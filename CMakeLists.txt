cmake_minimum_required(VERSION 3.10)
project(GenericCppTemplate)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -g")

# Enable testing
enable_testing()

include(FetchContent)
FetchContent_Declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG release-1.12.1
)
FetchContent_MakeAvailable(googletest)

include_directories(inc)

# Main executable
add_executable(GenericCppTemplate
    src/main.cpp
)

# Test executable
add_executable(GenericCppTemplateTests tests/test.cpp)
target_link_libraries(GenericCppTemplateTests gtest gtest_main pthread)

# Register tests
include(GoogleTest)
gtest_discover_tests(GenericCppTemplateTests)
