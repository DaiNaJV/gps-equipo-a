# Practica 9 - Hipotesis inicial vs realidad

Consultora NexoSoft · (hipotesis original del Equipo A en `docs/README.md`, P1)

leyenda: ✅ acertamos · 🟡 parcialmente · ❌ nos equivocamos · ➕ no lo vimos venir

## 1. ¿que hace?

| hipotesis P1 | realidad | resultado | donde se comprobo |
|---|---|:-:|---|
| tramites de residencia y servicio social: el alumno sube docs y los jefes revisan | si. solicitud, carta de presentacion, expediente, reportes, constancia | ✅ | P3 |
| visitas a empresas | si, con confirmacion del asesor academico e industrial | ✅ | P3 HU-13 |
| materias y calificaciones "para ver los creditos" | NO. las tablas de materias guardan las **empresas** del catalogo; examenes/plan de estudios son restos de otro sistema | ❌ | P3, P4 |
| chat alumno-asesor | es un chat de **observaciones sobre cada documento** | 🟡 | P3 HU-14 |
| correos para avisos y recuperar contraseña | PHPMailer si se usa, pero "recuperar contraseña" **no manda nada** | 🟡 | P3 HU-19 |
| PDFs de constancias y cartas (TCPDF) | si | ✅ | P3, P5 |
| importar/exportar Excel para usuarios | si, y tambien el catalogo | ✅ | P3 |

## 2. ¿para quien?

| hipotesis P1 | realidad | resultado |
|---|---|:-:|
| 5 tipos de usuario | 5 roles: Admin, Alumno, Jefe, a_Academico, a_Industrial | ✅ |
| "Academico" = departamento academico | = **asesor academico** (maestro) | ❌ |
| "Industrial" = area de vinculacion | = **asesor industrial** (persona de la empresa) | ❌ |
| hecho x otro Tec, tal vez de Hidalgo | ITSOEH (Tec Sup. del Occidente del Edo. de Hidalgo) | ✅ |
| proyecto de residencia de alumnos, 2021 | 2021 si; residencia es lo mas probable (ene-jun) pero no esta confirmado | 🟡 |
| equipo de 2-3 personas en un semestre | **1 persona**, ~3 meses visibles en git | ❌ |

## 3. ¿con que tecnologia?

| hipotesis P1 | realidad | resultado |
|---|---|:-:|
| PHP | PHP 7 puro, sin framework | ✅ |
| patron MVC | MVC "casero", con muchas excepciones | 🟡 |
| MySQL, versiones guardadas a mano | MariaDB 10.4; 3 respaldos .sql a mano, ninguno completo | ✅ |
| AdminLTE + Bootstrap + jQuery | AdminLTE 2.4, Bootstrap 3.3.7, jQuery 1.9 y 3.2 | ✅ |
| XAMPP / Apache | si | ✅ |

## 4. ¿que tan grande?

| hipotesis P1 | real | resultado |
|---|---|:-:|
| 120-150 MB, casi todo librerias y PDFs | ~150 MB, ~97% librerias | ✅ |
| ~20 controladores, ~13 modelos, ~49 vistas | 19-20 / 13 / 49 | ✅ |
| 80-90 archivos PHP propios | ~100 archivos propios (contando js) | 🟡 |
| 10,000-15,000 LOC | **8,658** LOC | ❌ (sobreestimamos 15-40%) |
| sistema mediano-pequeño | si | ✅ |

## 5. lo que no vimos venir ➕

- credenciales de un servidor en la nube escritas en el codigo (P7 R01)
- contraseñas iguales a la matricula, en texto plano (P4)
- el script de BD **no sirve** para instalar el sistema completo: faltan 3 tablas (P4)
- 0 llaves foraneas (P4)
- solo 10 commits y un "Initial commit" con todo (P6)
- librerias con vulnerabilidades conocidas (P7)

## 6. marcador

| | ✅ | 🟡 | ❌ |
|---|---|---|---|
| items (23) | 13 | 5 | 5 |

- lo "facil de ver" (tecnologia, tamaño, estructura) lo acertamos casi todo → los nombres de carpetas si dicen mucho
- lo que depende de **significado** (que es "Industrial", que guarda "materias") lo fallamos → los nombres engañan
- los riesgos grandes (seguridad, datos) **no** se ven sin abrir el codigo

*— [Nombre completo 2]*
