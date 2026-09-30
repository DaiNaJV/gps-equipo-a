# Practica 2 - Arquitectura del sistema y patron MVC

Equipo A

## ¿Que es MVC?

El patron **Modelo-Vista-Controlador** divide una aplicacion en tres partes para que cada una tenga una sola responsabilidad:

- **Modelo**: se encarga de los datos, osea de hablar con la base de datos (consultas, inserts, updates).
- **Vista**: es lo que ve el usuario, el HTML de cada pantalla.
- **Controlador**: es el intermediario, recibe lo que hace el usuario, le pide los datos al modelo y se los pasa a la vista.

La idea es que si cambias la base de datos solo tocas modelos, y si cambias el diseño solo tocas vistas.

## ¿Como entra una peticion al sistema?

1. El usuario escribe o da clic en una URL como `localhost/Sistema/carreras`.
2. El archivo `.htaccess` tiene activado `RewriteEngine` y una regla que convierte esa URL en `index.php?url=carreras`. Por eso todas las paginas pasan por un solo archivo (a esto se le llama *front controller*).
3. `index.php` hace `require_once` de **todos** los controladores y modelos del sistema (carreras, usuarios, materias, evaluaciones, visitas, chat, etc.) y de PHPMailer, y despues crea un objeto `Plantilla` y llama a `verPlantilla()`.
4. `Controladores/plantillaControlador.php` solo hace `include "Vistas/plantilla.php"`.
5. `Vistas/plantilla.php` es el que realmente decide todo: revisa si hay sesion iniciada, lee el parametro `url`, busca el rol del usuario y carga el menu que le toca (`menu.php` para Admin, `menuAlumno.php`, `menuJefe.php`, `menuAcademico.php` o `menuIndustrial.php`) y al final incluye `modulos/carreras.php`. Si la pagina no esta en su lista manda `404.php` y si no hay sesion manda a `Ingresar.php`.

## Ejemplo: carrerasC.php y carrerasM.php

**`Modelos/carrerasM.php`** tiene la clase `CarrerasM` que hereda de `ConexionBD`. Cada funcion es una operacion de base de datos sobre la tabla `carrera`: `CrearCarreraM` (INSERT), `VerCarrerasM` (SELECT de todas ordenadas por nombre), `EditarCarreraM` (SELECT por id), `ActualizarCarrerasM` (UPDATE) y `BorrarCarreraM` (DELETE). Usa PDO con `prepare` y `bindParam`, lo cual esta bien, aunque el nombre de la tabla se pega directo en el SQL con una variable.

**`Controladores/carrerasC.php`** tiene la clase `CarrerasC` con funciones del mismo nombre pero terminadas en C. Por ejemplo `crearCarreraC()` revisa si llego `$_POST["carrera"]`, llama a `CarrerasM::CrearCarreraM("carrera", ...)` y si salio bien redirige a la pagina de carreras. `BorrarCarrerasC()` saca el id de la URL (`carreras/5` → id 5) y llama al modelo para borrar.

La relacion es 1 a 1: cada controlador tiene su modelo "gemelo" y casi siempre el controlador solo le pasa el nombre de la tabla y los datos. Las vistas (`modulos/carreras.php`) llaman directo a los metodos estaticos del controlador, por ejemplo `CarrerasC::VerCarrerasC()` para llenar la tabla.

## ¿Que tan bien aplica MVC?

Si respeta la estructura general de carpetas, pero encontramos varias cosas que no cumplen al 100% con el patron:

- **Los controladores imprimen HTML y JavaScript.** `EditarCarreraC()` hace `echo` de un formulario completo con inputs y botones, eso le tocaria a la vista. Tambien las redirecciones se hacen imprimiendo `<script>window.location=...</script>`.
- **No hay un enrutador de verdad.** El que decide que pagina mostrar es `plantilla.php`, que es una vista, no un controlador. `plantillaControlador.php` practicamente no hace nada.
- **Hay scripts que se saltan el `index.php`.** Los archivos de `Controladores/subir*.php`, `Ajax/usuariosA.php`, `tcpdf/pdf/*.php` y `expExcel/*.php` se llaman directo desde el navegador y cada uno hace sus propios `require_once`.
- **`ImportarExcel/insertarUsuarios.php` inserta directo a la base de datos** sin pasar por `usuariosM.php`, se salta el modelo.
- **Todos los metodos son estaticos** y `index.php` carga todos los archivos en cada peticion aunque solo se use uno.

En conclusion es un **MVC "casero"**, muy parecido al que se enseña en cursos de YouTube de PHP, que sirve para ordenar el codigo pero con muchas excepciones, por lo que no siempre es facil saber donde esta cada cosa.

El diagrama completo esta en `arquitectura.png` (editable en `arquitectura.drawio`).
