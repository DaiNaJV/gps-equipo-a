# Practica 3 - Historias de usuario

Equipo A

**Formato:** *Como [rol], quiero [accion], para [beneficio].*
**Prioridad MoSCoW** pensada desde el punto de vista del **Tec de Matehuala** (¿que necesitariamos nosotros si adoptaramos el sistema?):

- **Must** (debe tener): sin esto no sirve para llevar residencias.
- **Should** (deberia): importante pero se puede sobrevivir un tiempo sin eso.
- **Could** (podria): es un extra.
- **Won't** (no por ahora): no lo necesitamos o no aplica.

---

### HU-01 Crear cuenta
**Como** visitante, **quiero** crear mi cuenta con mi matricula, nombre, carrera, correo y contraseña, **para** poder entrar al sistema como alumno.

Criterios de aceptacion:
- Si la matricula ya esta registrada el sistema no deja crear la cuenta y muestra un mensaje.
- Al terminar el registro puedo iniciar sesion con mi matricula y contraseña.
- La carrera se escoge de una lista, no se escribe a mano.

**Prioridad: Must** — sin cuentas no hay forma de que los alumnos usen el sistema.

---

### HU-02 Iniciar sesion
**Como** usuario registrado, **quiero** entrar con mi matricula y contraseña, **para** ver las opciones que me corresponden segun mi rol.

Criterios de aceptacion:
- Con datos correctos me manda a `inicio` y veo el menu de mi rol (Admin, Alumno, Jefe o Asesor).
- Con datos incorrectos aparece un mensaje de error y no entro.
- Si escribo en la URL una pagina sin haber iniciado sesion, me regresa al login.

**Prioridad: Must**

---

### HU-03 Consultar informacion de residencia
**Como** visitante, **quiero** ver en la pagina de inicio los requisitos, el calendario y las empresas vinculadas, **para** saber como empezar mi tramite antes de registrarme.

Criterios de aceptacion:
- En el login se muestran los objetivos, los pasos del proceso y los documentos para descargar.
- El calendario y el catalogo de empresas se pueden descargar en PDF.

**Prioridad: Should** — ayuda mucho pero la info tambien se puede dar por otros medios (pagina del Tec, Facebook).

---

### HU-04 Enviar solicitud de residencia
**Como** alumno, **quiero** llenar la solicitud de residencia y adjuntar mi Kardex, la constancia de liberacion de servicio social y mi cartilla del IMSS, **para** que el departamento revise si puedo hacer mi residencia.

Criterios de aceptacion:
- El formulario pide los mismos datos que el formato P-DRSS-02-F-06 (datos de la empresa, a quien se dirige la carta, datos del alumno, periodo).
- Solo se aceptan archivos PDF, si alguno no es PDF no se guarda la solicitud y se muestra un aviso.
- Despues de enviarla en mi inicio aparece "se ha enviado tu solicitud" y ya no puedo mandar otra.

**Prioridad: Must** — es el inicio de todo el proceso.

---

### HU-05 Revisar solicitudes y generar carta de presentacion
**Como** administrador, **quiero** ver la lista de solicitudes, abrir cada una con sus documentos y aceptarla o rechazarla, **para** decidir quien puede iniciar su residencia y darle su carta de presentacion.

Criterios de aceptacion:
- Las solicitudes se separan en "Aspirantes vigentes" y "Rechazados / Baja temporal".
- Puedo ver el Kardex, IMSS y servicio social de cada alumno en PDF.
- Al aceptar se genera la carta de presentacion en PDF con los datos de la empresa.
- Puedo cambiar el estado a rechazada, baja temporal o "termino residencia" y dejar observaciones.

**Prioridad: Must**

---

### HU-06 Gestionar catalogo de empresas y horarios
**Como** administrador, **quiero** dar de alta empresas en el catalogo con sus horarios y cupo maximo de alumnos, **para** que los alumnos de cada carrera puedan escoger donde hacer su residencia o servicio social.

