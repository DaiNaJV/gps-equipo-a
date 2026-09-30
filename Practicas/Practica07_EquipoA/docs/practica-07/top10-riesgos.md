# Práctica 7 – Top 10 de riesgos

**Grupo:** Equipos A y B
**Elaboró la propuesta:** [Jesus Alejandro Rodriguez Ramirez] (Líder, Equipo A)

> Este documento debe quedar **idéntico en ambos repositorios** una vez que se acuerde en el cierre grupal.

## 1. Propuesta del Equipo A

Seleccionamos los diez riesgos con mayor exposición. En caso de empate, se priorizó el que afecta a personas (datos y credenciales) sobre el que afecta al software.

| # | ID | Riesgo | Categoría | P | I | Exp. | Estrategia | Acción principal |
|---|---|---|---|---|---|---|---|---|
| 1 | R01 | Credenciales de MySQL en la nube expuestas en el código y en el historial | Seguridad | 5 | 5 | 25 | Evitar | Rotar credenciales y limpiar el historial |
| 2 | R03 | PDF con datos personales de alumnos en repositorio público | Legal | 5 | 5 | 25 | Evitar | Retirarlos del repositorio y del historial |
| 3 | R04 | Respaldos SQL con datos personales | Legal | 5 | 5 | 25 | Evitar | Reemplazar por datos ficticios |
| 4 | R02 | Contraseñas en texto plano iguales a la matrícula | Seguridad | 5 | 5 | 25 | Mitigar | `password_hash()` y cambio obligatorio |
| 5 | R05 | Archivos accesibles por URL directa con nombre predecible | Seguridad | 4 | 5 | 20 | Mitigar | Servirlos con validación de sesión y rol |
| 6 | R18 | Sin aviso de privacidad ni derechos ARCO | Legal | 5 | 4 | 20 | Evitar | Aviso de privacidad con el área jurídica |
| 7 | R20 | Un solo desarrollador, sin mantenimiento desde 2021 | Proyecto | 5 | 4 | 20 | Mitigar | Documentar y asignar responsable interno |
| 8 | R13 | Script de BD incompleto respecto al código | Técnico | 5 | 4 | 20 | Mitigar | Script único y versionado |
| 9 | R17 | Repositorio sin licencia | Legal | 4 | 4 | 16 | Transferir | Autorización escrita del autor |
| 10 | R12 | PHP 7.x fuera de soporte | Técnico | 4 | 4 | 16 | Mitigar | Migrar a PHP 8.2 |

Quedaron fuera, con exposición 16, R06, R07, R08 y R22. Proponemos agrupar R06, R07 y R08 con R01 en una sola acción ("sacar todos los secretos del código"), ya que se resuelven juntos.

## 2. Propuesta del Equipo B

| # | ID (Equipo B) | Riesgo | Exp. |
|---|---|---|---|
| 1 | | | |
| … | | | |

## 3. Diferencias discutidas

- Riesgos que solo identificó un equipo:
- Diferencias en probabilidad o impacto asignados:
- Criterio para desempatar:

## 4. Top 10 acordado

| # | Riesgo | Categoría | Exposición acordada | Responsable de la acción |
|---|---|---|---|---|
| 1 | | | | |
| 2 | | | | |
| 3 | | | | |
| 4 | | | | |
| 5 | | | | |
| 6 | | | | |
| 7 | | | | |
| 8 | | | | |
| 9 | | | | |
| 10 | | | | |

**Fecha del acuerdo:** [fecha]
