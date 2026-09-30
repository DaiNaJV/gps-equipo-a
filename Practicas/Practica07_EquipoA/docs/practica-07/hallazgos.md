# Practica 7 - Hallazgos de la busqueda (evidencia)

Equipo A

⚠ **etica:** solo se anota archivo y linea. no se copia ninguna contraseña ni se intento conectar a ningun servidor.

## 1. busqueda de terminos

comando (sobre el codigo original, remoto `original/master`, `-o` = solo imprime la palabra encontrada):

```bash
git grep -n -I -i -o -E "root|password|PASS|SECRET|clever-cloud|new PDO" original/master | grep -v -E "bower_components|PHPExcel|..."
```

### hallazgos reales (codigo propio)

| archivo | linea(s) | termino | que es |
|---|---|---|---|
| `Modelos/ConexionBD.php` | 7, 12 | clever-cloud | host de MySQL en la nube (Clever Cloud) |
| `Modelos/ConexionBD.php` | 10 | password | contraseña de esa BD en la nube, escrita en el codigo |
| `Modelos/ConexionBD.php` | 12 | new PDO | conexion a la BD en la nube |
| `Modelos/ConexionBD.php` | 14 | new PDO, root | conexion local con usuario root |
| `config/server.php` | 8, 10 | root, PASS | usuario/contraseña de BD en constantes |
| `config/server.php` | 20, 21, 24 | secret / SECRET | llave y vector de cifrado |
| `Controladores/EnviarCorreo.php` | 24 | Password | contraseña de la cuenta de correo SMTP |
| `PHPMailer/EnviarCorreo.php` | 18 | Password | lo mismo, archivo duplicado |
| `ImportarExcel/insertarUsuarios.php` | 10, 11, 16 | root, PASSWORD, new PDO | conexion propia (no usa ConexionBD) |
| `ImportarExcel/insertarCatalogo.php` | 10, 11, 16 | root, PASSWORD, new PDO | igual |
| `Modelos/importExcel.php` | 33, 34, 39 | root, PASSWORD, new PDO | igual + inserta en `tb_libros` (codigo sobrante) |
| `Vistas/modulos/usuarios.php` | 752 | root | opcion "Root" en el select de tipo de usuario |
| `Vistas/modulos/Editar-usuario.php` | 228 | root | igual |
| `sistemacontrolescolar*.sql` | 398 / 458 / 369 | root | el usuario Admin tiene tipo `root` en los INSERT |

### falsos positivos (no son riesgo)

- `Vistas/modulos/Ingresar.php:189,191`, `crearCuenta.php:106`, `recuperar.php:80`, `Controladores/usuariosC.php:49,51` → son `<input type="password">` de formularios (aunque `usuariosC.php` tenga HTML adentro es otro problema, R16)
- `jquery-1.9.1.js`, `xlsx.js`, `paginator.js` (en `Vistas/js` e `ImportarExcel`) → codigo de libreria, "root"/"pass" son nombres de variables
- `Documentos/*.pdf` linea 92666 "Root" → estructura interna del PDF
- `tcpdf/CHANGELOG.TXT`, `tcpdf/LICENSE.TXT` → texto de la libreria

## 2. carpetas con datos (sin abrir los archivos)

| carpeta / archivo | contenido x el nombre | tipo de dato |
|---|---|---|
| `Kardex/` (5 PDF) | `matricula_Kardex.pdf` | historial academico → personal |
| `IMSS/` (5 PDF) | `matricula_IMSS.pdf` | afiliacion a seguridad social → personal (identificador oficial) |
| `Servicio/` (4 PDF) | cartas de liberacion de servicio social | personal/academico |
| `Documentos/` (11 PDF) | `Doc__matricula__fecha__CV.pdf`, carta responsiva, acta… | CV, datos de contacto |
| `sistemacontrolescolar*.sql` (3) | INSERT de `usuarios` (17 registros) y `solicitudes` (5) | nombre, telefono, correo, direccion, fecha nac., num. IMSS, contraseña |

## 3. librerias y mantenimiento

| libreria | version | estado |
|---|---|---|
| PHPExcel | sin version (##VERSION##), 2 copias | **abandonada** (archivada; la reemplaza PhpSpreadsheet) |
| TCPDF | 6.2.6 | sigue mantenida pero la version es vieja |
| PHPMailer | 6.3.0 | mantenida; versiones < 6.5.0 tienen CVE-2021-34551 y CVE-2021-3603 |
| jQuery | 1.9.1 (x2) y 3.2.1 | 1.9.1 obsoleta; ambas tienen CVE de XSS (CVE-2019-11358, CVE-2020-11022) |
| Bootstrap | 3.3.7 | rama 3 sin soporte; XSS CVE-2019-8331 (arreglado en 3.4.1) |
| AdminLTE | 2.4.0 | v2 sin mantenimiento (ya hay v3/v4) |
| SheetJS (xlsx.js) | 0.15.4 (x2) | vieja; CVE-2023-30533 (prototype pollution, < 0.19.3) |
| Bower | — | gestor de paquetes obsoleto |
| PHP | 7.2 (segun volcado SQL) | fuera de soporte |

## 4. documentacion y pruebas

`git ls-tree -r --name-only original/master | grep -i -E "readme|license|test|install"`

- README propio: **no** (todos los README son de librerias)
- LICENSE en la raiz: **no** (solo licencias de librerias, ej. `tcpdf/LICENSE.TXT`, `jvectormap/LICENSE-AGPL`)
- manual de instalacion: **no**
- pruebas: **no** (los `tests/` son de bootstrap-datepicker, select2, jvectormap)

*— [Jesus Medellin Garcia], Analista*
