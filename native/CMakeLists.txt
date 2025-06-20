cmake_minimum_required(VERSION 3.16)
project(sdl_utils C)

# Find SDL2 and SDL2_ttf
find_package(SDL2 REQUIRED)
find_package(SDL2_ttf REQUIRED)

# Set output name and type based on platform
set(LIB_NAME sdl_utils)
if(WIN32)
    set(LIB_TYPE SHARED)
    set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
else()
    set(LIB_TYPE SHARED)
endif()

add_library(${LIB_NAME} ${LIB_TYPE} sdl_utils.c)

target_include_directories(${LIB_NAME} PRIVATE ${SDL2_INCLUDE_DIRS} ${SDL2_TTF_INCLUDE_DIRS})
# Explicitly link to SDL2 and SDL2_ttf libraries for runtime symbol resolution
# This helps ensure TTF_Init and other symbols are found at runtime
# even if CMake variables are incomplete
# (order matters: SDL2_ttf after SDL2)
target_link_libraries(${LIB_NAME} PRIVATE ${SDL2_LIBRARIES} ${SDL2_TTF_LIBRARIES} SDL2 SDL2_ttf)

# Set output directory to current (native/) folder
set_target_properties(${LIB_NAME} PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
)
