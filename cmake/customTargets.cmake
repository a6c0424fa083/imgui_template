#
#  customTargets.cmake
#  Template
#
#
#  Created by Jannis Sauer on 2025-10-16.
#


# generate dependency graph
add_custom_target(graph
        COMMAND ${CMAKE_COMMAND}
        --graphviz=${CMAKE_BINARY_DIR}/generated/dependencies.dot
        ${CMAKE_SOURCE_DIR}
        COMMENT "Generating CMake dependency graph (.dot file)..."
)

# check for graphviz
find_program(GRAPHVIZ_DOT_EXECUTABLE dot)

# auto-render PNG if Graphviz is available
if(GRAPHVIZ_DOT_EXECUTABLE)
    add_custom_target(graph_png
        COMMAND ${CMAKE_COMMAND}
        --graphviz=${CMAKE_BINARY_DIR}/generated/dependencies.dot
        ${CMAKE_SOURCE_DIR}
        COMMAND ${GRAPHVIZ_DOT_EXECUTABLE} -Tpng ${CMAKE_BINARY_DIR}/generated/dependencies.dot -o ${CMAKE_BINARY_DIR}/generated/dependencies.png
        COMMENT "Generating dependency graph as PNG..."
    )
endif()
