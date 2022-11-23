add_compile_definitions (
	GMRFLib_PATH=\"/doc/GMRFLib/data\"
	GITCOMMIT=${GITCOMMIT}
)

add_executable (
	inla

	inla.c
	dictionary.c
	iniparser.c
	strlib.c
	my-fix.c
	spde.c
	spde2.c
	spde3.c
	eval.c
	ar.c
	bessel.c
	pc-priors.c
	R-interface.c
	fgn.c
	quantile-regression.c
	my.c
	stochvol.c
	xerbla.c
	libpardiso.c
	tweedie.c
	pc-powerlink.c
	cgeneric.c
)

target_link_libraries (
	inla
	PRIVATE
	gmrf
	muparser
	OpenSSL::Crypto
	LTDL::LTDL
	SuiteSparse::AMD
)

if (LIBR_MATH_LIBRARY)
	target_compile_definitions (inla PRIVATE INLA_WITH_RMATH)
	target_link_libraries (inla PRIVATE R::Rmath)
endif ()

if (LIBR_CORE_LIBRARY)
	target_compile_definitions (inla PRIVATE INLA_WITH_RMATH)
	target_compile_definitions (inla PRIVATE INLA_LIBR)
	target_link_libraries (inla PRIVATE R::R)
endif ()

if (PARDISO_FOUND)
	target_link_libraries (inla PRIVATE PARDISO::PARDISO_C)
endif ()
