# Práctica 8 – Matriz RACI y plan de comunicación

**Consultora NexoSoft** · Pareja 3: [Nombre completo 1] y [Integrante B3]

**R** = Responsable (hace el trabajo) · **A** = Aprueba / rinde cuentas (solo uno por fila) · **C** = Consultado · **I** = Informado

## 1. Matriz RACI

| Paquete / entregable | Director [Nombre completo 1] | Líder técnico* | Pareja 1 (alcance y cronograma) | Pareja 2 (costos, riesgos y calidad) | Pareja 3 (acta, comunicación) | Cliente (Vinculación) | Jurídico | Centro de Cómputo |
|---|---|---|---|---|---|---|---|---|
| 1.1 Acta y plan | A | C | C | C | R | C | I | I |
| 2.1 Validar requerimientos | A | C | R | I | C | C | I | I |
| 2.2 Especificar módulos nuevos | I | C | R | I | I | A | – | – |
| 2.3 Autorización del autor | A/R | I | I | C | C | I | C | – |
| 3.1 Retirar datos y secretos | A | R | I | C | I | I | I | C |
| 3.2 Aviso de privacidad y ARCO | A | I | I | C | R | C | C | – |
| 4.1–4.2 Base de datos | I | A | R | C | I | I | – | C |
| 5.1–5.9 Desarrollo | I | A | R | C | I | C | – | I |
| 6.1–6.2 Pruebas y auditoría | I | C | C | R | I | I | – | C |
| 6.3 Pruebas de aceptación | C | C | C | R | C | A | – | I |
| Presupuesto y control de costos | A | I | I | R | I | C | – | – |
| Gestión de riesgos | A | C | C | R | C | I | – | – |
| 7.1 Documentación | I | A | C | C | R | I | – | C |
| 7.2 Migración a producción | C | A | R | C | I | I | I | R |
| 7.3 Capacitación | I | C | C | I | R | A | – | – |
| Propuesta al cliente | A | C | C | C | R | I | – | – |
| 1.2 Cierre | A/R | C | C | C | C | C | I | I |

\*En el proyecto real el líder técnico sería una persona contratada; en la consultora escolar este rol lo cubre el integrante con más experiencia en PHP ([Integrante B1]).

## 2. Plan de comunicación

| Qué | A quién | Quién lo prepara | Frecuencia | Medio | Contenido |
|---|---|---|---|---|---|
| Reunión de arranque | Cliente, Centro de Cómputo, jurídico | Director | Una vez (semana 1) | Presencial | Acta, alcance, cronograma, riesgos |
| Reporte de avance | Cliente | Pareja 3 | Semanal (viernes) | Correo + enlace al tablero de GitHub | % de avance por milestone, ruta crítica, riesgos activos, decisiones pendientes |
| Daily del equipo | Consultora | Director | Diaria, 15 min | Presencial o Meet | ¿Qué hice?, ¿qué haré?, ¿qué me bloquea? |
| Revisión de milestone | Cliente | Director + parejas | Al cierre de cada milestone (6 veces) | Presencial con demo | Demostración, aceptación de entregables, ajustes |
| Control de cambios | Cliente | Director | Cuando se solicite | Issue con etiqueta `cambio` + correo | Impacto en alcance, tiempo y costo; requiere firma del cliente |
| Alerta de riesgo | Cliente | Pareja 2 | Inmediata si la exposición es ≥ 15 | Correo + llamada | Riesgo, impacto y respuesta propuesta |
| Seguimiento técnico | Centro de Cómputo | Líder técnico | Quincenal | Correo | Servidor, respaldos, accesos |
| Informe de cierre | Cliente, docente | Director | Una vez (semana 28) | Documento + presentación | Resultados vs. plan, lecciones aprendidas |

**Reglas:** toda decisión queda por escrito (Issue o minuta en `docs/minutas/`); el cliente tiene un único canal oficial (correo del Director); el tablero de GitHub Projects es la fuente de verdad del avance.
