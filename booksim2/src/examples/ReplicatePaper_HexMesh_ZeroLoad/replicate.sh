# Move this script into the src directory where booksim was built
cd ..
cd ..

# Call Booksim and Append the output of the repro scripts into a log file inside of the target folder
./booksim examples/ReplicatePaper_HexMesh_ZeroLoad/anynet_mesh_config >> examples/ReplicatePaper_HexMesh_ZeroLoad/anynet_mesh_config.log
./booksim examples/ReplicatePaper_HexMesh_ZeroLoad/anynet_mesh_3x3_config >> examples/ReplicatePaper_HexMesh_ZeroLoad/anynet_mesh_config.log
./booksim examples/ReplicatePaper_HexMesh_ZeroLoad/anynet_hexmesh_config >> examples/ReplicatePaper_HexMesh_ZeroLoad/anynet_hexmesh_config.log
./booksim examples/ReplicatePaper_HexMesh_ZeroLoad/anynet_hexmesh_3x3_config >> examples/ReplicatePaper_HexMesh_ZeroLoad/anynet_hexmesh_config.log
