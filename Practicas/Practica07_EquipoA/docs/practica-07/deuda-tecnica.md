# Practica 7 - Deuda tecnica

Equipo A

deuda tecnica = lo que "se debe" arreglar x decisiones rapidas o descuidos al programar. esfuerzo en **horas de 1 dev junior**, estimado por el equipo (juicio experto, comparando con lo que tardamos en las practicas). mismos supuestos de la P5: 160 h/mes, $13,417/mes + 25%

| ID | deuda | donde | riesgo | horas | prioridad |
|---|---|---|---|---|---|
| DT01 | Credenciales en codigo (nube, root, SMTP, llave) → .env + 1 sola clase de conexion | ConexionBD.php, config/server.php, EnviarCorreo.php x2, ImportarExcel/insertar*.php, Modelos/importExcel.php | R01,R06-R09 | 8 | Alta |
| DT02 | Limpiar historial de Git (credenciales, PDFs, .sql con datos) con git filter-repo | todo el repo | R01,R03,R04 | 6 | Alta |
| DT03 | Contraseñas con password_hash + migrar las existentes + cambio forzado | usuariosC.php, usuariosM.php, tabla usuarios | R02 | 12 | Alta |
| DT04 | Archivos subidos fuera de htdocs y servidos por PHP con validacion de sesion/rol | Kardex/, IMSS/, Servicio/, Documentos/, subir*.php | R05 | 16 | Alta |
| DT05 | Validar subidas (tipo MIME real, tamaño, nombre aleatorio) | Controladores/subir*.php | R05 | 8 | Alta |
| DT06 | Script de BD unico y versionado con las 3 tablas faltantes | sistemacontrolescolar*.sql | R13 | 10 | Alta |
| DT07 | Migrar a PHP 8.2 y probar todos los modulos | todo el codigo propio (~8.7 KLOC) | R12 | 40 | Alta |
| DT08 | PHPExcel → PhpSpreadsheet (importar/exportar) | Modelos/PHPExcel, impExcel/, ImportarExcel/, expExcel/ | R11 | 16 | Media |
| DT09 | Actualizar jQuery, Bootstrap 3 → 5 y AdminLTE 2 → 3/4 (toca las 49 vistas) | Vistas/ | R10 | 60 | Media |
| DT10 | Dependencias con Composer/npm, borrar copias duplicadas (jquery x3, PHPExcel x2) y plugins sin uso | Vistas/bower_components, Vistas/js, ImportarExcel/ | R10,R19 | 8 | Media |
| DT11 | FKs + tipos correctos (fechas DATE, telefono/matricula VARCHAR) con migracion de datos | BD completa | R14 | 24 | Media |
| DT12 | Pruebas automatizadas minimas (PHPUnit): login, solicitud, carpeta, constancia | nuevo /tests | R15 | 30 | Media |
| DT13 | Sacar el HTML de los controladores (MVC real) | Controladores/*C.php (ej. usuariosC.php:45-53) | R16 | 40 | Baja |
| DT14 | Terminar 'recuperar contraseña' (hoy no manda correo) | Vistas/modulos/recuperar.php, EnviarCorreo.php | R16 | 6 | Media |
| DT15 | Quitar codigo heredado: examenes, plan de estudios, tb_libros, tablas evaluaciones/notificaciones | evaluaciones*.php, plan-de-estudios.php, Modelos/importExcel.php | R16 | 8 | Baja |
| DT16 | Renombrar materias→empresas, comisiones→horarios (BD + codigo) | materiasC/M, catalogo.php, BD | R14 | 20 | Baja |
| DT17 | Corregir nombres con faltas (Obcervaciones, Recidencia, CartaPrecentacion) y rutas | Vistas/modulos, tcpdf/pdf | — | 4 | Baja |
| DT18 | README tecnico + manual de instalacion + licencia | raiz | R17,R21 | 16 | Alta |
| | **total** | | | **332** | |

## resumen

| prioridad | horas | personas-mes |
|---|---|---|
| alta (antes de usarlo con datos reales) | 116 | 0.7 |
| media | 144 | 0.9 |
| baja | 72 | 0.5 |
| **total** | **332** | **2.1** |

- costo aprox: 2.08 PM × $13,417 × 1.25 = **$34,800 MXN**
- comparado con construir de cero (P5, ~$394,000): pagar la deuda cuesta ~9% → modernizar si conviene vs rehacer
- lo de prioridad **alta** es obligatorio antes de meter datos reales de alumnos

## notas
- DT09 es la mas cara xq cambiar la plantilla afecta todas las vistas
- no contamos el tiempo de levantar requerimientos nuevos del Tec (R22), eso va en el plan de la P8
- las horas son estimacion del equipo, pueden variar ±30%

*— [Jesus Medellin Garcia], Analista*
