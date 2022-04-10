cmake_minimum_required(VERSION 3.20)

project(
    TownPortal
    VERSION 1.1.0
    LANGUAGES NONE
)

include(FetchContent)

FetchContent_Declare(
    bgscmake
    GIT_REPOSITORY https://github.com/Exit-9B/BethesdaCMakeModules.git
    GIT_TAG main
)

FetchContent_MakeAvailable(bgscmake)

list(APPEND CMAKE_MODULE_PATH "${bgscmake_SOURCE_DIR}/Modules")

include(BSArchive)
include(Papyrus)

get_filename_component(
    Skyrim64Path
    "[HKEY_LOCAL_MACHINE\\SOFTWARE\\WOW6432Node\\Bethesda Softworks\\Skyrim Special Edition;installed path]"
    ABSOLUTE CACHE
)

file(GLOB ${PROJECT_NAME}_SOURCES
    LIST_DIRECTORIES false
    CONFIGURE_DEPENDS
    "Source/Scripts/*.psc"
)

add_papyrus(
    "${PROJECT_NAME}"
    GAME ${Skyrim64Path}
    IMPORTS ${CMAKE_CURRENT_SOURCE_DIR}/Source/Scripts
    SOURCES ${${PROJECT_NAME}_SOURCES}
    OPTIMIZE
    ANONYMIZE
)

source_group("Scripts" FILES ${${PROJECT_NAME}_SOURCES})

bethesda_archive(
    "BSA"
    OUTPUT "TownPortal.bsa"
    FORMAT SSE
    FILES
        ${${PROJECT_NAME}_OUTPUT}
        "${CMAKE_CURRENT_SOURCE_DIR}/Meshes/TownPortal/MAGINVTownPortal.nif"
        "${CMAKE_CURRENT_SOURCE_DIR}/Meshes/TownPortal/TownPortalHandFX.nif"
)

add_dependencies("BSA" "${PROJECT_NAME}")

install(
    FILES ${${PROJECT_NAME}_SOURCES}
    DESTINATION "Source/Scripts"
)

install(
    FILES ${${PROEJCT_NAME}_OUTPUT}
    DESTINATION "Scripts"
)

install(
    FILES
        "${CMAKE_CURRENT_SOURCE_DIR}/TownPortal.esp"
        "${CMAKE_CURRENT_BINARY_DIR}/TownPortal.bsa"
    DESTINATION "."
)

set(CPACK_GENERATOR "7Z")
set(CPACK_PACKAGE_FILE_NAME ${PROJECT_NAME}-${PROJECT_VERSION})
set(CPACK_INCLUDE_TOPLEVEL_DIRECTORY FALSE)
include(CPack)
