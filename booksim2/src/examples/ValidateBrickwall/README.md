Topology Comparison Scripts
=========================================

This folder contains the scripts used to get results for regular arrangements of both the Mesh and the  Hexagonal Mesh topologies from 4 chiplets to 121 chiplets. These results are using a greedy deterministic minimal algorithm.

To obtain information on Zero-Load Latency:

	For Hexagonal Mesh, navigate to this folder and call ./zeroload_hexmesh.sh

	For Regular Mesh, navigate to this folder and call ./zeroload_mesh.sh


To obtain information on saturation throughput:

	For Hexagonal Mesh, navigate to this folder and call ./saturation_hexmesh.sh

	For Regular Mesh, navigate to this folder and call ./saturation_mesh.sh

The zero load information is quick to obtain, but saturation information can take upwards of an hour to get.

The information will be stored in .log files within this directory
