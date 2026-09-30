# Análisis y reingeniería del Sistema de Control Escolar de Servicio Social y Residencia Profesional

**Consultora:** NexoSoft Consultores (Equipos A y B)
**Materia:** Gestión de Desarrollo de Proyectos de Software · Mtro. Jesús Alberto Garza Ortega · Agosto – Diciembre 2026
**Sistema analizado:** [cbarreral/Sistema_de_Control_Escolar_de_Servicio_Social_y_Residencia_Profesional](https://github.com/cbarreral/Sistema_de_Control_Escolar_de_Servicio_Social_y_Residencia_Profesional)
**Versión final:** tag `v1.0`

## Resultado en una línea

El sistema cubre el proceso de residencias, pero **no debe usarse con datos reales** hasta sanearlo. Recomendamos **modernizarlo**: 28 semanas, $477,899 MXN, condicionado a la autorización del autor (ver [propuesta](practica-08/propuesta.pdf)).

## Integrantes

| Integrante | Equipo | Usuario GitHub |
|---|---|---|
| [Jesus Alejandro Rodriguez Ramirez] | A | [usuario1] |
| [Jesus Medellin Garcia] | A | [usuario2] |
| [Daina Jahaveth Vega Coronado] | A | [usuario3] |
| [Integrante B1] | B | |
| [Integrante B2] | B | |
| [Integrante B3] | B | |

## Índice de entregables

| Práctica | Tema | Entregables |
|---|---|---|
| 1 | Arranque e hipótesis | [Hipótesis inicial](#hipotesis-inicial) (abajo) · [reflexión](practica-01/reflexion.md) · [evidencias](practica-01/evidencias.md) |
| 2 | Mapa del sistema y arquitectura | [inventario](practica-02/inventario.md) · [arquitectura](practica-02/arquitectura.md) · [diagrama](practica-02/arquitectura.png) ([drawio](practica-02/arquitectura.drawio)) · [reflexión](practica-02/reflexion.md) |
| 3 | Requerimientos | [actores](practica-03/actores.md) · [casos de uso](practica-03/casos-de-uso.png) ([drawio](practica-03/casos-de-uso.drawio)) · [historias de usuario](practica-03/historias-de-usuario.md) · [trazabilidad](practica-03/trazabilidad.md) · [reflexión](practica-03/reflexion.md) |
| 4 | Modelo de datos | [modelo ER](practica-04/modelo-er.png) ([drawio](practica-04/modelo-er.drawio)) · [diccionario de datos](practica-04/diccionario-datos.md) · [evaluación del modelo](practica-04/evaluacion-modelo.md) · [reflexión](practica-04/reflexion.md) |
| 5 | Estimación | [hoja de estimación](practica-05/estimacion.xlsx) · [resumen](practica-05/estimacion.md) · [Delphi](practica-05/delphi.md) · [reflexión](practica-05/reflexion.md) |
| 6 | Historia real | [historial](practica-06/historial.txt) · [actividad](practica-06/actividad.xlsx) · [Gantt real](practica-06/gantt-real.png) · [comparación](practica-06/comparacion.md) · [reflexión](practica-06/reflexion.md) |
| 7 | Riesgos y deuda técnica | [matriz de riesgos](practica-07/matriz-riesgos.xlsx) · [mapa de calor](practica-07/mapa-calor.png) · [hallazgos](practica-07/hallazgos.md) · [deuda técnica](practica-07/deuda-tecnica.md) · [top 10](practica-07/top10-riesgos.md) · [reflexión](practica-07/reflexion.md) |
| 8 | Plan de reingeniería | [acta](practica-08/acta-constitucion.md) · [alcance](practica-08/alcance.md) · [EDT](practica-08/edt.png) · [backlog](practica-08/backlog.md) · [cronograma](practica-08/cronograma.xlsx) ([Gantt](practica-08/cronograma.png)) · [presupuesto](practica-08/presupuesto.xlsx) · [riesgos y calidad](practica-08/riesgos-calidad.md) · [RACI](practica-08/raci.md) · [propuesta](practica-08/propuesta.docx) · [colaboración](practica-08/colaboracion.md) · [reflexiones](practica-08/reflexiones/) |
| 9 | Presentación y cierre | [presentación](practica-09/presentacion.pptx) · [guion](practica-09/guion-presentacion.md) · [hipótesis vs realidad](practica-09/hipotesis-vs-realidad.md) · [lecciones aprendidas](practica-09/lecciones-aprendidas.md) · [reflexión](practica-09/reflexion.md) |

**Gestión en GitHub:** [Issues](../../issues) · [Milestones](../../milestones) · [Projects](../../projects) · [Pull Requests](../../pulls?q=is%3Apr)

## Cifras clave

| Dato | Valor | Fuente |
|---|---|---|
| Código propio | 8,658 LOC (~1.3 % del repositorio) | P2, P5 |
| Roles / historias de usuario | 5 / 20 | P3 |
| Tablas / llaves foráneas declaradas | 17 / 0 | P4 |
| Estimación (construir de cero) | 23 personas-mes, ~$394,000 | P5 |
| Realidad (historial) | 1 persona, 10 commits, 86 días visibles | P6 |
| Riesgos | 24 (17 altos) | P7 |
| Propuesta | 28 semanas, $477,899 MXN | P8 |

> ⚠ **Nota ética:** este análisis no copia contraseñas ni datos personales; los hallazgos se documentan solo con archivo y línea.

---

## Anexo: hipótesis inicial (Práctica 1, sin cambios)

> Se conserva tal como se escribió para compararla en [hipotesis-vs-realidad.md](practica-09/hipotesis-vs-realidad.md).

### Hipotesis inicial

> Nota: esta hipotesis la escribimos sin abrir el codigo, solo viendo los nombres de carpetas y archivos del repositorio durante los 20 minutos que pedia la practica. La dejamos tal cual para compararla en la practica 9 aunque probablemente tengamos cosas mal.

#### ¿Que creemos que hace el sistema?

Creemos que es un sistema web para llevar el control de los tramites de **Residencia Profesional** y **Servicio Social** de un Tecnologico, osea que los alumnos puedan subir sus documentos y los jefes de departamento los revisen. Esto lo deducimos porque en la carpeta `Vistas/modulos` hay archivos como `solicitudRecidencia.php` (asi viene escrito, con c), `solicitudes.php`, `verSolicitudes.php`, `detallesSolicitud.php` y `solicitud-Constancia.php`, y en `Controladores` esta `SolicitudResidenciaC.php` e `infoResidenciaC.php`.

Tambien pensamos que maneja otras cosas aparte de las residencias:
- **Visitas a empresas** (por `visitasC.php` y `Editar-Visitas.php`)
- **Materias, calificaciones y evaluaciones** (`materiasC.php`, `evaluacionesC.php`, `calificaciones.php`, `plan-de-estudios.php`), aunque no nos queda claro porque un sistema de residencias tendria calificaciones, a lo mejor es para ver si el alumno ya tiene los creditos.
- **Un chat** entre usuarios (por `ChatC.php` y `ChatM.php`), creemos que es para que el alumno hable con su asesor.
- **Envio de correos** (carpeta `PHPMailer` y `EnviarCorreo.php`), tal vez para avisar cuando una solicitud cambia de estado o para recuperar contraseña (hay un `recuperar.php`).
- **Generar PDFs** como constancias o cartas (carpeta `tcpdf` y `ConstanciaC.php`).
- **Importar y exportar Excel** para dar de alta muchos usuarios a la vez (`ImportarExcel`, `impExcel`, `expExcel`, `importarUser.xls`).

#### ¿Para quien es?

Por los archivos de menu que encontramos creemos que hay por lo menos 5 tipos de usuario:
- Alumno (`menuAlumno.php`)
- Jefe de departamento o jefe de carrera (`menuJefe.php`)
- Departamento Academico (`menuAcademico.php`)
- Algo de "Industrial" (`menuIndustrial.php`), no sabemos si es la carrera de Ing. Industrial o el area de vinculacion con la industria/empresas. Nos inclinamos mas por vinculacion porque tiene sentido con las visitas a empresas.
- Un administrador general (`menu.php`, `usuarios.php`, `ajustesC.php`)

El sistema no parece ser del Tec de Matehuala, en `Vistas/img` hay un `logoHidalgo.jpg`, entonces creemos que lo hizo otro Tecnologico (tal vez el de Hidalgo) y lo hicieron alumnos como proyecto de residencia en 2021, porque las fechas de los archivos de la base de datos y de los PDFs son de marzo a junio de 2021.

#### ¿Con que tecnologia?

- **PHP** en el backend, casi todos los archivos son `.php`.
- Creemos que usa el patron **MVC** porque tiene carpetas `Modelos`, `Vistas` y `Controladores` y los archivos terminan en M y C (`usuariosM.php` / `usuariosC.php`). Todo pasaria por el `index.php` de la raiz.
- Base de datos **MySQL**, porque hay varios archivos `.sql` llamados `sistemacontrolescolar` (uno tiene fecha 11-06-2021, parece que iban guardando versiones a mano en vez de usar migraciones).
- En el frontend creemos que usa una plantilla ya hecha tipo **AdminLTE** con **Bootstrap** y **jQuery**, porque hay una carpeta `Vistas/bower_components` con cosas como jquery, select2, Ionicons y `Vistas/dist/css/skins`, eso es tipico de AdminLTE.
- Librerias de terceros: PHPMailer, TCPDF, PHPExcel, xlsx.js.
- Probablemente corre en XAMPP o un hosting compartido con Apache (hay un `.htaccess`).

#### ¿Que tan grande es?

Todo el repositorio pesa como 120 - 150 MB, pero creemos que la mayoria no es codigo, son PDFs (carpetas `Documentos`, `Kardex`, `IMSS`, `Servicio`, `Documentacion`) y librerias. Solo `Vistas` tiene miles de archivos pero casi todos deben ser de la plantilla.

Si contamos solo lo que parece hecho por el desarrollador:
- ~20 controladores
- ~13 modelos
- ~49 vistas en `modulos`

Nuestra estimacion es que el codigo propio es de unos **80 a 90 archivos PHP** y calculamos entre **10,000 y 15,000 lineas de codigo** propias. Lo consideramos un sistema **mediano-pequeño**, que pudo haberlo hecho un equipo de 2 o 3 personas en un semestre.

#### Cosas que nos llamaron la atencion

- Hay PDFs que parecen documentos **reales** de alumnos (kardex, alta del IMSS, CV, cartas de liberacion, hasta un contrato de una agenda dental). Si son de verdad eso seria un problema de privacidad. No los abrimos ni los compartimos.
- Hay faltas de ortografia en nombres de archivos (`Obcervaciones.php`, `solicitudRecidencia.php`), lo que nos hace pensar que no hubo mucha revision.
- Los nombres de archivos no siguen una sola convencion (algunos con guion `Editar-usuario.php`, otros camelCase `crearCuenta.php`, otros con mayuscula `Carpetas.php`).
- No encontramos un README ni manual, ni licencia.
