# Especificación del MVP de SIRAS

## 1. Objetivo del MVP

El MVP de SIRAS (Sistema Inteligente de Residencias) tiene como objetivo digitalizar y centralizar el proceso de **Prácticas Profesionales**.

El sistema permitirá que los alumnos consulten oportunidades de prácticas, realicen postulaciones, den seguimiento a sus solicitudes y gestionen documentos y reportes.

El coordinador contará con un panel web para administrar estudiantes, empresas, vacantes, postulaciones y documentos.

SIRAS incorporará funciones de inteligencia artificial para apoyar la recomendación de vacantes y el análisis de reportes.

---

## 2. Alcance

### Incluido en el MVP

El MVP contempla:

* Autenticación de usuarios.
* Control de acceso según rol.
* Perfil académico del alumno.
* Consulta de vacantes de prácticas profesionales.
* Filtrado de vacantes.
* Recomendación de vacantes mediante IA.
* Postulación a vacantes.
* Consulta del estado de las postulaciones.
* Gestión de documentos.
* Carga de reportes.
* Análisis de reportes mediante IA.
* Notificaciones.
* Gestión de alumnos por parte del coordinador.
* Gestión de empresas.
* Gestión de vacantes.
* Revisión de postulaciones.
* Validación de documentos.
* Dashboard básico para el coordinador.

---

## 3. Fuera del alcance

El MVP **no contempla Servicio Social**.

El alcance del proyecto se limita al proceso de **Prácticas Profesionales**.

También quedan fuera del MVP aquellas funciones que no sean necesarias para demostrar el flujo principal del sistema durante la primera versión.

---

# 4. Roles del sistema

SIRAS tendrá dos roles principales.

## 4.1 Alumno

El alumno utilizará principalmente la aplicación móvil.

Funciones:

* Iniciar sesión.
* Consultar su perfil académico.
* Consultar vacantes.
* Filtrar vacantes.
* Recibir recomendaciones de vacantes.
* Consultar información de una vacante.
* Realizar postulaciones.
* Consultar el estado de sus postulaciones.
* Subir documentos.
* Subir reportes.
* Consultar el análisis de sus reportes.
* Recibir notificaciones.

---

## 4.2 Coordinador

El coordinador utilizará principalmente el panel web.

Funciones:

* Iniciar sesión.
* Consultar alumnos.
* Gestionar información de estudiantes.
* Asignar asesores.
* Gestionar empresas.
* Crear y administrar vacantes.
* Consultar postulaciones.
* Aprobar o rechazar solicitudes.
* Validar documentos.
* Consultar reportes.
* Revisar resultados de análisis asistidos por IA.
* Consultar información general mediante el dashboard.

---

# 5. Módulos principales

## 5.1 Autenticación

El sistema deberá permitir el inicio de sesión mediante credenciales.

Flujo:

```text id="a1c8nq"
Usuario
   │
   ▼
Correo + contraseña
   │
   ▼
Backend
   │
   ▼
Validación
   │
   ├── Incorrecto ──► Mostrar error
   │
   └── Correcto
          │
          ▼
      Generar JWT
          │
          ▼
      Identificar rol
          │
          ▼
      Acceder al sistema
```

La autenticación deberá utilizar contraseñas almacenadas de forma segura mediante hash.

---

# 6. Módulo de alumnos

El sistema deberá almacenar información académica básica del alumno.

Información principal:

* Nombre.
* Apellidos.
* Matrícula.
* Carrera.
* Semestre.
* Información de contacto.
* Perfil académico.

El alumno podrá consultar y mantener la información permitida por el sistema.

---

# 7. Módulo de vacantes

Las vacantes representan oportunidades de Prácticas Profesionales ofrecidas por empresas.

Cada vacante deberá contener información como:

* Empresa.
* Título.
* Descripción.
* Requisitos.
* Ubicación.
* Modalidad.
* Fecha de inicio.
* Fecha de finalización.
* Estado.
* Fecha de publicación.

El alumno podrá consultar las vacantes disponibles.

---

# 8. Filtros de vacantes

El alumno podrá utilizar filtros para facilitar la búsqueda de oportunidades.

Los filtros podrán considerar información disponible de las vacantes, como:

* Ubicación.
* Modalidad.
* Empresa.
* Estado.
* Características de la vacante.

El objetivo es facilitar que el alumno encuentre oportunidades relacionadas con su perfil.

---

# 9. Recomendación de vacantes mediante IA

SIRAS incorporará una función de inteligencia artificial para recomendar vacantes.

La recomendación utilizará información disponible del perfil académico del alumno y las características de las vacantes.

Flujo:

```text id="1d0s4m"
Perfil del alumno
       │
       ▼
Información académica
       │
       ▼
Vacantes disponibles
       │
       ▼
Servicio de IA
       │
       ▼
Análisis de compatibilidad
       │
       ▼
Recomendaciones
       │
       ▼
Alumno
```

La IA funcionará como apoyo para el alumno.

La decisión final de postularse a una vacante corresponde al alumno.

---

# 10. Módulo de postulaciones

El alumno podrá realizar una postulación a una vacante.

Cada postulación deberá registrar:

* Alumno.
* Vacante.
* Fecha de postulación.
* Estado.
* Fecha de actualización.
* Comentarios cuando correspondan.

Estados iniciales considerados:

* Pendiente.
* En revisión.
* Aceptada.
* Rechazada.

Flujo:

```text id="b6p2m7"
Alumno
   │
   ▼
Selecciona vacante
   │
   ▼
Realiza postulación
   │
   ▼
Registrar solicitud
   │
   ▼
Pendiente
   │
   ▼
Revisión del coordinador
   │
   ├── Rechazada
   │
   └── Aceptada
```

