# Practica 6 - Reflexion

Equipo A

---

### 1. ¿Cuántas personas desarrollaron el sistema? ¿Qué riesgo representa eso para quien lo adopte?

- **1 persona**. git dice 2 autores (cbarreral 8, Carlos Alberto Barrera Lugo 2) pero es el mismo: usuario vs nombre completo en `user.name`
- riesgos si el Tec lo adopta:
  - **bus factor = 1**: todo el conocimiento esta en una sola cabeza. si no esta disponible nadie sabe como funciona
  - sin README, sin manual, sin pruebas, sin comentarios utiles → curva de aprendizaje alta
  - ultimo commit jun-2021 → +5 años sin mantenimiento, librerias viejas (PHPExcel, PHP 7)
  - sin licencia → legalmente no esta claro si se puede usar/modificar
  - no hubo revision de codigo (nadie mas lo vio), por eso los errores que salieron en P3 y P4
- mitigacion: documentar antes de adoptarlo, asignar un responsable interno, y si se puede contactar al autor

*— [Daina Jahaveth Vega Coronado], QA*

---

### 2. ¿La duración real se parece a la estimada? ¿Qué factores explican la diferencia?

No se parece nada, la verdad. COCOMO nos dijo 8.25 meses con casi 3 personas, y el historial muestra que una sola persona lo hizo en 86 días, o sea casi 3 meses, aunque si le sumamos lo que creemos que trabajó antes de subirlo a Git serían unos 5. Aun así es mucho menos esfuerzo del estimado.

Lo que más nos llamó la atención es que el "Initial commit" ya traía casi todo el sistema, entonces Git no nos cuenta la historia completa, solo la parte final. También hay un hueco de 60 días (de abril a junio) sin ningún commit, y no sabemos si en ese tiempo trabajó sin subir nada o si de plano no le movió.

Los factores que explican la diferencia son que reutilizó un sistema anterior y la plantilla AdminLTE, que muchas líneas son HTML copiado y pegado, y que no hizo cosas que COCOMO sí cuenta como pruebas o documentación. Además, al ser proyecto de residencia (eso suponemos por las fechas de enero a junio), seguramente le metió horas extra al final para entregar, lo que se ve en los 4 commits de junio. Aprendimos que COCOMO sirve para un equipo profesional, pero no describe bien a un estudiante trabajando solo.

*— [Jesus Alejandro Rodriguez Ramirez], Líder*

---

### 3. ¿Qué convenciones de commits propondrían para su propio equipo?

Con base en lo observado en el historial del autor, proponemos las siguientes convenciones:

1. **Formato con prefijo**, basado en *Conventional Commits*: `tipo(módulo): descripción`, por ejemplo `feat(constancias): generar PDF con folio` o `fix(login): validar matrícula vacía`. Los tipos serían `feat`, `fix`, `docs`, `refactor`, `style` y `chore`. Para las prácticas del curso mantendremos además el prefijo `P0X:` que pide el cuadernillo.
2. **Mensajes descriptivos en infinitivo** y de menos de 72 caracteres en la primera línea; nunca mensajes como "2" o "cambios".
3. **Commits pequeños y frecuentes**, uno por cambio lógico, en lugar de un "Initial commit" con todo el sistema.
4. **Cuerpo del mensaje** cuando el cambio no sea obvio, explicando el porqué.
5. **Referencia al Issue** (`closes #12`) para mantener la trazabilidad con las historias de usuario.
6. **Una sola identidad de Git por persona**, configurando `user.name` y `user.email` en todas las computadoras, para que las estadísticas de autoría sean confiables.
7. **Ramas por funcionalidad** y fusión mediante Pull Request con revisión de al menos otro integrante.

*— [Jesus Medellin Garcia], Analista*
