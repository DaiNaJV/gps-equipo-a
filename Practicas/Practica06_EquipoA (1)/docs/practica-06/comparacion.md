# Práctica 6 – Historia real vs. estimación

**Equipo A**
**Elaboró:** [Dana Jahaveth Vega Coronado] (Analista)

## 1. Obtención del historial

Nuestro repositorio `gps-equipo-a` no conserva el historial del autor: al ejecutar `git rev-list --count HEAD` obtuvimos **1 commit** (el nuestro, del 23-09-2026). Esto se debe a que el repositorio no se creó como *fork* del original, sino subiendo los archivos.

Para recuperar el historial sin modificar el repositorio original, agregamos un remoto de solo lectura y descargamos sus commits:

```bash
git remote add original https://github.com/cbarreral/Sistema_de_Control_Escolar_de_Servicio_Social_y_Residencia_Profesional.git
git fetch original
```

Todos los datos de esta práctica se obtuvieron sobre `original/master`. El archivo `historial.txt` contiene únicamente los commits del autor.

## 2. Datos del historial

| Dato | Valor | Comando |
|---|---|---|
| Primer commit | **22-09-2026** – "Initial commit" | `git log original/master --reverse ... \| head -1` |
| Último commit | **17-12-2026** – "2" | `git log original/master ...` |
| Total de commits | **10** | `git rev-list --count original/master` |
| Autores según Git | cbarreral (8), Carlos Alberto Barrera Lugo (2) | `git shortlog -sn original/master` |
| Personas reales | **1** | ver nota |
| Duración visible | **86 días ≈ 2.8 meses** | hoja *Resumen* de `actividad.xlsx` |
| Semanas con commits | 6 de 13 | hoja *Semanas* |

**Nota sobre los autores:** `cbarreral` es el usuario de GitHub de Carlos Alberto Barrera Lugo, según su perfil público. Aparece con dos nombres porque sus primeros commits se hicieron con una configuración de `user.name` distinta, probablemente desde la interfaz web de GitHub o desde otra computadora. En realidad se trata de **un solo desarrollador**.

## 3. Actividad y fases

La gráfica de `actividad.xlsx` muestra tres periodos claros:
1. **Finales de septiembre e inicios de octubre:** 6 commits en tres semanas.
2. **Del 6 de octubre al 4 de diciembre:** 60 días sin commits.
3. **Diciembre:** 4 commits en dos semanas, justo antes del cierre del semestre agosto–diciembre.

Con base en los mensajes, identificamos las fases del diagrama `gantt-real.png`:

| Fase | Fechas | Evidencia (mensaje de commit) |
|---|---|---|
| 0. Desarrollo previo sin Git *(inferida)* | ago – sep 2026 | El "Initial commit" ya contiene el sistema casi completo |
| 1. Estructura inicial y correo | 22 – 24 sep | "Initial commit", "Implantación de notificaciones mediante correo", "integración de la clase phpmailer" |
| 2. Rediseño y chat de observaciones | 4 oct | "rediseño moderno e incorporación del modulo de observaciones (Chat)", "Modulo de Observaciones en carpetas" |
| 3. Corrección de constancias | 5 oct | "correccion de bugs en el modulo constancia" |
| — Sin actividad registrada | 6 oct – 4 dic | — |
| 4. Información de residencia | 5 dic | "modulo info residencia" |
| 5. Módulos de inicio | 7 dic | "modulos de inicio" (misma fecha del respaldo `sistemacontrolescolar 07-12-2026.sql`) |
| 6. Reestructura y cierre | 15 – 17 dic | "restructura por segunda vez", "2" |

La fase 0 se marca como **inferida** porque no hay commits que la respalden. La deducimos por tres razones: el primer commit ya incluye la estructura completa, el formulario de solicitud maneja el periodo "Agosto–diciembre" y el sistema está adaptado de uno previo de control escolar de materias (Práctica 3).

## 4. Comparación con la estimación (Práctica 5)

| Concepto | Estimado (COCOMO) | Real (Git) |
|---|---|---|
| Tiempo | 8.25 meses | 2.8 meses visibles (≈ 5 meses si se incluye la fase inferida) |
| Personas | 2.8 | 1 |
| Esfuerzo | 23.15 personas-mes | ≈ 2.8 personas-mes visibles (≈ 5 si se incluye la fase inferida) |

El esfuerzo estimado es entre **4 y 8 veces mayor** que el real.

## 5. Análisis de la diferencia

Consideramos que la diferencia se explica por los siguientes factores:

1. **Git no registra todo el trabajo.** Un solo commit inicial con el sistema casi terminado indica que buena parte del desarrollo ocurrió antes de usar Git. Tampoco sabemos cuántas horas representa cada commit.
2. **Reutilización.** El autor partió de un sistema previo de materias y exámenes (tablas `materias`, `examenes`, `notas`) y de la plantilla AdminLTE, de modo que no escribió todo desde cero. COCOMO, en cambio, supone que cada línea se escribe nueva.
3. **Líneas "baratas".** Gran parte de las 8,658 líneas son HTML repetido en las vistas, que se produce copiando y pegando y cuesta mucho menos que el código de lógica.
4. **Actividades no incluidas.** COCOMO contempla análisis, diseño, pruebas, documentación y gestión. El proyecto real no tiene documentación, pruebas ni README, y en la Práctica 4 encontramos tablas faltantes; es decir, se omitieron actividades que el modelo sí considera.
5. **Contexto académico.** Por las fechas, es muy probable que fuera un proyecto de residencia profesional de una sola persona, con horarios intensivos cerca de la entrega, lo cual no corresponde al "equipo orgánico" que supone COCOMO.

En conclusión, la estimación no es "incorrecta": representa lo que costaría construir el sistema **con un proceso profesional completo**, mientras que el historial refleja un desarrollo individual, con reutilización y sin varias actividades de calidad.

## 6. Calidad de los mensajes de commit

| Calidad | Commits | Ejemplos |
|---|---|---|
| Buena (se entiende qué se hizo) | 5 | "Implantación de notificaciones mediante correo", "correccion de bugs en el modulo constancia", "integración de la clase phpmailer" |
| Regular (vaga) | 4 | "modulos de inicio", "restructura por segunda vez", "Initial commit" (que en realidad contiene todo el sistema) |
| Mala (no informa nada) | 1 | "2" |

Los mensajes permiten ubicar módulos, pero no explican **por qué** se hizo un cambio ni qué incluía. Además, los commits son muy grandes (pocos commits para todo el sistema), lo que dificulta revisar o revertir cambios específicos.
