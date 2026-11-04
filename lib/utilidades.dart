/// Funciones de apoyo para dar formato a los resultados.

/// Muestra el porcentaje sin decimales cuando es un número entero
/// (80.0 -> "80") y con un decimal en los demás casos (66.67 -> "66.7").
String formatearPorcentaje(double porcentaje) {
  if (porcentaje == porcentaje.roundToDouble()) {
    return porcentaje.toStringAsFixed(0);
  }
  return porcentaje.toStringAsFixed(1);
}

/// Convierte una fecha en texto con el formato dd/mm/aaaa.
String formatearFecha(DateTime fecha) {
  final String dia = fecha.day.toString().padLeft(2, '0');
  final String mes = fecha.month.toString().padLeft(2, '0');
  return '$dia/$mes/${fecha.year}';
}

/// Devuelve "Sí" o "No" según el valor booleano recibido.
String siNo(bool valor) {
  return valor ? 'Sí' : 'No';
}
