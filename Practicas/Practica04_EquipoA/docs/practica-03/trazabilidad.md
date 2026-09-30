# Practica 3 - Matriz de trazabilidad (actualizada en la Practica 4)

Equipo A

Relaciona cada historia de usuario con la vista donde pasa, el controlador (y metodo) que la atiende y la tabla de la base de datos.

> **Actualizacion P4:** ya llenamos la columna de tablas. Para sacarla revisamos que valor le pone cada controlador a la variable `$tablaBD` antes de llamar al modelo, porque asi es como el sistema le dice al modelo en que tabla trabajar. Las tablas marcadas con ⚠ no estan en el script oficial (11-06-2021), y las que tienen ❌ no estan en ningun script, entonces si instalas el sistema con el script que viene, esas historias no van a funcionar.

| HU | Historia | Vista(s) `Vistas/modulos/` | Controlador → metodo | Tabla(s) BD |
|---|---|---|---|---|
| HU-01 | Crear cuenta | `crearCuenta.php` | `usuariosC.php` → `CrearCuenta()` | `usuarios`, `carrera` (para el select) |
| HU-02 | Iniciar sesion | `Ingresar.php`, `plantilla.php` | `usuariosC.php` → `IniciarSesionC()` | `usuarios` |
| HU-03 | Consultar informacion de residencia | `Ingresar.php` | `infoResidenciaC.php` → `VerInfoC()`, `VerProcesos()`, `VerDocumentosC()` | `inforesidencia`, `procesos`, `documentacion` |
| HU-04 | Enviar solicitud de residencia | `solicitudRecidencia.php`, `inicio.php` | `Controladores/subirKardex.php` → `SolicitudResidenciaC::CrearSolicitud()` | `solicitudes`, `datosestudiante` ⚠, `datoscarta` ⚠, `requisitoscarta` ⚠ |
| HU-05 | Revisar solicitudes y carta de presentacion | `verSolicitudes.php`, `detallesSolicitud.php` | `SolicitudResidenciaC.php` → `AceptarSolicitud()`, `ActualizarSolicitud()`; PDF en `tcpdf/pdf/CartaPrecentacion.php` | `solicitudes`, `datosestudiante` ⚠, `datoscarta` ⚠, `requisitoscarta` ⚠, `plantillas` ⚠ |
| HU-06 | Gestionar catalogo de empresas y horarios | `catalogo.php`, `crear-comisiones.php` | `materiasC.php` → `CrearMateriaC()`, `EliminarMateriaC()`, `CrearComisionC()`, `BorrarComisionC()` | `materias`, `comisiones` |
| HU-07 | Inscribirse a una empresa | `catalogo.php`, `inscribir-materia.php` | `materiasC.php` → `InscribirMateriaC()` | `inscripciones`, `comisiones` |
| HU-08 | Consultar mi horario | `inscrito.php` | `materiasC.php` → `VerInscripcionesMateriasC()`, `VerComisiones2C()` | `inscripciones`, `comisiones`, `materias` |
| HU-09 | Subir documentos del expediente | `verCarpeta.php` | `Controladores/subirPDF.php`; `documentosEcenC.php` → `EliminarDocumento()` | `documentos` |
| HU-10 | Subir reportes parciales | `verCarpeta.php` | `Controladores/subirReportePDF.php`; `documentosEcenC.php` → `VerDocumentosRepC()` | `reportes` |
| HU-11 | Evaluar reportes parciales | `nota-materia.php` | `documentosEcenC.php` → `ActualizarNotasC()` | `reportes` (columnas `nota_academico`, `nota_industrial`, `promedioFinal`) |
| HU-12 | Marcar evaluaciones como revisadas | `calificaciones.php` | `documentosEcenC.php` → `ActualizarNotasC()` | `reportes` (columnas `revisadoJefe`, `revisadoAdmin`) |
| HU-13 | Agendar y confirmar visitas | `visitas.php`, `Editar-Visitas.php` | `visitasC.php` → `CrearVisitaC()`, `EditarVisitaC()`, `BorrarVisitasC()` | `visitas` ❌ |
| HU-14 | Comentar observaciones | `Obcervaciones.php` | `ChatC.php` → `EnviarMensajeC()`, `VerMensajes()` | `observacionesdoc` ❌ |
| HU-15 | Solicitar y generar constancia | `constancia-alumno.php`, `solicitud-Constancia.php` | `ConstanciaC.php` → `Solicitar()`, `Generar()`; PDF en `tcpdf/pdf/Constancia.php` | `constancias` ❌ |
| HU-16 | Gestionar usuarios | `usuarios.php`, `Editar-usuario.php`, `detalles-usuario.php` | `usuariosC.php` → `CrearUsuarioC()`, `ActualizarUsuariosC()`, `EliminarUsuariosC()`; `ImportarExcel/`, `expExcel/UsuariosExcel.php` | `usuarios`, `carrera` |
| HU-17 | Gestionar carreras | `carreras.php`, `Editar-Carrera.php` | `carrerasC.php` → `crearCarreraC()`, `ActualizarCarrerasC()`, `BorrarCarrerasC()` | `carrera` (y `ajustes` para el periodo) |
| HU-18 | Actualizar informacion de residencia | `info.php` | `infoResidenciaC.php` → `updateObjectivo()`, `CrearProceso()`, `BorrarProceso()`, `BorrarDocumentos()`; `subirCalendario.php`, `subirCatalogo.php`, `subirDoc.php` | `inforesidencia`, `procesos`, `documentacion` |
| HU-19 | Recuperar contraseña | `recuperar.php` | `usuariosC.php` → `IniciarSesionC()` (⚠ no manda correo) | `usuarios` |
| HU-20 | Examenes y plan de estudios | `evaluaciones.php`, `crear-evaluaciones.php`, `plan-de-estudios.php` | `evaluacionesC.php` → `CrearExamenC()`, `InscribirseExamenC()`; `materiasC.php` → `VerNotasC()` | `examenes`, `inscribir_examenes`, `notas` |

**Lo que notamos al llenarla**

- En la practica 3 pensamos que las calificaciones se guardaban en `notas`, pero no, las de los reportes van en `reportes`. `notas` solo la usan las vistas viejas (plan de estudios).
- Hay dos tablas que no aparecen en ninguna historia porque ningun controlador las usa: `evaluaciones` y `notificaciones`. Ya lo pusimos en la evaluacion del modelo.
- 3 de las 20 historias (visitas, observaciones y constancias) dependen de tablas que no existen en ningun script. O sea que con el respaldo que nos dieron el sistema no puede funcionar completo, cosa que vamos a confirmar cuando lo instalemos en la practica 7.

*Actualizo: [Nombre completo 3], QA*
