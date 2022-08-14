library(ggplot2)

setwd("~/Documents/GitHub/UCRQuantCamp/New/RMarkdown Lectures/")

# read_csv will interpret the file as a tibble
df <- read_csv("ESS10.csv")

# Set up data for plotting

df <- df %>%
  mutate(fairelcc = replace(fairelcc, fairelcc > 76, NA), # In country national elections are free and fair
         medcrgv = replace(medcrgv, medcrgv > 76, NA), # In country the media are free to criticise the government
         gvctzpv = replace(gvctzpv, gvctzpv > 76, NA), # The government protects all citizens against poverty
         wpestopc = replace(wpestopc, wpestopc > 76, NA) # In country the will of the people cannot be stopped
  ) %>% 
  mutate(gndr = as_factor(ifelse(gndr==9, NA, gndr)) ) 

#####################

# Histograms and Themes

#####################

p1 <- ggplot(df, aes(x=fairelcc)) + geom_histogram() + theme_minimal()


p2 <- ggplot(df, aes(x=medcrgv, color=gndr, group=gndr)) + geom_histogram(alpha=.1, position="dodge") + theme_classic()


p3 <- ggplot(df, aes(x=gvctzpv, color=gndr, group=gndr)) +
  geom_histogram(aes(y = ..density..),  fill = "white", alpha=.2) +
  geom_density() + theme_void()

#####################

# Grids and Panels

#####################

# ggarrange using ggpubr package

# You can customize the arrangement of plots

library(ggpubr)

ggarrange(ncol=3,nrow=1, p1,p2,p3)

ggarrange(ncol=3,nrow=1, p1,p2,p3, common.legend = T)

p4 <- qplot(fairelcc, data = df)

# facet wrap

# Different panel for each gender

p5 <-
  p4 + facet_wrap( ~ gndr, nrow = 1) + theme(legend.position = "none") +
  ggtitle("facetted plot")


#####################

# Line plots for timeseries

#####################

set.seed(500)
#create dataset with time series
ts <- data.frame(date = as.Date("2022-07-12") - 0:99, # 100 dates up to 2021-01-01
                 sales = runif(100, 0, 1000) + rnorm(100,0,2000) + seq(50,149)^2)

#view first six rows
head(ts)

#create time series plot
p <- ggplot(ts, aes(x=date, y=sales)) +
  geom_line() + theme_linedraw()

#display time series plot
p