# Modelo de Base de Datos SIRAS

## 1. Descripción

La base de datos de SIRAS almacena la información necesaria para gestionar el proceso de Prácticas Profesionales.

El sistema contempla las siguientes entidades principales:

* Usuarios
* Alumnos
* Empresas
* Vacantes de prácticas
* Postulaciones
* Documentos
* Reportes
* Notificaciones

La base de datos será PostgreSQL.

---

## 2. Entidades principales

### 2.1 Usuarios

La entidad `usuarios` contiene la información necesaria para la autenticación y control de acceso al sistema.

```text
usuarios
────────────────────────────
id_usuario        PK
correo            UNIQUE
password_hash
rol
activo
fecha_creacion
```

El campo `rol` permite diferenciar los tipos de usuario que utilizarán SIRAS.

Roles principales:

* Alumno
* Coordinador

---

### 2.2 Alumnos

La entidad `alumnos` contiene la información académica y personal necesaria para gestionar las prácticas profesionales.

```text
alumnos
────────────────────────────
id_alumno         PK
id_usuario        FK
nombre
apellido_paterno
apellido_materno
matricula
carrera
semestre
telefono
perfil_academico
fecha_registro
```

Relación:

```text
usuarios 1 ─────────── 1 alumnos
```

Un usuario puede tener un perfil de alumno.

---

### 2.3 Empresas

La entidad `empresas` almacena la información de las empresas que ofrecen oportunidades de prácticas profesionales.

```text
empresas
────────────────────────────
id_empresa        PK
nombre
descripcion
direccion
telefono
correo
sitio_web
fecha_registro
activo
```

Una empresa puede publicar varias vacantes.

Relación:

```text
empresas 1 ─────────── N vacantes_practicas
```

---

### 2.4 Vacantes de prácticas

La entidad `vacantes_practicas` contiene las oportunidades de prácticas profesionales disponibles para los alumnos.

```text
vacantes_practicas
────────────────────────────
id_vacante        PK
id_empresa        FK
titulo
descripcion
requisitos
ubicacion
modalidad
fecha_inicio
fecha_fin
estado
fecha_publicacion
```

Relación:

```text
empresas 1 ─────────── N vacantes_practicas
```

Una empresa puede publicar muchas vacantes.

---

### 2.5 Postulaciones

La entidad `postulaciones` registra las solicitudes realizadas por los alumnos para participar en una vacante.

```text
postulaciones
────────────────────────────
id_postulacion    PK
id_alumno         FK
id_vacante        FK
estado
fecha_postulacion
fecha_actualizacion
comentarios
```

Relaciones:

```text
alumnos 1 ─────────── N postulaciones

vacantes_practicas 1 ─────────── N postulaciones
```

Estados posibles de una postulación pueden incluir:

* Pendiente
* En revisión
* Aceptada
* Rechazada

---

### 2.6 Documentos

La entidad `documentos` permite registrar los archivos relacionados con el proceso de prácticas profesionales.

```text
documentos
────────────────────────────
id_documento      PK
id_alumno         FK
id_postulacion    FK
nombre_archivo
tipo_documento
url_archivo
fecha_subida
estado_validacion
```

Los archivos físicos no se almacenarán directamente dentro de PostgreSQL. La base de datos almacenará la información del archivo y su ubicación en el servicio de almacenamiento configurado.

Relaciones:

```text
alumnos 1 ─────────── N documentos

postulaciones 1 ─────────── N documentos
```

---

### 2.7 Reportes

La entidad `reportes` registra los reportes relacionados con las prácticas profesionales.

```text
reportes
────────────────────────────
id_reporte        PK
id_alumno         FK
id_postulacion    FK
titulo
descripcion
url_archivo
fecha_subida
estado_revision
resultado_ia
```

Relaciones:

```text
alumnos 1 ─────────── N reportes

postulaciones 1 ─────────── N reportes
```

Los reportes podrán ser analizados mediante el servicio de inteligencia artificial definido para SIRAS.

---

### 2.8 Notificaciones

La entidad `notificaciones` almacena las notificaciones generadas por el sistema.

```text
notificaciones
────────────────────────────
id_notificacion   PK
id_usuario        FK
titulo
mensaje
tipo
leida
fecha_creacion
```

Relación:

```text
usuarios 1 ─────────── N notificaciones
```

Un usuario puede recibir múltiples notificaciones.

---

# 3. Diagrama entidad-relación

El siguiente diagrama representa las relaciones principales del modelo.

