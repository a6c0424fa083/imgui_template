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
smartIncludeLibrary(${IMGUI_LIB_NAME} "${IMGUI_LIB_SRCS}" "${IMGUI_LIB_DIRS}")

# implot
smartIncludeLibrary(${IMPLOT_LIB_NAME} "${IMPLOT_LIB_SRCS}" "${IMPLOT_LIB_DIRS}")

######################
### LINK LIBRARIES ###
######################

# imgui
smartLinkLibrary(${IMGUI_LIB_NAME} OpenGL::GL)
smartLinkLibrary(${IMGUI_LIB_NAME} ${GLFW_LIB_NAME})

# implot
smartLinkLibrary(${IMPLOT_LIB_NAME} ${IMGUI_LIB_NAME})


# main
target_link_libraries(${MAIN_TARGET_NAME} PUBLIC
    ${IMGUI_LIB_NAME}
    ${IMPLOT_LIB_NAME}
)
