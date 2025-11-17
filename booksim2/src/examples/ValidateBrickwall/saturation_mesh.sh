# CD Up to Booksim2 Directory
cd ..
cd ..
cd ..

# Call Sweep.sh on all mesh outputs
./utils/sweep.sh ./src/booksim ./src/examples/ValidateBrickwall/mesh4 >> ./src/examples/ValidateBrickwall/throughput_mesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateBrickwall/mesh9 >> ./src/examples/ValidateBrickwall/throughput_mesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateBrickwall/mesh16 >> ./src/examples/ValidateBrickwall/throughput_mesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateBrickwall/mesh25 >> ./src/examples/ValidateBrickwall/throughput_mesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateBrickwall/mesh36 >> ./src/examples/ValidateBrickwall/throughput_mesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateBrickwall/mesh49 >> ./src/examples/ValidateBrickwall/throughput_mesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateBrickwall/mesh64 >> ./src/examples/ValidateBrickwall/throughput_mesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateBrickwall/mesh81 >> ./src/examples/ValidateBrickwall/throughput_mesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateBrickwall/mesh100 >> ./src/examples/ValidateBrickwall/throughput_mesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateBrickwall/mesh121 >> ./src/examples/ValidateBrickwall/throughput_mesh.log

