# Practica 3 - Reflexion

Equipo A

---

### 1. ¿Que requerimientos del proceso real de residencia en su Instituto no cubre este sistema?

Comparando con lo que sabemos del proceso en el Tec de Matehuala (y lo que nos han platicado compañeros que ya hicieron residencia), el sistema no cubre:

- **Registro y aprobacion del anteproyecto**: aqui el alumno entrega un anteproyecto que revisa la academia, y el sistema no tiene nada de eso.
- **Asignacion de asesor interno** por parte del jefe de departamento, en el sistema los asesores existen como usuarios pero no vimos una pantalla para asignarlos a un alumno.
- **Informe tecnico final** y su revision.
- **Acta de calificacion final / liberacion en el SII**: el sistema genera una constancia pero no se conecta con el SII del Tec.
- **Validacion de creditos**: el sistema solo pregunta "¿has terminado con el 100% de tus materias?", no verifica el 80% de creditos automaticamente.
- **Notificaciones**: no vimos que mande correos cuando cambia el estado de una solicitud.
- **Firmas electronicas** en las cartas.

*— [Nombre completo 3], Lider*

---

### 2. ¿Que tan confiable es recuperar requerimientos a partir del codigo? ¿Que se pierde?

Es **confiable para saber que hace el sistema**, pero **no para saber que deberia hacer**. El codigo muestra lo que se programo, incluyendo cosas que estan a medias (como recuperar contraseña, que dice que manda correo pero no lo hace) y cosas que sobran (las vistas de examenes y plan de estudios). Si no tienes cuidado puedes escribir un requerimiento de algo que en realidad es un error o un resto de otro sistema.

Lo que se pierde:
- **El porque** de cada funcion, osea la necesidad del usuario que la origino.
- **Las reglas de negocio** que nunca se programaron o que se validaban a mano.
- **Requerimientos no funcionales** (cuantos usuarios, tiempos de respuesta, seguridad) casi no se pueden deducir.
- **Prioridades**: el codigo no dice que era lo mas importante para el cliente.

Por eso la priorizacion MoSCoW la tuvimos que hacer nosotros desde nuestro Tec, no se puede sacar del codigo.

*— [Daina Jahaveth Vega Coronado], Analista*

---

### 3. Si los dos equipos obtienen listas distintas, ¿como decidirian cual es la correcta?

Primero no pensariamos que una es "la correcta" y la otra esta mal, porque cada equipo pudo ver cosas diferentes. Lo que hariamos:

1. **Juntar las dos listas** y marcar las historias que coinciden, esas son las mas seguras.
2. Para las que no coinciden, **ir a la evidencia**: cada historia tiene que tener una vista y un controlador real en la matriz de trazabilidad. Si no se puede rastrear al codigo, no es un requerimiento del sistema actual (puede ser una mejora, pero va aparte).
3. Si el docente puede mostrar el sistema funcionando, **probarlo en pantalla** para ver si realmente pasa lo que dice la historia.
4. En un proyecto real, lo ultimo seria **validarlo con los usuarios** (el departamento de residencias), porque ellos son los que saben que se necesita.

*— [Nombre completo 2], QA / Documentador*
