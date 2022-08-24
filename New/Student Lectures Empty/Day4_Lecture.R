


###########################

# Redundant code can be automated: Custom functions

###########################

# We want to convert Farenheit to Celsius
# Farenheit to Celsius is (F-32)*(5/9)

# What is 72F in C?

(72-32)*(5/9)

# What is 50F in C?

(50-32)*(5/9)

# What is 32F in C?

(32-32)*(5/9)

# What is 102F in C?

(102-32)*(5/9)

# What is 20F in C?

(20-32)*(5/9)

# We have to re-write or copy and paste that code each time. Is there a more efficient way?

# nameofcustomfunction <- function(input){
#   output <- dothiswithinput(input)
#   return(output)
# }

# Explicitly save object and return object
FtoC <- function(temp_F){
  temp_C <- (temp_F - 32) * (5/9)
  return(temp_C)
}

# Implicitly return last thing that was printed
FtoC <- function(temp_F){ (temp_F - 32) * (5/9) }

# What is 72F in C?

FtoC(72)

# What is 50F in C?

FtoC(50)

# What is 32F in C?

FtoC(32)

# What is 102F in C?

FtoC(102)

# What is 20F in C?

FtoC(20)

# Ultimately, you see that less code is needed here.

# Let's try an example with two inputs:

# Exercise: Concatenating two strings with paste0 produces: paste0('a','b')... 'ab'. Write a function called 
# fence that takes two parameters called original and wrapper and returns a new string that has the wrapper 
# character at the beginning and end of the original. A call to your function as fence('word','*') should
# produce '*word*'

Fence <- function(original, wrapper){
  paste0(wrapper, original, wrapper) # original and wrapper are in "local environment"
}

Fence <- function(inside, outside){
  paste0(outside, inside, outside)
}

# Test it by wrapping "pizza" with "+"

Fence("pizza","+")

# What happens if you switch the order though?

Fence("+", "pizza")

# Order of inputs matters! If you order the inputs in the order of the arguments, it will make no difference.
# But if you order the inputs in a different order than the arguments in how the function is specified, you must
# arguments explicit. For example...

Fence(wrapper="+",original="pizza")

# We can also add defaults for the functions. For example, maybe if someone doesn't specify a wrapper, we assume
# they just want to print the word without a wrapper.

Fence <- function(inside, outside=""){
  paste0(outside, inside, outside)
}

# Try it out on "pizza" as the input word without a wrapper using the variant of the function with an empty default
# for the wrapper

Fence("pizza","+")
Fence("pizza")

# You may have noticed that in the first example for converting temperatures, we used a return argument. While
# for this example, we did not. return is not required per se. If you did not call return, the custom function
# will return the last output of the function. But if you want to be explicit or call something that is not the last
# output, you should use return().

data("mtcars")

# We want to estimate the average miles per gallon of each car

mean(mtcars$mpg)

# Now, we want to compute the mean miles per gallon of the car weighted by multiple different variables

# sum( x * weight ) / sum(weight)

# Weighted by weight

sum( mtcars$mpg * mtcars$wt ) / sum(mtcars$wt)

# Weighted by 1/4 mile time

sum( mtcars$mpg * mtcars$qsec ) / sum(mtcars$qsec)

# Weighted by gross horsepower

sum( mtcars$mpg * mtcars$hp ) / sum(mtcars$hp)

# Weighted by number of carburetors

sum( mtcars$mpg * mtcars$carb ) / sum(mtcars$carb)

# However, doing this requires more code than is necessary.

# Weighted mean custom function

wm<- function(var1,var2) {
  sum(var1* var2)/ sum(var2)
}

# Apply the same process of weighted the miles per gallon average by weight, mile time, horsepower, carburetors

wm(mtcars$mpg, mtcars$wt)
wm(mtcars$mpg, mtcars$qsec)
wm(mtcars$mpg, mtcars$hp)
wm(mtcars$mpg, mtcars$carb)

# Another example...

# Inputs

hyp <- function(side_a, side_b){
  h <- sqrt(side_a^2 + side_b^2)
  return(h)
}

## Enter 3 then 5

hyp(3,5)

# You'll see that h is defined within the function. Let's try and print it outside the function.

print(h)

# Woah, there's an error. Why is that? Variables defined a function are what are called "local variables"
# that are only available and used in the local environment within the function but not for usage outside the function
# in the global environment.

# Default, null statement
# What to do if you didn't give an argument for one thing, use a null statement

hyp <- function(side_a, side_b = NULL){
  a <- side_a^2
  b <- ifelse(is.null(side_b), a, side_b^2)
  h <- sqrt(a+b)
  return(h)
}

# Control program flow with `if` and `else` statements

x <- 1
if(x == 0){
  paste(x, "is exactly 0")
}else if (x < 0 ){
  paste(x, "is negative")
}else if (x > 0){
  paste(x, "is positive")
}

# Write "wrapper functions" to make your life easier

mean_na <- function(x) mean(x, na.rm=T)
sd_na <- function(x) sd(x, na.rm=T)
se_na <- function(x) {
  x <- purrr::discard(x, is.na)
  sd(x) / sqrt(length(x))
}

# Use lists to return multiple outputs

summary_stats_na <- function(x) {
  # Function call previously defined custom functions
  list(mean = mean_na(x), sd = sd_na(x), se = se_na(x) )
}
data <- c(4,6,9,12,5,6,NA)
summarized_list <- summary_stats_na(data)
summarized_list
summarized_list$mean
summarized_list$sd
summarized_list$se

# Iteration

for(i in c(1, 2, 3, 4, 5)){
  print(paste("This is loop iteration", i))
}

for(i in c("cats","dogs","fish")){
  print(i)
}

# For loops

days_of_the_week <- c("Mon","Tues","Wed","Thurs","Fri","Sat","Sun")
for(i in days_of_the_week){
  print(paste("Today is",i))
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

# Use for loops to examine the weighted mean of mpg using cyl, disp, hp, drat, wt, and qsec as weights
# Let's also compare the weighted means to the overall mean

weights <- c("cyl","disp","hp","drat","wt","qsec")
wm_output <- vector()
for(p in weights){
  wm_output[p] <- wm(mtcars['mpg'], mtcars[p])
}
wm_output
wm_output - mean(mtcars[,'mpg'])

# While statement

filler <- 0
while(filler < 100000000){
  filler <- filler + 1
}
