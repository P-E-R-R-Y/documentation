# =============================================================================
#  P-E-R-R-Y — doc agregee
#
#  Recupere chaque repo liste dans repos.cmake, puis lance UNE seule passe
#  doxygen dessus. Le but n'est pas d'empiler des docs cote a cote : c'est
#  d'avoir un seul index, une seule recherche, et surtout des graphes
#  d'heritage qui traversent les repos - RayWindow -> graphic::IWindow3 est
#  un lien mort dans la doc de raylib_impl seule, il devient un vrai graphe
#  ici.
#
#  On ne COMPILE rien : les sources sont juste lues.
# =============================================================================

cmake_minimum_required(VERSION 3.24)
project(perry_documentation LANGUAGES NONE)

include(FetchContent)

find_package(Doxygen REQUIRED)

set(PERRY_REPOS "" CACHE INTERNAL "")

# -----------------------------------------------------------------------------
#  perry_repo(<nom> <categorie> <url> [TAG <ref>] [SUBDIRS <d>...])
#
#  Declare un repo. Ne telecharge rien encore : on veut d'abord toute la
#  liste, pour pouvoir la trier par categorie.
# -----------------------------------------------------------------------------
function(perry_repo name category url)
    cmake_parse_arguments(ARG "" "TAG;GROUP" "SUBDIRS" ${ARGN})

    if(NOT ARG_TAG)
        set(ARG_TAG main)
    endif()
    if(NOT ARG_SUBDIRS)
        set(ARG_SUBDIRS includes sources)
    endif()
    if(NOT ARG_GROUP)
        set(ARG_GROUP ${name})
    endif()
    if(NOT category MATCHES "^(utility|contract|vendor)$")
        message(FATAL_ERROR "perry_repo(${name}) : categorie inconnue '${category}'")
    endif()

    # un interrupteur par repo : -DPERRY_DOC_ECS=OFF sans toucher a repos.cmake
    string(TOUPPER "${name}" upper)
    option(PERRY_DOC_${upper} "Inclure ${name} dans la doc" ON)

    set(_repos ${PERRY_REPOS})
    list(APPEND _repos ${name})
    set(PERRY_REPOS "${_repos}" CACHE INTERNAL "")
    set(PERRY_${name}_CATEGORY "${category}" CACHE INTERNAL "")
    set(PERRY_${name}_URL      "${url}"      CACHE INTERNAL "")
    set(PERRY_${name}_TAG      "${ARG_TAG}"  CACHE INTERNAL "")
    set(PERRY_${name}_SUBDIRS  "${ARG_SUBDIRS}" CACHE INTERNAL "")
    set(PERRY_${name}_GROUP    "${ARG_GROUP}"   CACHE INTERNAL "")
endfunction()

include(${CMAKE_CURRENT_SOURCE_DIR}/repos.cmake)

# -----------------------------------------------------------------------------
#  Recuperation
#
#  SOURCE_SUBDIR pointe volontairement vers un dossier inexistant : c'est la
#  facon documentee de dire a FetchContent "telecharge, mais n'ajoute rien au
#  build". Sans ca il tenterait de configurer chaque repo, avec toutes leurs
#  dependances - pour lire des commentaires, ce serait absurde.
# -----------------------------------------------------------------------------
find_package(Git REQUIRED)

set(DOXY_INPUT "")
set(DOXY_IMAGE_PATH "")
set(DOXY_EXCLUDE "")
set(REPORT_utility "")
set(REPORT_contract "")
set(REPORT_vendor "")
set(REPORT_skipped "")

