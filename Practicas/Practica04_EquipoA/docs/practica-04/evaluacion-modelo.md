# Práctica 4 – Evaluación del modelo de datos

**Equipo A**
**Elaboró:** [Jesus Alejandro Rodriguez Ramirez] (Líder de proyecto)

## 1. Introducción

El presente documento resume los problemas de diseño que el equipo identificó al analizar el respaldo `sistemacontrolescolar 11-06-2021.sql`, así como una propuesta de mejora para cada uno. Cada problema se acompaña de la evidencia encontrada en el script o en el código fuente, de modo que pueda verificarse.

## 2. Problemas encontrados

### 2.1 Ausencia total de llaves foráneas
**Evidencia:** al buscar `REFERENCES` y `FOREIGN KEY` en el script se obtienen cero resultados. Las 17 tablas únicamente declaran `PRIMARY KEY (id)`.
**Consecuencia:** la base de datos no garantiza integridad referencial; por ejemplo, es posible borrar una carrera que todavía tiene alumnos asignados o registrar un reporte con una matrícula inexistente.
**Propuesta:** declarar las 24 relaciones inferidas en el diagrama como `FOREIGN KEY` con `ON DELETE RESTRICT` o `CASCADE` según corresponda.

### 2.2 El script no corresponde con el código
**Evidencia:** el código consulta tablas que no existen en el respaldo de 11-06-2021: `datosestudiante`, `datoscarta`, `requisitoscarta` y `plantillas` aparecen únicamente en `sistemacontrolescolar 2.sql` (generado el 21-06-2021), mientras que `constancias`, `visitas` y `observacionesdoc` no aparecen en ninguno de los tres scripts. Además, `Modelos/importExcel.php` inserta en una tabla `tb_libros` que no tiene relación con el sistema.
**Consecuencia:** si el Instituto instala el sistema con el script oficial, varios módulos (solicitudes, visitas, constancias, chat de observaciones) fallarán.
**Propuesta:** generar un único script actualizado, versionado dentro del repositorio, y eliminar los respaldos obsoletos.

### 2.3 Tipos de dato inadecuados
**Evidencia:**
- `usuarios.clave` es `int(10)`: la contraseña solo puede contener números.
- `usuarios.matricula` es `int(10)`, lo que elimina ceros a la izquierda.
- `solicitudes.telefonoAlumno`, `datosestudiante.telefono` y `datoscarta.telefono` son `int(11)`; su valor máximo es 2,147,483,647, por lo que un celular de 10 dígitos no cabe.
- Todas las fechas (`fecha`, `fechaSolicitud`, `fechanac`, etc.) se guardan como `text`, lo que impide ordenar o filtrar por fecha correctamente.
- Las calificaciones son `text` en `notas` pero `int` en `reportes`.
**Propuesta:** usar `VARCHAR` para matrícula y teléfono, `DATE`/`DATETIME` para fechas, `DECIMAL(4,1)` para calificaciones y `VARCHAR(255)` para el hash de contraseña.

### 2.4 Almacenamiento inseguro de contraseñas
**Evidencia:** la tabla `usuarios` contiene 17 registros de prueba. Sin reproducir los datos, se observó que en **los 17 casos la contraseña es numérica y es idéntica a la matrícula del usuario**, incluido el administrador. Las contraseñas se guardan en texto plano, sin cifrado ni *hash*.
**Consecuencia:** cualquier persona que conozca una matrícula puede iniciar sesión, y cualquiera con acceso al respaldo conoce todas las contraseñas.
**Propuesta:** almacenar `password_hash()` de PHP y validar con `password_verify()`; obligar al usuario a cambiar la contraseña en el primer inicio de sesión.

### 2.5 Redundancia y falta de normalización
**Evidencia:** `solicitudes` repite el nombre, la carrera (como texto) y el correo del alumno, que ya están en `usuarios`; `evaluaciones` guarda `id_carrera` y también `carrera` como texto; `notas` e `inscribir_examenes` guardan tanto `id_alumno` como `matricula`.
**Propuesta:** conservar únicamente la referencia (`id_usuario`) y obtener el resto mediante `JOIN`. Cabe mencionar que la versión 2 del script ya intentó normalizar `solicitudes` dividiéndola en tres tablas.

### 2.6 Nombres poco descriptivos e inconsistentes
**Evidencia:** la tabla `materias` almacena en realidad las **empresas** del catálogo y `comisiones` sus **horarios**; las llaves primarias se llaman `id`, `id_datoscarta` o `id_files` según la tabla; se mezclan estilos (`fechaSolicitud`, `fecha_inicio`, `1_fecha_inicio`) y existe la columna `obcervaciones` con falta de ortografía.
**Propuesta:** renombrar a `empresas` y `horarios_empresa`, y adoptar una convención única (*snake_case*, llave primaria `id`, llaves foráneas `id_<tabla>`).

### 2.7 Tablas heredadas o sin uso
**Evidencia:** `evaluaciones` y `notificaciones` no se usan en ningún controlador; `examenes` e `inscribir_examenes` solo se usan en vistas que no aparecen en los menús (Práctica 3). La tabla `usuarios` concentra columnas que solo aplican a ciertos roles (`institucion` para asesores industriales, `a_academico` para alumnos).
**Propuesta:** eliminar las tablas sin uso y separar los datos específicos por rol en tablas como `alumnos` y `asesores`.

### 2.8 Otros detalles
- Todas las columnas son `NOT NULL` sin valor por defecto, lo que provoca errores al insertar registros incompletos.
- Se mezclan los juegos de caracteres `utf8` y `utf8mb4` entre tablas.
- `materias.PDF` es de tipo `blob`, mientras que en las demás tablas los PDF se guardan como ruta de archivo.

## 3. Conclusión

El modelo cumple con lo mínimo para que el sistema funcione en un entorno de prueba, pero presenta deficiencias importantes de integridad, seguridad y mantenibilidad. Las más urgentes, a juicio del equipo, son el almacenamiento de contraseñas en texto plano (2.4) y la falta de correspondencia entre el script y el código (2.2), ya que ambas impedirían adoptar el sistema de forma segura en nuestro Instituto.
