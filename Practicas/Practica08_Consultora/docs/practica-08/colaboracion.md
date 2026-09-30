# Práctica 8 – Colaboración y conflictos de fusión

**Consultora NexoSoft** 

## 1. Organización

| Rol | Integrante | Equipo original |
|---|---|---|
| Director de proyecto | [Jesus Alejandro Rodriguez Ramirez] | A |
| Pareja 1 – Alcance, EDT y cronograma | [Nombre completo 2] + [Integrante B1] | A + B |
| Pareja 2 – Costos, riesgos y calidad | [Nombre completo 3] + [Integrante B2] | A + B |
| Pareja 3 – Acta, comunicación y propuesta | [Nombre completo 1] + [Integrante B3] | A + B |

**Repositorio oficial:** [usuario]/gps-equipo-[a/b] — elegido porque [razón: p. ej., es un fork real del original y conserva el historial].
Los integrantes del otro equipo se agregaron como colaboradores el [fecha].

## 2. Flujo de trabajo

- Una rama por pareja: `p08-alcance`, `p08-costos`, `p08-acta`.
- Cada pareja abre su PR hacia `master`; el Director revisa e integra.
- Los commits de cada pareja se reparten entre los dos integrantes.

## 3. Conflictos de fusión

> Completar con lo que **realmente** pasó. Si no surge ningún conflicto natural, el cuadernillo pide documentarlo, así que se recomienda provocar uno controlado (ver el procedimiento abajo).

| # | Fecha | Archivo | Ramas | Causa | Cómo se resolvió | Quién |
|---|---|---|---|---|---|---|
| 1 | | | | | | |
| 2 | | | | | | |

### Procedimiento usado para resolver

```bash
git checkout p08-costos
git pull origin master          # aquí aparece el conflicto
# abrir el archivo en VS Code → "Accept Current / Incoming / Both" o editar a mano
git add <archivo>
git commit -m "P08: resuelve conflicto en <archivo> con rama master"
git push
```

## 4. Diferencias entre los análisis de los equipos A y B

| Tema | Equipo A | Equipo B | Decisión y criterio |
|---|---|---|---|
| KLOC (P5) | 8.66 | | |
| Puntos de función (P5) | 459 | | |
| Número de riesgos (P7) | 24 | | |
| Recomendación (P7) | Modernizar | | |
