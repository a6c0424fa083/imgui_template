#
#  libs.cmake
#  Template
#
#
#  Created by Jannis Sauer on 2025-10-16.
#


#####################
### ADD LIBRARIES ###
#####################

# opengl
find_package(OpenGL REQUIRED)

# glfw (is build inside submodule)
add_subdirectory(${GLFW_LIB_PATH})

# imgui
if(EXISTS "${CMAKE_BINARY_DIR}/lib${IMGUI_LIB_NAME}.a")
    add_library(${IMGUI_LIB_NAME} STATIC IMPORTED)
    set_property(TARGET ${IMGUI_LIB_NAME} PROPERTY
        IMPORTED_LOCATION "${CMAKE_BINARY_DIR}/lib${IMGUI_LIB_NAME}.a"
    )
    target_include_directories(${IMGUI_LIB_NAME} INTERFACE ${IMGUI_LIB_DIRS})
elseif(EXISTS "${CMAKE_BINARY_DIR}/lib${IMGUI_LIB_NAME}.lib")
    add_library(${IMGUI_LIB_NAME} STATIC IMPORTED)
    set_property(TARGET ${IMGUI_LIB_NAME} PROPERTY
            IMPORTED_LOCATION "${CMAKE_BINARY_DIR}/lib${IMGUI_LIB_NAME}.lib"
    )
    target_include_directories(${IMGUI_LIB_NAME} INTERFACE ${IMGUI_LIB_DIRS})
else()
    message(STATUS "${IMGUI_LIB_NAME} library needs to be rebuild!")
    add_library(${IMGUI_LIB_NAME} STATIC)
    target_sources(${IMGUI_LIB_NAME} PUBLIC ${IMGUI_LIB_SRCS})
    target_include_directories(${IMGUI_LIB_NAME} PUBLIC ${IMGUI_LIB_DIRS})
endif()

# implot
if(EXISTS "${CMAKE_BINARY_DIR}/lib${IMPLOT_LIB_NAME}.a")
    add_library(${IMPLOT_LIB_NAME} STATIC IMPORTED)
    set_property(TARGET ${IMPLOT_LIB_NAME} PROPERTY
            IMPORTED_LOCATION "${CMAKE_BINARY_DIR}/lib${IMPLOT_LIB_NAME}.a"
    )
    target_include_directories(${IMPLOT_LIB_NAME} INTERFACE ${IMPLOT_LIB_DIRS})
elseif(EXISTS "${CMAKE_BINARY_DIR}/lib${IMPLOT_LIB_NAME}.lib")
    add_library(${IMPLOT_LIB_NAME} STATIC IMPORTED)
    set_property(TARGET ${IMPLOT_LIB_NAME} PROPERTY
            IMPORTED_LOCATION "${CMAKE_BINARY_DIR}/lib${IMPLOT_LIB_NAME}.lib"
    )
    target_include_directories(${IMPLOT_LIB_NAME} INTERFACE ${IMPLOT_LIB_DIRS})
else()
    message(STATUS "${IMPLOT_LIB_NAME} library needs to be rebuild!")
    add_library(${IMPLOT_LIB_NAME} STATIC)
    target_sources(${IMPLOT_LIB_NAME} PUBLIC ${IMPLOT_LIB_SRCS})
    target_include_directories(${IMPLOT_LIB_NAME} PUBLIC ${IMPLOT_LIB_DIRS})
endif()


######################
### LINK LIBRARIES ###
######################

# imgui
if(EXISTS "${CMAKE_BINARY_DIR}/lib${IMGUI_LIB_NAME}.a" OR EXISTS "${CMAKE_BINARY_DIR}/lib${IMGUI_LIB_NAME}.lib")
    target_link_libraries(${IMGUI_LIB_NAME} INTERFACE ${GLFW_LIB_NAME})
    target_link_libraries(${IMGUI_LIB_NAME} INTERFACE OpenGL::GL)
else()
    target_link_libraries(${IMGUI_LIB_NAME} PUBLIC ${GLFW_LIB_NAME})
    target_link_libraries(${IMGUI_LIB_NAME} PUBLIC OpenGL::GL)
endif()

# implot
if(EXISTS "${CMAKE_BINARY_DIR}/lib${IMGUI_LIB_NAME}.a" OR EXISTS "${CMAKE_BINARY_DIR}/lib${IMGUI_LIB_NAME}.lib")
    target_link_libraries(${IMPLOT_LIB_NAME} INTERFACE ${IMGUI_LIB_NAME})
else()
    target_link_libraries(${IMPLOT_LIB_NAME} PUBLIC ${IMGUI_LIB_NAME})
endif()

# main
if(EXISTS "${CMAKE_BINARY_DIR}/lib${IMPLOT_LIB_NAME}.a" OR EXISTS "${CMAKE_BINARY_DIR}/lib${IMPLOT_LIB_NAME}.lib")
    target_link_libraries(${MAIN_TARGET_NAME} INTERFACE ${IMPLOT_LIB_NAME})
else()
    target_link_libraries(${MAIN_TARGET_NAME} PUBLIC ${IMPLOT_LIB_NAME})
endif()
