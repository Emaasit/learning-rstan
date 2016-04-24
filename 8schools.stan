// First, we specify this model in a file called 8schools.stan as follows

// The first section of the below code specifies the data that is 
// conditioned upon by Bayes Rule

// The second section of the code defines the parameters whose posterior distribution 
// is sought using Bayes Rule

data {
  int<lower=0> J; //  the number of schools, J; constrained to be non-negative
  real y[J]; // vector of estimated treatment effects,y1, . . . , yJ (real = double)
  real<lower=0> sigma[J]; //  the standard errors, σ1, . . . σJ, of effect estimates 

parameters {
  real mu; // the mean of the school effects
  real<lower=0> tau; // the standard deviation of the school effects
  real eta[J];  // the standardized school-level effects
}
transformed parameters {
  real theta[J];  // the unstandardized school-level effects
  for (j in 1:J)
    theta[j] <- mu + tau * eta[j];
}
model {
  eta ~ normal(0, 1);
  y ~ normal(theta, sigma); // the second argument in Stan's normal(.,.) is the standard deviation
}