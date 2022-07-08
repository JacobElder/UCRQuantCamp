###########################

# Custom functions

###########################

# Inputs

hyp <- function(side_a, side_b) {
  a <- side_a^2
  b <- side_b^2
  h <- sqrt(a + b)
  return(h)
}
hyp(3, 4)
hyp(9, 12)

# Default, null statement

hyp <- function(side_a, side_b = NULL) {
  a <- side_a^2
  b <- ifelse(is.null(side_b), a, side_b^2)
  h <- sqrt(a + b)
  return(h)
}
hyp(9, 9)
hyp(9)

# Control program flow with `if` and `else` statements

x <- 1
if (x == 0) {
  paste(x, "is exactly 0")
} else if (x < 0) {
  paste(x, "is negative")
} else {
  paste(x, "is positive")
} 

# Control program flow with `if` and `else` statements

x <- -1
if (x == 0) {
  paste(x, "is exactly 0")
} else if (x < 0) {
  paste(x, "is negative")
} else {
  paste(x, "is positive")
} 

# Write "wrapper functions" to make your life easier

mean_na <- function(x) mean(x, na.rm = T)
sd_na <- function(x) sd(x, na.rm = T)
se_na <- function(x) {
  x <- discard(x, is.na) #discard is like "filter if not" for vectors
  sd(x)/sqrt(length(x))
}

# Use lists to return multiple outputs

summary_stats_na <- function(x) {
  # Functions can call previously defined functions
  list(mean = mean_na(x), sd = sd_na(x), se = se_na(x))
}
data <- c(4, 6, 9, 12, 5, 6, NA)
summary_stats_na(data)

# Iteration

for (i in c(1, 2, 3, 4, 5)) {
  # "i" will take on each value of the vector 1:5
  print(paste("This is loop iteration", i))
}

# For loops

days_of_the_week <- c("Mon", "Tues", "Wed", "Thur", "Fri", "Sat", "Sun")

for (i in days_of_the_week) {
  print(paste("Today is", i))
}

# Apply function

## Sum over rows

apply(mtcars, 1, sum)

## Mean over columns

apply(mtcars, 2, mean)

# There are other apply functions...

# apply	apply(x, MARGIN, FUN)	Apply a function to the rows or columns or both	Data frame or matrix	vector, list, array
# lapply	lapply(X, FUN)	Apply a function to all the elements of the input	List, vector or data frame	list
# sapply	sapply(X, FUN)	Apply a function to all the elements of the input	List, vector or data frame	vector or matrix

# Use for loops to run a series of analyses

preds <- c("cyl", "disp", "hp", "drat", "wt", "qsec")
cor_output <- vector()
for (p in preds) {
  cor_output[p] <- cor(mtcars['mpg'], mtcars[p])
}
cor_output

preds <- c("cyl", "disp", "hp", "drat", "wt", "qsec")
for (p in preds) {
  f <- as.formula(paste("mpg ~ ", p))
  res <- lm(f, data = mtcars)
  print(p)
  print(summary(res))
}

# While statement

filler <- 0
while(filler < 100000000){
  filler <- filler + 1
}
