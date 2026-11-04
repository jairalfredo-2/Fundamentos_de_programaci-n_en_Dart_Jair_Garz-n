import 'modelo_analisis.dart';
import 'utilidades.dart';

/// Ejercicios 8 y 9: clase Verificacion.
///
/// Organiza el resultado de verificar un ModeloAnalisis.
class Verificacion {
  // ===== Ejercicio 8: atributos, constructor y relación =====

  static const String sinProcesar = 'Sin procesar';

  /// Relación: la verificación evalúa un objeto ModeloAnalisis.
  final ModeloAnalisis modeloEvaluado;
  final DateTime fechaVerificacion;
  final String responsable;
  double porcentaje = 0.0;
  String estadoFinal = Verificacion.sinProcesar;
  String observaciones;

  Map<String, int> _conteo = {'cumplen': 0, 'noCumplen': 0, 'enRevision': 0};
  bool _procesada = false;

  Verificacion({
    required this.modeloEvaluado,
    required this.responsable,
    DateTime? fecha,
    this.observaciones = '',
  }) : fechaVerificacion = fecha ?? DateTime.now();

  /// Procesa los resultados: cuenta los criterios, calcula el porcentaje
  /// y determina el estado final a partir del modelo evaluado.
  void procesar() {
    _conteo = modeloEvaluado.verificarCriterios();
    porcentaje = modeloEvaluado.calcularPorcentajeCumplimiento();
    estadoFinal = modeloEvaluado.determinarEstado();
    _procesada = true;
  }

  /// Reúne en un solo texto las observaciones registradas en los criterios.
  void consolidarObservaciones() {
    final List<String> lineas = [];
    for (final criterio in modeloEvaluado.criterios) {
      if (criterio.observacion.isNotEmpty) {
        lineas.add('- Criterio ${criterio.id}: ${criterio.observacion}');
      }
    }
    observaciones = lineas.join('\n');
  }

  // ===== Ejercicio 9: resumen de la verificación =====

  /// Genera el resumen de la verificación como texto.
  String generarResumen() {
    if (!_procesada) {
      return 'La verificación aún no ha sido procesada. '
          'Ejecute procesar() primero.';
    }

    final int cumplen = _conteo['cumplen']!;
    final int noCumplen = _conteo['noCumplen']!;
    final int enRevision = _conteo['enRevision']!;

    final StringBuffer resumen = StringBuffer();
    resumen.writeln('RESULTADO DE LA VERIFICACIÓN');
    resumen.writeln();
    resumen.writeln('Modelo: ${modeloEvaluado.nombre}');
    resumen.writeln('Responsable: $responsable');
    resumen.writeln('Fecha: ${formatearFecha(fechaVerificacion)}');
    resumen.writeln();
    resumen.writeln('Total de criterios: ${modeloEvaluado.contarCriterios()}');
    resumen.writeln('Cumplen: $cumplen');
    resumen.writeln('No cumplen: $noCumplen');
    resumen.writeln('En revisión: $enRevision');
    resumen.writeln();
    resumen.writeln('Cumplimiento: ${formatearPorcentaje(porcentaje)} %');
    resumen.writeln();
    resumen.writeln('Estado: ${estadoFinal.toUpperCase()}');
    if (observaciones.isNotEmpty) {
      resumen.writeln();
      resumen.writeln('Observaciones:');
      resumen.writeln(observaciones);
    }
    return resumen.toString().trimRight();
  }
}
