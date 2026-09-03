# Versions de l'ecosysteme P-E-R-R-Y

Chaque repo porte sa propre version et nomme celle de ses dependances.

Le detail, repo par repo, vit dans `log/{tools,contrat,vendor,vitrines}/<repo>_log.md`.
Ce fichier-ci est la vue d'ensemble ; les logs sont la source, mis a jour
en premier.

## Lire les numeros

| tranche | sens |
|---|---|
| `0.X.Y` | PoC en travaux — la surface bouge encore |
| `1.X.Y` | v1 / MVP — la surface est gelee |
| `2.X.Y` | v2 |

Une case **future** vide veut dire : rien ne change.

## Lire la colonne CI doc

| | |
|---|---|
| 🟢 | site en ligne, verifie |
| – | pas de doc prevue |

Les colonnes CI lisent le **depot**, pas l'arbre de travail. Un workflow
present sur le disque mais non suivi par git n'a jamais tourne.

---

## Tools

| repo | actuelle | future | branches | tests | fichiers | CI doc | CI tests |
|---|---|---|---|---|---|---|---|
| `ecs` | v1.0.1 | | main | 3 | 11 | 🟢 [site](https://p-e-r-r-y.github.io/ecs/) | oui |
| `i18n` | — | v1.0.0 | main, cpp11-support | 4 | 15 | 🟢 [site](https://p-e-r-r-y.github.io/i18n/) | oui |
| `maths` | — | v1.0.0 | main | 19 | 7 | 🟢 [site](https://p-e-r-r-y.github.io/maths/) | oui |
| `procedurals` | — | v0.9.0 | main | 9 | 14 | 🟢 [site](https://p-e-r-r-y.github.io/procedurals/) | **ajoutee** |
| `system` | v0.1.0 | **v1.0.0** | main | 28 | 16 | 🟢 [site](https://p-e-r-r-y.github.io/system/) | oui |
| `cmake-utils` | — | v0.1.0 | main | 0 | 0 *(cmake)* | – | – |
| `documentation` | — | v0.1.0 | main | 0 | 0 *(cmake)* | 🟢 [site](https://p-e-r-r-y.github.io/documentation/) | – |

## Contrats & manager

| repo | actuelle | future | branches | tests | fichiers | CI doc | CI tests |
|---|---|---|---|---|---|---|---|
| `imodule` | — | v0.1.0 | main | 13 | 5 | 🟢 [site](https://p-e-r-r-y.github.io/imodule/) | oui |
| `igraphic` | v0.1.0 | **v0.2.0** | main | 2 | 35 | 🟢 [site](https://p-e-r-r-y.github.io/igraphic/) | oui |
| `iaudio` | — | v0.1.0 | main | 1 | 10 | 🟢 [site](https://p-e-r-r-y.github.io/iaudio/) | oui |
| `icore` | v1 *(supprime)* | v0.1.0 | main | 13 | 9 | 🟢 [site](https://p-e-r-r-y.github.io/icore/) | oui |
| `modulemanager` | — | v0.1.0 | main | 23 | 10 | 🟢 [site](https://p-e-r-r-y.github.io/modulemanager/) | oui |

## Vendors & vitrines

| repo | actuelle | future | branches | tests | fichiers | CI doc | CI tests |
|---|---|---|---|---|---|---|---|
| `sfml_impl` | — | v0.1.0 | main | 3 | 20 | 🟢 [site](https://p-e-r-r-y.github.io/sfml_impl/) | **non** |
| `sdl2_impl` | — | v0.1.0 | main | 4 | 16 | 🟢 [site](https://p-e-r-r-y.github.io/sdl2_impl/) | **non** |
| `sdl3_impl` | — | v0.1.0 | main | 4 | 16 | 🟢 [site](https://p-e-r-r-y.github.io/sdl3_impl/) | **non** |
| `raylib_impl` | — | v0.1.0 | main | 3 | 25 | 🟢 [site](https://p-e-r-r-y.github.io/raylib_impl/) | **non** |
| `arcade` | — | v0.1.0 | main *(pousse)* | 0 | 3 | – | **non** |
| `hunter` | — | v0.1.0 | **aucun commit** | 0 | 8 | – | **non** |
| `snake` | — | v0.1.0 | main *(pousse)* | 0 | 5 | – | **non** |
| `conformance` | *a creer* | v0.1.0 | — | — | — | a creer | a creer |

## Archive

Gardes, pas repris. Rien dans l'ensemble vivant ne les reference.

| repo | dernier commit | fichiers | pourquoi on le garde |
|---|---|---|---|
| `raygraphic` | 2025-11-13 | 15 | son CMake sert de modele au prochain |
| `sfmlgraphic` | 2025-10-02 | 14 | son CMake sert de modele au prochain |
| `engine` | 2025-02-24 | 2 | `CustomisableEngine<Parents...>` — **clone local seul**, plus sur GitHub |
| `iplugin` | *a creer* | — | `IPluginModule::createPlugin() -> IPlugin`, a concevoir |
| `idebug` | *a creer* | — | `IDebugModule::createDebug() -> IDebug`, a concevoir |

`raygraphic` et `sfmlgraphic` sont **archives sur GitHub** : lecture seule.
`engine` n'existe plus que comme clone local — rien a archiver a distance.
`iplugin` et `idebug` restent a ecrire.

## Supprimes

| repo | fichiers | remplace par |
|---|---|---|
| `iapp` | 7 | `icore` |
| `finder` | 5 | `modulemanager/SharedLibrary` |
| `idebug` | 3 | a reecrire de zero avec `iplugin` |
| `iinfo` | 2 | deja absent de GitHub avant qu'on y touche |

## Encore en attente de ton geste

Meme constat — personne ne les reference — mais tu ne les as pas nommes.

| repo | fichiers | remplace par |
|---|---|---|
| `icore-save` | 4 | sauvegarde d'`icore` |
| `computer` | 1 | `arcade` |
| `hunterapp` | 4 | `hunter` |
| `hunterv3app` | 0 | `hunter` |
| `myhunterV3` | 1 | `hunter` |
| `mini-app` | 0 | coquille vide |
| `mini-core` | 0 | coquille vide |
| `stride` | 2 | absorbe dans `modulemanager/Stride.hpp` |

---

# Ce que chaque version apporte

🟢 ajout · 🔴 rupture · 🔵 correctif · ⚪ interne ou doc · 🟡 propose dans le
plan, code non ecrit

Chaque repo a aussi son propre journal, plus detaille :
`log/{tools,contrat,vendor,vitrines}/<repo>_log.md`.

## Tools

### `ecs` — v1.0.1

- 🟢 `Registry`, `Entity`, `SparseArray<T>` a creneaux `std::optional`
- 🟢 `ISystem`, `killEntity` avec recyclage d'indices
- ⚪ v1.0.1 : `@addtogroup` sur les en-tetes, rien en API

### `i18n` — v1.0.0

- 🟢 API `cxx11` et `cxx20` cote a cote, testees separement
- 🟢 `I18n`, `ILocale`, `TypeTraits`
- ⚪ `cmake.yml` etait deja au depot : matrice C++11/14/17/20/23/26 en locale
  `fr_FR`, seule sa copie de travail avait ete supprimee

### `maths` — v1.0.0

- 🟢 `geometry`, `graph`, `interpolation`
- ⚪ le mieux eprouve des outils : 19 tests pour 413 lignes
- 🔵 `docs.yml` commite : il existait sur le disque sans etre suivi par git,
  donc n'avait jamais tourne — d'ou l'absence de `gh-pages`

### `procedurals` — v0.9.0

- 🟢 `Noise`, `PoissonDiskSampling`, `Smoothing`, `TinyKeepDev`
- 🟢 `WaveFunctionCollapse`, `Deterministic`, `Visualizer`
- 🔵 `.github/` commite (build ET doc) : ni l'un ni l'autre n'avait jamais
  tourne — verifie en local, **56 tests verts**
- ⚪ reste en `0.9` tant que `Readme.md`, supprime dans l'arbre, n'est pas
  tranche

### `system` — v1.0.0

- 🟢 `Vector2/3/4`, `Matrix`, `Quaternion`, `Color`, `Constants`, `Lambdify`
- 🟢 `Rect` a semantique **coin** : `(x, y)` est le coin haut-gauche
- 🟢 28 tests

Constate, non corrige :
- `Type.hpp` est un en-tete parapluie qui tire tout — `igraphic` n'inclut
  que lui, huit fois, et paie `Vector4`, `Matrix` et `Quaternion` sans s'en
  servir
- declare `STATIC` sans aucune source : produit un `.a` vide, devrait etre
  `INTERFACE`

### `cmake-utils` — v0.1.0

- 🟢 `ToolVar.cmake` : `cmake_var_extract`/`cmake_var_restore`, pour survivre
  aux dependances qui forcent `BUILD_SHARED_LIBS`
- 🟡 `perry_module()` (PROPOSE, pas ecrit) : un appel, trois cibles
  (`_headers` INTERFACE · SHARED · `_exec` si `iapp`)

### `documentation` — v0.1.0

- 🟢 `repos.cmake` : la liste, seul fichier a editer
- 🟢 ce fichier, et les logs par repo
- 🔵 `docs/DoxygenLayout.xml` : les onglets Classes/Interfaces/Structs/
  Namespaces/Concepts etaient tous `visible="no"` — les pages existaient,
  rien n'y menait
- 🔵 `docs/Doxyfile.in` : `EXCLUDE_PATTERNS = */build/*` excluait sans le
  vouloir tout `_deps/`, puisque FetchContent le pose sous le dossier de
  build — doxygen ne parsait plus un seul `.hpp`. Verifie sur le site en
  ligne apres correction : Classes, Files, Namespaces, `hierarchy.html`

## Contrats & manager

### `imodule` — v0.1.0

- 🟢 `IModule` : `type()`, `name()`, `bind()`, `registry()`, `acquire()`,
  `release()`, `uses()`, `mustClose()`, `isClosed()`, `condemn()`, `reset()`
- 🟢 `IModuleRegistry` : `Get`, `GetAllByType`, `GetAllByKey`, `GetAll`,
  `Current`, `Select`
- 🟢 `accepts[]` : la convention, declaree par chaque interface qui en a
  besoin (`igraphic`)
- 🟢 13 tests sur fausses abstractions (`DummyModule`, `DummyRegistry`)

**v0.2.0 — propose, rien de tout ceci n'est ecrit :**
- 🟡 `claims()` sur `IModule` — les ressources qu'un module confisque au
  processus, en chaines opaques
- 🟡 `acquire()`/`release()`/`uses()`/`condemned()` deplaces sur
  `IModuleRegistry` — la table cesserait de croire le module sur parole
- 🟡 `Select()` retire de la vue invite
- 🟡 `reset()` supprime

### `igraphic` — v0.1.0

- 🟢 `IGraphic2Module`, `IGraphic3Module` (qui derive du premier)
- 🟢 `IWindow2/3`, `IKeyboard`, `IMouse`, `IGamepad`
- 🟢 `ITexture`, `ISprite`, `IFont`, `IText`, `IPolygon`
- 🟢 `ICamera`, `IMesh`, `IModel`, `IAnimationSet`
- 🟢 `isReady()` sur les dix types, `setMouseVisibility(bool)`
- 🟢 `accepts = {"graphic2", "graphic3"}` : la substitution vit dans le contrat

**v0.2.0 — propose, rien de tout ceci n'est ecrit :**
- 🟡 `GraphicAssets` — on lui declarerait des ressources, il les
  refabriquerait quand le vendor change et detruirait dans l'ordre inverse
- 🟡 inclure le granulaire (`Vector2.hpp`) au lieu de `Type.hpp`

### `iaudio` — v0.1.0

- 🟢 `IAudioModule`, `IMusic`, `ISound`, `ISoundBuffer`
- 🟢 les trois etats de lecture epingles, `isReady()` sur les trois types

**Propose, pas ecrit :**
- 🟡 `AudioAssets`, pendant d'un `GraphicAssets` qui n'existe pas non plus

### `icore` — v0.1.0

- 🟢 `ICore`, `IApp`, `IAppModule`, `ITickable`
- 🟢 `launch<T>()` construit, `run()`, detruit **avant** de rendre le code
  de sortie, pour que les dll se ferment proprement
- 🟢 26 tests, dont la trace d'ordre et `LaunchDestroysBeforeReturning`
- ⚪ le tag `v1` (non-semver) est supprime cette session, remplace par
  `v0.1.0` — aucune release GitHub, aucun consommateur ne le nommait

### `modulemanager` — v0.1.0

- 🟢 `Load`, `Unload`, `Reconcile` — condamne n'est pas ferme
- 🟢 `SharedLibrary` en `RTLD_NOW | RTLD_LOCAL` : c'est ce flag qui fait
  tenir deux vendors aux classes homonymes dans un meme processus
- 🟢 table Stride : une colonne par dll, une ligne par contrat, O(1)
- 🟢 aides typees `Get<T>`, `GetAllByType<T>`, `Current<T>`, `Select<T>`
- 🟢 23 tests

**v0.2.0 — propose, rien de tout ceci n'est ecrit :**
- 🟡 `Adopt(IModule*, key)` — un module lie en statique entrerait dans la
  table sans `dlopen`
- 🟡 `Binding<T>` — suivre un contrat, tenir le verrou, numeroter les
  generations
- 🟡 registre de jetons : `acquire()` refuserait si une ressource de
  `claims()` est detenue ailleurs

## Vendors

### `sfml_impl`, `sdl2_impl`, `sdl3_impl`, `raylib_impl` — v0.1.0

- 🟢 les trois premiers remplissent `graphic2` + `audio` ; `raylib_impl`
  remplit `graphic3` + `audio`, donc `graphic2` par la chaine `accepts`
- 🟢 point d'entree unique `getModules()`
- 🟢 cibles SHARED et STATIC (la STATIC recompile `sources/xxx.cpp` pour un
  consommateur qui n'en a pas besoin — constate, pas corrige)

Faille mesuree cette session, pas corrigee :
- 🔴 `createTexture`/`createSoundBuffer` etc. rendent un objet mort
  (`isReady()==false`) au lieu de `nullptr` quand le chargement echoue —
  sfml jette (`bad_optional_access`), raylib segfault. Reproduit avec des
  sondes dediees sur les quatre vendors

**Propose, pas ecrit :**
- 🟡 `claims()` : `{"opengl"}` chez `sfml` et `raylib`, rien chez les deux
  `sdl` qui passent par Metal
- 🟡 cible STATIC → INTERFACE, zero object code
- 🟡 `sdl2_impl`/`sdl3_impl` : toujours aucun exemple

## Vitrines

### `arcade` — v0.1.0 *(premier commit, pousse cette session)*

- 🟢 charge tout ce qui exporte `getModules()`, trie par `type()`
- 🟢 menu a colonnes, une par contrat decouvert — y compris ceux qu'elle ne
  sait pas utiliser
- 🟢 terminal non bloquant sur stdin
- 🟢 bascule a chaud en quatre temps (`use()`)

Faille mesuree cette session, pas corrigee :
- 🔴 `set graphic2 <nom>` passe par la branche generique de `command()` et
  n'appelle jamais `use()` : `_using` et `Current("graphic2")` divergent.
  Reproduit — `get graphic` rend `sdl2` apres `set graphic2 sfml`

**Propose, pas ecrit :**
- 🟡 `_using` supprime, remplace par un `Binding` epingle
- 🟡 cibles `_headers` et `_exec`

### `hunter` — v0.1.0 *(premier commit, pousse cette session)*

- 🟢 ECS reel : `Position`, `Velocity`, `Depth`, `Life` et trois systemes
- 🟢 `Perspective` : objet-valeur pur, testable sans fenetre ni registre
- 🟢 pas fixe a 60 Hz
- 🟢 audio a quatre voix, delai d'impact proportionnel a la profondeur
- ⚪ `Host.hpp` (380 l.) et `Cadence.hpp` (114 l.), identiques a snake

**Propose, pas ecrit :**
- 🟡 `Host` a sortir vers `Binding<T>` + `GraphicAssets`/`AudioAssets`
- 🟡 `sources/main.cpp` et cible `_exec`

### `snake` — v0.1.0 *(premier commit, pousse cette session)*

- 🟢 grille qui suit la fenetre, cinq pas par seconde de montre
- ⚪ `Host.hpp`/`Cadence.hpp`, copies identiques a hunter

**Propose, pas ecrit :**
- 🟡 `Host` sorti
- 🟡 cible `_exec`

### `conformance` — *n'existe pas, entierement propose*

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
  entre `sfml_impl/examples` et `raylib_impl/examples`, dans les deux seuls
  vendors qui ont des exemples
- 🟡 critere mesurable prevu : `wc -l cases/*.cpp`
