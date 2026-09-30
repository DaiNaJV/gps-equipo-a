# Practica 3 - Actores del sistema

Equipo A

## 1. ¿Como encontramos los roles?

Abrimos `Vistas/plantilla.php` y buscamos la palabra `rol` con Ctrl+F. Ahi hay un bloque de `if / else if` que revisa el rol del usuario que inicio sesion y carga un menu diferente:

| Valor del rol en la BD | Menu que carga | Nombre que le dimos |
|---|---|---|
| `Admin` | `modulos/menu.php` | Administrador |
| `Alumno` | `modulos/menuAlumno.php` | Alumno |
| `Jefe` | `modulos/menuJefe.php` | Jefe de Carrera |
| `a_Academico` | `modulos/menuAcademico.php` | Asesor Academico |
| `a_Industrial` | `modulos/menuIndustrial.php` | Asesor Industrial |

Ademas, si **no** hay sesion iniciada, `plantilla.php` solo deja entrar a `Ingresar.php`, `crearCuenta.php` y `recuperar.php`. A ese usuario lo llamamos **Visitante**.

Un detalle: los nombres "Asesor Academico" y "Asesor Industrial" los sacamos de `usuarios.php`, donde en el formulario de crear usuario el select de rol dice "Acesor Academico" y "Acesor Industrial" (asi, con c).

## 2. Opciones de menu por rol

Sacamos los textos visibles y los `href` de cada archivo de menu:

| Opcion del menu | Pagina (href) | Admin | Alumno | Jefe | A. Academico | A. Industrial |
|---|---|:-:|:-:|:-:|:-:|:-:|
| Inicio | `inicio` | ✔ | ✔ | ✔ | ✔ | ✔ |
| Solicitudes | `verSolicitudes/1` | ✔ | | | | |
| Usuarios | `usuarios` | ✔ | | ✔ | ✔ | |
| Catalogo | `catalogo` | ✔ | ✔ | ✔ | ✔ | |
| Mi horario | `inscrito` | | ✔ | | | |
| Carpetas | `Carpetas` | ✔ | ✔ | ✔ | ✔ | ✔ |
| Certificados | `solicitud-Constancia` / `constancia-alumno` | ✔ | ✔ | ✔ | ✔ | ✔ |
| Visitas a empresa | `visitas` | ✔ | ✔ | ✔ | ✔ | ✔ |
| Subir Calificaciones | `calificaciones` | ✔ | | ✔ | ✔ | |
| CRUD Carreras | `carreras` | ✔ | | | | |
| Informacion | `info` | ✔ | | | | |

Nos llamo la atencion que el **Catalogo no es de materias sino de empresas** ("Gestor de catalogo de empresas"), aunque por dentro usa `MateriasC` y la tabla de materias. Y "Mi horario" son los horarios en los que el alumno puede ir a la empresa (las "comisiones"). Parece que el sistema se hizo a partir de un sistema de control escolar de materias y lo adaptaron para residencias.

## 3. Vistas que no aparecen en ningun menu

De los 49 archivos de `Vistas/modulos` estos no tienen opcion en ningun menu. Buscamos con Ctrl+Shift+F desde donde se llega a cada uno:

| Vista | ¿Como se llega? | ¿Para que sirve? |
|---|---|---|
| `Ingresar.php`, `crearCuenta.php`, `recuperar.php` | Sin sesion | Login, registro y recuperar contraseña |
| `solicitudRecidencia.php` | Boton "Solicitar" en `inicio` del alumno | Formulario de solicitud de residencia |
| `detallesSolicitud.php`, `tablaSolicitudes.php` | Desde `verSolicitudes` y `verCarpeta` | Ver una solicitud completa y aceptarla/rechazarla |
| `verCarpeta.php`, `Obcervaciones.php`, `nota-materia.php` | Boton "Ver carpeta" en `Carpetas` | Expediente del alumno, chat de observaciones y poner nota a un reporte |
| `inscribir-materia.php`, `crear-comisiones.php` | Botones en `catalogo` | Inscribirse a una empresa / crear horarios |
| `Editar-usuario.php`, `detalles-usuario.php`, `Editar-Carrera.php`, `Editar-Visitas.php`, `Editar-Nota.php`, `Editar-Inicio.php` | Botones "Editar" o "Detalles" | Pantallas de edicion |
| `crear-materias.php`, `estudiantes.php` | Botones en `carreras` | Ver empresas y alumnos por carrera |
| `cabecera.php`, `menu*.php`, `404.php`, `salir.php` | Los incluye la plantilla | Partes de la pagina y cerrar sesion |
| `mis-datos.php` | Menu de la cabecera "Ver mi Perfil" | Ver perfil del usuario |
| `plan-de-estudios.php`, `materias.php`, `evaluaciones.php`, `crear-evaluaciones.php`, `c-e.php`, `ver-evaluaciones.php`, `inscribir-evaluacion.php`, `inscritos-evaluacion.php` | Casi no hay enlaces hacia ellas | **Creemos que son restos** del sistema de materias/examenes del que partieron, no tienen que ver con residencias |
| `solicitudes.php` | Ninguno | Esta vacio (0 lineas) |

## 4. ¿Que parte del proceso real automatiza?

En la carpeta `Documentacion` estan el calendario de residencias, la lista de empresas vinculadas, el codigo de etica y el formato **P-DRSS-02-F-06 Solicitud de Residencia Profesional**. Comparando el formato con `solicitudRecidencia.php` los campos son practicamente los mismos (datos de la empresa, persona a quien se dirige la carta, datos del alumno, IMSS, periodo).

Entonces el sistema automatiza esta parte del proceso:
1. Difundir la informacion (requisitos, calendario, empresas) en la pagina de inicio.
2. Llenar la **solicitud de residencia** y subir Kardex, liberacion de servicio social e IMSS.
3. Que el departamento **acepte o rechace** la solicitud y genere la **carta de presentacion** en PDF.
4. Armar el **expediente** del alumno (carta de aceptacion, codigo de etica, carta de confidencialidad, comprobante de pago).
5. Dar **seguimiento**: reportes parciales, calificacion de los asesores y visitas a la empresa.
6. Generar la **constancia de liberacion** al final.

No automatiza por ejemplo la asignacion de asesor, el informe final ni el acta de calificacion (lo vemos en la reflexion).

## 5. Lista de actores

| Actor | Tipo | Descripcion |
|---|---|---|
| **Visitante** | Principal | Persona que entra sin sesion. Puede ver la informacion de residencias, crear su cuenta de alumno y recuperar contraseña. |
| **Alumno** | Principal | Estudiante que quiere hacer (o esta haciendo) su residencia. Envia su solicitud, se inscribe a una empresa del catalogo, sube documentos y reportes, agenda visitas y pide su constancia. |
| **Administrador** | Principal | Personal del departamento que lleva las residencias (en `verCarpeta` aparece como "Revisado por Control Escolar"). Revisa solicitudes, genera cartas y constancias, administra usuarios, carreras, catalogo e informacion del sistema. |
| **Jefe de Carrera** | Principal | Revisa las carpetas y evaluaciones de los alumnos de su carrera y las marca como revisadas ("Revisado por Jefe"). |
| **Asesor Academico** | Principal | Maestro del Tec que asesora al residente. Califica los reportes parciales, confirma o niega visitas y comenta los documentos. |
| **Asesor Industrial** | Principal | Persona de la empresa que supervisa al residente. Califica reportes, confirma visitas en la empresa y comenta documentos. |
| **Servidor de correo** | Secundario (sistema externo) | Servidor SMTP usado con PHPMailer para mandar correos, por ejemplo al recuperar la contraseña. |
