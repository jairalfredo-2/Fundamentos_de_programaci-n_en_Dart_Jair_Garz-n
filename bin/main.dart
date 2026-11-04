// EA1 - Fundamentos de programación en Dart.
// Los diez ejercicios del taller reunidos en un solo programa.
//
// Uso:
//   dart run bin/main.dart        -> ejecuta los 10 ejercicios en orden
//   dart run bin/main.dart 5      -> ejecuta solo el ejercicio 5
import 'package:fundamentos_dart_ea1/criterio.dart';
import 'package:fundamentos_dart_ea1/datos_modelos.dart';
import 'package:fundamentos_dart_ea1/modelo_analisis.dart';
import 'package:fundamentos_dart_ea1/utilidades.dart';
import 'package:fundamentos_dart_ea1/verificacion.dart';

void main(List<String> args) {
  final Map<int, void Function()> ejercicios = {
    1: ejercicio01,
    2: ejercicio02,
    3: ejercicio03,
    4: ejercicio04,
    5: ejercicio05,
    6: ejercicio06,
    7: ejercicio07,
    8: ejercicio08,
    9: ejercicio09,
    10: ejercicio10,
  };

  if (args.isNotEmpty) {
    final int? numero = int.tryParse(args.first);
    final void Function()? ejercicio =
        numero == null ? null : ejercicios[numero];
    if (ejercicio == null) {
      print('Uso: dart run bin/main.dart [numero de ejercicio del 1 al 10]');
      return;
    }
    ejercicio();
    return;
  }

  for (final entrada in ejercicios.entries) {
    entrada.value();
    print('');
    print('##################################################');
    print('');
  }
}

// ---------- Ejercicio 1. Crear la clase Criterio. ----------
void ejercicio01() {
  print('EJERCICIO 1. CLASE CRITERIO');
  print('');

  final criterio1 = Criterio(
    id: 1,
    descripcion: 'Todos los actores del sistema están identificados',
    estado: 'Cumple',
    observacion: 'Se identificaron cuatro actores',
  );
  final criterio2 = Criterio(
    id: 2,
    descripcion: 'Cada caso de uso tiene un nombre que inicia con un verbo',
    estado: 'No cumple',
    observacion: 'El caso de uso Ventas debe llamarse Registrar venta',
  );
  final criterio3 = Criterio(
    id: 3,
    descripcion: 'Las precondiciones y postcondiciones están definidas',
    estado: 'En revisión',
    observacion: 'Pendiente de revisar con el analista',
  );
  // Este criterio usa los valores por defecto del constructor.
  final criterio4 = Criterio(
    id: 4,
    descripcion: 'El diagrama delimita la frontera del sistema',
  );

  final criterios = [criterio1, criterio2, criterio3, criterio4];

  for (final criterio in criterios) {
    final String observacion = criterio.observacion.isEmpty
        ? '(sin observación)'
        : criterio.observacion;
    print('Criterio ${criterio.id}');
    print('  Descripción: ${criterio.descripcion}');
    print('  Estado: ${criterio.estado}');
    print('  Observación: $observacion');
    print('');
  }
}

// ---------- Ejercicio 2. Implementar comportamientos en Criterio. ----------
void ejercicio02() {
  print('EJERCICIO 2. COMPORTAMIENTOS DE LA CLASE CRITERIO');
  print('');

  final criterio = Criterio(
    id: 1,
    descripcion: 'Cada caso de uso está asociado al menos a un actor',
  );

  print('1) Información inicial del criterio');
  criterio.mostrarInformacion();
  print('¿El criterio cumple? ${siNo(criterio.cumpleCriterio())}');
  print('');

  print('2) Cambiar el estado a "Cumple"');
  criterio.cambiarEstado(Criterio.cumple);
  criterio.mostrarInformacion();
  print('¿El criterio cumple? ${siNo(criterio.cumpleCriterio())}');
  print('');

  print('3) Registrar una observación');
  criterio.registrarObservacion('Verificado en la versión 2 del diagrama');
  criterio.mostrarInformacion();
  print('');

  print('4) Cambiar el estado a "No cumple"');
  criterio.cambiarEstado(Criterio.noCumple);
  print('Estado actual: ${criterio.estado}');
  print('¿El criterio cumple? ${siNo(criterio.cumpleCriterio())}');
  print('');

  print('5) Intentar un estado que no existe ("Aprobado")');
  final bool aceptado = criterio.cambiarEstado('Aprobado');
  print('¿Se aceptó el cambio? ${siNo(aceptado)}');
  print('Estado actual: ${criterio.estado}');
}

