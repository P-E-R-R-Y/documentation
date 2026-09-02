# Versions de l'ecosysteme P-E-R-R-Y

Chaque repo porte sa propre version et nomme celle de ses dependances.

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
| `engine` | 2025-02-24 | 2 | `CustomisableEngine<Parents...>` — composition a la compilation, a revoir |
| `raygraphic` | 2025-11-13 | 15 | son CMake sert de modele au prochain |
| `sfmlgraphic` | 2025-10-02 | 14 | son CMake sert de modele au prochain |
| `iplugin` | *a creer* | — | `IPluginModule::createPlugin() -> IPlugin`, a concevoir |
| `idebug` | *a creer* | — | `IDebugModule::createDebug() -> IDebug`, a concevoir |

Les trois premiers sont **archives sur GitHub** : lecture seule, conserves.
Les deux derniers restent a ecrire.

## Supprimes

| repo | fichiers | remplace par |
|---|---|---|
| `iapp` | 7 | `icore` |
| `iinfo` | 2 | `imodule` / `modulemanager` |
| `finder` | 5 | `modulemanager/SharedLibrary` |
| `idebug` | 3 | a reecrire de zero avec `iplugin` |

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

🟢 ajout · 🔴 rupture · 🔵 correctif · ⚪ interne ou doc

## Tools

### `ecs` — v1.0.1

- 🟢 `Registry`, `Entity`, `SparseArray<T>` a creneaux `std::optional`
- 🟢 `ISystem`, `killEntity` avec recyclage d'indices
- ⚪ v1.0.1 : documentation

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
- 🔵 `cmake.yml` ajoute — verifie en local : **56 tests verts**
- 🔵 `.github/` commite : ni l'un ni l'autre workflow n'avait jamais tourne
- ⚪ reste en `0.9` tant que `Readme.md`, supprime dans l'arbre, n'est pas
  tranche

### `system` — v1.0.0

- 🟢 `Vector2/3/4`, `Matrix`, `Quaternion`, `Color`, `Constants`, `Lambdify`
- 🟢 `Rect` a semantique **coin** : `(x, y)` est le coin haut-gauche
- 🔴 `Type.hpp` est un parapluie qui tire tout — `igraphic` n'inclut que lui,
  huit fois, et paie `Vector4`, `Matrix` et `Quaternion` sans s'en servir
- ⚪ declare `STATIC` sans aucune source : produit un `.a` vide, devrait etre
  `INTERFACE`

### `cmake-utils` — v0.1.0

- 🟢 `ToolVar.cmake` : survivre aux dependances qui forcent `BUILD_SHARED_LIBS`
- 🟢 `perry_module()` : un appel, trois cibles
  (`_headers` INTERFACE · SHARED · `_exec` si `iapp`)

### `documentation` — v0.1.0

- 🟢 `repos.cmake` : la liste, seul fichier a editer
- 🟢 ce fichier

## Contrats & manager

### `imodule` — v0.1.0

- 🟢 `IModule` : `type()`, `name()`, `claims()`, `bind()`, `registry()`
- 🟢 `claims()` : les ressources qu'un module confisque au processus, en
  chaines opaques comparees par egalite — il nomme une ressource, jamais un rival
- 🟢 `IModuleRegistry` : `Get`, `GetAllByType`, `GetAllByKey`, `GetAll`,
  `Current`, plus `acquire()`, `release()`, `uses()`, `condemned()`
- 🔴 la comptabilite quitte la dll : la table tient ses propres chiffres
- 🔴 `Select()` quitte la vue invite — un invite ne peut plus re-pointer le
  contrat de tout le monde
- 🔴 `reset()` disparait : il n'existait que parce que l'etat vivait dans une
  dll que macOS ne demappe pas
- 🟢 13 tests sur fausses abstractions

### `igraphic` — v0.1.0 → **v0.2.0**

**v0.1.0**
- 🟢 `IGraphic2Module`, `IGraphic3Module` (qui derive du premier)
- 🟢 `IWindow2/3`, `IKeyboard`, `IMouse`, `IGamepad`
- 🟢 `ITexture`, `ISprite`, `IFont`, `IText`, `IPolygon`
- 🟢 `ICamera`, `IMesh`, `IModel`, `IAnimationSet`
- 🟢 `isReady()` sur les dix types, `setMouseVisibility(bool)`
- 🟢 `accepts = {"graphic2", "graphic3"}` : la substitution vit dans le contrat

**v0.2.0**
- 🟢 `GraphicAssets` : on lui declare des ressources, il les refabrique quand
  le vendor change et detruit dans l'ordre inverse
- 🔵 inclut le granulaire au lieu de `Type.hpp`

### `iaudio` — v0.1.0

- 🟢 `IAudioModule`, `IMusic`, `ISound`, `ISoundBuffer`
- 🟢 les trois etats de lecture epingles, `isReady()` sur les trois types
- 🟢 `AudioAssets`, pendant de `GraphicAssets`

