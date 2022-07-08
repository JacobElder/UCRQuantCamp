
########################

# SCATTERPLOTS

########################

library(ggplot2)

setwd("~/Documents/GitHub/UCRQuantCamp/New/RMarkdown Lectures/")

# read_csv will interpret the file as a tibble
df <- read_csv("ESS10.csv")

# Let's start simple and only use Bulgaria

# Let's look at a scatterplot of happy and  minute

# remove the non-responses

Bulg <- df %>% filter(cntry=="BG") %>%
  mutate(happy = replace(happy, happy > 76, NA),
         netustm = replace(netustm, netustm == 6666 | netustm == 7777 | netustm == 8888 | netustm == 9999, NA)
  )

# Let's look at a scatterplot of happy and  minute

ggplot(Bulg, aes(y = happy, x = netustm)) 

# Wait a sec! There's nothing there. You need to specify "geom_point()" for the data points.

ggplot(Bulg, aes(y = happy, x = netustm)) + geom_point()

# You can further tweak the size and shape of the dots.

ggplot(Bulg, aes(y = happy, x = netustm)) + geom_point(size=5,shape=18)

# Maybe you'd like to take on a best fit OLS line through the data points.

ggplot(Bulg, aes(y = happy, x = netustm)) + geom_point(size=5,shape=18) + geom_smooth(method=lm)

# Then maybe tweak that line a bit...

ggplot(Bulg, aes(y = happy, x = netustm)) + geom_point(size=5,shape=18) + geom_smooth(method=lm,  linetype="dotted",
                                                                                      color="dodgerblue", fill="red")

#
