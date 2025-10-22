#
#  CMakeLists.txt
#  Template
#
#
#  Created by Jannis Sauer on 2025-10-16.
#


############################
###   GENERAL SETTINGS   ###
############################

# set cmake minimal version
cmake_minimum_required(VERSION 4.0)

# include the variables
include("${CMAKE_SOURCE_DIR}/cmake/vars.cmake")

# add project
project("Template"
        VERSION 0.1.0
        LANGUAGES C CXX
)

# include necessary modules
include("${CMAKE_SOURCE_DIR}/cmake/funcs/Warnings.cmake")

# configure cmake_config.h.in file
configure_file("${CMAKE_SOURCE_DIR}/cmake_config.h.in" "${CMAKE_BINARY_DIR}/generated/cmake_config.h")
set(MAIN_TARGET_DIRS "${MAIN_TARGET_DIRS}"
    "${CMAKE_BINARY_DIR}/generated"
    CACHE INTERNAL ""
)


#######################
###   MAIN TARGET   ###
#######################

# add main target
add_executable(${MAIN_TARGET_NAME})

# include subdirectories to build the project recursively
add_subdirectory(src)

# add sources
target_sources(${MAIN_TARGET_NAME} PUBLIC ${MAIN_TARGET_SRCS})

# include directories
target_include_directories(${MAIN_TARGET_NAME} PUBLIC ${MAIN_TARGET_DIRS})

# set main target warnings
target_set_warnings(${MAIN_TARGET_NAME} ON OFF)

# set compile definitions
target_compile_definitions(${MAIN_TARGET_NAME} PUBLIC APPLICATION_DATA_PATH="${APPLICATION_DATA_PATH}")

# include the libraries
include("${CMAKE_SOURCE_DIR}/cmake/libs.cmake")

# include custom targets
include("${CMAKE_SOURCE_DIR}/cmake/customTargets.cmake")
