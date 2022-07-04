# Regression by group

This is a Bayesian regression analysis of the relationship between eye movements and aftereffects in the different data sets that we collected in an experiment with two manipulations.

1. The amount of time between movement and feedback (labeled `group 1`, `group 2`, and `group 3`
2. Whether landmarks were shown during the movement that would help give eyes an anchor for the intended movement.

In addition, we did the analysis twice. One with the eye movements as the dependent variable and once with the difference between eye movements and the hand as the dependent variable. We expect the first to be anti-correlated with afteffect and the second to be correlated with aftereffect (Which we see).

The primary goal of this analysis was to compare whether a homogeneous model (that assumed the eyes movements would go directly to the hand in situations where the aftereffect is 0) or a model with an intercept (a standard regression with intercept) better captures the data.

To run this, you need to run `regression_analysis_univariate.ipynb`. It depends on `pymc` and `arviz`, but there are `.yml` files for setting up the enviornment with `conda` or `mamba`. It should also work under `colab`.
