# Move this script into the src directory where booksim was built
cd ..
cd ..

# Call Booksim and Append the output of the repro scripts into a log file inside of the target folder
./booksim examples/ValidateAdaptive/hexmesh4 >> examples/ValidateAdaptive/zero_load_hexmesh.log
./booksim examples/ValidateAdaptive/hexmesh9 >> examples/ValidateAdaptive/zero_load_hexmesh.log
./booksim examples/ValidateAdaptive/hexmesh16 >> examples/ValidateAdaptive/zero_load_hexmesh.log
./booksim examples/ValidateAdaptive/hexmesh25 >> examples/ValidateAdaptive/zero_load_hexmesh.log
./booksim examples/ValidateAdaptive/hexmesh36 >> examples/ValidateAdaptive/zero_load_hexmesh.log
./booksim examples/ValidateAdaptive/hexmesh49 >> examples/ValidateAdaptive/zero_load_hexmesh.log
./booksim examples/ValidateAdaptive/hexmesh64 >> examples/ValidateAdaptive/zero_load_hexmesh.log
./booksim examples/ValidateAdaptive/hexmesh81 >> examples/ValidateAdaptive/zero_load_hexmesh.log
./booksim examples/ValidateAdaptive/hexmesh100 >> examples/ValidateAdaptive/zero_load_hexmesh.log
./booksim examples/ValidateAdaptive/hexmesh121 >> examples/ValidateAdaptive/zero_load_hexmesh.log
