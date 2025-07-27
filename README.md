# Colored Noise [![View Coloured Noise on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/121108-coloured-noise)
Matlab toolbox to generate power-law colored noise signals of any dimensions.

## Description
Create a power-law coloured noise array of equal side-lengths (must be even) in any number of dimensions. Power-law noise here is defined as filtered Gaussian white noise in any number of dimensions, whose total power in each frequency $f$ across all orientations goes as $f^\alpha$, where $\alpha$ is the exponent. So avg. power at each frequency along any orientation goes as $f^{\alpha+1-d}$ in $d$ dimensions, and avg. amplitude along any orientation is its square root. Pink noise has $\alpha=-1$ in all dimensions, and brown noise has $\alpha=-2$.

## Author
Abhranil Das, Center for Perceptual Systems, The University of Texas at Austin.

Bugs/comments/questions/suggestions to abhranil.das@utexas.edu.

If you use this code, please cite: [Camouflage Detection & Signal Discrimination: Theory, Methods & Experiments.](http://dx.doi.org/10.13140/RG.2.2.10585.80487)

## Installation
Within Matlab's Home tab, select Add-Ons > Get Add-Ons > Search for 'Colored Noise' and install.

## Quick Start
After installation, begin with the Getting Started live script with interactive examples, or, at any time, go to Matlab Home tab > Add-Ons > Manage Add-Ons > click the three dots next to this toolbox > View Getting Started Guide

## Documentation
Type:

    doc colored_noise
