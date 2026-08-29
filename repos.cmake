# =============================================================================
#  LA liste. C'est le seul fichier a editer pour changer la doc generee.
# =============================================================================
#
#   perry_repo(<nom> <categorie> <url> [TAG <ref>] [SUBDIRS <d> ...])
#
#   categorie : utility | contract | vendor
#   TAG       : branche, tag ou sha. Defaut : main
#   GROUP     : id du groupe doxygen du repo. Defaut : son nom
#   SUBDIRS   : dossiers a documenter dans le repo. Defaut : includes sources
#               (jamais tests/ : les bouchons ne sont pas de l'API)
#
# Retirer un repo de la doc : commenter sa ligne.
# Ajouter un repo : ajouter une ligne, rien d'autre.
#
# Pour documenter une copie LOCALE en cours de dev plutot que le depot distant,
# rien a toucher ici - on passe la variable a la configuration :
#
#   cmake -B build -DFETCHCONTENT_SOURCE_DIR_IGRAPHIC=/chemin/vers/igraphic
#
# (le nom en MAJUSCULES, c'est la convention de FetchContent)
# =============================================================================

# ----- Utilitaires : des briques autonomes, sans contrat a respecter ---------

perry_repo(ecs         utility  https://github.com/P-E-R-R-Y/ecs.git)
perry_repo(i18n        utility  https://github.com/P-E-R-R-Y/i18n.git)
perry_repo(maths       utility  https://github.com/P-E-R-R-Y/maths.git)
perry_repo(system      utility  https://github.com/P-E-R-R-Y/system.git)
perry_repo(procedurals utility  https://github.com/P-E-R-R-Y/procedurals.git)
perry_repo(modulemanager utility https://github.com/P-E-R-R-Y/modulemanager.git)

# ----- Contrats : ce que les vendors doivent respecter ----------------------

perry_repo(imodule     contract https://github.com/P-E-R-R-Y/imodule.git)
perry_repo(igraphic    contract https://github.com/P-E-R-R-Y/igraphic.git)
perry_repo(iaudio      contract https://github.com/P-E-R-R-Y/iaudio.git)
perry_repo(icore       contract https://github.com/P-E-R-R-Y/icore.git)

# ----- Vendors : une bibliotheque tierce derriere un contrat ----------------

perry_repo(raylib_impl vendor   https://github.com/P-E-R-R-Y/raylib_impl.git
                                SUBDIRS includes sources GROUP raylib)
perry_repo(sfml_impl   vendor   https://github.com/P-E-R-R-Y/sfml_impl.git
                                SUBDIRS includes sources GROUP sfml)
perry_repo(sdl2_impl   vendor   https://github.com/P-E-R-R-Y/sdl2_impl.git
                                SUBDIRS includes sources GROUP sdl2)
perry_repo(sdl3_impl   vendor   https://github.com/P-E-R-R-Y/sdl3_impl.git
                                SUBDIRS includes sources GROUP sdl3)