Criterios de aceptacion:
- Puedo agregar, ver y eliminar empresas indicando nombre, codigo, carrera, tipo (residencia o servicio social) y direccion.
- A cada empresa le puedo crear horarios con cantidad maxima de alumnos.
- Puedo importar la lista desde Excel y exportarla a Excel o PDF.

**Prioridad: Must**

---

### HU-07 Inscribirse a una empresa
**Como** alumno, **quiero** ver las empresas de mi carrera e inscribirme en un horario, **para** apartar mi lugar para la residencia.

Criterios de aceptacion:
- Solo veo las empresas de mi carrera.
- Si el horario ya llego al maximo de alumnos no me deja inscribirme.
- Despues de inscribirme la empresa y el horario aparecen en "Mi horario".

**Prioridad: Should** — en nuestro Tec muchos alumnos consiguen la empresa por su cuenta, pero sirve para las empresas vinculadas.

---

### HU-08 Consultar mi horario
**Como** alumno, **quiero** ver mi horario en la empresa y descargarlo en PDF, **para** tenerlo a la mano.

Criterios de aceptacion:
- Se muestra la empresa, el horario y las horas.
- El boton "Generar PDF" descarga el horario.

**Prioridad: Could**

---

### HU-09 Subir documentos del expediente
**Como** alumno, **quiero** subir en PDF mi carta de aceptacion, codigo de etica, registro de residencia, carta de confidencialidad y comprobante de pago, **para** completar mi expediente sin llevar papeles.

Criterios de aceptacion:
- En mi carpeta aparece la tabla de documentos requeridos y cuales ya subi.
- Si el archivo no es PDF se muestra el mensaje "No se adjunto un archivo PDF".
- Puedo eliminar un documento que subi mal y volver a subirlo.
- Se ve si el documento ya fue "Revisado por Control Escolar" y "Revisado por Jefe".

**Prioridad: Must**

---

### HU-10 Subir reportes parciales
**Como** alumno, **quiero** subir mis reportes parciales en PDF, **para** que mis asesores los califiquen.

Criterios de aceptacion:
- El reporte aparece en la "Tabla de Reportes y Evaluaciones" con nombre y fecha.
- En la misma tabla veo la nota del asesor academico, la del industrial y el promedio.

**Prioridad: Must**

---

### HU-11 Evaluar reportes parciales
**Como** asesor academico o industrial, **quiero** abrir la carpeta del alumno y ponerle calificacion a cada reporte, **para** registrar su avance.

Criterios de aceptacion:
- Cada asesor solo llena su propia nota (academico o industrial).
- El promedio se calcula con las dos notas.
- La calificacion le aparece al alumno en su carpeta.

**Prioridad: Must**

---

### HU-12 Marcar evaluaciones como revisadas
**Como** jefe de carrera (o administrador), **quiero** ver las evaluaciones de los alumnos y marcarlas como hechas, **para** llevar control de que reportes ya se revisaron.

Criterios de aceptacion:
- En "Subir Calificaciones" se ve matricula, nombre, carrera, tipo de evaluacion y promedio por parcial.
- El boton "Marcar como hecho" cambia el estado y ya no aparece como pendiente.

**Prioridad: Should**

---

### HU-13 Agendar y confirmar visitas a la empresa
**Como** alumno, **quiero** agendar una visita de mi asesor a la empresa con fecha, hora y lugar, **para** que se registre el seguimiento en sitio.

Criterios de aceptacion:
- La visita se crea con estatus "solicitando".
- El asesor academico puede confirmarla o negarla y el asesor industrial confirmarla.
- Cuando los dos confirman aparece como "Confirmado".
- Se puede abrir el lugar en Google Maps.

**Prioridad: Should**

---

