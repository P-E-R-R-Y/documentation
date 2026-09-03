# hunter — changelog

Markers: 🟢 added · 🔴 breaking · 🔵 fix · ⚪ internal or docs · 🟡 proposed
in the plan, no code written yet.

## v0.1.0 *(first commit, pushed this session)*

- 🟢 real ECS: `Position`, `Velocity`, `Depth`, `Life` and three systems
  (`MotionSystem`, `ReapSystem`, `SpawnSystem`)
- 🟢 `Perspective`: pure value object, two doubles with everything else
  derived, testable with no window or registry
- 🟢 fixed 60 Hz step: on a slow machine the game lags, it never slows down
- 🟢 four-voice audio, impact delay proportional to depth
- ⚪ `Host.hpp` (380 lines) and `Cadence.hpp` (114 lines), identical to
  snake

## Proposed, not written

- 🟡 `Host` to be split out into `Binding<T>` + `GraphicAssets`/`AudioAssets`
- 🟡 `sources/main.cpp` and an `_exec` target: hunter would become a
  standalone binary
