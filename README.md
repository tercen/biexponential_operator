# Biexponential

##### Description

`biexponential_transform` operator performs a bi-exponential transformation of
the data.

##### Usage

Input projection|.
---|---
`row`   | represents the variables (e.g. channels, markers, genes)
`col`   | represents the observations (e.g. cells, samples, indviduals) 
`y-axis`| measurement value


Output relations|.
---|---
`value`| numeric, per cell

##### Details

The operator is the `biexponential_transformation` function in from the flowCore
package available in R. This is an over-parameterized inverse of the hyperbolic sine. 

The function to be inverted takes the form biexp(x) = a*exp(b*(x-w))-c*exp(-d*(x-w))+f with default parameters selected to correspond to the hyperbolic sine.

##### References

See the `flowCore::biexponentialTransform` function of the R package for more details.