foreach(name IN LISTS PERRY_REPOS)
    string(TOUPPER "${name}" upper)
    if(NOT PERRY_DOC_${upper})
        list(APPEND REPORT_skipped "${name} : desactive (-DPERRY_DOC_${upper}=OFF)")
        continue()
    endif()

    # Une copie locale court-circuite tout : rien a verifier a distance.
    if(FETCHCONTENT_SOURCE_DIR_${upper})
        set(PERRY_${name}_TAG "local : ${FETCHCONTENT_SOURCE_DIR_${upper}}")
    else()
        # On sonde le depot AVANT de le declarer. Sans ca, un repo vide (pas
        # encore pousse) ou renomme fait echouer toute la configuration, et
        # on perd la doc des dix autres pour un seul absent.
        execute_process(
            COMMAND ${GIT_EXECUTABLE} ls-remote --symref ${PERRY_${name}_URL} HEAD
            OUTPUT_VARIABLE probe RESULT_VARIABLE probe_status
            ERROR_QUIET OUTPUT_STRIP_TRAILING_WHITESPACE
        )
        if(NOT probe_status EQUAL 0 OR probe STREQUAL "")
            list(APPEND REPORT_skipped
                 "${name} : depot vide ou inaccessible (${PERRY_${name}_URL})")
            continue()
        endif()

        # Le tag par defaut est 'main', mais un depot peut vivre sur une
        # autre branche : on lit celle vers laquelle HEAD pointe vraiment.
        if(PERRY_${name}_TAG STREQUAL "main" AND probe MATCHES "ref: refs/heads/([^\t\n]+)")
            set(PERRY_${name}_TAG "${CMAKE_MATCH_1}")
        endif()
    endif()

    FetchContent_Declare(${name}
        GIT_REPOSITORY ${PERRY_${name}_URL}
        GIT_TAG        ${PERRY_${name}_TAG}
        GIT_SHALLOW    TRUE
        SOURCE_SUBDIR  cmake_does_not_configure_this
        # sans ca FetchContent range dans <nom>-src, et l'onglet Files
        # affiche "i18n-src" a cote de "igraphic" (venu d'une copie locale,
        # donc sans suffixe). Meme nom de racine partout.
        SOURCE_DIR     "${FETCHCONTENT_BASE_DIR}/${name}"
    )
    FetchContent_MakeAvailable(${name})

    string(TOLOWER "${name}" lower)
    set(src "${${lower}_SOURCE_DIR}")

    foreach(sub IN LISTS PERRY_${name}_SUBDIRS)
        if(EXISTS "${src}/${sub}")
            string(APPEND DOXY_INPUT " \\\n    \"${src}/${sub}\"")
        endif()
    endforeach()

    # la declaration de groupe du repo, si elle existe. Pas le reste de
    # docs/ : chaque .md y deviendrait une page a la racine de la doc.
    if(EXISTS "${src}/docs/Topics.dox")
        string(APPEND DOXY_INPUT " \\\n    \"${src}/docs/Topics.dox\"")
    endif()

    # Le Readme d'un repo, c'est souvent la seule prose qui existe. Plutot
    # que d'en faire une page de plus a la racine, on l'attache comme
    # DESCRIPTION du topic du repo : \include{doc} insere un fichier en tant
    # que documentation, pas en tant que bloc de code. Un chemin absolu
    # evite l'ambiguite - douze repos ont un fichier nomme Readme.md.
    set(readme_found "")
    foreach(readme Readme.md README.md docs/Readme.md docs/README.md)
        if(EXISTS "${src}/${readme}")
            set(readme_found "${src}/${readme}")
            break()
        endif()
    endforeach()

    # Les images d'un Readme sont relatives A LUI (![](preview/x.png)).
    # doxygen les cherche dans IMAGE_PATH, pas a cote du fichier inclus :
    # sans le dossier du Readme la-dedans, toutes les images cassent.
    if(readme_found)
        get_filename_component(readme_dir "${readme_found}" DIRECTORY)
        string(APPEND DOXY_IMAGE_PATH " \\\n    \"${readme_dir}\"")
    endif()

    if(readme_found AND EXISTS "${src}/docs/Topics.dox")
        # Il est injecte dans le groupe : s'il est AUSSI lu comme source, il
        # devient une page a la racine en plus. Arrive des qu'un repo a ses
        # en-tetes a la racine (SUBDIRS .), donc que docs/ tombe dans INPUT.
        string(APPEND DOXY_EXCLUDE " \\\n    \"${readme_found}\"")

        set(attach "${CMAKE_CURRENT_BINARY_DIR}/groups/${name}.dox")
        file(WRITE "${attach}"
             "/** @addtogroup ${PERRY_${name}_GROUP}\n *  @include{doc} ${readme_found}\n */\n")
        string(APPEND DOXY_INPUT " \\\n    \"${attach}\"")
    elseif(readme_found)
        # pas de groupe declare : le Readme reste une page, faute de mieux
        string(APPEND DOXY_INPUT " \\\n    \"${readme_found}\"")
    endif()

    set(cat ${PERRY_${name}_CATEGORY})
    list(APPEND REPORT_${cat} "${name} @ ${PERRY_${name}_TAG}")
