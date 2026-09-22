# Flujo del Sistema SIRAS

## 1. Flujo general

SIRAS gestiona el proceso de Prácticas Profesionales desde el acceso del usuario hasta el seguimiento y cierre de las prácticas.

```text
                    ┌─────────────────────┐
                    │      INICIO         │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │  Usuario inicia     │
                    │      sesión         │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │ ¿Credenciales       │
                    │     válidas?        │
                    └──────┬───────┬──────┘
                           │       │
                         NO│       │SÍ
                           │       │
                           ▼       ▼
                    ┌──────────┐  ┌──────────────────┐
                    │ Mostrar  │  │ Identificar rol  │
                    │  error   │  │ del usuario      │
                    └────┬─────┘  └────────┬─────────┘
                         │                 │
                         │                 ▼
                         │       ┌─────────────────────┐
                         │       │ ¿Alumno o           │
                         │       │ Coordinador?        │
                         │       └──────┬───────┬──────┘
                         │              │       │
                         │         ALUMNO│       │COORDINADOR
                         │              │       │
                         │              ▼       ▼
                         │      ┌────────────┐ ┌──────────────┐
                         │      │ Panel del  │ │ Panel del    │
                         │      │   alumno   │ │ coordinador  │
                         │      └─────┬──────┘ └──────┬───────┘
                         │            │               │
                         │            ▼               ▼
                         │      ┌────────────┐ ┌──────────────┐
                         │      │ Consultar  │ │ Gestionar    │
                         │      │ vacantes   │ │ estudiantes  │
                         │      └─────┬──────┘ └──────┬───────┘
                         │            │               │
                         │            ▼               ▼
                         │      ┌────────────┐ ┌──────────────┐
                         │      │ Filtrar y  │ │ Gestionar    │
                         │      │ consultar  │ │ vacantes y   │
                         │      │ vacantes   │ │ empresas     │
                         │      └─────┬──────┘ └──────┬───────┘
                         │            │               │
                         │            ▼               ▼
                         │      ┌────────────┐ ┌──────────────┐
                         │      │ Asistencia │ │ Gestionar    │
                         │      │ de IA para │ │ postulaciones│
                         │      │ recomendar │ │ y documentos │
                         │      │ vacantes   │ └──────┬───────┘
                         │      └─────┬──────┘        │
                         │            │               │
                         │            ▼               ▼
                         │      ┌────────────┐ ┌──────────────┐
                         │      │ Postularse │ │ Seguimiento  │
                         │      │ a vacante  │ │ y reportes   │
                         │      └─────┬──────┘ └──────┬───────┘
                         │            │               │
```
