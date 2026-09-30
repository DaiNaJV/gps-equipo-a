# Práctica 8 – Riesgos y calidad del proyecto de reingeniería

**Consultora NexoSoft** · Pareja 2: [Jesus Alejandro Rodriguez Ramirez] [Daina Jahaveth Vega Coronado] [Jesus Medellin Garcia]
 
## 1. Top 10 de riesgos actualizado

El top 10 de la P7 describía riesgos **del sistema actual**. Varios de ellos se vuelven tareas del plan: R01–R04 (datos y secretos) se resuelven en el paquete 3.1, y R12 (PHP 7) se resuelve con la migración. Para **el proyecto de reingeniería** los riesgos quedan así:

| # | Riesgo del proyecto | Origen | P | I | Exp. | Estrategia | Respuesta | Dueño |
|---|---|---|---|---|---|---|---|---|
| 1 | El autor no otorga autorización o licencia | P7 R17 | 3 | 5 | 15 | Transferir / evitar | Contactarlo en la semana 1; si en la semana 3 no hay respuesta, el cliente decide si desarrollar desde cero (plan B) | Director |
| 2 | Los requerimientos del Tec difieren mucho de lo que hace el sistema | P7 R22 | 4 | 4 | 16 | Mitigar | Validación en 2.1 con minuta firmada; cambios posteriores solo por control de cambios | Pareja 1 |
| 3 | Fuga de datos personales durante la migración | P7 R03–R05 | 2 | 5 | 10 | Evitar | Usar datos ficticios en desarrollo; migración real solo en 7.2, con acceso restringido | Líder técnico |
| 4 | Retraso en la ruta crítica (16 de 25 tareas) | Cronograma | 4 | 4 | 16 | Mitigar | Seguimiento semanal de la ruta crítica; usar la holgura de 5.3/5.9 para apoyar tareas críticas | Director |
| 5 | Curva de aprendizaje de Laravel para devs junior | Nuevo | 4 | 3 | 12 | Mitigar | Capacitación de 1 semana dentro de 5.1; revisión de código por el líder técnico | Líder técnico |
| 6 | Rotación o baja de un integrante (el sistema original tenía bus factor 1) | P7 R20 | 3 | 4 | 12 | Mitigar | Pull Requests con revisión obligatoria; documentación continua; nadie es dueño único de un módulo | Director |
| 7 | Poca disponibilidad del enlace del cliente para pruebas de aceptación | Nuevo | 3 | 4 | 12 | Mitigar | Agendar 6.3 desde el acta; usuarios suplentes | Pareja 3 |
| 8 | Aviso de privacidad no aprobado a tiempo por jurídico | P7 R18 | 2 | 4 | 8 | Mitigar | Iniciar 3.2 en la semana 4 (tiene 20 semanas de holgura) | Pareja 3 |
| 9 | Estimación optimista (variación de 4 a 8 veces vista en P6) | P5–P6 | 3 | 4 | 12 | Aceptar (activo) | Reserva de contingencia del 15 %; re-estimar al terminar M3 | Pareja 2 |
| 10 | Incompatibilidad del servidor institucional (versión de PHP/MySQL) | P7 R12 | 2 | 3 | 6 | Mitigar | Confirmar especificaciones en la semana 1; plan B: VPS contratado (ya presupuestado) | Líder técnico |

**Reserva de contingencia:** 15 % ($62,335 MXN, ver `presupuesto.xlsx`). Solo el Director puede liberarla, con registro del riesgo que se materializó.

## 2. Criterios de calidad

| Atributo | Criterio | Cómo se mide |
|---|---|---|
| Seguridad | 0 vulnerabilidades altas/críticas; 0 secretos en el repo; contraseñas con *hash* | Auditoría OWASP (6.2), `composer audit`, `git grep` de secretos en cada PR |
| Confiabilidad | Pruebas automatizadas en verde antes de cada merge | GitHub Actions |
| Mantenibilidad | ≥ 60 % de cobertura en controladores críticos; estándar PSR-12; sin HTML en controladores | PHPUnit + reporte de cobertura; PHP_CodeSniffer |
| Usabilidad | Un alumno completa su solicitud en ≤ 15 min sin ayuda | Prueba con 5 alumnos en 6.3 |
| Rendimiento | Páginas en < 2 s con 200 usuarios registrados | Prueba de carga básica |
| Portabilidad | Instalación en < 1 h siguiendo el manual | Una persona externa al equipo lo instala (7.1) |
| Legal | Aviso de privacidad visible antes del registro; procedimiento ARCO operativo | Revisión de jurídico |
| Proceso | 100 % de los cambios por Pull Request con al menos 1 revisión; commits con convención `tipo(módulo): mensaje` | Historial de GitHub |

## 3. Criterios de aceptación del cliente

1. Todas las HU **Must** (P3) funcionan según sus criterios de aceptación, verificadas en 6.3.
2. Las HU nuevas (anteproyecto y asignación de asesores) están aprobadas por Vinculación.
3. Se entregan el manual de usuario por rol y el manual técnico.
4. Los datos migrados coinciden en número de registros con el origen.
5. Se firma el acta de aceptación al cierre de M5 y el acta de cierre en M6.

## 4. Presupuesto (resumen)

| Concepto | MXN |
|---|---|
| Personal (1 líder técnico + 2 devs junior × 6.45 meses) | $310,052 |
| Indirectos 25 % | $77,513 |
| Otros directos (servidor, jurídico, capacitación) | $28,000 |
| **Subtotal** | **$415,564** |
| Contingencia 15 % | $62,335 |
| **Total** | **$477,899** |

**Sustento:** 459 PF de la P5 ajustados al nuevo alcance dan 502 PF (se quitan las funciones heredadas y se agregan las nuevas). Con 8.3 h/PF y un 20 % de reutilización resultan 20.8 personas-mes, que se cubren con el plan de personal de 3 personas durante 6.45 meses (19.4 PM). El total es 21 % mayor que la estimación de "construir de cero" de la P5 porque incluye alcance nuevo, contingencia, líder técnico con salario mayor y costos que la P5 no consideraba (servidor, jurídico, capacitación).

> ⚠ Si en el Delphi de la P5 se acordó otra cifra, cámbienla en `presupuesto.xlsx` → hoja *Supuestos*, celda B14.
