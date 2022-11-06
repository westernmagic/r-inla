add_executable (example-blockupdate example-blockupdate.c)
target_link_libraries (example-blockupdate PRIVATE gmrf)

add_executable (example-blockupdate-with-error-control example-blockupdate-with-error-control.c)
target_link_libraries (example-blockupdate-with-error-control PRIVATE gmrf)

add_executable (example-graph1 example-graph1.c)
target_link_libraries (example-graph1 PRIVATE gmrf)

add_executable (example-graph2 example-graph2.c)
target_link_libraries (example-graph2 PRIVATE gmrf)

add_executable (example-sample example-sample.c)
target_link_libraries (example-sample PRIVATE gmrf)

add_executable (example-wa example-wa.c)
target_link_libraries (example-wa PRIVATE gmrf)

add_executable (example-rw example-rw.c)
target_link_libraries (example-rw PRIVATE gmrf)

add_executable (example-qinv example-qinv.c)
target_link_libraries (example-qinv PRIVATE gmrf)

add_executable (example-rng example-rng.c)
target_link_libraries (example-rng PRIVATE gmrf)

add_executable (example-error-handler example-error-handler.c)
target_link_libraries (example-error-handler PRIVATE gmrf)

add_executable (example-graph-edit example-graph-edit.c)
target_link_libraries (example-graph-edit PRIVATE gmrf)

add_executable (example-bitmap example-bitmap.c)
target_link_libraries (example-bitmap PRIVATE gmrf)

add_executable (example-auxvar example-auxvar.c)
target_link_libraries (example-auxvar PRIVATE gmrf)

add_executable (example-approx-1 example-approx-1.c)
target_link_libraries (example-approx-1 PRIVATE gmrf)

add_executable (example-approx-2 example-approx-2.c)
target_link_libraries (example-approx-2 PRIVATE gmrf)

add_executable (example-approx-3 example-approx-3.c)
target_link_libraries (example-approx-3 PRIVATE gmrf)

add_executable (example-hgmrfm-1 example-hgmrfm-1.c)
target_link_libraries (example-hgmrfm-1 PRIVATE gmrf)

add_executable (example-hgmrfm-2 example-hgmrfm-2.c)
target_link_libraries (example-hgmrfm-2 PRIVATE gmrf)

add_executable (example-matern2d example-matern2d.c)
target_link_libraries (example-matern2d PRIVATE gmrf)

add_executable (example-blockupdate-2 EXCLUDE_FROM_ALL example-blockupdate-2.c)
target_link_libraries (example-blockupdate-2 PRIVATE gmrf)
