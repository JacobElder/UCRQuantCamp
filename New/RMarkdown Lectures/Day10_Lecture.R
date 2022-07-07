#############

# SPECIAL DISTRIBUTIONS

#############

# Binomial Number Generation

hist(rbinom(10000,20,prob=.7))
hist(rbinom(10000,20,prob=.5))
hist(rbinom(10000,20,prob=.15))

# Poisson Number Generation

hist(rpois(10000,lambda=1))
hist(rpois(10000,lambda=1.5))
hist(rpois(10000,lambda=2))

# Normal Number Generation

hist(rnorm(10000,0,1))
hist(rnorm(10000,3,10))
hist(rnorm(10000,10,50))
