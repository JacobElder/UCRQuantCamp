###########

# Set Operations #

###########

vect1 <- c(1,2,3,8,9,10)
vect2 <- c(1,2,3,4,5,6)

# Union
# All elements in one vector OR the other

union(vect1, vect2)

# Intersect
# All elements that overlap in one vector AND the other

intersect(vect1, vect2)

# Complement
# All elements of the full sample that are not in the vector

setdiff(1:10, vect1)
setdiff(1:10, vect2)

# Test is the sets are equivalent

setequal(vect1, vect2) # They're not equivalent
setequal(vect1[1:3],vect2[1:3]) # But they first three elements are

# Does element belong to another vector?

is.element(1:10, vect2)
1:10 %in% vect2 # same, but different expression

is.element(1:10, vect1)
1:10 %in% vect1

# Bonus: For fun, let's see what that looks like using the ggvenn package!

# load Venn diagram package
install.packages("ggvenn")
library("ggvenn")

# use list as input 
AB <-list('A'=vect1,'B'=vect2)

# create customised venn diagram
ggvenn(AB,show_elements=TRUE,stroke_color="Red",
       stroke_linetype="solid")

##############



##############