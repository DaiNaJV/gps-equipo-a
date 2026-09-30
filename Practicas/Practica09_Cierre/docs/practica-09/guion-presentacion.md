# Práctica 9 – Guion de la presentación (20 min) y preguntas probables

Las notas completas de cada diapositiva están en `presentacion.pptx` (vista de notas del orador).

## Reparto y tiempos

| # | Diapositiva | Presenta | Min | Acumulado |
|---|---|---|---|---|
| 1 | Portada y presentación del equipo | Director [Nombre completo 1] | 1 | 1 |
| 2 | El reto | Director | 1.5 | 2.5 |
| 3 | Lo que analizamos | [Integrante B1] | 1.5 | 4 |
| 4 | 24 riesgos, 17 graves | [Nombre completo 3] | 2 | 6 |
| 5 | Mapa de calor | [Nombre completo 3] | 1 | 7 |
| 6 | Tres opciones → modernizar | Director | 1.5 | 8.5 |
| 7 | Qué incluye | [Nombre completo 2] | 1.5 | 10 |
| 8 | Seis entregas | [Nombre completo 2] | 1.5 | 11.5 |
| 9 | Cronograma y ruta crítica | [Integrante B1] | 1 | 12.5 |
| 10 | Inversión | [Integrante B2] | 1.5 | 14 |
| 11 | Pago contra entregas | [Integrante B2] | 1 | 15 |
| 12 | Riesgos del proyecto | [Nombre completo 3] | 1.5 | 16.5 |
| 13 | Criterios de calidad | [Integrante B3] | 1 | 17.5 |
| 14 | Equipo y comunicación | [Integrante B3] | 1 | 18.5 |
| 15 | Siguiente paso | Director | 1 | 19.5 |
| 16 | Preguntas | Todos | 5+ | — |

**Tips:** hablen al cliente, no al profe; eviten tecnicismos (digan "cifrar contraseñas", no "password_hash"); ensayen con cronómetro al menos una vez.

## Preguntas probables del cliente

| Pregunta | Quién responde | Respuesta sugerida |
|---|---|---|
| ¿Por qué no lo usamos ya y lo arreglamos sobre la marcha? | Director | Porque desde el primer día pondría en riesgo datos personales y el Tec sería responsable legalmente. Primero se sanea (M2, en 7 semanas) y después se usa. |
| ¿No sale más barato hacerlo desde cero? | B2 | No. Construir lo mismo desde cero se estimó en ~$394,000 **sin** contingencia, sin las funciones nuevas y sin cumplimiento legal; nuestra cifra sí los incluye y reutiliza el análisis ya hecho. |
| ¿Qué pasa si el autor no da permiso? | Director | Lo sabremos en la semana 3. Pasaríamos al plan B: desarrollar un sistema propio usando nuestro análisis como especificación; ajustaríamos tiempo y costo antes de continuar. |
| ¿Se puede conectar con el SII? | [Nombre completo 2] | Está fuera de este alcance para no retrasar la entrega; la arquitectura lo permite como segunda fase. |
| ¿Quién le da mantenimiento después? | B3 | Incluimos 3 meses de garantía, manuales técnicos y capacitación, para que el Centro de Cómputo pueda mantenerlo. Un contrato de soporte sería aparte. |
| ¿Qué tan seguros están de las 28 semanas? | B1 | Es la estimación más probable; 16 tareas son críticas y las vigilamos cada semana. Re-estimamos al cerrar M3 y tenemos 15 % de contingencia. |
| ¿Los alumnos van a saber usarlo? | B3 | Uno de los criterios de aceptación es que un alumno complete su solicitud en 15 minutos sin ayuda; lo probamos con alumnos reales en M5. |
| ¿Qué hacemos con los datos que ya existen? | [Nombre completo 3] | Se migran en la semana 26 con verificación de conteos; las contraseñas se cifran y cada usuario la cambia en su primer acceso. |