// ---------- Ejercicio 3. Crear la clase ModeloAnalisis. ----------
void ejercicio03() {
  print('EJERCICIO 3. CLASE MODELOANALISIS');
  print('');

  final casosDeUso = ModeloAnalisis(
    id: 1,
    nombre: 'Modelo de casos de uso',
    descripcion: 'Representa las funcionalidades del sistema y sus actores',
    criterios: [
      Criterio(id: 1, descripcion: 'Todos los actores están identificados'),
      Criterio(id: 2, descripcion: 'Cada caso de uso tiene un actor asociado'),
    ],
  );

  final actividades = ModeloAnalisis(
    id: 2,
    nombre: 'Modelo de actividades',
    descripcion: 'Representa el flujo de acciones de un proceso',
    criterios: [
      Criterio(id: 1, descripcion: 'Existe un único nodo inicial'),
      Criterio(id: 2, descripcion: 'Las decisiones tienen condición de guarda'),
    ],
  );

  final secuencia = ModeloAnalisis(
    id: 3,
    nombre: 'Modelo de secuencia',
    descripcion: 'Representa la interacción entre objetos en el tiempo',
    criterios: [
      Criterio(id: 1, descripcion: 'Los participantes están identificados'),
      Criterio(id: 2, descripcion: 'Los mensajes están ordenados en el tiempo'),
    ],
  );

  final clases = ModeloAnalisis(
    id: 4,
    nombre: 'Modelo de clases',
    descripcion: 'Representa la estructura estática del sistema',
    criterios: [
      Criterio(id: 1, descripcion: 'Cada clase tiene un nombre significativo'),
      Criterio(id: 2, descripcion: 'Los atributos tienen su tipo de dato'),
    ],
  );

  final modelos = [casosDeUso, actividades, secuencia, clases];

  for (final modelo in modelos) {
    print('Modelo ${modelo.id}: ${modelo.nombre}');
    print('  Descripción: ${modelo.descripcion}');
    print('  Cantidad de criterios: ${modelo.criterios.length}');
    for (final criterio in modelo.criterios) {
      print('    - (${criterio.id}) ${criterio.descripcion}');
    }
    print('');
  }
}

// ---------- Ejercicio 4. Agregar criterios a un modelo. ----------
void ejercicio04() {
  print('EJERCICIO 4. AGREGAR CRITERIOS A UN MODELO');
  print('');

  final modelo = ModeloAnalisis(
    id: 1,
    nombre: 'Modelo de casos de uso',
    descripcion: 'Representa las funcionalidades del sistema y sus actores',
  );

  print('1) Criterios al inicio: ${modelo.contarCriterios()}');
  print('');

  print('2) Agregar criterios');
  final c1 = Criterio(id: 1, descripcion: 'Los actores están identificados');
  final c2 = Criterio(id: 2, descripcion: 'Cada caso de uso tiene un actor');
  final c3 = Criterio(id: 3, descripcion: 'Existen especificaciones de casos');
  print('Agregar criterio 1: ${siNo(modelo.agregarCriterio(c1))}');
  print('Agregar criterio 2: ${siNo(modelo.agregarCriterio(c2))}');
  print('Agregar criterio 3: ${siNo(modelo.agregarCriterio(c3))}');
  print('');

  print('3) Intentar agregar un criterio con id repetido');
  final repetido = Criterio(id: 2, descripcion: 'Criterio repetido');
  print('Agregar criterio repetido: ${siNo(modelo.agregarCriterio(repetido))}');
  print('');

  print('4) Mostrar los criterios');
  modelo.mostrarCriterios();
  print('');

  print('5) Buscar criterios');
  final encontrado = modelo.buscarCriterio(2);
  if (encontrado != null) {
    print('Criterio 2 encontrado: ${encontrado.descripcion}');
  }
  final noExiste = modelo.buscarCriterio(99);
  if (noExiste == null) {
    print('Criterio 99: no se encontró en el modelo');
  }
  print('');

  print('6) Consultar y contar criterios');
  final lista = modelo.consultarCriterios();
  print('Criterios consultados: ${lista.length}');
  print('Total de criterios del modelo: ${modelo.contarCriterios()}');
}

