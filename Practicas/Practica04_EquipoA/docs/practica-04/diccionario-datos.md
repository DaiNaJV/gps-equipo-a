# Practica 4 - Diccionario de datos

Equipo A

fuente: `sistemacontrolescolar 11-06-2021.sql` (17 tablas). al final van 4 tablas extra que salen en `sistemacontrolescolar 2.sql` y que el codigo si usa.

notas rapidas:
- PK de todas = primera columna, AUTO_INCREMENT (seccion de indices al final del script)
- FK declaradas: **0** (Ctrl+F `REFERENCES` = 0 resultados). las FK de aqui son inferidas x nombre de columna
- todas las columnas son `NOT NULL`
- "dato personal" = identifica o se relaciona con una persona fisica (LFPDPPP). calificaciones las marcamos como dato academico


### ajustes

| columna | tipo | llave | descripcion | ¿dato personal? |
|---|---|---|---|---|
| id | int(11) | PK | id del registro de configuracion | no |
| periodo | text |  | periodo actual (ej. ene-jun) | no |
| 1_fecha_inicio | text |  | inicio 1er periodo de reportes | no |
| 1_fecha_fin | text |  | fin 1er periodo de reportes | no |
| 2_fecha_inicio | text |  | inicio 2o periodo | no |
| 2_fecha_fin | text |  | fin 2o periodo | no |
| evaluacion_i | text |  | inicio evaluaciones | no |
| evaluacion_f | text |  | fin evaluaciones | no |
| inscripciones_i | text |  | inicio inscripciones | no |
| inscripciones_f | text |  | fin inscripciones | no |
| h_reportes | int(11) |  | habilitar reportes (0/1) | no |
| h_evaluacion | int(11) |  | habilitar evaluaciones (0/1) | no |
| h_inscripciones | int(11) |  | habilitar inscripciones (0/1) | no |

### carrera

| columna | tipo | llave | descripcion | ¿dato personal? |
|---|---|---|---|---|
| id | int(11) | PK | id carrera | no |
| nombre | text |  | nombre de la carrera | no |

### comisiones

| columna | tipo | llave | descripcion | ¿dato personal? |
|---|---|---|---|---|
| id | int(11) | PK | id del horario | no |
| id_materia | int(11) | FK? → materias | empresa a la que pertenece (materias.id) | no |
| c_maxima | int(11) |  | cupo maximo de alumnos | no |
| horario | text |  | dias/horario | no |
| numero | int(11) |  | numero de horario | no |
| horas | text |  | horas | no |

### documentacion

| columna | tipo | llave | descripcion | ¿dato personal? |
|---|---|---|---|---|
| id | int(11) | PK | id | no |
| PDF | text |  | ruta del archivo | no |
| nombre | text |  | nombre del documento guia | no |

### documentos

| columna | tipo | llave | descripcion | ¿dato personal? |
|---|---|---|---|---|
| id | int(11) | PK | id | no |
| nombre | text |  | tipo de documento (carta aceptacion, codigo etica...) | no |
| PDF | text |  | ruta del PDF subido | si |
| fecha | text |  | fecha de subida | no |
| matricula | int(11) | FK? → usuarios | alumno dueño del doc | si |
| id_materia | int(11) | FK? → materias | empresa (materias.id) | no |

### evaluaciones

| columna | tipo | llave | descripcion | ¿dato personal? |
|---|---|---|---|---|
| id | int(11) | PK | id | no |
| estado | int(11) |  | estado de la evaluacion | no |
| id_carrera | int(11) | FK? → carrera | carrera | no |
| id_materia | int(11) | FK? → materias | empresa | no |
| carrera | text |  | nombre de carrera (repetido) | no |
| a_academico | text |  | asesor academico | si |
| fecha | text |  | fecha | no |
| a_industrial | text |  | asesor industrial | si |
| hora | text |  | hora | no |
| tipo | text |  | tipo de evaluacion | no |

### examenes

| columna | tipo | llave | descripcion | ¿dato personal? |
|---|---|---|---|---|
| id | int(11) | PK | id | no |
| estado | int(11) |  | estado | no |
| id_carrera | int(11) | FK? → carrera | carrera | no |
| id_materia | int(11) | FK? → materias | materia | no |
| aula | text |  | aula | no |
| profesor | text |  | nombre del profesor | si |
| hora | text |  | hora | no |
| fecha | text |  | fecha | no |

### inforesidencia

| columna | tipo | llave | descripcion | ¿dato personal? |
|---|---|---|---|---|
| id | int(11) | PK | id | no |
| objetivos | text |  | texto de objetivos (login) | no |
| empresasPDF | text |  | ruta catalogo empresas | no |
| calendarioPDF | text |  | ruta calendario | no |