```text
┌─────────────────────┐
│      usuarios       │
├─────────────────────┤
│ PK id_usuario       │
│    correo           │
│    password_hash    │
│    rol              │
│    activo           │
└──────────┬──────────┘
           │
           │ 1:1
           ▼
┌─────────────────────┐
│       alumnos       │
├─────────────────────┤
│ PK id_alumno        │
│ FK id_usuario       │
│    nombre           │
│    apellidos        │
│    matricula        │
│    carrera          │
│    semestre         │
└──────┬────────┬─────┘
       │        │
       │ 1:N    │ 1:N
       ▼        ▼
┌────────────┐ ┌─────────────────────┐
│documentos  │ │    postulaciones    │
├────────────┤ ├─────────────────────┤
│PK id_doc   │ │ PK id_postulacion   │
│FK id_alumno│ │ FK id_alumno        │
│FK id_post  │ │ FK id_vacante       │
│tipo        │ │ estado              │
│url_archivo │ │ fecha_postulacion   │
└────────────┘ └──────────┬──────────┘
                           │
                           │ N:1
                           ▼
                 ┌─────────────────────┐
                 │ vacantes_practicas  │
                 ├─────────────────────┤
                 │ PK id_vacante       │
                 │ FK id_empresa       │
                 │ titulo              │
                 │ descripcion         │
                 │ requisitos          │
                 │ ubicacion           │
                 │ modalidad           │
                 │ estado              │
                 └──────────┬──────────┘
                            │
                            │ N:1
                            ▼
                 ┌─────────────────────┐
                 │      empresas       │
                 ├─────────────────────┤
                 │ PK id_empresa       │
                 │ nombre              │
                 │ descripcion         │
                 │ direccion           │
                 │ telefono            │
                 │ correo              │
                 │ sitio_web           │
                 └─────────────────────┘


┌─────────────────────┐
│      reportes       │
├─────────────────────┤
│ PK id_reporte       │
│ FK id_alumno        │
│ FK id_postulacion   │
│ titulo              │
│ descripcion         │
│ url_archivo         │
│ estado_revision     │
│ resultado_ia        │
└─────────────────────┘


┌─────────────────────┐
│   notificaciones    │
├─────────────────────┤
│ PK id_notificacion  │
│ FK id_usuario       │
│ titulo              │
│ mensaje             │
│ tipo                │
│ leida               │
│ fecha_creacion      │
└─────────────────────┘

usuarios 1 ─────────── N notificaciones

alumnos 1 ─────────── N reportes

postulaciones 1 ───── N reportes
```

---

# 4. Relaciones principales

| Entidad origen     | Relación | Entidad destino    |
| ------------------ | -------- | ------------------ |
| usuarios           | 1 : 1    | alumnos            |
| usuarios           | 1 : N    | notificaciones     |
| empresas           | 1 : N    | vacantes_practicas |
| alumnos            | 1 : N    | postulaciones      |
| vacantes_practicas | 1 : N    | postulaciones      |
| alumnos            | 1 : N    | documentos         |
| postulaciones      | 1 : N    | documentos         |
| alumnos            | 1 : N    | reportes           |
| postulaciones      | 1 : N    | reportes           |

---

# 5. Reglas principales del modelo

1. Cada alumno debe estar asociado a un usuario.
2. Una empresa puede tener múltiples vacantes.
3. Un alumno puede realizar múltiples postulaciones.
4. Una vacante puede recibir múltiples postulaciones.
5. Los documentos se relacionan con el alumno y, cuando corresponde, con su postulación.
6. Los reportes se relacionan con el alumno y su postulación.
7. Un usuario puede recibir múltiples notificaciones.
8. Las contraseñas no se almacenan en texto plano; se almacenará un hash.
9. Los archivos se almacenarán en un servicio de almacenamiento externo y la base de datos conservará sus referencias.
10. Las operaciones sobre la base de datos serán gestionadas por el backend de SIRAS.

---

# 6. Integración con la arquitectura

El modelo de datos será utilizado por el backend desarrollado con FastAPI.

```text
React Native ───────┐
                    │
                    ▼
               ┌──────────┐
               │ FastAPI  │
               │ Backend  │
               └────┬─────┘
                    │
                    ▼
               ┌──────────┐
               │PostgreSQL│
               └──────────┘

React + Vite ───────┘
```

El backend será la capa encargada de validar las operaciones y aplicar las reglas de negocio antes de modificar la información almacenada.

---

# 7. Objetivo

El modelo de base de datos proporciona la estructura necesaria para implementar el MVP de SIRAS y soportar el proceso de Prácticas Profesionales desde la gestión de usuarios y vacantes hasta las postulaciones, documentos, reportes y notificaciones.
