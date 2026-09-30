# Práctica 8 – Backlog del proyecto (Issues y Milestones)

**Consultora NexoSoft** · Pareja 1: [Daina Jahaveth Vega Coronado] y [Integrante B1]

Cada paquete de trabajo de la EDT es un Issue. Los Issues se agrupan en 6 Milestones (fases) y se organizan en el tablero de Projects con las columnas *Backlog → Por hacer → En proceso → En revisión → Terminado*.

Los Issues se crean automáticamente con `crear-backlog.sh` (usa GitHub CLI desde el Codespace).

## Milestones

| Milestone | Fecha límite | Paquetes |
|---|---|---|
| M1 · Inicio y requerimientos | 02/10/2026 | 1.1, 2.1, 2.2, 2.3 |
| M2 · Seguridad y base de datos | 16/10/2026 | 3.1, 3.2, 4.1, 4.2 |
| M3 · Desarrollo del núcleo | 06/11/2026 | 5.1, 5.2, 5.3, 5.4, 5.5 |
| M4 · Módulos nuevos e integración | 20/11/2026 | 5.6, 5.7, 5.8, 5.9 |
| M5 · Pruebas y calidad | 04/12/2026 | 6.1, 6.2, 6.3 |
| M6 · Implantación y cierre | 18/12/2026 | 7.1, 7.2, 7.3, 7.4, 1.2 |

## Issues

| EDT | Título | Milestone | Semanas | Depende de | Etiquetas | Criterio de aceptación |
|---|---|---|---|---|---|---|
| 1.1 | Acta de constitución y plan del proyecto | M1 | 1 | — | gestión, ruta-crítica | Acta firmada por el cliente; plan publicado en docs/ |
| 2.1 | Validar requerimientos con Vinculación y Control Escolar | M1 | 2 | 1.1 | análisis, ruta-crítica | Minuta firmada; lista de HU validada con prioridad MoSCoW |
| 2.2 | Especificar módulos nuevos (anteproyecto, asignación de asesores) | M1 | 1 | 2.1 | análisis, ruta-crítica | HU nuevas con criterios de aceptación aprobadas por el cliente |
| 2.3 | Obtener autorización/licencia del autor | M1 | 2 | 1.1 | análisis | Documento de autorización o LICENSE en el repo; si no se obtiene, escalar al cliente (R17) |
| 3.1 | Retirar datos personales y secretos del repositorio | M2 | 1 | 2.3 | seguridad | git grep no encuentra credenciales ni datos personales en ninguna rama |
| 3.2 | Aviso de privacidad y procedimiento ARCO | M2 | 2 | 2.1 | seguridad | Aviso aprobado por jurídico y visible antes del registro |
| 4.1 | Rediseño del modelo de datos (FK, tipos, nombres) | M2 | 2 | 2.2 | base-de-datos, ruta-crítica | Diagrama ER aprobado; migraciones de Laravel ejecutan sin error |
| 4.2 | Scripts de migración de datos | M2 | 1 | 4.1 | base-de-datos | Migración de prueba sin pérdida de registros |
| 5.1 | Proyecto Laravel: autenticación, roles y contraseñas con hash | M3 | 2 | 4.1, 3.1 | desarrollo, ruta-crítica | Cada rol ve solo su menú; ninguna contraseña en texto plano |
| 5.2 | Módulo de usuarios y carreras | M3 | 2 | 5.1 | desarrollo, ruta-crítica | HU-01, 02, 16, 17 cumplen criterios de aceptación |
| 5.3 | Catálogo de empresas y horarios | M3 | 2 | 5.2 | desarrollo | HU-06, 07, 08 cumplen criterios |
| 5.4 | Solicitud de residencia y carta de presentación | M3 | 3 | 5.2 | desarrollo, ruta-crítica | HU-04, 05 cumplen criterios; carta PDF correcta |
| 5.5 | Expediente, documentos privados y reportes parciales | M3 | 3 | 5.4 | desarrollo, ruta-crítica | HU-09, 10; un PDF no es accesible sin sesión |
| 5.6 | Evaluación de reportes, visitas y observaciones | M4 | 3 | 5.5 | desarrollo, ruta-crítica | HU-11 a 14 cumplen criterios |
| 5.7 | Constancias PDF y notificaciones por correo | M4 | 2 | 5.6 | desarrollo, ruta-crítica | HU-15, 19; correo recibido en pruebas |
| 5.8 | Anteproyecto y asignación de asesores (nuevos) | M4 | 2 | 5.4 | desarrollo | HU nuevas de 2.2 cumplen criterios |
| 5.9 | Importar/exportar Excel con PhpSpreadsheet | M4 | 1 | 5.3 | desarrollo | Importación de 100 usuarios sin errores |
| 6.1 | Pruebas automatizadas (PHPUnit) de módulos críticos | M5 | 2 | 5.7, 5.8, 5.9 | calidad, ruta-crítica | Cobertura ≥ 60% en controladores críticos; pipeline en verde |
| 6.2 | Auditoría de seguridad (OWASP Top 10) | M5 | 1 | 5.7 | calidad | Sin vulnerabilidades altas o críticas abiertas |
| 6.3 | Pruebas de aceptación con usuarios | M5 | 2 | 6.1, 6.2, 4.2 | calidad, ruta-crítica | Acta de aceptación firmada por el cliente |
| 7.1 | Documentación: README, manual técnico y de usuario | M6 | 2 | 5.7 | implantación | Otra persona instala el sistema solo con el manual |
| 7.2 | Migración de datos a producción | M6 | 1 | 6.3, 3.2 | implantación, ruta-crítica | Conteo de registros igual antes y después |
| 7.3 | Capacitación a usuarios | M6 | 1 | 7.2 | implantación, ruta-crítica | Asistencia ≥ 90% del personal clave |
| 7.4 | HITO: Puesta en producción | M6 | 0 | 7.3, 7.1 | implantación, ruta-crítica | Sistema operando con usuarios reales |
| 1.2 | Cierre del proyecto y lecciones aprendidas | M6 | 1 | 7.4 | gestión, ruta-crítica | Acta de cierre firmada |
