# Practica 3 - Matriz de trazabilidad (parcial)

Equipo A

Relaciona cada historia de usuario con la vista donde pasa, el controlador (y metodo) que la atiende y la tabla de la base de datos. **La columna de tablas se completa en la Practica 4**, por ahora solo pusimos lo que suponemos por el nombre (con ?).

| HU | Historia | Vista(s) `Vistas/modulos/` | Controlador → metodo | Tabla BD (P4) |
|---|---|---|---|---|
| HU-01 | Crear cuenta | `crearCuenta.php` | `usuariosC.php` → `CrearCuenta()` | usuarios? |
| HU-02 | Iniciar sesion | `Ingresar.php`, `plantilla.php` | `usuariosC.php` → `IniciarSesionC()` | usuarios? |
| HU-03 | Consultar informacion de residencia | `Ingresar.php` | `infoResidenciaC.php` → `VerInfoC()`, `VerProcesos()`, `VerDocumentosC()` | ? |
| HU-04 | Enviar solicitud de residencia | `solicitudRecidencia.php`, `inicio.php` | `Controladores/subirKardex.php` → `SolicitudResidenciaC::CrearSolicitud()` | solicitudes?, datosestudiante? |
| HU-05 | Revisar solicitudes y carta de presentacion | `verSolicitudes.php`, `detallesSolicitud.php` | `SolicitudResidenciaC.php` → `AceptarSolicitud()`, `ActualizarSolicitud()`; PDF en `tcpdf/pdf/CartaPrecentacion.php` | solicitudes? |
| HU-06 | Gestionar catalogo de empresas y horarios | `catalogo.php`, `crear-comisiones.php` | `materiasC.php` → `CrearMateriaC()`, `EliminarMateriaC()`, `CrearComisionC()`, `BorrarComisionC()` | materias?, comisiones? |
| HU-07 | Inscribirse a una empresa | `catalogo.php`, `inscribir-materia.php` | `materiasC.php` → `InscribirMateriaC()` | ? |
| HU-08 | Consultar mi horario | `inscrito.php` | `materiasC.php` → `VerInscripcionesMateriasC()`, `VerComisiones2C()` | ? |
| HU-09 | Subir documentos del expediente | `verCarpeta.php` | `Controladores/subirPDF.php`; `documentosEcenC.php` → `EliminarDocumento()` | documentos? |
| HU-10 | Subir reportes parciales | `verCarpeta.php` | `Controladores/subirReportePDF.php`; `documentosEcenC.php` → `VerDocumentosRepC()` | ? |
| HU-11 | Evaluar reportes parciales | `nota-materia.php` | `documentosEcenC.php` → `ActualizarNotasC()` | notas? |
| HU-12 | Marcar evaluaciones como revisadas | `calificaciones.php` | `documentosEcenC.php` → `ActualizarNotasC()` | ? |
| HU-13 | Agendar y confirmar visitas | `visitas.php`, `Editar-Visitas.php` | `visitasC.php` → `CrearVisitaC()`, `EditarVisitaC()`, `BorrarVisitasC()` | visitas? |
| HU-14 | Comentar observaciones | `Obcervaciones.php` | `ChatC.php` → `EnviarMensajeC()`, `VerMensajes()` | ? |
| HU-15 | Solicitar y generar constancia | `constancia-alumno.php`, `solicitud-Constancia.php` | `ConstanciaC.php` → `Solicitar()`, `Generar()`; PDF en `tcpdf/pdf/Constancia.php` | constancias? |
| HU-16 | Gestionar usuarios | `usuarios.php`, `Editar-usuario.php`, `detalles-usuario.php` | `usuariosC.php` → `CrearUsuarioC()`, `ActualizarUsuariosC()`, `EliminarUsuariosC()`; `ImportarExcel/`, `expExcel/UsuariosExcel.php` | usuarios? |
| HU-17 | Gestionar carreras | `carreras.php`, `Editar-Carrera.php` | `carrerasC.php` → `crearCarreraC()`, `ActualizarCarrerasC()`, `BorrarCarrerasC()` | carrera |
| HU-18 | Actualizar informacion de residencia | `info.php` | `infoResidenciaC.php` → `updateObjectivo()`, `CrearProceso()`, `BorrarProceso()`, `BorrarDocumentos()`; `subirCalendario.php`, `subirCatalogo.php`, `subirDoc.php` | ? |
| HU-19 | Recuperar contraseña | `recuperar.php` | `usuariosC.php` → `IniciarSesionC()` (⚠ no manda correo) | usuarios? |
| HU-20 | Examenes y plan de estudios | `evaluaciones.php`, `crear-evaluaciones.php`, `plan-de-estudios.php` | `evaluacionesC.php` → `CrearExamenC()`, `InscribirseExamenC()` | ? |

**Observaciones**
- La tabla `carrera` si la confirmamos porque la vimos en `carrerasM.php` en la practica 2.
- Varias historias usan el mismo controlador `materiasC.php` aunque no tienen que ver con materias, porque el catalogo de empresas se guarda como si fueran materias.
- Los scripts `subir*.php` estan en la carpeta Controladores pero no son clases, son archivos que se llaman directo desde el formulario.
