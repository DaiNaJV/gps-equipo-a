#!/usr/bin/env bash
# Crea labels, milestones e issues del backlog de la P8 con GitHub CLI.
# Uso (desde la raíz del repo oficial, en el Codespace):  bash docs/practica-08/crear-backlog.sh
set -e
REPO=$(gh repo view --json nameWithOwner -q .nameWithOwner)
echo "Repositorio: $REPO"

# --- etiquetas
gh label create "gestión" --color 5319e7 --force
gh label create "análisis" --color 1d76db --force
gh label create "seguridad" --color b60205 --force
gh label create "base-de-datos" --color 0e8a16 --force
gh label create "desarrollo" --color fbca04 --force
gh label create "calidad" --color c5def5 --force
gh label create "implantación" --color f9d0c4 --force
gh label create "ruta-crítica" --color d93f0b --force

# --- milestones
gh api "repos/$REPO/milestones" -f title="M1 · Inicio y requerimientos" -f due_on="2027-02-05T23:59:59Z" -f state=open >/dev/null || echo "milestone ya existe: M1 · Inicio y requerimientos"
gh api "repos/$REPO/milestones" -f title="M2 · Seguridad y base de datos" -f due_on="2027-02-26T23:59:59Z" -f state=open >/dev/null || echo "milestone ya existe: M2 · Seguridad y base de datos"
gh api "repos/$REPO/milestones" -f title="M3 · Desarrollo del núcleo" -f due_on="2027-04-30T23:59:59Z" -f state=open >/dev/null || echo "milestone ya existe: M3 · Desarrollo del núcleo"
gh api "repos/$REPO/milestones" -f title="M4 · Módulos nuevos e integración" -f due_on="2027-06-04T23:59:59Z" -f state=open >/dev/null || echo "milestone ya existe: M4 · Módulos nuevos e integración"
gh api "repos/$REPO/milestones" -f title="M5 · Pruebas y calidad" -f due_on="2027-07-02T23:59:59Z" -f state=open >/dev/null || echo "milestone ya existe: M5 · Pruebas y calidad"
gh api "repos/$REPO/milestones" -f title="M6 · Implantación y cierre" -f due_on="2027-07-23T23:59:59Z" -f state=open >/dev/null || echo "milestone ya existe: M6 · Implantación y cierre"

# --- issues
gh issue create --title "[1.1] Acta de constitución y plan del proyecto" --milestone "M1 · Inicio y requerimientos" --label "gestión,ruta-crítica" --body-file - <<'EOF_BODY'
**Paquete EDT:** 1.1

Redactar y firmar el acta de constitución con el cliente; aprobar plan, cronograma y presupuesto.

**Criterio de aceptación:** Acta firmada por el cliente; plan publicado en docs/

**Duración estimada:** 1 semana(s)  
**Depende de:** ninguna
EOF_BODY
gh issue create --title "[2.1] Validar requerimientos con Vinculación y Control Escolar" --milestone "M1 · Inicio y requerimientos" --label "análisis,ruta-crítica" --body-file - <<'EOF_BODY'
**Paquete EDT:** 2.1

Sesiones con el Depto. de Gestión Tecnológica y Vinculación y Control Escolar para validar las 20 HU de la P3 y el proceso real del Tec.

**Criterio de aceptación:** Minuta firmada; lista de HU validada con prioridad MoSCoW

**Duración estimada:** 2 semana(s)  
**Depende de:** 1.1
EOF_BODY
gh issue create --title "[2.2] Especificar módulos nuevos (anteproyecto, asignación de asesores)" --milestone "M1 · Inicio y requerimientos" --label "análisis,ruta-crítica" --body-file - <<'EOF_BODY'
**Paquete EDT:** 2.2

Especificar HU nuevas: registro y dictamen de anteproyecto, asignación de asesor interno/externo.

**Criterio de aceptación:** HU nuevas con criterios de aceptación aprobadas por el cliente

**Duración estimada:** 1 semana(s)  
**Depende de:** 2.1
EOF_BODY
gh issue create --title "[2.3] Obtener autorización/licencia del autor" --milestone "M1 · Inicio y requerimientos" --label "análisis" --body-file - <<'EOF_BODY'
**Paquete EDT:** 2.3

Contactar al autor del sistema original y obtener autorización escrita o licencia abierta.

**Criterio de aceptación:** Documento de autorización o LICENSE en el repo; si no se obtiene, escalar al cliente (R17)

**Duración estimada:** 2 semana(s)  
**Depende de:** 1.1
EOF_BODY
gh issue create --title "[3.1] Retirar datos personales y secretos del repositorio" --milestone "M2 · Seguridad y base de datos" --label "seguridad" --body-file - <<'EOF_BODY'
**Paquete EDT:** 3.1

Eliminar PDFs y respaldos con datos personales, secretos y credenciales del repositorio y del historial (git filter-repo); mover configuración a .env.

**Criterio de aceptación:** git grep no encuentra credenciales ni datos personales en ninguna rama

