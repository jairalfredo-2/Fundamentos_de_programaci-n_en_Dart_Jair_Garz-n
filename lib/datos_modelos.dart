import 'criterio.dart';
import 'modelo_analisis.dart';

/// Persona que realiza las verificaciones de los ejemplos.
const String responsablePorDefecto = 'Jair Alfredo Garzón Jiménez';

/// Datos de un modelo de análisis para las pruebas: sus criterios,
/// el estado que se registra en cada uno y las observaciones por criterio.
class DatosModelo {
  final int id;
  final String nombre;
  final String descripcion;
  final List<String> descripcionesCriterios;
  final List<String> estados;
  final Map<int, String> observaciones;

  const DatosModelo({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.descripcionesCriterios,
    required this.estados,
    required this.observaciones,
  });
}

// ----- Modelo 1: casos de uso (8 cumplen, 1 no cumple, 1 en revisión) -----
const DatosModelo datosCasosDeUso = DatosModelo(
  id: 1,
  nombre: 'Modelo de casos de uso',
  descripcion: 'Representa las funcionalidades del sistema y sus actores.',
  descripcionesCriterios: [
    'Todos los actores del sistema están identificados y nombrados.',
    'Cada caso de uso tiene un nombre que inicia con un verbo.',
    'Cada caso de uso está asociado al menos a un actor.',
    'Las relaciones include y extend se usan correctamente.',
    'Todos los requisitos funcionales están cubiertos por un caso de uso.',
    'El diagrama delimita claramente la frontera del sistema.',
    'Cada caso de uso tiene su especificación (flujo principal y alterno).',
    'No existen casos de uso duplicados ni redundantes.',
    'Las precondiciones y postcondiciones están definidas.',
    'Los casos de uso son consistentes con los demás modelos.',
  ],
  estados: [
    Criterio.cumple,
    Criterio.cumple,
    Criterio.cumple,
    Criterio.cumple,
    Criterio.cumple,
    Criterio.cumple,
    Criterio.cumple,
    Criterio.cumple,
    Criterio.noCumple,
    Criterio.enRevision,
  ],
  observaciones: {
    9: 'Faltan las pre y postcondiciones del caso de uso Registrar venta.',
    10: 'Pendiente contrastar con los modelos de clases y de secuencia.',
  },
);

// ----- Modelo 2: actividades (10 cumplen) -----
const DatosModelo datosActividades = DatosModelo(
  id: 2,
  nombre: 'Modelo de actividades',
  descripcion: 'Representa el flujo de acciones de un proceso.',
  descripcionesCriterios: [
    'Existe un único nodo inicial.',
    'Existe al menos un nodo final.',
    'Todas las acciones están nombradas con un verbo.',
    'Todos los flujos tienen origen y destino.',
    'Las decisiones tienen condiciones de guarda en cada salida.',
    'Cada bifurcación (fork) tiene su unión (join) correspondiente.',
    'Las calles (swimlanes) identifican a los responsables.',
    'No hay acciones aisladas sin flujo de entrada o de salida.',
    'El flujo es coherente con el caso de uso que representa.',
    'Se contemplan los flujos alternos y de excepción.',
  ],
  estados: [
    Criterio.cumple,
    Criterio.cumple,
    Criterio.cumple,
    Criterio.cumple,
    Criterio.cumple,
    Criterio.cumple,
    Criterio.cumple,
    Criterio.cumple,
    Criterio.cumple,
    Criterio.cumple,
  ],
  observaciones: {},
);

