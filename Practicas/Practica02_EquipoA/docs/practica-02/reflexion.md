# Practica 2 - Reflexion

Equipo A

---

### 1. ¿Que porcentaje aproximado de los archivos del repositorio es codigo propio? ¿Que implica eso para estimar el tamaño del proyecto?

Contamos alrededor de 100 archivos propios de ~7,700, osea como el 1.3%. Todo lo demas son librerias (casi todo AdminLTE y sus plugins, PHPExcel que viene dos veces, TCPDF y PHPMailer) y PDFs.

Esto implica que si alguien mide el tamaño contando todo el repositorio (o el peso de 120 MB) va a sobreestimar el proyecto muchisimo. En nuestra hipotesis de la practica 1 dijimos 80-90 archivos propios y no estuvimos tan lejos, pero si hubieramos contado todos los .php hubieramos dicho que el sistema tiene como 500 archivos PHP. Para la practica 5 hay que medir solo lo propio y ademas tener cuidado con las carpetas mixtas como `Modelos/` y `tcpdf/pdf/`, porque si se cuentan completas se infla el esfuerzo y el costo.

*— [Nombre completo 2], Lider*

---

### 2. ¿Que riesgos trae depender de librerias que el equipo no escribio ni mantiene?

- Obsolescencia: PHPExcel ya esta abandonada (la reemplazo PhpSpreadsheet) y las versiones de TCPDF y AdminLTE son viejas. Si el servidor se actualiza a PHP 8 hay funciones que ya no existen y el sistema puede dejar de funcionar.
- Seguridad: si sale una vulnerabilidad en una version vieja (por ejemplo de jQuery 1.9 o PHPMailer) nadie la va a parchar porque las librerias se copiaron a mano, no se usa composer ni npm para actualizarlas.
- Licencias: cada libreria tiene su licencia (TCPDF es LGPL por ejemplo) y hay que respetarlas si el Tec quiere adoptar el sistema.
- Peso y confusion: se subieron plugins que no se usan, y hay copias repetidas (jquery aparece en varias carpetas), eso hace mas pesado el repo y confunde a quien le da mantenimiento.
- Si la libreria cambia su forma de uso en una version nueva hay que modificar el codigo propio.

*— [Daina Jahaveth Vega Coronado], Analista*

---

### 3. ¿La arquitectura encontrada facilita o dificulta que otro equipo le de mantenimiento? ¿Por que?

Las dos cosas. Por un lado facilita porque la separacion en carpetas Modelos/Vistas/Controladores y los nombres con el mismo prefijo (`carrerasC` / `carrerasM` / `carreras.php`) hacen que sea facil encontrar los archivos de un modulo, y es un patron que cualquier egresado de sistemas conoce.

Pero en general creemos que dificulta mas, porque:
- El patron no se respeta siempre, hay HTML dentro de controladores y scripts que se saltan el `index.php` y hasta el modelo, entonces no hay una sola regla para saber donde buscar.
- No hay documentacion, ni comentarios utiles, ni pruebas.
- El codigo propio esta revuelto con librerias.
- Hay faltas de ortografia en nombres de archivos (`Obcervaciones.php`, `CartaPrecentacion.php`) que hacen dificil buscar con Ctrl+P.
- Si se cambia algo de la plantilla.php afecta a todo el sistema porque ahi esta el ruteo, la sesion y los permisos juntos.

Un equipo nuevo tendria que invertir bastante tiempo solo en entender el sistema antes de poder cambiarle algo.

*— [Nombre completo 1], QA / Documentador*