---

# 11. Gestión de documentos

Los alumnos podrán cargar documentos relacionados con el proceso de Prácticas Profesionales.

El sistema registrará:

* Nombre del archivo.
* Tipo de documento.
* Alumno.
* Postulación relacionada.
* Ubicación del archivo.
* Fecha de carga.
* Estado de validación.

Los archivos se almacenarán mediante el servicio de almacenamiento definido para el proyecto.

La base de datos conservará la referencia correspondiente.

---

# 12. Gestión de reportes

Los alumnos podrán cargar reportes relacionados con sus prácticas.

El sistema deberá registrar:

* Alumno.
* Postulación.
* Título.
* Descripción.
* Archivo.
* Fecha de carga.
* Estado de revisión.
* Resultado del análisis mediante IA.

---

# 13. Análisis de reportes mediante IA

SIRAS contará con una segunda función de inteligencia artificial orientada al análisis de reportes.

Flujo:

```text id="4z4v3q"
Alumno
   │
   ▼
Sube reporte
   │
   ▼
Almacenamiento
   │
   ▼
Backend
   │
   ▼
Claude API
   │
   ▼
Análisis
   │
   ▼
Resultado
   │
   ├──────────► Alumno
   │
   └──────────► Coordinador
```

El resultado de la IA será un apoyo para la revisión y no sustituirá la revisión correspondiente por parte del personal encargado.

---

# 14. Notificaciones

El sistema podrá generar notificaciones relacionadas con eventos importantes.

Ejemplos:

* Cambios en el estado de una postulación.
* Validación de documentos.
* Nuevos avisos.
* Eventos relacionados con el seguimiento de prácticas.

Las notificaciones móviles utilizarán el servicio definido para el proyecto.

---

# 15. Panel del coordinador

El coordinador contará con un panel web para administrar el proceso.

Funciones principales:

```text id="2kw6tm"
                    PANEL COORDINADOR
                           │
          ┌────────────────┼────────────────┐
          │                │                │
          ▼                ▼                ▼
     Estudiantes       Empresas         Vacantes
          │                │                │
          └────────────────┼────────────────┘
                           │
                           ▼
                    Postulaciones
                           │
                           ▼
                     Documentos
                           │
                           ▼
                       Reportes
                           │
                           ▼
                       Dashboard
```

---

# 16. Seguridad

El MVP deberá considerar las siguientes medidas:

* Autenticación mediante JWT.
* Contraseñas almacenadas mediante hash.
* Variables de entorno para información sensible.
* Comunicación mediante HTTPS en producción.
* Control de acceso basado en roles.
* Validación de datos en el backend.
* El cliente no deberá acceder directamente a la base de datos.
* Protección de los archivos almacenados.

---

# 17. Arquitectura tecnológica

El MVP utilizará la arquitectura definida para SIRAS.

```text id="4j0f1x"
┌───────────────────────────┐
│       Alumno              │
│ React Native + Expo       │
└─────────────┬─────────────┘
              │
              │ HTTPS / API
              ▼
┌───────────────────────────┐
│       Backend             │
│       FastAPI             │
│       Docker              │
└───────┬─────────┬─────────┘
        │         │
        ▼         ▼
┌────────────┐ ┌────────────┐
│ PostgreSQL │ │  Storage   │
└────────────┘ └────────────┘
        │
        ▼
┌───────────────────────────┐
│       Servicios IA        │
│       Claude API          │
└───────────────────────────┘


┌───────────────────────────┐
│      Coordinador          │
│      React + Vite         │
└─────────────┬─────────────┘
              │
              │ HTTPS / API
              ▼
          Backend
```

---

# 18. Flujo principal del MVP

El flujo principal que deberá poder demostrarse es:

```text id="2y7d4f"
Inicio
  │
  ▼
Login
  │
  ▼
Identificación del rol
  │
  ├─────────────────────────────┐
  │                             │
  ▼                             ▼
Alumno                      Coordinador
  │                             │
  ▼                             ▼
Consultar vacantes          Gestionar vacantes
  │                             │
  ▼                             ▼
Recomendación IA             Revisar postulaciones
  │                             │
  ▼                             ▼
Postularse                   Validar documentos
  │                             │
  ▼                             ▼
Seguimiento                  Revisar reportes
  │
  ▼
Documentos
  │
  ▼
Reportes
  │
  ▼
Análisis IA
  │
  ▼
Seguimiento de prácticas
```

---

# 19. Criterios de aceptación del MVP

El MVP podrá considerarse funcional cuando sea posible realizar el flujo principal de manera integrada.

### Autenticación

* [ ] Un usuario puede iniciar sesión.
* [ ] Las credenciales incorrectas generan un error.
* [ ] El sistema identifica correctamente el rol.

### Alumno

* [ ] El alumno puede consultar su perfil.
* [ ] El alumno puede consultar vacantes.
* [ ] El alumno puede filtrar vacantes.
* [ ] El alumno puede recibir recomendaciones.
* [ ] El alumno puede realizar una postulación.
* [ ] El alumno puede consultar el estado de su postulación.
* [ ] El alumno puede subir documentos.
* [ ] El alumno puede subir reportes.
* [ ] El alumno puede consultar el análisis de sus reportes.

### Coordinador

* [ ] El coordinador puede consultar alumnos.
* [ ] El coordinador puede gestionar empresas.
* [ ] El coordinador puede gestionar vacantes.
* [ ] El coordinador puede consultar postulaciones.
* [ ] El coordinador puede aprobar o rechazar postulaciones.
* [ ] El coordinador puede validar documentos.
* [ ] El coordinador puede consultar reportes.
* [ ] El coordinador puede consultar el dashboard.

### Integración

* [ ] Frontend m
