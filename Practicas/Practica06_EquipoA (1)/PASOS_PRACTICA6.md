# Cómo subir la Práctica 6 (este archivo NO va en el repositorio)

Roles (fila «3, 6»): **Líder = Integrante 3**, **Analista = Integrante 1**, **QA = Integrante 2**.

## 1. historial.txt
Ya viene hecho, pero es mejor que lo genere Git en tu Codespace, para que quede con tu commit:
```bash
mkdir -p docs/practica-06
git log original/master --pretty=format:"%ad | %an | %s" --date=short > docs/practica-06/historial.txt
```
(Si lo generas tú, sobrescribe el mío; el contenido debe ser igual.)

## 2. Capturas de Insights (evidencia)
Como su repo no es fork, en **su** repo Insights solo aparecerán ustedes. Tomen las capturas del **repo original**:
- github.com/cbarreral/Sistema_de_Control_Escolar_de_Servicio_Social_y_Residencia_Profesional → Insights → Contributors
- Insights → Commits / Commit activity

Guárdenlas en `docs/practica-06/img/`.

## 3. Issues
1. `P06: Obtener historial y datos de Git` → Analista
2. `P06: Gráfica de actividad y Gantt real` → Analista
3. `P06: Comparación estimado vs real` → Líder
4. `P06: Reflexión y revisión del PR` → QA

## 4. Commits (rama `practica-06`)
- Analista: `P06: agrega historial de commits del autor original` y `P06: agrega actividad por semana y gantt real`
- Analista: `P06: agrega comparacion estimado vs real`
- Líder: `P06: agrega reflexion sobre duracion`
- QA: `P06: agrega reflexion sobre riesgos y revisa PR`

## 5. Ojo
`comparacion.md` explica que su repo no es fork y cómo recuperaron el historial. Déjalo así: es mejor que el profe lo lea explicado a que lo descubra.
