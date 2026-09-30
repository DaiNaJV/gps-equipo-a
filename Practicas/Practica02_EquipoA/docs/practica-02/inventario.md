# Practica 2 - Inventario de carpetas

Equipo A

Recorrimos todas las carpetas de la raiz del repositorio con el explorador de VS Code y contamos los archivos con la terminal (`find <carpeta> -type f | wc -l`). Los numeros son aproximados.

Clasificacion usada:
- Codigo propio: lo escribio el desarrollador del sistema
- Libreria de terceros: codigo descargado de otro proyecto
- Datos/documentos: archivos que genera o sube el usuario (PDFs, Excel, respaldos de BD)
- Configuracion: archivos para que el servidor o git funcionen

## Tabla de carpetas

| Carpeta | No. archivos (aprox) | Tipo de archivos | ¿Que contiene? | Clasificacion | Evidencia |
|---|---|---|---|---|---|
| `Controladores/` | 20 | .php | Las clases controlador de cada modulo (`carrerasC.php`, `usuariosC.php`, `SolicitudResidenciaC.php`...) y scripts para subir archivos (`subirKardex.php`, `subirPDF.php`, etc) | Codigo propio | Nombres en español, terminan en "C", comentarios en español |
| `Modelos/` | 261 | .php, .txt | 13 modelos propios (`carrerasM.php`, `usuariosM.php`, `ConexionBD.php`...) pero adentro esta la libreria PHPExcel completa y dos clases descargadas (`class.upload.php`, `simplexlsx.class.php`) | Mixta: propio (13 archivos) + terceros (~248) | La carpeta `PHPExcel/Classes` trae licencia y comentarios en ingles de otro autor |
| `Vistas/` | ~6,990 | .js, .css, .png, .svg, .php | `plantilla.php`, 49 pantallas en `modulos/`, 3 js propios en `js/` y la plantilla AdminLTE con todos sus plugins en `bower_components/` y `dist/` | Mixta: propio (~55) + terceros (~6,930) | `dist/css/AdminLTE.min.css`, `bower_components/` trae jquery, bootstrap, select2, fullcalendar, ckeditor, etc. |
| `Ajax/` | 1 | .php | `usuariosA.php`, responde en JSON a las peticiones AJAX de `usuarios.js` (editar usuario, verificar matricula) | Codigo propio | Llama a `UsuariosC` |
| `ImportarExcel/` | 6 | .php, .js | Pantallas e inserts para cargar usuarios y catalogo desde Excel. Trae una copia de `jquery-1.9.1.js` y `xlsx.js` | Mixta: 4 propios + 2 terceros | `xlsx.js` es la libreria SheetJS |
| `impExcel/` | 229 | .php | Otra copia de PHPExcel en `Classes/` y un solo archivo propio `leerUsuariosExcel.php` | Mixta(casi todo terceros) | PHPExcel repetida, ya esta en `Modelos/` |
| `expExcel/` | 2 | .php | Exportar usuarios y catalogo a Excel | Codigo propio | `UsuariosExcel.php`, `CatalogoExcel.php` |
| `tcpdf/` | 109 | .php, .txt, fuentes | Libreria TCPDF para generar PDFs. Adentro de `tcpdf/pdf/` el desarrollador puso sus propios generadores (`Constancia.php`, `CartaPrecentacion.php`, `Inscriptos-Materias.php`...) | Mixta: terceros + ~6 propios | Tiene `LICENSE.TXT`, `README.TXT` y `CHANGELOG.TXT` en ingles |
| `PHPMailer/` | 6 | .php | Libreria PHPMailer para mandar correos, mas un `EnviarCorreo.php` | Libreria de terceros | Nombre de producto conocido, clases `SMTP.php`, `POP3.php`, `OAuth.php` |
| `Documentos/` | 11 | .pdf | Documentos que suben los alumnos (CV, acta, constancias, carta responsiva). El nombre sigue el formato `Doc__matricula__fecha__nombre.pdf` y `Rep__...` para reportes | Datos/documentos | Hay PDFs repetidos, el mismo CV de 5.9 MB aparece 4 veces |
| `Kardex/` | 5 | .pdf | Kardex de alumnos, nombrados `matricula_Kardex.pdf` | Datos/documentos | ⚠ parecen datos personales |
| `IMSS/` | 5 | .pdf | Comprobantes del IMSS, `matricula_IMSS.pdf` | Datos/documentos | ⚠ parecen datos personales |
| `Servicio/` | 4 | .pdf | Cartas de liberacion de servicio social | Datos/documentos | ⚠ parecen datos personales |
| `Documentacion/` | 4 | .pdf, .docx | Formatos oficiales que el admin sube para descargar (calendario de residencias, codigo de etica, solicitud de residencia) | Datos/documentos | Nombres con fecha de subida `09-06-2021_...` |
| Raiz (archivos sueltos) | ~7 | .php, .sql, .xls, .htaccess | `index.php`, `.htaccess`, `.gitattributes`, `importarUser.xls` (plantilla de Excel) y los respaldos `sistemacontrolescolar*.sql` | Mixta: `index.php` propio, `.htaccess` y `.gitattributes` configuracion, `.sql` y `.xls` datos | |

## Resumen

| Clasificacion | Archivos aprox | % aprox |
|---|---|---|
| Codigo propio | ~100 | ~1.3 % |
| Librerias de terceros | ~7,500 | ~97 % |
| Datos / documentos | ~35 | ~0.5 % |
| Configuracion | 2-3 | ~0 % |
| Total | ~7,700 | |

Lo que mas nos sorprendio es que el codigo propio es muy poquito comparado con todo el repo. Casi todo el peso son las librerias (sobre todo la plantilla AdminLTE que se subio completa con plugins que ni se usan, como mocha o jvectormap) y los PDFs.

Tambien encontramos que el codigo propio no esta separado de las librerias, por ejemplo hay generadores propios dentro de `tcpdf/pdf/` y la libreria PHPExcel esta dentro de `Modelos/`, esto va a complicar contar lineas en la practica 5.

> Nota: no abrimos los PDFs de `Kardex/`, `IMSS/` y `Servicio/`, solo los identificamos por nombre, por las reglas de etica del curso.
