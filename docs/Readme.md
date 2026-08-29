# documentation

[![Docs](https://img.shields.io/badge/docs-doxygen-blue.svg)](https://p-e-r-r-y.github.io/documentation)

> Every P-E-R-R-Y repo, one doxygen pass.

Nothing is written by hand here except the front page : each repo brings its
own readme and its own group declaration.

## Generate

```bash
cmake -B build && cmake --build build --target serve
```

Serves on `http://localhost:8080`. Doxygen is the only requirement.

## Change what is documented

One file : [`repos.cmake`](../repos.cmake), one line per repo.

```cmake
perry_repo(<name> <utility|contract|vendor> <url> [TAG <ref>] [GROUP <id>] [SUBDIRS <d>...])
```

Comment a line out to drop a repo. To document a local checkout instead of
the remote :

```bash
cmake -B build -DFETCHCONTENT_SOURCE_DIR_IGRAPHIC=/path/to/igraphic
```

## Why one pass and not twelve docs

`RayWindow` inherits from `graphic::IWindow3`, which lives in another repo.
On its own, `raylib_impl`'s doc cannot show that link. Here it is one
diagram. Search covers everything too : `isKeyPressed` returns the contract
and both implementations in the same list.

Nothing is compiled — repos are fetched and read.