endforeach()

# les pages a nous (mainpage, hierarchie des groupes) en dernier
string(APPEND DOXY_INPUT " \\\n    \"${CMAKE_CURRENT_SOURCE_DIR}/docs/Main.md\"")
string(APPEND DOXY_INPUT " \\\n    \"${CMAKE_CURRENT_SOURCE_DIR}/docs/Topics.dox\"")

# -----------------------------------------------------------------------------
#  Doxyfile
# -----------------------------------------------------------------------------
set(DOXY_OUTPUT_DIR "${CMAKE_CURRENT_BINARY_DIR}")
set(DOXY_STRIP_PATH "${FETCHCONTENT_BASE_DIR}")
set(DOXY_MAINPAGE   "${CMAKE_CURRENT_SOURCE_DIR}/docs/Main.md")
set(DOXY_LAYOUT     "${CMAKE_CURRENT_SOURCE_DIR}/docs/DoxygenLayout.xml")

configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/docs/Doxyfile.in
    ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile
    @ONLY
)

add_custom_target(doc ALL
    COMMAND ${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    COMMENT "Doxygen sur l'ensemble des repos"
    VERBATIM
)

# -----------------------------------------------------------------------------
#  Servir la doc en HTTP plutot que d'ouvrir des file://
#
#  Ce n'est pas qu'une commodite : la recherche de doxygen est du JavaScript
#  qui va lire search/*.js en XHR. En file:// le navigateur refuse la
#  requete (origine "null"), donc la loupe ne rend jamais rien. En HTTP elle
#  fonctionne.
#
#      cmake --build build --target serve
#      cmake --build build --target serve -- PERRY_DOC_PORT=9000   (autre port)
# -----------------------------------------------------------------------------
set(PERRY_DOC_PORT 8080 CACHE STRING "Port du serveur de doc local")

find_package(Python3 COMPONENTS Interpreter)

if(Python3_Interpreter_FOUND)
    add_custom_target(serve
        COMMAND ${CMAKE_COMMAND} -E echo
                "  doc servie sur http://localhost:${PERRY_DOC_PORT}/  (ctrl-c pour arreter)"
        COMMAND ${Python3_EXECUTABLE} -m http.server ${PERRY_DOC_PORT}
                --directory ${DOXY_OUTPUT_DIR}/html
        DEPENDS doc
        USES_TERMINAL
        VERBATIM
    )
else()
    message(STATUS "  python3 introuvable : cible 'serve' indisponible")
endif()

message(STATUS "")
message(STATUS "  Doc P-E-R-R-Y")
message(STATUS "  ------------")
foreach(cat utility contract vendor)
    message(STATUS "  ${cat} :")
    foreach(entry IN LISTS REPORT_${cat})
        message(STATUS "      ${entry}")
    endforeach()
endforeach()
if(REPORT_skipped)
    message(STATUS "  ecartes :")
    foreach(entry IN LISTS REPORT_skipped)
        message(STATUS "      ${entry}")
    endforeach()
    message(STATUS "")
    message(STATUS "  Un depot pas encore pousse se documente depuis sa copie locale :")
    message(STATUS "      cmake -B build -DFETCHCONTENT_SOURCE_DIR_<NOM>=/chemin")
endif()
message(STATUS "  -> ${DOXY_OUTPUT_DIR}/html/index.html")
message(STATUS "")
