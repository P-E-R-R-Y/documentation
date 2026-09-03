# conformance — journal

Marqueurs : 🟢 ajout · 🔴 rupture · 🔵 correctif · ⚪ interne ou doc · 🟡 propose
dans le plan, code non ecrit.

## *n'existe pas, entierement propose*

| cas | la ligne qui le definirait | manager |
|---|---|---|
| `exec` | `launch<DemoApp>(assets)` | non |
| `stack` | `SfmlWindow w(960, 540, "x")` | non |
| `heap` | `new SfmlWindow(...)` | non |
| `contract` | `IWindow2 *w = new SfmlWindow(...)` | non |
| `factory` | `vendor.createWindow(...)` | non |
| `dynamic` | `Load()` + `Binding<T>` | oui |
| `mixed` | `Adopt(&builtin)` + `Load(dll)` | oui |

- 🟡 `DemoScene.hpp` a dedupliquer — aujourd'hui identique a l'octet pres
  entre `sfml_impl/examples` et `raylib_impl/examples`, les deux seuls
  vendors qui ont des exemples
- 🟡 critere mesurable prevu : `wc -l cases/*.cpp` — un niveau qui demande
  du code particulier grossirait, et ca se verrait