### `icore` — v0.1.0

- ⚪ le tag `v1` est supprime : aucune release GitHub, aucun consommateur ne le
  nomme. Dernier moment ou le geste est gratuit
- 🟢 `ICore`, `IApp`, `IAppModule`, `ITickable`
- 🟢 `launch<T>()` construit, `run()`, detruit **avant** de rendre le code de
  sortie, pour que les dll se ferment proprement
- 🟢 26 tests, dont la trace d'ordre et `LaunchDestroysBeforeReturning`

### `modulemanager` — v0.1.0

- 🟢 `Load`, `Unload`, `Reconcile` — condamne n'est pas ferme
- 🟢 `SharedLibrary` en `RTLD_NOW | RTLD_LOCAL` : c'est ce flag qui fait tenir
  deux vendors aux classes homonymes dans un meme processus
- 🟢 table Stride : une colonne par dll, une ligne par contrat, O(1)
- 🟢 **`Adopt(IModule*, key)`** : un module lie en statique entre dans la table
  sans `dlopen`. `Reconcile()` ne change pas d'une ligne
- 🟢 **`Binding<T>`** : suivre un contrat, tenir le verrou, numeroter les
  generations, epingler ou suivre le defaut
- 🟢 registre des jetons : `acquire()` refuse si une ressource de `claims()`
  est detenue ailleurs
- 🔵 `Current(string)` et `GetAllByType(string)` parcourent enfin `accepts`

## Vendors & vitrines

### `sfml_impl`, `sdl2_impl`, `sdl3_impl`, `raylib_impl` — v0.1.0

- 🟢 les trois premiers remplissent `graphic2` + `audio` ; `raylib_impl`
  remplit `graphic3` + `audio`, donc `graphic2` par la chaine `accepts`
- 🟢 point d'entree unique `getModules()`
- 🟢 `claims()` : `{"opengl"}` chez `sfml` et `raylib`, rien chez les deux
  `sdl` qui passent par Metal. Aucun ne nomme l'autre
- 🔴 `createTexture` et consorts rendent `nullptr` quand le chargement echoue,
  au lieu d'un objet mort — supprime le `throw` sfml et le SIGSEGV raylib
- 🔴 la cible STATIC devient INTERFACE : zero object code, et les 33 symboles
  en collision entre `sdl2` et `sdl3` disparaissent
- 🟢 `sdl2_impl` et `sdl3_impl` gagnent des exemples
- ⚪ le module possede l'init des sous-systemes — sans lui, `SdlWindow` s'ouvre
  et `SdlTexture` charge, mais `SdlFont` echoue faute de `TTF_Init()`

### `arcade` — v0.1.0

- 🟢 charge tout ce qui exporte `getModules()`, trie par `type()`
- 🟢 menu a colonnes, une par contrat decouvert — y compris ceux qu'elle ne
  sait pas utiliser
- 🟢 terminal non bloquant sur stdin : la seule entree qui survit a une borne
  sans fenetre
- 🟢 bascule a chaud en quatre temps, l'ancien eteint avant le nouveau
- 🔵 `_using` supprime, remplace par un `Binding` epingle : `set graphic2 sfml`
  ne peut plus diverger de `get graphic`
- 🟢 cibles `_headers` et SHARED : une arcade peut en charger une autre

### `hunter` — v0.1.0

- 🟢 ECS reel : `Position`, `Velocity`, `Depth`, `Life` et trois systemes
- 🟢 `Perspective` : objet-valeur pur, testable sans fenetre ni registre
- 🟢 pas fixe a 60 Hz — sur machine lente le jeu rame, il ne ralentit pas
- 🟢 audio a quatre voix, delai d'impact proportionnel a la profondeur
- 🔵 `Host` (380 l.) sorti vers `Binding<T>` + `GraphicAssets` / `AudioAssets`
- 🟢 `sources/main.cpp` et cible `_exec` : hunter devient un binaire autonome

### `snake` — v0.1.0

- 🟢 grille qui suit la fenetre, cinq pas par seconde de montre
- 🔵 `Host` sorti, comme hunter
- 🟢 cible `_exec`

### `conformance` — v0.1.0 *(a creer)*

Une scene, sept binaires.

| cas | la ligne qui le definit | manager |
|---|---|---|
| `exec` | `launch<DemoApp>(assets)` | non |
| `stack` | `SfmlWindow w(960, 540, "x")` | non |
| `heap` | `new SfmlWindow(...)` | non |
| `contract` | `IWindow2 *w = new SfmlWindow(...)` | non |
| `factory` | `vendor.createWindow(...)` | non |
| `dynamic` | `Load()` + `Binding<T>` | oui |
| `mixed` | `Adopt(&builtin)` + `Load(dll)` | oui |

- 🟢 `DemoScene.hpp` une seule fois, la ou il etait duplique a l'octet pres
- 🟢 critere mesurable : `wc -l cases/*.cpp`. Un niveau qui demande du code
  particulier grossit, et ca se voit