**Duración estimada:** 1 semana(s)  
**Depende de:** 2.3
EOF_BODY
gh issue create --title "[3.2] Aviso de privacidad y procedimiento ARCO" --milestone "M2 · Seguridad y base de datos" --label "seguridad" --body-file - <<'EOF_BODY'
**Paquete EDT:** 3.2

Redactar con el área jurídica el aviso de privacidad y el procedimiento de derechos ARCO.

**Criterio de aceptación:** Aviso aprobado por jurídico y visible antes del registro

**Duración estimada:** 2 semana(s)  
**Depende de:** 2.1
EOF_BODY
gh issue create --title "[4.1] Rediseño del modelo de datos (FK, tipos, nombres)" --milestone "M2 · Seguridad y base de datos" --label "base-de-datos,ruta-crítica" --body-file - <<'EOF_BODY'
**Paquete EDT:** 4.1

Nuevo modelo: FK declaradas, tipos correctos, nombres (empresas, horarios), tablas faltantes y nuevas.

**Criterio de aceptación:** Diagrama ER aprobado; migraciones de Laravel ejecutan sin error

**Duración estimada:** 2 semana(s)  
**Depende de:** 2.2
EOF_BODY
gh issue create --title "[4.2] Scripts de migración de datos" --milestone "M2 · Seguridad y base de datos" --label "base-de-datos" --body-file - <<'EOF_BODY'
**Paquete EDT:** 4.2

Scripts para migrar datos del esquema viejo al nuevo, incluyendo hash de contraseñas.

**Criterio de aceptación:** Migración de prueba sin pérdida de registros

**Duración estimada:** 1 semana(s)  
**Depende de:** 4.1
EOF_BODY
gh issue create --title "[5.1] Proyecto Laravel: autenticación, roles y contraseñas con hash" --milestone "M3 · Desarrollo del núcleo" --label "desarrollo,ruta-crítica" --body-file - <<'EOF_BODY'
**Paquete EDT:** 5.1

Proyecto Laravel, autenticación, 5 roles con permisos, contraseñas con hash y cambio obligatorio.

**Criterio de aceptación:** Cada rol ve solo su menú; ninguna contraseña en texto plano

**Duración estimada:** 2 semana(s)  
**Depende de:** 4.1, 3.1
EOF_BODY
gh issue create --title "[5.2] Módulo de usuarios y carreras" --milestone "M3 · Desarrollo del núcleo" --label "desarrollo,ruta-crítica" --body-file - <<'EOF_BODY'
**Paquete EDT:** 5.2

CRUD de usuarios (alta, edición, baja) y carreras.

**Criterio de aceptación:** HU-01, 02, 16, 17 cumplen criterios de aceptación

**Duración estimada:** 2 semana(s)  
**Depende de:** 5.1
EOF_BODY
gh issue create --title "[5.3] Catálogo de empresas y horarios" --milestone "M3 · Desarrollo del núcleo" --label "desarrollo" --body-file - <<'EOF_BODY'
**Paquete EDT:** 5.3

Catálogo de empresas con horarios y cupo; inscripción de alumnos.

**Criterio de aceptación:** HU-06, 07, 08 cumplen criterios

**Duración estimada:** 2 semana(s)  
**Depende de:** 5.2
EOF_BODY
gh issue create --title "[5.4] Solicitud de residencia y carta de presentación" --milestone "M3 · Desarrollo del núcleo" --label "desarrollo,ruta-crítica" --body-file - <<'EOF_BODY'
**Paquete EDT:** 5.4

Formulario de solicitud con PDFs, revisión, aceptación/rechazo y carta de presentación.

**Criterio de aceptación:** HU-04, 05 cumplen criterios; carta PDF correcta

**Duración estimada:** 3 semana(s)  
**Depende de:** 5.2
EOF_BODY
gh issue create --title "[5.5] Expediente, documentos privados y reportes parciales" --milestone "M3 · Desarrollo del núcleo" --label "desarrollo,ruta-crítica" --body-file - <<'EOF_BODY'
**Paquete EDT:** 5.5

Expediente del alumno con documentos privados (servidos con control de acceso) y reportes parciales.

**Criterio de aceptación:** HU-09, 10; un PDF no es accesible sin sesión

**Duración estimada:** 3 semana(s)  
**Depende de:** 5.4
EOF_BODY
gh issue create --title "[5.6] Evaluación de reportes, visitas y observaciones" --milestone "M4 · Módulos nuevos e integración" --label "desarrollo,ruta-crítica" --body-file - <<'EOF_BODY'
**Paquete EDT:** 5.6

Calificación de reportes por asesores, revisión jefe/admin, visitas y chat de observaciones.

**Criterio de aceptación:** HU-11 a 14 cumplen criterios

**Duración estimada:** 3 semana(s)  
**Depende de:** 5.5
EOF_BODY
gh issue create --title "[5.7] Constancias PDF y notificaciones por correo" --milestone "M4 · Módulos nuevos e integración" --label "desarrollo,ruta-crítica" --body-file - <<'EOF_BODY'
**Paquete EDT:** 5.7