### HU-14 Comentar observaciones en un documento
**Como** asesor (o alumno), **quiero** escribir observaciones sobre un documento del expediente en un chat, **para** pedir o hacer correcciones sin mandar correos.

Criterios de aceptacion:
- Cada mensaje muestra quien lo envio y la fecha y hora.
- Se puede subir un PDF de evidencia junto con la observacion.

**Prioridad: Could** — es util pero se puede hacer por correo o Teams.

---

### HU-15 Solicitar y generar constancia de liberacion
**Como** alumno, **quiero** solicitar mi constancia al terminar, **para** comprobar que libere mi residencia. **Como** administrador, **quiero** generarla en PDF, **para** entregarla sin hacerla a mano.

Criterios de aceptacion:
- Al solicitarla, al alumno le aparece "en proceso".
- En "Gestor de Constancias" el administrador ve las solicitudes y el boton "Generar Constancia".
- Ya generada, el alumno ve "Listo" y un enlace "ver PDF".

**Prioridad: Must**

---

### HU-16 Gestionar usuarios
**Como** administrador, **quiero** crear, editar y eliminar usuarios de cualquier rol, e importarlos desde Excel, **para** dar de alta a los asesores y jefes y corregir datos de alumnos.

Criterios de aceptacion:
- Al crear un usuario puedo escoger el rol: Administrador, Jefe de Carrera, Asesor Academico, Asesor Industrial o Alumno.
- Si la matricula ya existe se avisa antes de guardar.
- Puedo importar una lista desde Excel usando la plantilla `importarUser.xls` y exportar la tabla a Excel.

**Prioridad: Must**

---

### HU-17 Gestionar carreras
**Como** administrador, **quiero** agregar, editar y borrar carreras, **para** que los alumnos y empresas se organicen por carrera.

Criterios de aceptacion:
- Las carreras aparecen en los select de crear cuenta, usuarios y catalogo.
- Solo Admin puede entrar a "CRUD Carreras".

**Prioridad: Should**

---

### HU-18 Actualizar informacion de residencia
**Como** administrador, **quiero** cambiar los objetivos, los pasos del proceso y subir el calendario, el catalogo y documentos guia, **para** que la informacion del inicio este actualizada cada semestre.

Criterios de aceptacion:
- Los cambios se ven en la pagina de login.
- Puedo agregar y borrar procesos y documentos.

**Prioridad: Should**

---

### HU-19 Recuperar contraseña
**Como** usuario, **quiero** recuperar mi contraseña con mi matricula y correo, **para** poder entrar si se me olvida.

Criterios de aceptacion:
- Me llega un correo con mis datos de acceso.
- Si la matricula y el correo no coinciden, se muestra un mensaje.

**Prioridad: Should**

> ⚠ Nota del equipo: la pantalla dice "Se enviaran tus credenciales mediante correo", pero en el codigo `recuperar.php` llama a `IniciarSesionC()` y no encontramos donde se mande el correo. Parece que esta funcion **no esta terminada**. Lo verificamos en la practica 7.

---

### HU-20 Examenes y plan de estudios (Won't)
**Como** administrador, **quiero** crear evaluaciones tipo examen e inscribir alumnos, y consultar el plan de estudios, **para** llevar control de materias.

Criterios de aceptacion:
- Se pueden crear examenes por materia y ver los inscritos.
- El alumno ve su plan de estudios con notas.

**Prioridad: Won't** — son vistas que quedaron del sistema original de materias (`evaluaciones`, `plan-de-estudios`, `c-e`...). Para residencias no se necesitan y el Tec ya tiene SII para las materias.

---

## Resumen MoSCoW

| Prioridad | Historias | Cantidad |
|---|---|---|
| Must | HU-01, 02, 04, 05, 06, 09, 10, 11, 15, 16 | 10 |
| Should | HU-03, 07, 12, 13, 17, 18, 19 | 7 |
| Could | HU-08, 14 | 2 |
| Won't | HU-20 | 1 |
