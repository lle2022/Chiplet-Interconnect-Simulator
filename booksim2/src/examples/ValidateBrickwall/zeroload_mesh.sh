# Move this script into the src directory where booksim was built
cd ..
cd ..

# Call Booksim and Append the output of the repro scripts into a log file inside of the target folder
./booksim examples/ValidateBrickwall/mesh4 >> examples/ValidateBrickwall/zero_load_mesh.log
./booksim examples/ValidateBrickwall/mesh9 >> examples/ValidateBrickwall/zero_load_mesh.log
./booksim examples/ValidateBrickwall/mesh16 >> examples/ValidateBrickwall/zero_load_mesh.log
./booksim examples/ValidateBrickwall/mesh25 >> examples/ValidateBrickwall/zero_load_mesh.log
./booksim examples/ValidateBrickwall/mesh36 >> examples/ValidateBrickwall/zero_load_mesh.log
./booksim examples/ValidateBrickwall/mesh49 >> examples/ValidateBrickwall/zero_load_mesh.log
./booksim examples/ValidateBrickwall/mesh64 >> examples/ValidateBrickwall/zero_load_mesh.log
./booksim examples/ValidateBrickwall/mesh81 >> examples/ValidateBrickwall/zero_load_mesh.log
./booksim examples/ValidateBrickwall/mesh100 >> examples/ValidateBrickwall/zero_load_mesh.log
./booksim examples/ValidateBrickwall/mesh121 >> examples/ValidateBrickwall/zero_load_mesh.log
