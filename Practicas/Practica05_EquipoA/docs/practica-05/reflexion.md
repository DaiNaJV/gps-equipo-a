# Practica 5 - Reflexion

Equipo A

---

### 1. ¿Por qué los dos métodos dieron resultados distintos? ¿Cuál les parece más confiable?

La verdad a nosotros nos salieron casi iguales (23.15 contra 23.81 personas-mes, como 3% de diferencia), y al principio pensamos que habíamos hecho algo mal. Pero revisándolo nos dimos cuenta que fue más bien coincidencia, porque los dos métodos miden cosas muy diferentes. COCOMO mide cuánto código se escribió, y en este sistema muchas líneas son HTML repetido en las vistas, o sea que si el autor hubiera programado más ordenado tendría menos líneas y según COCOMO "costaría menos", lo cual no tiene mucho sentido. Puntos de función en cambio mide lo que el sistema hace para el usuario (pantallas, reportes, tablas), sin importar cómo se programó, pero depende muchísimo de la productividad que uses: con 8.3 horas por punto sale lo mismo que COCOMO, pero con 14 horas por punto (que también es un dato de ISBSG) casi se duplica.

Para nosotros el más confiable es **puntos de función**, porque se puede calcular antes de programar (con las historias de usuario y el modelo de datos) y porque cada punto lo podemos justificar con una pantalla o tabla real. COCOMO solo funciona bien cuando ya tienes el código, que es justo lo que no tienes cuando vas a empezar un proyecto.

*— [Daina Jahaveth Vega Coronado], Analista*

---

### 2. ¿Por qué los dos equipos obtuvieron cifras distintas analizando el mismo sistema?

Porque, aun con el mismo código y el mismo cuadernillo, cada equipo tomó decisiones distintas en varios puntos del proceso. Las principales fuentes de diferencia que identificamos en el cierre grupal fueron:

1. **Qué se considera código propio.** Basta con incluir o excluir carpetas mixtas como `tcpdf/pdf/`, `ImportarExcel/` o la carpeta `config` para que cambie el total de líneas.
2. **Cómo se cuentan los puntos de función.** Por ejemplo, si cada alta, edición y eliminación se cuenta por separado o como una sola entrada, o si las cuatro tablas de la solicitud se cuentan como uno o como cuatro archivos lógicos.
3. **Las fuentes de salario y productividad.** Cada equipo encontró cifras distintas en portales de empleo y estudios.
4. **La interpretación de lo heredado.** Algunos incluyeron las vistas de exámenes y plan de estudios y otros no.

Esto demuestra que una estimación nunca es un dato objetivo, sino el resultado de supuestos; por eso es indispensable documentarlos, como hicimos en `estimacion.md`.

*— [Jesus Medellin Garcia], QA*

---

### 3. ¿Qué aprendieron sobre la incertidumbre de estimar un proyecto antes de construirlo?

- nosotros teniamos **todo** (codigo, BD, pantallas) y aun asi la cifra depende de supuestos. antes de construir hay mucha menos info → mas incertidumbre
- un solo parametro mueve todo: 8.3 vs 14 h/PF = $400k vs ~$670k
- el error del principio (920k lineas con librerias) daria ~250 PM. o sea, un error de conteo = estimacion 10 veces mas grande
- conviene dar **rangos**, no un solo numero ("entre 350 y 450 mil")
- usar 2 metodos y comparar ayuda a detectar errores
- Delphi sirve: juntar varias opiniones baja el sesgo de una sola persona
- la estimacion se tiene que **re-hacer** conforme avanza el proyecto (cono de incertidumbre)

*— [Nombre completo 2], Lider*