### inscribir_examenes

| columna | tipo | llave | descripcion | ¿dato personal? |
|---|---|---|---|---|
| id | int(11) | PK | id | no |
| id_alumno | int(11) | FK? → usuarios | alumno (usuarios.id) | no |
| id_examen | int(11) | FK? → examenes | examen | no |
| matricula | text |  | matricula del alumno (repetida) | si |

### inscripciones

| columna | tipo | llave | descripcion | ¿dato personal? |
|---|---|---|---|---|
| id | int(11) | PK | id | no |
| id_materia | int(11) | FK? → materias | empresa elegida | no |
| id_alumno | int(11) | FK? → usuarios | alumno (usuarios.id) | no |
| id_comision | int(11) | FK? → comisiones | horario elegido | no |

### materias

| columna | tipo | llave | descripcion | ¿dato personal? |
|---|---|---|---|---|
| id | int(11) | PK | id (en realidad es la EMPRESA del catalogo) | no |
| id_carrera | int(11) | FK? → carrera | carrera | no |
| codigo | text |  | codigo de la empresa | no |
| nombre | text |  | nombre de la empresa | no |
| grado | text |  | grado (sobra del sistema de materias, no se usa) | no |
| tipo | text |  | Residencia o Servicio Social | no |
| PDF | blob |  | archivo (blob) | no |

### notas

| columna | tipo | llave | descripcion | ¿dato personal? |
|---|---|---|---|---|
| id | int(11) | PK | id | no |
| id_alumno | int(11) | FK? → usuarios | alumno | no |
| matricula | int(11) |  | matricula (repetida) | si |
| id_materia | int(11) | FK? → materias | empresa | no |
| fecha | text |  | fecha | no |
| a_academico | text |  | asesor academico | si |
| a_industrial | text |  | asesor industrial | si |
| tipo | text |  | tipo de evaluacion | no |
| estado | text |  | estado | no |
| nota_final | text |  | calificacion final | academico |
| nota_academico | text |  | calificacion asesor academico | academico |
| nota_industrial | text |  | calificacion asesor industrial | academico |
| PDF | text |  | ruta evidencia | no |

### notificaciones

| columna | tipo | llave | descripcion | ¿dato personal? |
|---|---|---|---|---|
| id | int(11) | PK | id | no |
| numero | int(11) |  | numero | no |
| estado | text |  | estado | no |
| id_alumno | int(11) | FK? → usuarios | alumno | no |
| id_aAcademico | int(11) |  | asesor academico | no |
| id_aIndustrial | int(11) |  | asesor industrial | no |

### procesos

| columna | tipo | llave | descripcion | ¿dato personal? |
|---|---|---|---|---|
| id | int(11) | PK | id | no |
| info | text |  | texto del paso del proceso | no |
| num | int(11) |  | orden del paso | no |

### reportes

| columna | tipo | llave | descripcion | ¿dato personal? |
|---|---|---|---|---|
| id | int(11) | PK | id | no |
| nombre | text |  | nombre del reporte parcial | no |
| PDF | text |  | ruta del PDF | no |
| fecha | text |  | fecha de subida | no |
| matricula | int(11) | FK? → usuarios | alumno | si |
| id_materia | int(11) | FK? → materias | empresa | no |
| nota_industrial | int(11) |  | calif. asesor industrial | academico |
| nota_academico | int(11) |  | calif. asesor academico | academico |
| promedioFinal | int(11) |  | promedio | academico |
| revisadoJefe | int(11) |  | revisado por jefe (0/1) | no |
| revisadoAdmin | int(11) |  | revisado por control escolar (0/1) | no |

### solicitudes

| columna | tipo | llave | descripcion | ¿dato personal? |
|---|---|---|---|---|
| id | int(11) | PK | id | no |
| fechaSolicitud | text |  | fecha | no |
| periodo | text |  | periodo | no |
| nombreCarta | text |  | a quien se dirige la carta | si |
| nombreEmpresa | text |  | empresa | no |
| domicilioEmpresa | text |  | direccion empresa | no |
| telefonoEmpresa | text |  | tel empresa | no |
| emailEmpresa | text |  | correo empresa | no |
| nombreAlumno | text |  | nombre alumno (repetido de usuarios) | si |
| carreraAlumno | text |  | carrera como texto | no |
| especialidadAlumno | text |  | especialidad | no |
| matricula | int(11) | FK? → usuarios | matricula | si |
| emailAlumno | text |  | correo alumno | si |
| telefonoAlumno | int(11) |  | telefono alumno (int, no cabe 10 digitos) | si |
| tipoProyecto | text |  | tipo de proyecto | no |
| IMSS | text |  | numero de afiliacion IMSS | SI (sensible) |
| polizaSeguroAlumno | text |  | poliza de seguro | si |
| estado | int(11) |  | estado de la solicitud (aceptada/rechazada/baja...) | no |

