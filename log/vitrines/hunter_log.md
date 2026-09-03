# hunter — journal

Marqueurs : 🟢 ajout · 🔴 rupture · 🔵 correctif · ⚪ interne ou doc · 🟡 propose
dans le plan, code non ecrit.

## v0.1.0 *(premier commit, pousse cette session)*

- 🟢 ECS reel : `Position`, `Velocity`, `Depth`, `Life` et trois systemes
  (`MotionSystem`, `ReapSystem`, `SpawnSystem`)
- 🟢 `Perspective` : objet-valeur pur, deux doubles et tout le reste
  derive, donc testable sans fenetre ni registre
- 🟢 pas fixe a 60 Hz : sur machine lente le jeu rame, il ne ralentit pas
- 🟢 audio a quatre voix, delai d'impact proportionnel a la profondeur
- ⚪ `Host.hpp` (380 l.) et `Cadence.hpp` (114 l.), identiques a snake

## Propose, pas ecrit

- 🟡 `Host` a sortir vers `Binding<T>` + `GraphicAssets`/`AudioAssets`
- 🟡 `sources/main.cpp` et cible `_exec` : hunter deviendrait un binaire
  autonome
