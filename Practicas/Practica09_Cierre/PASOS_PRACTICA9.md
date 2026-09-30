# Cómo cerrar la Práctica 9 (este archivo NO va en el repositorio)

## 1. Presentación
- `presentacion.pptx`: 16 diapositivas para 20 min, con **notas del orador** en cada una (quién presenta y qué decir).
- `guion-presentacion.md`: reparto de tiempos y **8 preguntas probables del cliente con respuesta**.
- Reemplacen `[Nombre completo X]` / `[Integrante BX]` en la diapositiva 14 y en las notas.
- Si usan Google Slides: Archivo → Importar diapositivas → sube el .pptx.
- Ensayen una vez con cronómetro. Hablen como a un cliente (sin tecnicismos).

## 2. Archivos en `docs/practica-09/`
`presentacion.pptx`, `guion-presentacion.md`, `hipotesis-vs-realidad.md`, `lecciones-aprendidas.md`, `reflexion.md`
- En `lecciones-aprendidas.md` → sección 5, llenen los conteos reales de PRs, commits e issues.
- En `reflexion.md` los 3 del Equipo B agregan su respuesta al final.

## 3. README final
`docs/README.md` **reemplaza** al de la P1: ahora es el índice con enlaces a todo, y la hipótesis original queda al final como anexo (sin cambios). Revisen que los enlaces abran en GitHub (si algún archivo tiene otro nombre en su repo, ajústenlo).

## 4. Etiqueta v1.0 (después de hacer merge del último PR)
```bash
git checkout master
git pull
git tag -a v1.0 -m "Entrega final de la consultora"
git push origin v1.0
```
Comprueben en GitHub → pestaña *Tags* (o *Releases*) que aparezca `v1.0`.

## 5. Auto y coevaluación
Son los formatos **que da el docente**; esos no los puedo llenar por ustedes. Tip: argumenten con evidencia (PRs, commits, issues cerrados de cada quien).

## 6. Commits sugeridos
- [Daina Jahaveth Vega Coronado]: `P09: agrega comparacion hipotesis vs realidad`
- [Jesus Medellin Garcia]: `P09: agrega lecciones aprendidas` y `P09: actualiza README como indice final`
- [Jesus Alejandro Rodriguez Ramirez]: `P09: agrega presentacion y guion`
- Cada uno: su parte de `reflexion.md`
