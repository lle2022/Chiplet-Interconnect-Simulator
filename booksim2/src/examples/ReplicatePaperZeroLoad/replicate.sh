# Move this script into the src directory where booksim was built
cd ..
cd ..

# Call Booksim and Append the output of the repro scripts into a log file inside of the target folder
./booksim examples/ReplicatePaperZeroLoad/anynet_config >> examples/ReplicatePaperZeroLoad/anynet_config.log
./booksim examples/ReplicatePaperZeroLoad/anynet_3x3_config >> examples/ReplicatePaperZeroLoad/anynet_config.log
