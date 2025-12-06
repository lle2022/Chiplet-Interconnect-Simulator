HexaMesh Paper Reproduction Scripts
=========================================

This folder contains the scripts used in an attempt to validate the if the custom Hexagonal Mesh topology created matches with research results found in the paper called: [HexaMesh: Scaling to Hundreds of Chiplets with an Optimized Chiplet Arrangement](https://arxiv.org/abs/2211.13989).

However the HexaMesh paper results appear to line up with simulation using the anynet config files rather than custom topology. But the baseline behaviour of Zero-Load Latency and relative behaviour of saturation throughput can still be used for comparison to see if the custom topology is trending in the correct direction.

To use the scripts navigate to this directory and then call ./replicate.sh

The results from this script will appear in a log file in this directory.

---

Paper Citation: 

P. Iff, M. Besta, M. Cavalcante, T. Fischer, L. Benini and T. Hoefler, "HexaMesh: Scaling to Hundreds of Chiplets with an Optimized Chiplet Arrangement," 2023 60th ACM/IEEE Design Automation Conference (DAC), San Francisco, CA, USA, 2023, pp. 1-6, doi: 10.1109/DAC56929.2023.10248006.
