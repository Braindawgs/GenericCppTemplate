cmake_minimum_required(VERSION 3.10)
project(GenericCppTemplate)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -g")

include_directories(inc)

add_executable(GenericCppTemplate
    src/main.cpp
)
