# CD Up to Booksim2 Directory
cd ..
cd ..
cd ..

# Call Sweep.sh on all hexmesh outputs
./utils/sweep.sh ./src/booksim ./src/examples/ValidateAdaptive/hexmesh4 >> ./src/examples/ValidateAdaptive/throughput_hexmesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateAdaptive/hexmesh9 >> ./src/examples/ValidateAdaptive/throughput_hexmesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateAdaptive/hexmesh16 >> ./src/examples/ValidateAdaptive/throughput_hexmesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateAdaptive/hexmesh25 >> ./src/examples/ValidateAdaptive/throughput_hexmesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateAdaptive/hexmesh36 >> ./src/examples/ValidateAdaptive/throughput_hexmesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateAdaptive/hexmesh49 >> ./src/examples/ValidateAdaptive/throughput_hexmesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateAdaptive/hexmesh64 >> ./src/examples/ValidateAdaptive/throughput_hexmesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateAdaptive/hexmesh81 >> ./src/examples/ValidateAdaptive/throughput_hexmesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateAdaptive/hexmesh100 >> ./src/examples/ValidateAdaptive/throughput_hexmesh.log
./utils/sweep.sh ./src/booksim ./src/examples/ValidateAdaptive/hexmesh121 >> ./src/examples/ValidateAdaptive/throughput_hexmesh.log