// ---------- Ejercicio 5. Verificar los criterios. ----------
void ejercicio05() {
  print('EJERCICIO 5. VERIFICAR LOS CRITERIOS');
  print('');

  final modelo = crearModelo(datosCasosDeUso);
  agregarCriteriosAlModelo(modelo, datosCasosDeUso);
  registrarEstados(modelo, datosCasosDeUso);

  print('Modelo: ${modelo.nombre}');
  for (final criterio in modelo.criterios) {
    print('  ${criterio.id}. [${criterio.estado}] ${criterio.descripcion}');
  }
  print('');

  final conteo = modelo.verificarCriterios();
  print('Total de criterios: ${modelo.contarCriterios()}');
  print('Cumplen: ${conteo['cumplen']}');
  print('No cumplen: ${conteo['noCumplen']}');
  print('Requieren revisión: ${conteo['enRevision']}');
}

// ---------- Ejercicio 6. Calcular el porcentaje de cumplimiento. ----------
void ejercicio06() {
  print('EJERCICIO 6. CALCULAR EL PORCENTAJE DE CUMPLIMIENTO');
  print('');

  for (final datos in todosLosModelos) {
    final modelo = crearModelo(datos);
    agregarCriteriosAlModelo(modelo, datos);
    registrarEstados(modelo, datos);

    final conteo = modelo.verificarCriterios();
    final porcentaje = modelo.calcularPorcentajeCumplimiento();

    print('Modelo: ${modelo.nombre}');
    print('Criterios: ${modelo.contarCriterios()} '
        '(cumplen: ${conteo['cumplen']})');
    print('Porcentaje de cumplimiento: ${formatearPorcentaje(porcentaje)} %');
    print('');
  }

  // Caso límite: un modelo sin criterios no debe dividir entre cero.
  final vacio = ModeloAnalisis(
    id: 99,
    nombre: 'Modelo sin criterios',
    descripcion: 'Prueba del caso límite',
  );
  final porcentajeVacio = vacio.calcularPorcentajeCumplimiento();
  print('Modelo: ${vacio.nombre}');
  final String texto = formatearPorcentaje(porcentajeVacio);
  print('Porcentaje de cumplimiento: $texto %');
}

// ---------- Ejercicio 7. Determinar el estado del modelo. ----------
void ejercicio07() {
  print('EJERCICIO 7. DETERMINAR EL ESTADO DEL MODELO');
  print('');

  for (final datos in todosLosModelos) {
    final modelo = crearModelo(datos);
    agregarCriteriosAlModelo(modelo, datos);
    registrarEstados(modelo, datos);

    final conteo = modelo.verificarCriterios();
    print('Modelo: ${modelo.nombre}');
    print('  Cumplen: ${conteo['cumplen']} | '
        'No cumplen: ${conteo['noCumplen']} | '
        'En revisión: ${conteo['enRevision']}');
    print('  Estado del modelo: ${modelo.determinarEstado()}');
    print('');
  }

  // Caso límite: un modelo sin criterios.
  final vacio = ModeloAnalisis(
    id: 99,
    nombre: 'Modelo sin criterios',
    descripcion: 'Prueba del caso límite',
  );
  print('Modelo: ${vacio.nombre}');
  print('  Estado del modelo: ${vacio.determinarEstado()}');
}

// ---------- Ejercicio 8. Crear la clase Verificacion. ----------
void ejercicio08() {
  print('EJERCICIO 8. CLASE VERIFICACION');
  print('');

  final modelo = crearModelo(datosCasosDeUso);
  agregarCriteriosAlModelo(modelo, datosCasosDeUso);
  registrarEstados(modelo, datosCasosDeUso);
  registrarObservaciones(modelo, datosCasosDeUso);

  final verificacion = Verificacion(
    modeloEvaluado: modelo,
    responsable: responsablePorDefecto,
  );

  print('Antes de procesar:');
  _mostrarDatos(verificacion);
  print('');

  verificacion.procesar();
  verificacion.consolidarObservaciones();

  print('Después de procesar:');
  _mostrarDatos(verificacion);
}

void _mostrarDatos(Verificacion verificacion) {
  final String fecha = formatearFecha(verificacion.fechaVerificacion);
  final String porcentaje = formatearPorcentaje(verificacion.porcentaje);
  final String observaciones = verificacion.observaciones.isEmpty
      ? '  (ninguna)'
      : verificacion.observaciones;

  print('  Modelo evaluado: ${verificacion.modeloEvaluado.nombre}');
  print('  Fecha de verificación: $fecha');
  print('  Responsable: ${verificacion.responsable}');
  print('  Porcentaje: $porcentaje %');
  print('  Estado final: ${verificacion.estadoFinal}');
  print('  Observaciones:');
  print(observaciones);
}

