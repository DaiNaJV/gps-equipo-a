# Arquitectura del Sistema SIRAS

## 1. Descripción

SIRAS (Sistema Inteligente de Residencias) es una plataforma orientada a la digitalización y automatización del proceso de Prácticas Profesionales del Tecnológico Nacional de México (TecNM).

El MVP estará enfocado exclusivamente en Prácticas Profesionales.

El sistema tendrá dos tipos principales de usuarios:

* Alumno
* Coordinador

El alumno utilizará principalmente una aplicación móvil, mientras que el coordinador utilizará un panel web.

---

## 2. Arquitectura general

```text
                    ┌─────────────────────┐
                    │       ALUMNO        │
                    │    App móvil        │
                    │ React Native + Expo │
                    └──────────┬──────────┘
                               │
                               │ HTTPS
                               ▼
                    ┌─────────────────────┐
                    │      BACKEND        │
                    │ FastAPI + Docker    │
                    │       REST API      │
                    └──────────┬──────────┘
                               │
              ┌────────────────┼────────────────┐
              │                │                │
              ▼                ▼                ▼
      ┌──────────────┐ ┌──────────────┐ ┌──────────────┐
      │  PostgreSQL  │ │ Cloud Storage│ │     n8n      │
      │   Supabase   │ │  Documentos  │ │ Automatización│
      └──────────────┘ └──────────────┘ └──────┬───────┘
                                                │
                                                ▼
                                        ┌──────────────┐
                                        │  Claude API  │
                                        │     IA       │
                                        └──────────────┘


                    ┌─────────────────────┐
                    │    COORDINADOR      │
                    │     Panel Web       │
                    │   React + Vite      │
                    └──────────┬──────────┘
                               │
                               │ HTTPS
                               ▼
                         Backend FastAPI
```

---

## 3. Componentes principales

### 3.1 Aplicación móvil

Tecnologías:

* React Native
* Expo

La aplicación será utilizada por los alumnos.

Funciones principales:

* Registro e inicio de sesión
* Consulta del perfil académico
* Gestión de habilidades e intereses
* Consulta de vacantes
* Recomendación de vacantes mediante IA
* Postulación a vacantes
* Seguimiento de postulaciones
* Carga de documentos
* Carga de reportes
* Consulta de notificaciones
* Asistencia mediante IA

### 3.2 Panel web

Tecnologías:

* React
* Vite
* Tailwind CSS

El panel será utilizado por los coordinadores.

Funciones principales:

* Gestión de alumnos
* Asignación de asesores
* Gestión de empresas
* Gestión de vacantes
* Revisión de postulaciones
* Aprobación o rechazo de postulaciones
* Validación de documentos
* Revisión de reportes
* Visualización de indicadores y pendientes

### 3.3 Backend

Tecnologías:

* Python
* FastAPI
* Docker

El backend será responsable de:

* Autenticación
* Autorización
* Gestión de usuarios
* Control de roles
* Reglas de negocio
* Gestión de vacantes
* Gestión de postulaciones
* Gestión de documentos
* Gestión de reportes
* Comunicación con PostgreSQL
* Comunicación con servicios externos
* Integración con Claude API
* Integración con n8n

El backend será stateless y utilizará autenticación mediante JWT.

### 3.4 Base de datos

Tecnología:

* PostgreSQL

Servicio cloud previsto:

* Supabase o Neon

La base de datos almacenará la información oficial del sistema.

Entidades principales:

* usuarios
* alumnos
* empresas
* vacantes_practicas
* postulaciones
* documentos
* reportes
* notificaciones

### 3.5 Almacenamiento

Los documentos y reportes no se almacenarán directamente dentro del servidor del backend.

Se utilizará almacenamiento cloud:

* Supabase Storage

Los archivos serán almacenados en cloud y la base de datos conservará la referencia correspondiente mediante `archivo_url`.

### 3.6 Automatización

Tecnología:

* n8n

