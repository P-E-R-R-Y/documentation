# cmake-utils — changelog

Markers: 🟢 added · 🔴 breaking · 🔵 fix · ⚪ internal or docs · 🟡 proposed
in the plan, no code written yet.

## v0.1.0

- 🟢 `ToolVar.cmake`: `cmake_var_extract`/`cmake_var_restore`, to survive
  dependencies that force `BUILD_SHARED_LIBS`

### Proposed, not written

- 🟡 `perry_module()`: one call, three targets (`_headers` INTERFACE ·
  SHARED · `_exec` if `iapp`)
