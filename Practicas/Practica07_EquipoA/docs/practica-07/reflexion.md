# Practica 7 - Reflexion

Equipo A

---

### 1. ¿Cuál es el riesgo más grave que encontraron y por qué?

Para nosotros el más grave es el **R01, las credenciales de la base de datos en la nube que están escritas en `Modelos/ConexionBD.php`** (líneas 7, 10 y 12). Lo platicamos bastante porque también estaban los PDFs de los alumnos, pero ganó este por tres razones. Primero, el repo es público, o sea que cualquiera en internet puede verlas, no nada más nosotros. Segundo, aunque el autor las borrara hoy, siguen en el historial de Git, entonces "borrar la línea" no sirve. Y tercero, si esa base de datos todavía existe, ahí podrían estar los datos reales de todos los alumnos, así que no es solo un riesgo del código sino de las personas.

Y ojo que nosotros no intentamos entrar, ni siquiera revisamos si la contraseña funciona; el cuadernillo lo deja muy claro y además sería un delito. Solo anotamos el archivo y la línea. Lo que sí haríamos en la vida real es avisarle al autor para que cambie la contraseña, porque es lo único que de verdad lo arregla.

*— [Daina Jahaveth Vega Coronado], QA*

---

### 2. ¿Qué obligaciones establece la Ley Federal de Protección de Datos Personales para un sistema como este?

nota: la LFPDPPP aplica a particulares (empresas, escuelas privadas). un Tec publico es sujeto obligado → le aplica la Ley General de Proteccion de Datos Personales en Posesion de Sujetos Obligados. las 2 se reformaron en marzo de 2025, pero las obligaciones de fondo son casi las mismas:

- **principios**: licitud, finalidad, lealtad, consentimiento, calidad, proporcionalidad, informacion y responsabilidad → solo pedir lo necesario para el tramite (¿de verdad se ocupa el num. de IMSS guardado en texto?)
- **aviso de privacidad** antes de recabar datos: quien es el responsable, para que se usan, a quien se transfieren, como ejercer derechos. el sistema **no tiene** (R18)
- **consentimiento**: datos sensibles (salud, p.ej. IMSS) necesitan consentimiento expreso
- **medidas de seguridad** administrativas, fisicas y tecnicas → contraseñas en texto plano (R02), PDFs publicos (R03, R05) y credenciales expuestas (R01) las incumplen
- **derechos ARCO**: acceso, rectificacion, cancelacion, oposicion → no hay mecanismo
- **confidencialidad**: nadie sin autorizacion puede ver los datos → los PDFs en un repo publico lo violan
- **aviso de vulneraciones**: si hay una fuga, avisar a los titulares
- **conservacion**: definir cuanto tiempo se guardan y borrarlos despues
- incumplir → sanciones economicas y responsabilidad para la institucion

*— [Jesus Medellin Garcia], Analista*

---

### 3. Con lo que saben ahora, ¿recomendarían adoptar, modernizar o descartar el sistema? Justifiquen.

Recomendamos **modernizar**, bajo tres condiciones previas.

**No recomendamos adoptarlo tal como está.** En su estado actual presenta 17 riesgos de nivel alto (de 24 identificados), entre ellos credenciales expuestas, contraseñas en texto plano y datos personales publicados. Usarlo con información real de nuestros alumnos incumpliría la legislación de protección de datos.

**Tampoco recomendamos descartarlo.** El sistema resuelve buena parte del proceso de residencia (solicitud, expediente, reportes, visitas y constancias), su arquitectura es sencilla y conocida por cualquier egresado de sistemas, y el costo de corregir su deuda técnica (≈ 332 horas, alrededor de $35,000 MXN según `deuda-tecnica.md`) es mucho menor que construirlo desde cero (≈ $394,000 según la Práctica 5).

**Condiciones previas a la modernización:**
1. Obtener **autorización por escrito del autor** o que publique una licencia (R17); sin ella no es legal modificarlo ni usarlo.
2. **Eliminar los datos personales** y los secretos del repositorio antes de cualquier otra tarea (R01–R04).
3. **Validar los requerimientos** con el Departamento de Gestión Tecnológica y Vinculación, ya que el proceso del Tec incluye pasos que el sistema no contempla (R22).

Si la primera condición no se cumple, la recomendación cambia a **desarrollar un sistema propio** usando lo aprendido en este análisis como especificación.

*— [Jesus Alejnadro Rodriguez Ramirez], Líder*
