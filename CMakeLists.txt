cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    laboratory
    VERSION 0.1.0
    DESCRIPTION "C++ laboratory repo"
    HOMEPAGE_URL "https://example.com/"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    laboratory_lib OBJECT
    source/lib.cpp
)

target_include_directories(
    laboratory_lib ${warning_guard}
    PUBLIC
    "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/source>"
)

target_compile_features(laboratory_lib PUBLIC cxx_std_17)

# ---- Declare executable ----

add_executable(laboratory_exe source/main.cpp)
add_executable(laboratory::exe ALIAS laboratory_exe)

set_property(TARGET laboratory_exe PROPERTY OUTPUT_NAME laboratory)

target_compile_features(laboratory_exe PRIVATE cxx_std_17)

target_link_libraries(laboratory_exe PRIVATE laboratory_lib)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT laboratory_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of laboratory"
  )
endif()

include(cmake/dev-mode.cmake)
