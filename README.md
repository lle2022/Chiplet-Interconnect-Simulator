# Chiplet-Interconnect-Simulator
Boston University EC601 Fall 2025, A1 Section
Linglong Le

This repository contains modifications made to the [Booksim2](https://github.com/booksim/booksim2/) repository as part of a project to support Hexagonal Topology Chiplet Interconnect Simulation.

A custom hexmesh topology class has been implemented in this code, converting the hexagonal mesh topology into a standard cartesian representation, using row-offsets. This allows the topology to stay within cartesion coordinates, while maintaining information on the difference in connections from the conversion to cartesian coordinate systems.

For this custom topology, two routing algorithms have been implemented. A greedy determistic minimal algorithm, and a minimally adaptive algorithm

The greedy determistic algorithm takes the difference between the current and target node, and uses that information to deterministically select which path to take to reach the target.

The minimally adaptive algorithm takes an approximation of how many more hops would be required after taking a path, and uses that to determine valid directions. Then from the set of valid directions it selects the channel with the least congestion, based on credit channel information.

