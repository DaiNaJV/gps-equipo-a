# Cómo subir la Práctica 2 (este archivo NO va en el repositorio)

Roles (fila «2, 5»): **Líder = Integrante 2**, **Analista = Integrante 3**, **QA = Integrante 1**.

## Issues que crea el Líder
1. `P02: Inventario y clasificación de carpetas` → Analista
2. `P02: Diagrama de arquitectura (.drawio y .png)` → Analista
3. `P02: Explicación MVC en arquitectura.md` → Líder
4. `P02: Reflexión y revisión del Pull Request` → QA

## Commits sugeridos
```
git checkout master
git pull
git checkout -b practica-02        # solo el Líder; los demás: git fetch y git checkout practica-02
```
- Analista: `P02: agrega inventario de carpetas` y `P02: agrega diagrama de arquitectura`
- Líder: `P02: agrega explicacion del patron MVC`
- QA: `P02: agrega reflexion y corrige ortografia del inventario`

PR: `practica-02` → `master` **de su fork**. Título: `Practica 02 - Mapa del sistema y arquitectura`.

## Antes de subir
- Reemplaza `[Nombre completo X]`.
- Abre `arquitectura.drawio` en diagrams.net o con la extensión Draw.io de VS Code, revisa que se vea bien y, si mueves algo, vuelve a exportar el .png (File → Export as → PNG).
- Compara los números del inventario con tu fork (`find Vistas -type f | wc -l`): pueden variar un poco.
