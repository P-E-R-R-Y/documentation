# cmake-utils — journal

Marqueurs : 🟢 ajout · 🔴 rupture · 🔵 correctif · ⚪ interne ou doc · 🟡 propose
dans le plan, code non ecrit.

## v0.1.0

- 🟢 `ToolVar.cmake` : `cmake_var_extract`/`cmake_var_restore`, pour
  survivre aux dependances qui forcent `BUILD_SHARED_LIBS`

### Propose, pas ecrit

- 🟡 `perry_module()` : un appel, trois cibles (`_headers` INTERFACE ·
  SHARED · `_exec` si `iapp`)
