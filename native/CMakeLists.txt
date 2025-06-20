cmake_minimum_required(VERSION 3.5)
project(sdl_utils C)

# Find SDL2
find_package(SDL2 REQUIRED)

# On macOS, add Homebrew SDL2 include path for SDL2_ttf
if(APPLE)
    execute_process(COMMAND brew --prefix OUTPUT_VARIABLE BREW_PREFIX OUTPUT_STRIP_TRAILING_WHITESPACE)
    include_directories(${BREW_PREFIX}/include/SDL2)
endif()

# Set output name and type based on platform
set(LIB_NAME sdl_utils)
if(WIN32)
    set(LIB_TYPE SHARED)
    set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
elseif(APPLE)
    set(LIB_TYPE MODULE)
else()
    set(LIB_TYPE SHARED)
endif()

add_library(${LIB_NAME} ${LIB_TYPE} sdl_utils.c)

target_include_directories(${LIB_NAME} PRIVATE ${SDL2_INCLUDE_DIRS})
target_link_libraries(${LIB_NAME} PRIVATE ${SDL2_LIBRARIES})

# Set output directory to current (native/) folder
set_target_properties(${LIB_NAME} PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
)

# On macOS, ensure .dylib extension
if(APPLE)
    set_target_properties(${LIB_NAME} PROPERTIES SUFFIX ".dylib")
endif()
