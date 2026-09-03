# arcade — journal

Marqueurs : 🟢 ajout · 🔴 rupture · 🔵 correctif · ⚪ interne ou doc · 🟡 propose
dans le plan, code non ecrit.

## v0.1.0 *(premier commit, pousse cette session)*

- 🟢 charge tout ce qui exporte `getModules()`, trie par `type()`
- 🟢 menu a colonnes, une par contrat decouvert — y compris ceux qu'elle
  ne sait pas utiliser
- 🟢 terminal non bloquant sur stdin : la seule entree qui survit a une
  borne sans fenetre
- 🟢 bascule a chaud en quatre temps (`use()`)

### Faille mesuree, pas corrigee

- 🔴 `set graphic2 <nom>` passe par la branche generique de `command()`
  et n'appelle jamais `use()` : `_using` et `Current("graphic2")`
  divergent. Reproduit — `get graphic` rend `sdl2` apres
  `set graphic2 sfml`

## Propose, pas ecrit

- 🟡 `_using` supprime, remplace par un `Binding` epingle — le bug
  ci-dessus deviendrait inecrivable
- 🟡 cibles `_headers` et `_exec` : une arcade pourrait en charger une
  autre