### usuarios

| columna | tipo | llave | descripcion | ¿dato personal? |
|---|---|---|---|---|
| id | int(11) | PK | id | no |
| matricula | int(10) |  | matricula / usuario de login | si |
| clave | int(10) |  | contraseña (int, texto plano) | SI (credencial) |
| nombre | varchar(200) |  | nombre | si |
| apellido | varchar(200) |  | apellidos | si |
| id_carrera | int(2) | FK? → carrera | carrera | no |
| fechanac | text |  | fecha de nacimiento | si |
| telefono | text |  | telefono | si |
| direccion | text |  | domicilio | si |
| correo | text |  | correo electronico | si |
| rol | text |  | Admin, Alumno, Jefe, a_Academico, a_Industrial | no |
| tipo | text |  | residencia o servicio social | no |
| periodo | text |  | periodo | no |
| a_academico | text |  | asesor academico asignado | si |
| a_industrial | text |  | asesor industrial asignado | si |
| institucion | text |  | institucion/empresa (asesor industrial) | no |
| especialidad | text |  | especialidad | no |

---

## Tablas extra (solo en `sistemacontrolescolar 2.sql`)


### datosestudiante

| columna | tipo | llave | descripcion | ¿dato personal? |
|---|---|---|---|---|
| id_datosestudiante | int(11) | PK | id | no |
| fechaRegistro | text |  | fecha | no |
| periodo | text |  | periodo | no |
| nombre | text |  | nombre alumno | si |
| sexo | text |  | sexo | SI |
| matricula | int(11) | FK? → usuarios | matricula | si |
| id_carrera | int(11) | FK? → carrera | carrera | no |
| especialidad | text |  | especialidad | no |
| telefono | int(11) |  | telefono (int) | si |
| semestre | int(11) |  | semestre | no |
| 100Mate | text |  | ¿100% materias? | no |
| cursandoMate | text |  | ¿cursa materias? | no |
| cuantasMateCursando | text |  | cuantas | no |
| platicaInfo | text |  | ¿asistio a platica informativa? | no |

### datoscarta

| columna | tipo | llave | descripcion | ¿dato personal? |
|---|---|---|---|---|
| id_datoscarta | int(11) | PK | id | no |
| nombre | text |  | empresa | no |
| direccion | text |  | direccion | no |
| municipio | text |  | municipio | no |
| estado | text |  | estado (entidad) | no |
| telefono | int(11) |  | tel empresa (int) | no |
| persona | text |  | persona a quien se dirige | si |
| cargo | text |  | cargo | no |
| correo | text |  | correo de la persona | si |
| matricula | int(11) | FK? → usuarios | alumno | si |

### requisitoscarta

| columna | tipo | llave | descripcion | ¿dato personal? |
|---|---|---|---|---|
| id_files | int(11) | PK | id | no |
| kardex | text |  | ruta PDF kardex | SI (doc. personal) |
| servicioSocial | text |  | ruta PDF liberacion SS | SI (doc. personal) |
| IMSS | text |  | ruta PDF IMSS | SI (doc. personal) |
| numIMSS | text |  | numero IMSS | SI (sensible) |
| matricula | int(11) | FK? → usuarios | alumno | si |

### plantillas

| columna | tipo | llave | descripcion | ¿dato personal? |
|---|---|---|---|---|
| id_plantilla | int(11) | PK | id | no |
| nombre | text |  | nombre plantilla | no |
| texto | text |  | texto de la carta de presentacion | no |

---

## resumen

- tablas: 17 en el script oficial + 4 en la version 2 = 21
- columnas marcadas como dato personal: **39** (sin contar calificaciones)
- datos mas delicados: `usuarios.clave` (contraseña en texto plano), numero de IMSS (`solicitudes.IMSS`, `requisitoscarta.numIMSS`), rutas a PDFs de kardex / IMSS / servicio social, telefono, direccion, fecha de nacimiento
- tablas que el codigo usa pero **no existen en ningun script**: `constancias`, `visitas`, `observacionesdoc` → no se pueden documentar
- tablas que existen pero el codigo **no usa**: `evaluaciones`, `notificaciones`
