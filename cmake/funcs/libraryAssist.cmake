#
#  libraryAssist.cmake
#  Template
#
#
#  Created by Jannis Sauer on 2025-10-24.
#


macro(smartIncludeLibrary LIB_NAME LIB_SRCS LIB_DIRS)
    if(EXISTS "${CMAKE_BINARY_DIR}/lib${LIB_NAME}.a")
        message(STATUS "[smartIncludeLibrary] -- Using pre-compiled ${LIB_NAME} library!")
        add_library(${LIB_NAME} STATIC IMPORTED)
        set_property(TARGET ${LIB_NAME} PROPERTY
                IMPORTED_LOCATION "${CMAKE_BINARY_DIR}/lib${LIB_NAME}.a"
        )
        target_include_directories(${LIB_NAME} INTERFACE ${LIB_DIRS})
    elseif(EXISTS "${CMAKE_BINARY_DIR}/lib${LIB_NAME}.lib")
        message(STATUS "[smartIncludeLibrary] -- Using pre-compiled ${LIB_NAME} library!")
        add_library(${LIB_NAME} STATIC IMPORTED)
        set_property(TARGET ${LIB_NAME} PROPERTY
                IMPORTED_LOCATION "${CMAKE_BINARY_DIR}/lib${LIB_NAME}.lib"
        )
        target_include_directories(${LIB_NAME} INTERFACE ${LIB_DIRS})
    else()
        message(STATUS "[smartIncludeLibrary] -- ${LIB_NAME} library needs to be rebuild!")
        add_library(${LIB_NAME} STATIC)
        target_sources(${LIB_NAME} PUBLIC ${LIB_SRCS})
        target_include_directories(${LIB_NAME} PUBLIC ${LIB_DIRS})
    endif()
endmacro(smartIncludeLibrary)

macro(smartLinkLibrary TARGET_NAME LIB_NAME)
    add_dependencies(${TARGET_NAME} ${LIB_NAME})
    if(EXISTS "${CMAKE_BINARY_DIR}/lib${TARGET_NAME}.a" OR EXISTS "${CMAKE_BINARY_DIR}/lib${TARGET_NAME}.lib")
        target_link_libraries(${TARGET_NAME} INTERFACE ${LIB_NAME})
    else()
        target_link_libraries(${TARGET_NAME} PUBLIC ${LIB_NAME})
    endif()
endmacro(smartLinkLibrary)
