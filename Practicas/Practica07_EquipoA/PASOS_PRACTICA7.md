# Cómo subir la Práctica 7 (este archivo NO va en el repositorio)

Roles (fila «1, 4, 7»): **Líder = Integrante 1**, **Analista = Integrante 2**, **QA = Integrante 3**.
Estilos: Integrante 1 formal · Integrante 2 seco/técnico · Integrante 3 platicado.

## Archivos
- `matriz-riesgos.xlsx` (24 riesgos, exposición con fórmula, colores automáticos)
- `mapa-calor.png`
- `deuda-tecnica.md`
- `top10-riesgos.md` → la propuesta del Equipo A ya está llena; las secciones del Equipo B y el acuerdo se llenan **en el cierre grupal**, y el archivo final debe quedar igual en ambos repos
- `reflexion.md`
- `hallazgos.md` (extra: evidencia de la búsqueda; no lo pide el cuadernillo como entregable, pero respalda los 30 puntos de "identificación con evidencia")

## Issues
1. `P07: Búsqueda de credenciales y datos sensibles` → Analista
2. `P07: Matriz de riesgos y mapa de calor` → Analista
3. `P07: Deuda técnica` → Analista
4. `P07: Top 10 (propuesta) y reflexión` → Líder
5. `P07: Revisión ética (sin contraseñas copiadas) y PR` → QA

## Commits (rama `practica-07`)
- Analista: `P07: agrega hallazgos de busqueda de credenciales`, `P07: agrega matriz de riesgos y mapa de calor`, `P07: agrega deuda tecnica`
- Líder: `P07: agrega propuesta de top 10 de riesgos`
- QA: `P07: agrega reflexion` y, después de la clase, `P07: registra top 10 acordado con equipo B`

## Revisión ética antes del PR (le toca al QA)
Busca en `docs/practica-07/` que no aparezca ninguna contraseña, host completo ni llave: solo nombres de archivo y números de línea.
