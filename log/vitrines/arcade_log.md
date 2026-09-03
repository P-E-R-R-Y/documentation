# arcade — changelog

Markers: 🟢 added · 🔴 breaking · 🔵 fix · ⚪ internal or docs · 🟡 proposed
in the plan, no code written yet.

## v0.1.0 *(first commit, pushed this session)*

- 🟢 loads anything that exports `getModules()`, sorts by `type()`
- 🟢 column menu, one per discovered contract — including ones it can't
  itself use
- 🟢 non-blocking stdin terminal: the only input that survives a borne
  with no window
- 🟢 hot vendor swap in four steps (`use()`)

### Measured failure, not fixed

- 🔴 `set graphic2 <name>` goes through `command()`'s generic branch and
  never calls `use()`: `_using` and `Current("graphic2")` diverge.
  Reproduced — `get graphic` still returns `sdl2` after
  `set graphic2 sfml`

## Proposed, not written

- 🟡 `_using` removed, replaced by a pinned `Binding` — the bug above
  would become unwritable
- 🟡 `_headers` and `_exec` targets: an arcade could load another one
