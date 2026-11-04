import 'criterio.dart';

/// Ejercicios 3 a 7: clase ModeloAnalisis.
///
/// Representa un modelo de análisis (casos de uso, actividades,
/// secuencia o clases) que contiene una lista de criterios a verificar.
class ModeloAnalisis {
  // ===== Ejercicio 3: atributos, constructor y composición =====

  /// Posibles estados generales del modelo.
  static const String aprobado = 'Aprobado';
  static const String requiereAjustes = 'Requiere ajustes';
  static const String enRevision = 'En revisión';
  static const String sinCriterios = 'Sin criterios';

  final int id;
  final String nombre;
  final String descripcion;

  /// Composición: el modelo contiene objetos de tipo Criterio.
  final List<Criterio> criterios;

  ModeloAnalisis({
    required this.id,
    required this.nombre,
    required this.descripcion,
    List<Criterio>? criterios,
  }) : criterios = List<Criterio>.from(criterios ?? <Criterio>[]);

  // ===== Ejercicio 4: agregar, consultar, mostrar, buscar y contar =====

  /// Agrega un criterio al modelo. No permite ids repetidos.
  bool agregarCriterio(Criterio criterio) {
    if (buscarCriterio(criterio.id) != null) {
      print('Ya existe un criterio con id ${criterio.id} en "$nombre".');
      return false;
    }
    criterios.add(criterio);
    return true;
  }

  /// Devuelve una copia de solo lectura de la lista de criterios.
  List<Criterio> consultarCriterios() {
    return List<Criterio>.unmodifiable(criterios);
  }

  /// Muestra todos los criterios del modelo.
  void mostrarCriterios() {
    print('Criterios de "$nombre" (${contarCriterios()}):');
    if (criterios.isEmpty) {
      print('  (el modelo no tiene criterios)');
      return;
    }
    for (final criterio in criterios) {
      criterio.mostrarInformacion();
    }
  }

  /// Busca un criterio por su id. Devuelve null si no existe.
  Criterio? buscarCriterio(int idCriterio) {
    for (final criterio in criterios) {
      if (criterio.id == idCriterio) {
        return criterio;
      }
    }
    return null;
  }

  /// Cuenta los criterios del modelo.
  int contarCriterios() {
    return criterios.length;
  }

  // ===== Ejercicio 5: verificar los criterios =====

  /// Recorre los criterios y cuenta cuántos cumplen, no cumplen
  /// o requieren revisión.
  Map<String, int> verificarCriterios() {
    int cantidadCumplen = 0;
    int cantidadNoCumplen = 0;
    int cantidadEnRevision = 0;

    for (final criterio in criterios) {
      if (criterio.estado == Criterio.cumple) {
        cantidadCumplen++;
      } else if (criterio.estado == Criterio.noCumple) {
        cantidadNoCumplen++;
      } else {
        cantidadEnRevision++;
      }
    }

    return {
      'cumplen': cantidadCumplen,
      'noCumplen': cantidadNoCumplen,
      'enRevision': cantidadEnRevision,
    };
  }

  // ===== Ejercicio 6: porcentaje de cumplimiento =====

  /// Calcula el porcentaje de criterios que cumplen (0 a 100).
  double calcularPorcentajeCumplimiento() {
    final int total = contarCriterios();
    if (total == 0) {
      return 0.0;
    }
    final int cumplen = verificarCriterios()['cumplen']!;
    return (cumplen * 100) / total;
  }

  // ===== Ejercicio 7: estado general del modelo =====

  /// Determina el estado general del modelo:
  /// - Algún criterio no cumple          -> Requiere ajustes
  /// - Sin incumplimientos, pero alguno
  ///   en revisión                       -> En revisión
  /// - Todos cumplen                     -> Aprobado
  String determinarEstado() {
    if (criterios.isEmpty) {
      return sinCriterios;
    }
    final Map<String, int> conteo = verificarCriterios();
    if (conteo['noCumplen']! > 0) {
      return requiereAjustes;
    }
    if (conteo['enRevision']! > 0) {
      return enRevision;
    }
    return aprobado;
  }
}
