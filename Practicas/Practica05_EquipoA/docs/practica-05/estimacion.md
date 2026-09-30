# Practica 5 - Estimacion inversa

Equipo A · hoja de calculo: `estimacion.xlsx` (todas las celdas calculadas son formulas)

pregunta del cliente: *si hoy lo hicieramos desde cero, ¿cuanto cuesta y cuanto tarda?*

## resumen

| | COCOMO basico | Puntos de funcion |
|---|---|---|
| tamaño | 8.658 KLOC | 459 PF (sin ajustar) |
| esfuerzo | **23.15 personas-mes** | **23.81 personas-mes** (3,810 h) |
| tiempo | **8.2 meses** | 7.9 meses (con 3 personas) |
| personal | 2.8 personas | 3 (supuesto) |
| costo total (+25%) | **$388,209 MXN** | **$399,334 MXN** |

promedio de los 2 metodos: **~$394,000 MXN, ~8 meses, equipo de 3**

## 1. LOC

- herramienta: VS Code Counter (clic derecho → *Count lines in directory*), carpeta x carpeta
- solo codigo propio segun inventario de la P2

| grupo | archivos | codigo | coment. | blancos |
|---|---|---|---|---|
| Controladores | 19 | 1,105 | 69 | 388 |
| Modelos (propios, sin PHPExcel ni class.upload / simplexlsx) | 13 | 986 | 105 | 389 |
| Vistas/modulos | 49 | 5,378 | 180 | 1,640 |
| Vistas/plantilla.php | 1 | 106 | 38 | 39 |
| Vistas/js (comisiones, materias, usuarios) | 3 | 126 | 2 | 41 |
| Ajax | 1 | 41 | 0 | 13 |
| ImportarExcel (4 .php) | 4 | 314 | 40 | 40 |
| expExcel | 2 | 108 | 2 | 16 |
| impExcel/leerUsuariosExcel.php | 1 | 19 | 6 | 3 |
| tcpdf/pdf (6 propios) | 6 | 360 | 0 | 246 |
| config | 2 | 79 | 28 | 16 |
| raiz (index.php, .htaccess) | 2 | 36 | 2 | 18 |
| **total** | **103** | **8,658** | **472** | **2,849** |

- KLOC = 8,658 / 1000 = **8.658**
- ⚠ 1er intento contamos todo el repo → ~920,000 lineas. error, estaban las librerias (AdminLTE, TCPDF, PHPExcel x2...). regresamos al inventario de la P2
- se excluyo tambien `tcpdf/pdf/pdf.php` → es el `example_001.php` de TCPDF, no es del autor

## 2. COCOMO basico (organico)

- E = 2.4 × 8.658^1.05 = **23.15 PM**
- T = 2.5 × 23.15^0.38 = **8.25 meses**
- P = 23.15 / 8.25 = **2.8 personas**
- modo organico xq: equipo chico, sistema web sin restricciones fuertes, requisitos conocidos

## 3. Puntos de funcion

detalle con evidencia (vista/controlador/tabla) de cada elemento → hoja `PuntosFuncion`

| tipo | cant. | peso | PF |
|---|---|---|---|
| EI entradas externas (forms que guardan/borran) | 33 | 4 | 132 |
| EO salidas externas (PDF, Excel, correo, contadores) | 10 | 5 | 50 |
| EQ consultas externas (listados, detalles, login) | 20 | 4 | 80 |
| ILF archivos logicos internos (tablas propias) | 19 | 10 | 190 |
| EIF archivos de interfaz externos | 1 | 7 | 7 |
| **total** | | | **459** |

criterios que usamos:
- cada alta / edicion / borrado cuenta como EI aparte (asi lo dice IFPUG)
- ILF: solicitudes + datosestudiante + datoscarta + requisitoscarta = **1** grupo logico (el usuario lo ve como "la solicitud")
- ILF: si contamos visitas, constancias y observacionesdoc aunque no esten en el script, xq el codigo los usa
- ILF: NO contamos evaluaciones ni notificaciones (ningun controlador las usa, P4)
- EIF: solo el Excel de importacion (`importarUser.xls`). el SMTP no cuenta como archivo, es una salida
- complejidad media para todo (lo pide el cuadernillo)

conversion a esfuerzo:
- productividad: **8.3 h/PF** = mediana ISBSG 2021 para lenguajes tradicionales (PHP entra aqui)
- 459 × 8.3 = 3,810 h / 160 h/mes = **23.81 PM**

## 4. Costo

- salario junior SLP: **$13,417 MXN/mes** (Glassdoor mx, mediana "Programador Junior" en San Luis Potosi, ago-2026). como comparacion Indeed da $12,221/mes para "Programador web jr" en SLP
- costo = esfuerzo × salario + 25% indirectos
- COCOMO: 23.15 × 13,417 = $310,567 + $77,642 = **$388,209**
- PF: 23.81 × 13,417 = $319,467 + $79,867 = **$399,334**
- diferencia: $11,125 (2.9%)

## 5. supuestos

1. el codigo que medimos es la version corregida del fork, puede variar unas lineas vs el original
2. se estima construir **lo mismo que existe**, incluyendo lo heredado (examenes, plan de estudios)
3. todo el equipo es junior con el mismo salario, sin lider senior ni QA dedicado
4. 160 h productivas por mes (en la realidad son menos x juntas, etc)
5. el salario es sueldo base, no incluye IMSS/prestaciones patronales (en teoria entran en el 25%)
6. no se incluye diseño grafico: la plantilla AdminLTE es gratis
7. PF sin ajustar (sin factor de ajuste de valor)

## 6. comparacion de metodos

- salieron casi iguales (23.15 vs 23.81 PM). mas coincidencia que otra cosa, ver reflexion
- COCOMO depende 100% de las lineas → si el codigo esta inflado (HTML repetido en las vistas) sube el esfuerzo
- PF depende del conteo y sobre todo de la productividad: con 14 h/PF (otro dato de ISBSG) serian 40 PM y ~$670,000
- los dos asumen que se sabe exactamente que construir, en un proyecto real eso no pasa

*— [Nombre completo 2], Lider*
