cmake_minimum_required (VERSION 3.23)
project (R-INLA LANGUAGES C CXX Fortran)

if (${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})
	message (FATAL_ERROR "In-source builds not allowed. Please make a new directory (called a build directory) and run CMake from there. You may need to remove CMakeCache.txt. ")
endif ()

if (NOT CMAKE_BUILD_TYPE)
	set (CMAKE_BUILD_TYPE "RelWithDebInfo")
endif ()

option (BUILD_SHARED_LIBS "Build using shared libraries" FALSE)
option (BUILD_TESTING "" TRUE)

set (CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
set (CMAKE_POSITION_INDEPENDENT_CODE TRUE)

include (CTest)
find_package (Git)
find_package (OpenMP REQUIRED COMPONENTS C)
find_package (GSL REQUIRED)
find_package (METIS REQUIRED)
find_package (LAPACK REQUIRED)
find_package (SuiteSparse REQUIRED COMPONENTS AMD)
find_package (ZLIB REQUIRED)
find_package (OpenSSL REQUIRED COMPONENTS Crypto)
find_package (Pardiso)
find_package (LibR)

if (LIBR_CORE_LIBRARY)
	add_library (R::R INTERFACE IMPORTED)
	target_include_directories (R::R INTERFACE ${LIBR_INCLUDE_DIRS})
	target_link_libraries (R::R INTERFACE ${LIBR_CORE_LIBRARY})
endif ()

find_library (
	LIBR_MATH_LIBRARY
	NAMES Rmath
	HINTS ${LIBR_LIB_DIR} ${LIBRARY_ARCH_HINT_PATH} ${LIBR_HOME}/lib
	REQUIRED
)
if (LIBR_MATH_LIBRARY)
	add_library (R::Rmath INTERFACE IMPORTED)
	target_include_directories (R::Rmath INTERFACE ${LIBR_INCLUDE_DIRS})
	target_link_libraries (R::Rmath INTERFACE -lRmath)
endif ()

if (LIBR_BLAS_LIBRARY)
	add_library (R::Rblas INTERFACE IMPORTED)
	target_include_directories (R::Rblas INTERFACE ${LIBR_INCLUDE_DIRS})
	target_link_libraries (R::Rblas INTERFACE ${LIBR_BLAS_LIBRARY})
endif ()

if (LIBR_LAPACK_LIBRARY)
	add_library (R::Rlapack INTERFACE IMPORTED)
	target_include_directories (R::Rlapack INTERFACE ${LIBR_INCLUDE_DIRS})
	target_link_libraries (R::Rlapack INTERFACE ${LIBR_LAPACK_LIBRARY})
endif ()

if (LIBR_GRAPHAPP_LIBRARY)
	add_library (R::Rgraphapp INTERFACE IMPORTED)
	target_include_directories (R::Rgraphapp INTERFACE ${LIBR_INCLUDE_DIRS})
	target_link_libraries (R::Rgraphapp INTERFACE ${LIBR_GRAPHAPP_LIBRARY})
endif ()

find_library (
	LTDL_LIBRARY
	NAMES ltdl
	REQUIRED
)
find_path (
	LTDL_INCLUDE_DIRS
	NAMES ltdl.h
	REQUIRED
)

if (LTDL_LIBRARY)
	add_library (LTDL::LTDL INTERFACE IMPORTED)
	target_include_directories (LTDL::LTDL INTERFACE ${LTDL_INCLUDE_DIRS})
	target_link_libraries (LTDL::LTDL INTERFACE ${LTDL_LIBRARY})
endif ()

execute_process (
	COMMAND Git::Git log --pretty=format:"%H - %cd" -n 1
	OUTPUT_VARIABLE GITCOMMIT
)

add_subdirectory (extlibs)

set (FMESHER_USE_OPENMP TRUE)
set (FMESHER_BUILD_WITH_X FALSE)
set (FMESHER_BUILD_WITH_GSL TRUE)
add_subdirectory (fmesher)

add_subdirectory (gmrflib)
add_subdirectory (inlaprog)
# add_subdirectory (rinla)