n8n será utilizado para automatizar eventos del sistema mediante webhooks.

Ejemplos:

* Eventos relacionados con postulaciones
* Recordatorios
* Procesamiento de reportes
* Automatizaciones relacionadas con documentos
* Comunicación con otros servicios

### 3.7 Inteligencia Artificial

Servicio:

* Claude API

La IA tendrá dos funciones principales dentro del MVP:

#### Recomendación de vacantes

La información del perfil académico, habilidades e intereses del alumno será utilizada para generar recomendaciones de vacantes.

La IA proporcionará recomendaciones y razones de compatibilidad.

La IA asistirá al sistema, pero no tendrá autoridad para tomar decisiones administrativas.

#### Análisis de reportes

Claude podrá realizar un análisis preliminar de los reportes enviados por los alumnos.

El análisis podrá considerar:

* Claridad
* Ortografía
* Estructura
* Cumplimiento de objetivos
* Observaciones

La evaluación generada por IA será revisada y validada por el coordinador.

---

## 4. Notificaciones

Servicio previsto:

* Firebase Cloud Messaging

Las notificaciones podrán utilizarse para comunicar eventos importantes al alumno.

Ejemplos:

* Cambio de estado de una postulación
* Fechas límite
* Avisos relacionados con reportes

---

## 5. Seguridad

El sistema deberá utilizar:

* HTTPS
* Contraseñas almacenadas mediante hash
* JWT
* Refresh tokens
* Variables de entorno para secretos
* Control de acceso por roles
* Row Level Security cuando corresponda en Supabase

Las claves y secretos nunca deberán almacenarse directamente en el repositorio.

---

## 6. Flujo principal

### Flujo del alumno

```text
Alumno
   │
   ▼
Inicia sesión
   │
   ▼
Completa perfil
   │
   ▼
Consulta vacantes
   │
   ▼
Solicita recomendaciones
   │
   ▼
Selecciona vacante
   │
   ▼
Realiza postulación
   │
   ▼
Espera revisión
   │
   ▼
Recibe actualización
   │
   ▼
Carga documentos/reportes
```

### Flujo del coordinador

```text
Coordinador
   │
   ▼
Inicia sesión
   │
   ▼
Consulta dashboard
   │
   ├──► Gestiona empresas
   │
   ├──► Gestiona vacantes
   │
   ├──► Revisa alumnos
   │
   └──► Revisa postulaciones
              │
              ▼
       Acepta / Rechaza
              │
              ▼
        Actualización
              │
              ▼
       Notificación
```

---

## 7. Principio de autoridad

La inteligencia artificial funciona como mecanismo de asistencia.

Claude no toma decisiones administrativas finales.

Las decisiones relacionadas con postulaciones, documentos y proceso de prácticas permanecen bajo la autoridad del coordinador.

---

## 8. Despliegue

El sistema estará diseñado para ejecutarse utilizando servicios cloud administrados.

Componentes previstos:

* Backend: Railway o Render
* Base de datos: Supabase o Neon
* Storage: Supabase Storage
* Panel web: Vercel o Netlify
* Automatización: n8n Cloud o Railway
* Notificaciones: Firebase Cloud Messaging
* App móvil: Expo / EAS Build

---

## 9. Objetivo del MVP

El objetivo del MVP es demostrar un flujo funcional completo de Prácticas Profesionales:

1. El alumno inicia sesión.
2. El alumno completa su perfil.
3. El sistema muestra vacantes.
4. Claude genera recomendaciones.
5. El alumno realiza una postulación.
6. El coordinador revisa la postulación.
7. El coordinador acepta o rechaza.
8. El alumno recibe el cambio de estado.
9. El alumno carga un reporte.
10. El sistema realiza un análisis asistido mediante IA.
11. El coordinador revisa el resultado.

Todo el flujo deberá funcionar mediante infraestructura cloud y ser accesible desde dispositivos con conexión a Internet.

