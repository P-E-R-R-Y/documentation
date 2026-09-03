# documentation — changelog

Markers: 🟢 added · 🔴 breaking · 🔵 fix · ⚪ internal or docs · 🟡 proposed
in the plan, no code written yet.

## v0.1.0

- 🟢 `repos.cmake`: the list, the only file to edit
- 🟢 `VERSIONS.md`, and the per-repo logs
- 🔵 `docs/DoxygenLayout.xml`: the Classes/Interfaces/Structs/Namespaces/
  Concepts tabs were all `visible="no"` — the pages existed, nothing
  linked to them. 16 entries turned back on
- 🔵 `docs/Doxyfile.in`: `EXCLUDE_PATTERNS = */build/*` was unintentionally
  excluding all of `_deps/`, since FetchContent places it under the build
  directory. Doxygen was no longer parsing a single `.hpp` across the 14
  aggregated repos — a CI run that looked green (exit 0) was only parsing
  its own `.dox` files. Verified live after the fix: Classes, Files,
  Namespaces, `hierarchy.html`, 345 class pages
