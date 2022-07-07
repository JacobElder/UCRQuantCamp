############

# LIMITS #

############

# Example 3.1.1.

n = -100:100
SetA = 2 - (1 / n^2)
plot(SetA)

## Can you see the limit? What is it?

# 2

# Example 3.1.2

n = -100:100
SetB = (n^2 + 1)/n
plot(SetB)

## Can you see the limit? What is it?

# Infinity

# Example 3.1.3

n = -100:100
SetC = (-1^n * ( 1 - (1/n) ))
plot(SetC)

# -1

# Example 3.1.1

n = -100:100
SetD = (2*n / (n^2 + 1) )
plot(SetD)

# What is the limit?

# 0

# Example 3.1.2

n = -10000:10000
SetE = n^3 - 100 * n^2
plot(SetE)

# Infinity

# Central Limit Theorem Example

# generate population distribution from exponential distribution, a lot of data
population <- rexp(100000000, rate = 3.2)
iter <- 100000
samplematrix <- matrix(ncol=1, nrow=iter)
for(i in 1:iter){
  # Get samples of 100
  study <- sample(population, 100, replace=F)
  # store in vector/matrix
  samplematrix[i,] <- mean(study)
}
# examine matrix
hist(scale(samplematrix))
# You can see it converges (i.e., has a limit) on Normal(0,1)


