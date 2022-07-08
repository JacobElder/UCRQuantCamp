############################

# Data frames

############################

# Set working directory

setwd("~/Documents/GitHub/UCRQuantCamp/New/RMarkdown Lectures/")

# Load dplyr

library("dplyr")

# Load Star Wars dataset

data("mtcars")

# Examine the dataset

View(mtcars)

# Examine variable names of dataset

colnames(mtcars)

# Examine dimensions of the data

dim(mtcars)

## How many rows and columns are there?

# Examine the head (top 6 rows) and tail (bottom 6 rows) of dataset

head(mtcars)
tail(mtcars)

## What is in the bottom six and top six rows?

# Examine class of Star Wars dataset

class(mtcars)

## What kind of class is the dataframe?

# You can examine variables by using the dollar sign $

mtcars$mpg
mtcars$cyl
mtcars$disp

# Check class of name

class(mtcars$mpg)

## What kind of class is it?



#######################

# Indexing

#######################

# Index first row

mtcars[1,]

# Index second row

mtcars[2,]

# Index 3rd through 5th rows

mtcars[3:5,]

# Index 4th column

mtcars[,4]

## You can index without the comma but it will be interpreted as a data.frame, in contrast to above being a vector.

mtcars[4]

# Index 2 and 5th column

mtcars[,c(2,5)]

# Index column for "cyl"

mtcars[,"cyl"]

# Index column for "cyl" and "wt"

mtcars[,c("cyl","wt")]

# Index column for "cyl" and "wt" and move "wt" before "cyl"

mtcars[,c("wt","cyl")]

# Index 3 row and 5th column

mtcars[3,5]

# Index 2nd, 3rd, and 5th column and 3rd through 6th rows

mtcars[3:6, c(2,3,5)]

# Subset rows of wt that are less than 3

mtcars[mtcars$wt < 3,]

# Subset rows where vs is 1

mtcars[mtcars$vs == 3,]

# Subset rows where carb is NOT 4

mtcars[mtcars$carb != 4,]

#######################

# Writing

#######################

# Write csv to your working directory

write.csv(mtcars, "mtcars.csv", row.names = F)

# You can save you workspace as well

save.image("mtcars_space.RData")

# Clear workspace

rm()

# Load workspace

load("mtcars_space.RData")

#############################

# Reading data

#############################

# https://ess-search.nsd.no/en/study/172ac431-2a06-41df-9dab-c1fd8f3877e7

# Base read csv
df <- read.csv("ESS10.csv",header = T)

# readr's read_csv much faster
df <- readr::read_csv("ESS10.csv")

# fread 2.5x faster than read_csv
df <- data.table::fread("ESS10.csv")

# I would recommend fread-- You won't notice the difference on small files but for large files like you might see
# in political science and public policy, it can save you a lot of waiting.

# But readr has some very useful new functionality like if multiple files of same columns are in same directory
# it can read them all into one file.

# FUNCTIONS FOR READING FILES

# read.table, read.csv, for reading tabular data
# readLines, for reading lines of a text file
# source, for reading in R code files (inverse of dump)
# dget, for reading in R code files (inverse of dput)
# load, for reading in saved workspaces
# unserialize, for reading single R objects in binary form

# FUNCTIONS FOR WRITING FILES

# write.table, for writing tabular data to text files (i.e. CSV) or connections
# writeLines, for writing character data line-by-line to a file or connection
# dump, for dumping a textual representation of multiple R objects
# dput, for outputting a textual representation of an R object
# save, for saving an arbitrary number of R objects in binary format (possibly compressed) to a file.
# serialize, for converting an R object into a binary format for outputting to a connection (or file).

# What is the row number for this dataset?

nrow(df)

# What is the column number for this dataset?

ncol(df)

# What are the dimensions for this dataset? Use the function for this.

dim(df)

# What are the variable names for the dataset?

colnames(df)
