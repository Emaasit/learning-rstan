# Learning rstan: R Interface to Stan

## What is Stan & RStan?
Stan is a C++ library for Bayesian modeling and inference that primarily uses the No-U-Turn sampler (NUTS) (Hoffman and Gelman 2012) to obtain posterior simulation given user-specified model and data. 

R interface to Stan, which is a C++ package for obtaining Bayesian inference using the No-U-turn sampler, a variant of Hamiltonian Monte Carlo (see http://mc-stan.org/).

The RStan package provides uUser-facing R functions to parse, compile, test, estimate, and analyze Stan models by accessing the header-only Stan library provided by the 'StanHeaders' package. The Stan project develops a probabilistic programming language that implements full Bayesian statistical inference via Markov Chain Monte Carlo, rough Bayesian inference via variational approximation, and (optionally penalized) maximum likelihood estimation via optimization. In all three cases, automatic differentiation is used to quickly and accurately evaluate gradients without burdening the user with the need to derive the partial derivatives.

## Typcial Workflow of RStan
1. Build a model using the Stan modeling language.
2. Translate that model to C++ code (Use the **stanc** function)
3. Compile the C++ code to create a DSO/DLL that can be loaded by R. (Use a C++ compiler)
4. Run the DSO/DLL to sample from the posterior distribtuion (Use the ** stan** function)

5. Diagnose non-convergence of the MCMC chains
6. Conduct inference based on the samples from the posterior distribution