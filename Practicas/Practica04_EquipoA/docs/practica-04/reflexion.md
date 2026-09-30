# Practica 4 - Reflexion

Equipo A

---

### 1. ¿Qué consecuencias tiene que la base de datos no declare llaves foráneas?

La principal consecuencia es que la integridad de los datos depende completamente del código PHP. Si un controlador olvida validar algo, la base de datos no lo impedirá. En concreto, identificamos tres riesgos:

1. **Registros huérfanos.** Es posible eliminar una carrera, una empresa (`materias`) o un usuario y dejar reportes, inscripciones o documentos apuntando a un registro que ya no existe.
2. **Datos inválidos.** Se puede insertar un reporte con una matrícula inexistente o inscribir a un alumno en un horario de otra empresa.
3. **Menor claridad del diseño.** Sin llaves foráneas, las relaciones no quedan documentadas en la base de datos; tuvimos que deducirlas por el nombre de las columnas, y algunas pueden ser incorrectas.

Adicionalmente, sin llaves foráneas tampoco se crean índices en esas columnas, lo que afecta el rendimiento de las consultas cuando crece el número de registros.

*— [Jesus Alejandro Rodriguez Ramirez], Líder*

---

### 2. ¿Qué datos personales guarda el sistema y qué obligaciones legales implica eso para el Instituto?

Pues la verdad guarda bastantes, más de los que pensábamos al principio. De los alumnos está el nombre, la matrícula, la fecha de nacimiento, el teléfono, la dirección, el correo, el sexo, el número de afiliación del IMSS, la póliza de seguro y aparte los PDFs de su kardex, su IMSS y su carta de servicio social, que están guardados en carpetas del servidor. También hay datos de terceros, como el nombre y correo de la persona de la empresa a la que va dirigida la carta, y los nombres de los asesores. Y las calificaciones, que no son datos personales "de identificación" pero sí son información académica que no cualquiera debería ver.

Como el Tec es una institución pública, le aplica la **Ley General de Protección de Datos Personales en Posesión de Sujetos Obligados**. Eso significa, por lo que investigamos, que el Instituto tendría que:

- Tener un **aviso de privacidad** que diga qué datos se recogen y para qué, y que el alumno lo vea antes de registrarse (el sistema no tiene ninguno).
- Pedir solo los datos que realmente se necesitan para el trámite.
- Poner **medidas de seguridad**, y aquí las contraseñas en texto plano y los PDFs accesibles por URL serían un problema serio.
- Respetar los **derechos ARCO** (que el alumno pueda acceder, corregir, cancelar u oponerse al uso de sus datos).
- Definir cuánto tiempo se guardan y borrarlos después.

O sea, antes de usarlo en el Tec habría que arreglar varias cosas, no nada más técnicas sino también administrativas.

*— [Daina Jahaveth Vega Coronado], QA*

---

### 3. ¿Qué cambiarían del modelo si lo rediseñaran?

- FKs en todas las relaciones (las 24 del diagrama)
- 1 solo script actualizado, dentro del repo, con migraciones
- `clave` → `VARCHAR(255)` con `password_hash`
- matricula y telefonos → `VARCHAR`, fechas → `DATE/DATETIME`, calificaciones → `DECIMAL`
- renombrar `materias` → `empresas`, `comisiones` → `horarios`
- separar `usuarios` en `usuarios` (login y rol) + `alumnos` + `asesores`, asi no hay columnas vacias segun el rol
- tabla `asignaciones` (alumno, asesor academico, asesor industrial, empresa, periodo) en vez de guardar los asesores como texto en `usuarios`
- una sola tabla `documentos` con columna `tipo` (kardex, imss, reporte, carta...) en vez de tener `documentos`, `reportes` y `requisitoscarta` por separado
- borrar `evaluaciones`, `notificaciones`, `examenes`, `inscribir_examenes` si no se van a usar
- no guardar el num. de IMSS si no es necesario (minimizacion de datos)
- `NULL` / `DEFAULT` donde tenga sentido, y utf8mb4 en todas las tablas

*— [Jesus Medellin Garcia], Analista*
