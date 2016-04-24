// The variable N is declared in the data block of 
// the program as being an integer greater than or equal to zero. 
// The variable y is declared as an integer array 
// of size N with entries between 0 and 1 inclusive.


data {
  int<lower = 0> N;                   // N >= 0
  int<lower = 0, upper = 1> y[N];    // y[n] in {0, 1}
}

parameters {
  real<lower = 0, upper = 1> theta;  // theta in [0, 1]
}

model {
  theta ~ beta(1, 1);               // prior
  y ~ bernoulli(theta);             // likelihood
}