# EA1 - Fundamentos de programación en Dart

Taller de estudio de caso del programa **Análisis y Desarrollo de Software**
(SENA, Centro de Gestión y Desarrollo Sostenible Surcolombiano, ficha 3410385).

Implementa en Dart (modo consola) la lógica del módulo de verificación de
modelos de análisis de una aplicación móvil con lista de chequeo digital.
Se verifican cuatro modelos: **casos de uso, actividades, secuencia y clases**.

- **Autor:** Jair Alfredo Garzón Jiménez
- **Instructivo:** EA1 (Actividad AA1)

## Estructura

```
fundamentos_dart_ea1/
├── pubspec.yaml
├── lib/
│   ├── criterio.dart          # Ejercicios 1 y 2: clase Criterio
│   ├── modelo_analisis.dart   # Ejercicios 3 a 7: clase ModeloAnalisis
│   ├── verificacion.dart      # Ejercicios 8 y 9: clase Verificacion
│   ├── datos_modelos.dart     # Datos de prueba de los cuatro modelos
│   └── utilidades.dart        # Funciones de formato
└── bin/
    └── main.dart              # Los 10 ejercicios reunidos en un solo programa
```

## Cómo ejecutarlo

Requisito: tener instalado el SDK de Dart (o Flutter, que ya lo incluye).

```bash
cd fundamentos_dart_ea1
dart run bin/main.dart       # ejecuta los 10 ejercicios en orden
dart run bin/main.dart 5     # ejecuta solo el ejercicio 5
```

> Si en la consola de Windows las tildes se ven raras, ejecute antes
> `chcp 65001`.

## Ejercicios

| N.º | Contenido | Archivos |
|----|-----------|----------|
| 1 | Clase `Criterio` (id, descripción, estado, observación) | `criterio.dart`, `main.dart` (ejercicio 01) |
| 2 | Métodos de `Criterio`: cambiar estado, observar, mostrar, cumple | `criterio.dart`, `main.dart` (ejercicio 02) |
| 3 | Clase `ModeloAnalisis` con lista de `Criterio` (composición) | `modelo_analisis.dart`, `main.dart` (ejercicio 03) |
| 4 | Agregar, consultar, mostrar, buscar y contar criterios | `modelo_analisis.dart`, `main.dart` (ejercicio 04) |
| 5 | Verificar criterios (cumplen / no cumplen / en revisión) | `modelo_analisis.dart`, `main.dart` (ejercicio 05) |
| 6 | Porcentaje de cumplimiento | `modelo_analisis.dart`, `main.dart` (ejercicio 06) |
| 7 | Estado general del modelo | `modelo_analisis.dart`, `main.dart` (ejercicio 07) |
| 8 | Clase `Verificacion` relacionada con un `ModeloAnalisis` | `verificacion.dart`, `main.dart` (ejercicio 08) |
| 9 | Resumen de la verificación | `verificacion.dart`, `main.dart` (ejercicio 09) |
| 10 | Integración: flujo completo con los cuatro modelos | `main.dart` (ejercicio 10) |

## Reglas del estado del modelo (Ejercicio 7)

1. Todos los criterios cumplen -> **Aprobado**.
2. Algún criterio no cumple -> **Requiere ajustes**.
3. Sin incumplimientos, pero con criterios en revisión -> **En revisión**.

(Además, un modelo sin criterios devuelve **Sin criterios**.)

## Resultados esperados del Ejercicio 10

| Modelo | Criterios | Cumplen | No cumplen | En revisión | Cumplimiento | Estado |
|--------|----------:|--------:|-----------:|------------:|-------------:|--------|
| Casos de uso | 10 | 8 | 1 | 1 | 80 % | Requiere ajustes |
| Actividades | 10 | 10 | 0 | 0 | 100 % | Aprobado |
| Secuencia | 10 | 7 | 0 | 3 | 70 % | En revisión |
| Clases | 10 | 6 | 3 | 1 | 60 % | Requiere ajustes |
