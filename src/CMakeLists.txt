cmake_minimum_required (VERSION 3.0)

project (brownrv)
add_executable (brownrv brownrv.c) 

project (exponentialrv)
add_executable (exponentialrv exponentialrv.c)

project (laplace)
add_executable (laplace laplace.c)

project (pinkgen)
add_executable (pinkgen pinkgen.c) 

project(uniformrv)
add_executable (uniformrv uniformrv.c)

set (EXECUTABLE_OUTPUT_PATH "${PROJECT_BINARY_DIR}/../dist")
set (CMAKE_CXX_FLAGS "-O3")
set (CMAKE_EXE_LINKER_FLAGS  "-lm")
