#
#  vars.cmake
#  Template
#
#
#  Created by Jannis Sauer on 2025-10-16.
#


#######################
### CMAKE VARIABLES ###
#######################

# define global standards
set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# define build architecture
set(CMAKE_OSX_ARCHITECTURES    "arm64" CACHE INTERNAL "The architecture the project is build for") # x86_64 / arm64
set(CMAKE_LIBRARY_ARCHITECTURE "arm64" CACHE INTERNAL "The architecture the project is build for") # x86_64 / arm64


#################
### LIBRARIES ###
#################

# set library base path
set(LIB_BASE_DIR "${CMAKE_SOURCE_DIR}/lib/thirdParty")
set(OWN_LIB_BASE_DIR "${CMAKE_SOURCE_DIR}/lib/own")

# glfw
set(GLFW_LIB_NAME glfw)
set(GLFW_LIB_PATH "${LIB_BASE_DIR}/glfw")

# imgui
set(IMGUI_LIB_NAME imgui)
set(IMGUI_LIB_PATH "${LIB_BASE_DIR}/imgui")
set(IMGUI_LIB_SRCS
    "${IMGUI_LIB_PATH}/imgui_demo.cpp"
    "${IMGUI_LIB_PATH}/imgui_draw.cpp"
    "${IMGUI_LIB_PATH}/imgui_tables.cpp"
    "${IMGUI_LIB_PATH}/imgui_widgets.cpp"
    "${IMGUI_LIB_PATH}/imgui.cpp"
    #"${IMGUI_LIB_PATH}/backends/imgui_impl_allegro5.cpp"
    #"${IMGUI_LIB_PATH}/backends/imgui_impl_android.cpp"
    #"${IMGUI_LIB_PATH}/backends/imgui_impl_dx9.cpp"
    #"${IMGUI_LIB_PATH}/backends/imgui_impl_dx10.cpp"
    #"${IMGUI_LIB_PATH}/backends/imgui_impl_dx11.cpp"
    #"${IMGUI_LIB_PATH}/backends/imgui_impl_dx12.cpp"
    "${IMGUI_LIB_PATH}/backends/imgui_impl_glfw.cpp"
    #"${IMGUI_LIB_PATH}/backends/imgui_impl_glut.cpp"
    #"${IMGUI_LIB_PATH}/backends/imgui_impl_metal.mm"
    #"${IMGUI_LIB_PATH}/backends/imgui_impl_opengl2.cpp "
    "${IMGUI_LIB_PATH}/backends/imgui_impl_opengl3.cpp"
    #"${IMGUI_LIB_PATH}/backends/imgui_impl_osx.mm"
    #"${IMGUI_LIB_PATH}/backends/imgui_impl_sdl2.cpp"
    #"${IMGUI_LIB_PATH}/backends/imgui_impl_sdl3.cpp"
    #"${IMGUI_LIB_PATH}/backends/imgui_impl_sdlrenderer2.cpp"
    #"${IMGUI_LIB_PATH}/backends/imgui_impl_sdlrenderer3.cpp"
    #"${IMGUI_LIB_PATH}/backends/imgui_impl_vulkan.cpp"
    #"${IMGUI_LIB_PATH}/backends/imgui_impl_wgpu.cpp"
    #"${IMGUI_LIB_PATH}/backends/imgui_impl_win32.cpp"
)
set(IMGUI_LIB_DIRS
    "${IMGUI_LIB_PATH}"
    "${IMGUI_LIB_PATH}/backends"
)

# implot
set(IMPLOT_LIB_NAME implot) # set library name
set(IMPLOT_LIB_PATH "${LIB_BASE_DIR}/implot") # set library path
set(IMPLOT_LIB_SRCS
    "${IMPLOT_LIB_PATH}/implot.cpp"
    "${IMPLOT_LIB_PATH}/implot_items.cpp"
)
set(IMPLOT_LIB_DIRS ${IMPLOT_LIB_PATH})


###################
### MAIN TARGET ###
###################

set(MAIN_TARGET_NAME "Template")

set(MAIN_TARGET_SRCS "${MAIN_TARGET_SRCS}"
    "${CMAKE_SOURCE_DIR}/main.cpp"
    CACHE INTERNAL ""
)
set(MAIN_TARGET_DIRS "" CACHE INTERNAL "")

set (APPLICATION_DATA_PATH "${CMAKE_SOURCE_DIR}/applicationData/")
