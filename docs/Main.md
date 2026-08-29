# P-E-R-R-Y

> A game engine you assemble : contracts on one side, interchangeable
> vendors on the other, tools in between.

- @ref utilities "Utilitaires" — ecs, i18n, maths, system, procedurals, modulemanager
- @ref contracts "Contrats" — imodule, igraphic, iaudio, icore
- @ref vendors "Vendors" — raylib_impl, sfml_impl

## Regenerer

```bash
cmake -B build && cmake --build build --target serve
```

Une ligne par depot dans `repos.cmake`. Pour une copie locale :

```bash
cmake -B build -DFETCHCONTENT_SOURCE_DIR_IGRAPHIC=/chemin/vers/igraphic
```
