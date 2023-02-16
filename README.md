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
package available in R.

##### References

See the `flowCore::biexponentialTransform` function of the R package for more details.