Constancia de liberación PDF y correos al cambiar el estado de la solicitud; recuperar contraseña funcional.

**Criterio de aceptación:** HU-15, 19; correo recibido en pruebas

**Duración estimada:** 2 semana(s)  
**Depende de:** 5.6
EOF_BODY
gh issue create --title "[5.8] Anteproyecto y asignación de asesores (nuevos)" --milestone "M4 · Módulos nuevos e integración" --label "desarrollo" --body-file - <<'EOF_BODY'
**Paquete EDT:** 5.8

Registro/dictamen de anteproyecto y asignación de asesores.

**Criterio de aceptación:** HU nuevas de 2.2 cumplen criterios

**Duración estimada:** 2 semana(s)  
**Depende de:** 5.4
EOF_BODY
gh issue create --title "[5.9] Importar/exportar Excel con PhpSpreadsheet" --milestone "M4 · Módulos nuevos e integración" --label "desarrollo" --body-file - <<'EOF_BODY'
**Paquete EDT:** 5.9

Importar/exportar usuarios y catálogo con PhpSpreadsheet.

**Criterio de aceptación:** Importación de 100 usuarios sin errores

**Duración estimada:** 1 semana(s)  
**Depende de:** 5.3
EOF_BODY
gh issue create --title "[6.1] Pruebas automatizadas (PHPUnit) de módulos críticos" --milestone "M5 · Pruebas y calidad" --label "calidad,ruta-crítica" --body-file - <<'EOF_BODY'
**Paquete EDT:** 6.1

Pruebas automatizadas de login, solicitud, expediente y constancias.

**Criterio de aceptación:** Cobertura ≥ 60% en controladores críticos; pipeline en verde

**Duración estimada:** 2 semana(s)  
**Depende de:** 5.7, 5.8, 5.9
EOF_BODY
gh issue create --title "[6.2] Auditoría de seguridad (OWASP Top 10)" --milestone "M5 · Pruebas y calidad" --label "calidad" --body-file - <<'EOF_BODY'
**Paquete EDT:** 6.2

Revisión con OWASP Top 10 y análisis de dependencias.

**Criterio de aceptación:** Sin vulnerabilidades altas o críticas abiertas

**Duración estimada:** 1 semana(s)  
**Depende de:** 5.7
EOF_BODY
gh issue create --title "[6.3] Pruebas de aceptación con usuarios" --milestone "M5 · Pruebas y calidad" --label "calidad,ruta-crítica" --body-file - <<'EOF_BODY'
**Paquete EDT:** 6.3

Pruebas con alumnos, asesores y Vinculación usando datos de prueba.

**Criterio de aceptación:** Acta de aceptación firmada por el cliente

**Duración estimada:** 2 semana(s)  
**Depende de:** 6.1, 6.2, 4.2
EOF_BODY
gh issue create --title "[7.1] Documentación: README, manual técnico y de usuario" --milestone "M6 · Implantación y cierre" --label "implantación" --body-file - <<'EOF_BODY'
**Paquete EDT:** 7.1

README, manual de instalación, manual técnico y manual de usuario por rol.

**Criterio de aceptación:** Otra persona instala el sistema solo con el manual

**Duración estimada:** 2 semana(s)  
**Depende de:** 5.7
EOF_BODY
gh issue create --title "[7.2] Migración de datos a producción" --milestone "M6 · Implantación y cierre" --label "implantación,ruta-crítica" --body-file - <<'EOF_BODY'
**Paquete EDT:** 7.2

Migrar datos reales al servidor de producción.

**Criterio de aceptación:** Conteo de registros igual antes y después

**Duración estimada:** 1 semana(s)  
**Depende de:** 6.3, 3.2
EOF_BODY
gh issue create --title "[7.3] Capacitación a usuarios" --milestone "M6 · Implantación y cierre" --label "implantación,ruta-crítica" --body-file - <<'EOF_BODY'
**Paquete EDT:** 7.3

Sesiones de capacitación por rol.

**Criterio de aceptación:** Asistencia ≥ 90% del personal clave

**Duración estimada:** 1 semana(s)  
**Depende de:** 7.2
EOF_BODY
gh issue create --title "[7.4] HITO: Puesta en producción" --milestone "M6 · Implantación y cierre" --label "implantación,ruta-crítica" --body-file - <<'EOF_BODY'
**Paquete EDT:** 7.4

Liberación en producción.

**Criterio de aceptación:** Sistema operando con usuarios reales

**Duración estimada:** 0 semana(s)  
**Depende de:** 7.3, 7.1
EOF_BODY
gh issue create --title "[1.2] Cierre del proyecto y lecciones aprendidas" --milestone "M6 · Implantación y cierre" --label "gestión,ruta-crítica" --body-file - <<'EOF_BODY'
**Paquete EDT:** 1.2

Informe de cierre, lecciones aprendidas y entrega formal.

**Criterio de aceptación:** Acta de cierre firmada

**Duración estimada:** 1 semana(s)  
**Depende de:** 7.4
EOF_BODY

echo "Listo. Ahora en Projects → Add items → selecciona todos los issues del repo."
