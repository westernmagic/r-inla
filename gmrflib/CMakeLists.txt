add_compile_definitions (
	GMRFLib_PATH=\"/doc/GMRFLib/data\"
	GITCOMMIT=${GITCOMMIT}
)

file (
	WRITE ${CMAKE_CURRENT_BINARY_DIR}/GitID.all
	\"${GITCOMMIT}\",
)
include_directories (${CMAKE_CURRENT_BINARY_DIR})

# add_subdirectory (examples)

add_library (
	gmrf

	problem-setup.c
	lapack-interface.c
	graph.c
	error-handler.c
	acm582.F
	GMRFLib-fortran.F
	optimize.c
	blockupdate.c
	distributions.c
	globals.c
	random.c
	timer.c
	hash.c
	density.c
	smtp-band.c
	smtp-taucs.c
	sparse-interface.c
	rw.c
	bitmap.c
	tabulate-Qfunc.c
	io.c
	approx-inference.c
	ghq.c
	utils.c
	graph-edit.c
	domin-interface.c
	design.c
	version.c
	integrator.c
	openmp.c
	hgmrfm.c
	seasonal.c
	matern.c
	bfgs3.c
	bfgs4.c
	fmesher-io.c
	smtp-pardiso.c
	interpol.c
	pre-opt.c
)
target_include_directories (gmrf PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries (
	gmrf
	PUBLIC
	OpenMP::OpenMP_C
	GSL::gsl
	taucs
	METIS::METIS
	LAPACK::LAPACK
	GSL::gslcblas
	ZLIB::ZLIB
)