// ----- Modelo 3: secuencia (7 cumplen, 3 en revisión) -----
const DatosModelo datosSecuencia = DatosModelo(
  id: 3,
  nombre: 'Modelo de secuencia',
  descripcion: 'Representa la interacción entre objetos a lo largo del tiempo.',
  descripcionesCriterios: [
    'Los participantes (actores y objetos) están identificados.',
    'Los mensajes están ordenados cronológicamente.',
    'Cada mensaje corresponde a una operación del modelo de clases.',
    'Las líneas de vida están correctamente representadas.',
    'Se muestran los mensajes de retorno cuando son necesarios.',
    'Los fragmentos alt, opt y loop se usan correctamente.',
    'La secuencia corresponde a un escenario de un caso de uso.',
    'Los nombres de los mensajes son claros y consistentes.',
    'No hay mensajes dirigidos a objetos inexistentes.',
    'Se incluyen los escenarios de error.',
  ],
  estados: [
    Criterio.cumple,
    Criterio.cumple,
    Criterio.cumple,
    Criterio.cumple,
    Criterio.cumple,
    Criterio.cumple,
    Criterio.cumple,
    Criterio.enRevision,
    Criterio.enRevision,
    Criterio.enRevision,
  ],
  observaciones: {
    8: 'Revisar que los nombres coincidan con las operaciones de las clases.',
    9: 'Pendiente validar los destinatarios con el modelo de clases.',
    10: 'Falta revisar los escenarios de error de Registrar venta.',
  },
);

// ----- Modelo 4: clases (6 cumplen, 3 no cumplen, 1 en revisión) -----
const DatosModelo datosClases = DatosModelo(
  id: 4,
  nombre: 'Modelo de clases',
  descripcion: 'Representa la estructura estática del sistema.',
  descripcionesCriterios: [
    'Cada clase tiene un nombre en singular y significativo.',
    'Los atributos tienen nombre y tipo de dato definidos.',
    'Los métodos tienen nombre, parámetros y tipo de retorno.',
    'La visibilidad de atributos y métodos está definida.',
    'Las relaciones (asociación, herencia, composición) son correctas.',
    'La multiplicidad está indicada en las asociaciones.',
    'No existen clases sin relación con otras clases.',
    'Cada clase tiene responsabilidades claras (cohesión).',
    'Las clases cubren las entidades identificadas en los requisitos.',
    'El modelo es consistente con los casos de uso y la secuencia.',
  ],
  estados: [
    Criterio.cumple,
    Criterio.cumple,
    Criterio.cumple,
    Criterio.noCumple,
    Criterio.cumple,
    Criterio.noCumple,
    Criterio.cumple,
    Criterio.enRevision,
    Criterio.cumple,
    Criterio.noCumple,
  ],
  observaciones: {
    4: 'No se definió la visibilidad de los atributos de la clase Producto.',
    6: 'Faltan las multiplicidades entre Venta y Producto.',
    8: 'La cohesión de la clase Inventario debe revisarse con el equipo.',
    10: 'Hay operaciones de secuencia que no existen en las clases.',
  },
);

/// Los cuatro modelos de análisis planteados en el instructivo.
const List<DatosModelo> todosLosModelos = [
  datosCasosDeUso,
  datosActividades,
  datosSecuencia,
  datosClases,
];

// ----- Funciones de apoyo -----

/// Crea el modelo de análisis vacío (sin criterios).
ModeloAnalisis crearModelo(DatosModelo datos) {
  return ModeloAnalisis(
    id: datos.id,
    nombre: datos.nombre,
    descripcion: datos.descripcion,
  );
}

/// Agrega los criterios al modelo. Cada criterio queda "En revisión".
void agregarCriteriosAlModelo(ModeloAnalisis modelo, DatosModelo datos) {
  for (int i = 0; i < datos.descripcionesCriterios.length; i++) {
    modelo.agregarCriterio(
      Criterio(id: i + 1, descripcion: datos.descripcionesCriterios[i]),
    );
  }
}

/// Registra el estado de cada criterio del modelo.
void registrarEstados(ModeloAnalisis modelo, DatosModelo datos) {
  for (int i = 0; i < modelo.criterios.length; i++) {
    if (i < datos.estados.length) {
      modelo.criterios[i].cambiarEstado(datos.estados[i]);
    }
  }
}

/// Registra las observaciones en los criterios indicados.
void registrarObservaciones(ModeloAnalisis modelo, DatosModelo datos) {
  datos.observaciones.forEach((int idCriterio, String texto) {
    final Criterio? criterio = modelo.buscarCriterio(idCriterio);
    if (criterio != null) {
      criterio.registrarObservacion(texto);
    }
  });
}
