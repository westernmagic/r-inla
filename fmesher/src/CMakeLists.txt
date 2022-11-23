add_compile_definitions (
	GITCOMMIT=${GITCOMMIT}
)

if (CMAKE_SYSTEM_NAME STREQUAL "Linux")
	add_compile_definitions (LINUX=1)
elseif (CMAKE_SYSTEM_NAME STREQUAL "Darwin")
	add_compile_definitions (MAC=1)
elseif (CMAKE_SYSTEM_NAME STREQUAL "Windows")
	add_compile_definitions (WINDOWS=1)
endif ()

if (X11_FOUND)
	add_compile_definitions (MESHER_USE_X)
else ()
	add_compile_definitions (MESHER_NO_X)
endif ()

if (NOT GSL_FOUND)
	add_compile_definitions (NO_SPHERICAL_HARMONICS=1)
endif ()

set_property (
	SOURCE xtmpl.c x11utils.cc
	PROPERTY COMPILE_FLAGS "-Wno-unused-result -Wno-pedantic"
)

add_library (
	fmesher-lib

	$<$<BOOL:X11_FOUND>:xtmpl.c>
	$<$<BOOL:X11_FOUND>:x11utils.cc>
	predicates.cc
	mesh.cc
	meshc.cc
	vector.cc
	ioutils.cc
	cmdline.c
	basis.cc
	locator.cc
	trees.cc
	fmesher_helpers.cc
)
set_property (
	TARGET fmesher-lib
	PROPERTY OUTPUT_NAME fmesher
)
target_link_libraries (
	fmesher-lib
	PUBLIC
	OpenMP::OpenMP_C
	GSL::gsl
	$<$<BOOL:X11_FOUND>:X11::X11>
)

add_executable (fmesher fmesher.cc)
target_link_libraries (fmesher PRIVATE fmesher-lib)

add_executable (fmesher_test fmesher_test.cc)
target_link_libraries (fmesher_test PRIVATE fmesher-lib)

add_executable (treetest treetest.cc)
target_link_libraries (treetest PRIVATE fmesher-lib)
