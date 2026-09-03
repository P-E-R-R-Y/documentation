# conformance — changelog

Markers: 🟢 added · 🔴 breaking · 🔵 fix · ⚪ internal or docs · 🟡 proposed
in the plan, no code written yet.

## *doesn't exist yet, entirely proposed*

| case | the line that would define it | manager |
|---|---|---|
| `exec` | `launch<DemoApp>(assets)` | no |
| `stack` | `SfmlWindow w(960, 540, "x")` | no |
| `heap` | `new SfmlWindow(...)` | no |
| `contract` | `IWindow2 *w = new SfmlWindow(...)` | no |
| `factory` | `vendor.createWindow(...)` | no |
| `dynamic` | `Load()` + `Binding<T>` | yes |
| `mixed` | `Adopt(&builtin)` + `Load(dll)` | yes |

- 🟡 `DemoScene.hpp` to deduplicate — today identical byte-for-byte
  between `sfml_impl/examples` and `raylib_impl/examples`, the only two
  vendors with examples at all
- 🟡 planned measurable criterion: `wc -l cases/*.cpp` — a level that
  needs special-case code would grow, and it would show
