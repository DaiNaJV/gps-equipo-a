# Práctica 9 – Lecciones aprendidas

**Consultora NexoSoft** · Integró: [Nombre completo 1], Director de proyecto
**Participaron:** los 6 integrantes (sesión de retrospectiva del [fecha], formato *qué funcionó / qué no / qué haríamos diferente*)

## 1. Qué funcionó

| Lección | Evidencia | Por qué importa |
|---|---|---|
| Usar Git como bitácora obligatoria | Todas las prácticas se entregaron por Pull Request; en la P6 el historial fue la única fuente objetiva | Permite saber quién hizo qué y reconstruir decisiones |
| Separar código propio de librerías desde el inicio | El inventario de la P2 evitó que la P5 estimara con ~920,000 líneas en lugar de 8,658 | Un error de medición multiplica la estimación por 10 o más |
| Medir con dos métodos (COCOMO y puntos de función) | Coincidieron en ±3 %, pero la P6 mostró una realidad hasta 8 veces menor | La comparación expone supuestos que un solo método oculta |
| Trazabilidad HU → vista → controlador → tabla | En la P4 reveló 3 historias sin tabla en la base de datos | Encontró defectos que ni el código ni el diagrama mostraban por separado |
| Ética explícita (no copiar ni usar credenciales) | La P7 documentó 14 hallazgos reales solo con archivo y línea | Un diagnóstico puede ser completo sin volverse un riesgo |
| Automatizar lo repetitivo | El backlog de la P8 (25 Issues, 6 Milestones) se creó con un script | Menos errores de captura y más tiempo para analizar |

## 2. Qué no funcionó

| Problema | Consecuencia | Causa raíz |
|---|---|---|
| El repositorio del Equipo A no se creó como *fork* | En la P6 no había historial; tuvimos que agregar el remoto `original` | No se verificó la configuración inicial contra la instrucción de la P1 |
| Trabajar sobre una copia modificada del sistema | Los números de línea y los conteos no coincidían con el original (P5, P7) | No se separó la "copia de análisis" de la "copia de trabajo" |
| Numeraciones distintas entre equipos (HU, riesgos) | En la P8 tuvimos que hacer tablas de equivalencias | No hubo una convención común desde el inicio |
| Estimaciones puntuales en lugar de rangos | Las cifras parecían más exactas de lo que eran | Falta de práctica para comunicar incertidumbre |
| Dejar para el final las partes grupales (Delphi, top 10) | Sesiones con poco tiempo para discutir | Se planearon las tareas individuales pero no las de integración |

## 3. Qué haríamos diferente

1. **Verificar el entorno el primer día**: fork real, colaboradores, Issues activados y la misma versión del código para todos.
2. **Acordar convenciones comunes entre equipos** desde la P1: nombres de archivos, numeración de HU y riesgos, formato de commits.
3. **Congelar una copia del original** (tag o rama `original`) antes de modificar cualquier cosa.
4. **Estimar siempre en rangos** (optimista, probable, pesimista) y registrar los supuestos al lado de cada cifra.
5. **Calendarizar primero las actividades de integración** y después las individuales.
6. **Revisar entregables en parejas** antes del PR, no solo al aprobarlo.

## 4. Recomendaciones para otra consultora

- **No confíen en los nombres.** Una tabla llamada `materias` guardaba empresas; un rol "Industrial" era una persona de la empresa. Verifiquen en el código.
- **El respaldo de la base de datos no es el modelo de datos.** Crucen siempre lo que el código consulta contra lo que el script crea.
- **Lean el historial antes de estimar.** Les dirá cuántas personas hubo y cuánto tardaron realmente.
- **Un sistema que "funciona" puede ser inadoptable.** Revisen datos personales, credenciales y licencia antes de recomendar cualquier cosa.
- **Documenten mientras trabajan**, no al final: la mitad de nuestras reflexiones salieron de notas tomadas durante las prácticas.
- **La recomendación debe tener condiciones.** "Modernizar, si el autor lo autoriza" es más honesto y útil que un "sí" o un "no".

## 5. Métricas del proyecto de análisis

| Métrica | Valor |
|---|---|
| Prácticas entregadas | 9 |
| Pull Requests | [contar en GitHub] |
| Commits de la consultora | [`git rev-list --count HEAD` menos los 10 del autor] |
| Issues cerrados | [contar en GitHub] |
| Riesgos identificados | 24 (17 altos) |
| Historias de usuario recuperadas | 20 |
