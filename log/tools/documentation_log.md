# documentation — journal

Marqueurs : 🟢 ajout · 🔴 rupture · 🔵 correctif · ⚪ interne ou doc · 🟡 propose
dans le plan, code non ecrit.

## v0.1.0

- 🟢 `repos.cmake` : la liste, seul fichier a editer
- 🟢 `VERSIONS.md`, et les logs par repo (ce fichier compris)
- 🔵 `docs/DoxygenLayout.xml` : les onglets Classes/Interfaces/Structs/
  Namespaces/Concepts etaient tous `visible="no"` — les pages existaient,
  rien n'y menait. 16 entrees rallumees
- 🔵 `docs/Doxyfile.in` : `EXCLUDE_PATTERNS = */build/*` excluait sans le
  vouloir tout `_deps/`, puisque FetchContent le pose sous le dossier de
  build. Doxygen ne parsait plus un seul `.hpp` des 14 repos agreges — un
  run CI qui semblait reussir (exit 0) ne parsait en realite que ses
  propres fichiers `.dox`. Verifie sur le site en ligne apres correction :
  Classes, Files, Namespaces, `hierarchy.html`, 345 pages de classes
