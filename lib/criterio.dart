/// Ejercicios 1 y 2: clase Criterio.
///
/// Representa un criterio de verificación de un modelo de análisis,
/// por ejemplo: "Todos los actores del sistema están identificados".
class Criterio {
  // ===== Ejercicio 1: atributos y constructor =====

  /// Estados que puede tener un criterio.
  static const String cumple = 'Cumple';
  static const String noCumple = 'No cumple';
  static const String enRevision = 'En revisión';
  static const List<String> estadosValidos = [cumple, noCumple, enRevision];

  /// Identificador del criterio dentro de un modelo.
  final int id;

  /// Texto que describe qué se debe verificar.
  final String descripcion;

  /// Estado actual: Cumple, No cumple o En revisión.
  String estado;

  /// Comentario del analista sobre el criterio.
  String observacion;

  /// Constructor con parámetros nombrados. Un criterio nuevo queda
  /// "En revisión" y sin observación, salvo que se indique otra cosa.
  Criterio({
    required this.id,
    required this.descripcion,
    this.estado = Criterio.enRevision,
    this.observacion = '',
  });

  // ===== Ejercicio 2: comportamientos del criterio =====

  /// Cambia el estado del criterio.
  /// Devuelve false (y no cambia nada) si el estado no es válido.
  bool cambiarEstado(String nuevoEstado) {
    if (!estadosValidos.contains(nuevoEstado)) {
      print('Estado no válido para el criterio $id: "$nuevoEstado"');
      return false;
    }
    estado = nuevoEstado;
    return true;
  }

  /// Registra (o reemplaza) la observación del criterio.
  void registrarObservacion(String texto) {
    observacion = texto;
  }

  /// Determina si el criterio cumple.
  bool cumpleCriterio() {
    return estado == Criterio.cumple;
  }

  /// Muestra la información del criterio en consola.
  void mostrarInformacion() {
    final String textoObservacion =
        observacion.isEmpty ? '(sin observación)' : observacion;
    print('Criterio $id: $descripcion');
    print('  Estado: $estado');
    print('  Observación: $textoObservacion');
  }
}
