# CD Up to Booksim2 Directory
cd ..
cd ..
cd ..

# Call Sweep.sh on all hexmesh outputs
./utils/sweep.sh ./src/booksim ./src/examples/ValidateBrickwall/hexmesh4 >> ./src/examples/ValidateBrickwall/throughput_hexmesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateBrickwall/hexmesh9 >> ./src/examples/ValidateBrickwall/throughput_hexmesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateBrickwall/hexmesh16 >> ./src/examples/ValidateBrickwall/throughput_hexmesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateBrickwall/hexmesh25 >> ./src/examples/ValidateBrickwall/throughput_hexmesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateBrickwall/hexmesh36 >> ./src/examples/ValidateBrickwall/throughput_hexmesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateBrickwall/hexmesh49 >> ./src/examples/ValidateBrickwall/throughput_hexmesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateBrickwall/hexmesh64 >> ./src/examples/ValidateBrickwall/throughput_hexmesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateBrickwall/hexmesh81 >> ./src/examples/ValidateBrickwall/throughput_hexmesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateBrickwall/hexmesh100 >> ./src/examples/ValidateBrickwall/throughput_hexmesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateBrickwall/hexmesh121 >> ./src/examples/ValidateBrickwall/throughput_hexmesh.log

