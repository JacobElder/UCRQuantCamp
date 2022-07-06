# Load dplyr

library("dplyr")

# Load Star Wars dataset

data("starwars")

# Examine the dataset

View(starwars)

# Examine variable names of dataset

colnames(starwars)

# Variables

# name
# Name of the character
# 
# height
# Height (cm)
# 
# mass
# Weight (kg)
# 
# hair_color,skin_color,eye_color
# Hair, skin, and eye colors
# 
# birth_year
# Year born (BBY = Before Battle of Yavin)
# 
# sex
# The biological sex of the character, namely male, female, hermaphroditic, or none (as in the case for Droids).
# 
# gender
# The gender role or gender identity of the character as determined by their personality or the way they were programmed (as in the case for Droids).
# 
# homeworld
# Name of homeworld
# 
# species
# Name of species
# 
# films
# List of films the character appeared in
# 
# vehicles
# List of vehicles the character has piloted
# 
# starships
# List of starships the character has piloted

# Examine dimensions of the data

dim(starwars)

## How many rows and columns are there?

# Examine the head (top 6 rows) and tail (bottom 6 rows) of dataset

head(starwars)
tail(starwars)

## What is in the bottom six and top six rows?

# Examine class of Star Wars dataset

class(starwars)

## What kind of class is it?

# Check class of name

class(starwars$name)

## What kind of class is it?

# Check class of gender

class(starwars$gender)

## Are there missing values? What denotes missing values?

## What kind of class is it? What might be a preferable class?

