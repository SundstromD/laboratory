# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(laboratoryTests LANGUAGES CXX)

# ---- Tests ----

add_executable(laboratory_test source/laboratory_test.cpp)
target_link_libraries(laboratory_test PRIVATE laboratory_lib)
target_compile_features(laboratory_test PRIVATE cxx_std_17)

add_test(NAME laboratory_test COMMAND laboratory_test)

# ---- End-of-file commands ----

add_folders(Test)
