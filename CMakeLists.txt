project(deepbooru-ncnn)

cmake_minimum_required(VERSION 3.9)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CUSTOM_WARNINGS "-Wall -Wextra -Wno-unused-parameter -Wno-comment -Wno-unused-function -Wold-style-cast -Wsign-conversion -Wno-system-headers")
set(CMAKE_CXX_FLAGS_RELEASE "-O3")

find_package(Threads REQUIRED)
find_package(ncnn REQUIRED)
find_package(ImageMagick REQUIRED)
find_package(ImageMagick COMPONENTS MagickWand REQUIRED)

add_executable(dd-ncnn dd_main.cxx)
include_directories(${ImageMagick_MagickWand_INCLUDE_DIRS})
target_link_libraries(dd-ncnn ncnn ${ImageMagick_LIBRARIES})
