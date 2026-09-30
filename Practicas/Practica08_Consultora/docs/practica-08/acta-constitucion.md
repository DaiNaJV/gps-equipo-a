# Acta de constitución del proyecto

**Proyecto:** Reingeniería del Sistema de Control Escolar de Servicio Social y Residencia Profesional
**Consultora:** NexoSoft Consultores (Equipos A y B, ISC 9.º semestre)
**Cliente:** Instituto Tecnológico de Matehuala – Departamento de Gestión Tecnológica y Vinculación
**Director de proyecto:** [Nombre completo 1]
**Elaboró:** Pareja 3 – [Nombre completo 1] y [Integrante B3]
**Fecha:** 22/09/2026  ·  **Versión:** 1.0

---

## 1. Objetivo

Modernizar el sistema web de control de residencias profesionales y servicio social para que el Instituto pueda operarlo de forma **segura, legal y mantenible**, entregando en producción el **18 de diciembre de 2026** (13 semanas, del 22 de septiembre al 18 de diciembre) con un presupuesto máximo de **$477,899 MXN**, incluida la reserva de contingencia.

**Objetivos específicos y medibles:**
1. Eliminar el 100 % de las credenciales y datos personales del repositorio y de su historial.
2. Almacenar el 100 % de las contraseñas con *hash* (`password_hash`).
3. Cumplir las 20 historias de usuario validadas por el cliente más las nuevas de anteproyecto y asignación de asesores.
4. Alcanzar al menos 60 % de cobertura de pruebas automatizadas en los controladores críticos.
5. Cero vulnerabilidades altas o críticas abiertas al momento de liberar.

## 2. Justificación

El diagnóstico (prácticas 1 a 7) mostró que el sistema actual automatiza la mayor parte del proceso de residencia (solicitud, expediente, reportes, visitas y constancias), pero **no puede usarse con datos reales**: presenta 17 riesgos de nivel alto, entre ellos credenciales expuestas, contraseñas en texto plano, documentos personales accesibles públicamente y ausencia de aviso de privacidad. Modernizarlo cuesta menos que desarrollar desde cero, ya que se reutilizan los requerimientos, el modelo de datos y el diseño de pantallas ya documentados.

## 3. Alcance general

**Incluye:** saneamiento de seguridad y datos, cumplimiento de protección de datos personales, rediseño de la base de datos, migración a Laravel (PHP 8.2), módulos nuevos de anteproyecto y asignación de asesores, pruebas, documentación, capacitación y puesta en producción.

**No incluye:** integración con el SII, aplicación móvil, módulo de exámenes y plan de estudios, ni soporte posterior a 3 meses de garantía (detalle en `alcance.md`).

## 4. Interesados

| Interesado | Rol en el proyecto | Interés / expectativa |
|---|---|---|
| Jefatura de Gestión Tecnológica y Vinculación | Patrocinador y cliente | Proceso de residencias más rápido y ordenado |
| Control Escolar / Administrador del sistema | Usuario clave | Revisar solicitudes y generar constancias sin papel |
| Jefes de carrera | Usuarios | Seguimiento de alumnos de su carrera |
| Asesores académicos | Usuarios | Calificar reportes y visitas fácilmente |
| Asesores industriales (empresas) | Usuarios externos | Acceso simple, sin capacitación larga |
| Alumnos residentes | Usuarios finales | Trámite en línea, saber el estado de su solicitud |
| Centro de Cómputo | Infraestructura | Servidor, respaldos, seguridad |
| Área jurídica | Asesor | Cumplimiento de la ley de protección de datos |
| Autor original (C. A. Barrera Lugo) | Titular del código | Reconocimiento y respeto a su autoría |
| Docente de la materia | Supervisor académico | Aplicación correcta de la gestión de proyectos |

## 5. Supuestos

1. El autor original otorga autorización o licencia para modificar el código (paquete 2.3).
2. El cliente asigna un enlace con disponibilidad de 2 horas por semana.
3. El Centro de Cómputo proporciona un servidor con PHP 8.2 y MySQL 8.
4. El equipo trabaja 160 horas al mes por persona.
5. Las cifras de salario y productividad de la Práctica 5 siguen vigentes.

## 6. Restricciones

- **Tiempo:** liberar el 18/12/2026, antes del periodo de residencias enero–junio 2027.
- **Presupuesto:** máximo $477,899 MXN.
- **Tecnología:** software libre únicamente, sin costo de licencias.
- **Legal:** cumplir la Ley General de Protección de Datos Personales en Posesión de Sujetos Obligados.
- **Equipo:** 1 líder técnico y 2 desarrolladores junior.

## 7. Criterios de éxito

| Criterio | Medida |
|---|---|
| Plazo | Puesta en producción a más tardar el 18/12/2026 |
| Costo | Gasto real ≤ presupuesto aprobado |
| Funcionalidad | 100 % de las HU "Must" aceptadas por el cliente |
| Seguridad | 0 vulnerabilidades altas o críticas; 0 secretos en el repositorio |
| Calidad | ≥ 60 % de cobertura de pruebas en módulos críticos |
| Adopción | ≥ 90 % de las solicitudes del periodo ene–jun 2027 tramitadas en el sistema |

## 8. Hitos principales

| Hito | Fecha |
|---|---|
| M1 Inicio y requerimientos | 02/10/2026 |
| M2 Seguridad y base de datos | 16/10/2026 |
| M3 Desarrollo del núcleo | 06/11/2026 |
| M4 Módulos nuevos e integración | 20/11/2026 |
| M5 Pruebas y calidad | 04/12/2026 |
| M6 Implantación y cierre | 18/12/2026 |

## 9. Firmas

| Nombre | Cargo | Firma |
|---|---|---|
| | Jefe(a) del Depto. de Gestión Tecnológica y Vinculación (cliente) | |
| [Nombre completo 1] | Director de proyecto, NexoSoft | |
