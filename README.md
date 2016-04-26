# Learning rstan: R Interface to Stan

## What is Stan & RStan?
Stan is a C++ library for Bayesian modeling and inference that primarily uses the No-U-Turn sampler (NUTS) (Hoffman and Gelman 2012) to obtain posterior simulation given user-specified model and data.(see http://mc-stan.org/). Other inference methods include Variational inference (approximate Bayesian inference at much larger scales than is possible with Monte Carlo methods).

The RStan package provides user-facing R functions to parse, compile, test, estimate, and analyze Stan models by accessing the header-only Stan library provided by the 'StanHeaders' package. The Stan project develops a probabilistic programming language that implements full Bayesian statistical inference via Markov Chain Monte Carlo, rough Bayesian inference via variational approximation, and (optionally penalized) maximum likelihood estimation via optimization. In all three cases, automatic differentiation is used to quickly and accurately evaluate gradients without burdening the user with the need to derive the partial derivatives.

## Typical Workflow of RStan
1. Build a model using the Stan modeling language.
2. Translate that model from Stan code to C++ code
3. Compile the C++ code to create a Dynamic Shared Object (DSO/DLL) that can be loaded by R.
4. Run the DSO/DLL to sample from the posterior distribtuion 

(The ** stan** function wraps steps 2, 3, & 4)

5. Diagnose non-convergence of the MCMC chains
6. Conduct inference based on the samples from the posterior distribution

## Preparing the data
Stan accepts data as a list. It's encouraged to read in the data from a file rather than to directly enter the numbers in the R script.

RStan will only read variables declared in the data block of the Stan model. Incase your data contains more variables not declared in the data block, Stan function will ignore them.  

An element in the input list should be numeric data. For example *factor* type in R is not supported as data element for RStan. Factors must be converted to integers using **as.integer()**.

The dimension of an element in the data list should match the declaration in the data block of the Stan model.

Stan cannot handle missing values in data automatically. So no element of the data can contain **NA**.

## Sample from the posterior distribution
Use the **stan** function to wrap 3 operations together. The primary arguments are:
1. data
2. init
3. chains
4. iter
5. warmup

## Execution of a Stan Program
1. Reading and transforming the data. The data is read into the model
2. Initialization the algorithm
3. Sampling by variational inference. It ouputs samples from the approximate posterior once
the algorithm has decided that it has converged