// ---------- Ejercicio 9. Generar el resumen de la verificación. ----------
void ejercicio09() {
  print('EJERCICIO 9. GENERAR EL RESUMEN DE LA VERIFICACIÓN');
  print('');

  final modelo = crearModelo(datosCasosDeUso);
  agregarCriteriosAlModelo(modelo, datosCasosDeUso);
  registrarEstados(modelo, datosCasosDeUso);
  registrarObservaciones(modelo, datosCasosDeUso);

  final verificacion = Verificacion(
    modeloEvaluado: modelo,
    responsable: responsablePorDefecto,
  );

  // Si se pide el resumen antes de procesar, se avisa al usuario.
  print('Resumen antes de procesar:');
  print(verificacion.generarResumen());
  print('');

  verificacion.procesar();
  verificacion.consolidarObservaciones();

  print('Resumen después de procesar:');
  print('');
  print(verificacion.generarResumen());
}

// ---------- Ejercicio 10. Integración de la solución. ----------
void ejercicio10() {
  print('EJERCICIO 10. INTEGRACIÓN DE LA SOLUCIÓN');
  print('Responsable de la verificación: $responsablePorDefecto');
  print('');

  final List<Verificacion> verificaciones = [];
  for (final datos in todosLosModelos) {
    verificaciones.add(ejecutarFlujo(datos));
  }

  print('==================================================');
  print('RESUMEN COMPARATIVO DE LOS CUATRO MODELOS');
  print('==================================================');
  for (final verificacion in verificaciones) {
    final String nombre = verificacion.modeloEvaluado.nombre.padRight(24);
    final String porcentaje = formatearPorcentaje(verificacion.porcentaje);
    print('$nombre ${porcentaje.padLeft(3)} %   ${verificacion.estadoFinal}');
  }
}

/// Ejecuta el flujo completo de verificación para un modelo.
Verificacion ejecutarFlujo(DatosModelo datos) {
  print('==================================================');
  print('VERIFICACIÓN: ${datos.nombre.toUpperCase()}');
  print('==================================================');

  // Paso 1. Crear modelo.
  final modelo = crearModelo(datos);
  print('Paso 1. Modelo creado: ${modelo.nombre}');

  // Paso 2. Agregar criterios.
  agregarCriteriosAlModelo(modelo, datos);
  print('Paso 2. Criterios agregados: ${modelo.contarCriterios()}');

  // Paso 3. Evaluar criterios (todos inician "En revisión").
  final pendientes = modelo.verificarCriterios()['enRevision'];
  print('Paso 3. Criterios por evaluar: $pendientes');

  // Paso 4. Registrar estados.
  registrarEstados(modelo, datos);
  print('Paso 4. Estados registrados:');
  for (final criterio in modelo.criterios) {
    print('  Criterio ${criterio.id}: ${criterio.estado}');
  }

  // Paso 5. Agregar observaciones.
  registrarObservaciones(modelo, datos);
  int conObservacion = 0;
  for (final criterio in modelo.criterios) {
    if (criterio.observacion.isNotEmpty) {
      conObservacion++;
    }
  }
  print('Paso 5. Criterios con observación: $conObservacion');

  // Paso 6. Procesar resultados.
  final verificacion = Verificacion(
    modeloEvaluado: modelo,
    responsable: responsablePorDefecto,
  );
  verificacion.procesar();
  verificacion.consolidarObservaciones();
  final conteo = modelo.verificarCriterios();
  print('Paso 6. Resultados procesados: '
      '${conteo['cumplen']} cumplen, '
      '${conteo['noCumplen']} no cumplen, '
      '${conteo['enRevision']} en revisión');

  // Paso 7. Calcular porcentaje.
  final porcentaje = formatearPorcentaje(verificacion.porcentaje);
  print('Paso 7. Porcentaje de cumplimiento: $porcentaje %');

  // Paso 8. Determinar estado.
  print('Paso 8. Estado del modelo: ${verificacion.estadoFinal}');

  // Paso 9. Generar resumen.
  print('Paso 9. Resumen:');
  print('');
  print(verificacion.generarResumen());
  print('');

  return verificacion;
}
