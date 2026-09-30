# Cómo hacer y subir la Práctica 8 (este archivo NO va en el repositorio)

Esta práctica es de **6 personas** (Equipos A + B fusionados en la consultora). Todo lo que depende del Equipo B quedó con `[Integrante B1/B2/B3]` o como plantilla.

## 0. Antes de todo (en clase, con el Equipo B)
1. **Nombre de la consultora**: propuse *NexoSoft Consultores*. Si eligen otro, reemplázalo con buscar/reemplazar en todos los archivos y en `propuesta.docx`.
2. **Director**: puse al Integrante 1. Parejas:
   - Pareja 1 (alcance, EDT, cronograma): Integrante 2 + B1
   - Pareja 2 (costos, riesgos, calidad): Integrante 3 + B2
   - Pareja 3 (acta, comunicación, propuesta): Integrante 1 (Director) + B3
3. **Repositorio oficial**: ⚠ les conviene usar el del **Equipo B** si el suyo SÍ es fork (el de ustedes no lo es, ver P6). El Líder de ese repo agrega a los 3 del otro equipo como colaboradores.
4. **Cifra del Delphi**: si el consenso de la P5 no fue ~$394,000, cámbiala en `presupuesto.xlsx` → *Supuestos* → B14.

## 1. Crear Issues y Milestones automáticamente
En el Codespace del **repo oficial**, con Issues activados:
```bash
gh auth status          # debe decir que estás logueado
bash docs/practica-08/crear-backlog.sh
```
Crea 8 etiquetas, 6 milestones con fecha y 25 issues con descripción y criterio de aceptación.
Si falla por permisos: `gh auth login` y vuelve a correrlo.

Luego el **tablero**: pestaña *Projects* → *New project* → *Board* → columnas `Backlog, Por hacer, En proceso, En revisión, Terminado` → *Add items* → selecciona los 25 issues. Opcional: agrega el campo "Milestone" como agrupación.

## 2. Ramas y PRs (vale 15 puntos: commits de los 6 + conflictos documentados)
- Pareja 1 → rama `p08-alcance`: `alcance.md`, `edt.png`, `cronograma.xlsx`, `cronograma.png`, `backlog.md`, `crear-backlog.sh`
- Pareja 2 → rama `p08-costos`: `presupuesto.xlsx`, `riesgos-calidad.md`
- Pareja 3 → rama `p08-acta`: `acta-constitucion.md`, `raci.md`, `propuesta.docx`, `propuesta.pdf`
- Director → rama `p08-integracion`: `colaboracion.md`
- Cada integrante → su archivo en `reflexiones/` (renómbralo con su nombre; los de B usan la plantilla)

Que **cada pareja divida sus commits entre los dos** (uno sube un archivo, el otro otro).

## 3. Conflicto de fusión (hay que documentarlo)
Lo más natural: que dos parejas editen la misma línea de `colaboracion.md` (p. ej., la tabla de organización) en ramas distintas. Al hacer el segundo merge aparece el conflicto → resuélvanlo en VS Code (Accept Both / editar) y anoten fecha, archivo, causa y solución en la sección 3 de `colaboracion.md`.

## 4. Reflexiones
Las de Integrantes 1, 2 y 3 ya están escritas con sus estilos, pero la **pregunta 2 (conflictos)** tiene partes entre corchetes: llénenlas con lo que realmente pasó.

## 5. Propuesta
`propuesta.docx` (5 páginas, el límite es 8) y su versión `propuesta.pdf`. Si cambian el nombre de la consultora, fechas o la cifra, actualicen también el docx.
