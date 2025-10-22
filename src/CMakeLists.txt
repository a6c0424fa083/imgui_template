#
#  main.cpp
#  Template
#
#
#  Created by Jannis Sauer on 2025-10-16.
#

set(MAIN_TARGET_DIRS "${MAIN_TARGET_DIRS}"
    "${CMAKE_CURRENT_SOURCE_DIR}"
    CACHE INTERNAL ""
)

add_subdirectory(backend)
add_subdirectory(frontend)
