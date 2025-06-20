cmake_minimum_required(VERSION 3.16)
project(sdl_utils C)

# Find SDL2 and SDL2_ttf
if(WIN32)
    # Use variables from environment/workflow, do not use find_package
    set(SDL2_INCLUDE_DIR $ENV{SDL2_DIR}/include)
    set(SDL2_TTF_INCLUDE_DIR $ENV{SDL2_TTF_DIR}/include)
    set(SDL2_LIBRARY $ENV{SDL2_DIR}/lib/x64/SDL2.lib)
    set(SDL2_TTF_LIBRARY $ENV{SDL2_TTF_DIR}/lib/x64/SDL2_ttf.lib)
else()
    find_package(SDL2 REQUIRED)
    find_package(SDL2_ttf REQUIRED)
endif()

# Set output name and type based on platform
set(LIB_NAME sdl_utils)
if(WIN32)
    set(LIB_TYPE SHARED)
    set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
else()
    set(LIB_TYPE SHARED)
endif()

add_library(${LIB_NAME} ${LIB_TYPE} sdl_utils.c)

if(WIN32)
    target_include_directories(${LIB_NAME} PRIVATE
        ${SDL2_INCLUDE_DIR}
        ${SDL2_TTF_INCLUDE_DIR}
    )
    target_link_libraries(${LIB_NAME} PRIVATE ${SDL2_LIBRARY} ${SDL2_TTF_LIBRARY})
else()
    target_include_directories(${LIB_NAME} PRIVATE ${SDL2_INCLUDE_DIRS} ${SDL2_TTF_INCLUDE_DIRS})
    target_link_libraries(${LIB_NAME} PRIVATE ${SDL2_LIBRARIES} ${SDL2_TTF_LIBRARIES} SDL2 SDL2_ttf)
endif()

# Set output directory to current (native/) folder
set_target_properties(${LIB_NAME} PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
)
