library(dplyr)
library(naniar)
library(visdat)
library(ggplot2)

bank = read.csv('bank-additional-full.csv', sep = ";")
head(bank)
bank[is.na(bank)]
str(bank)

#Replace 'Unknown' with NAs
bank[bank=="unknown"]=NA
colnames(bank)[colSums(is.na(bank)) > 0]

#Visualise NAs
vis_miss(bank)
gg_miss_var(bank)

#Distribution of Clients Based on Job
unique(bank$job)
ggplot(bank, aes(x=job, fill=job)) + geom_bar() +scale_fill_hue(c = 40) +
  labs(title = "Distribution of Clients Based On Job", x='Client Jobs', y="# of Clients")

#Check if There is any relationship between Job and Marital Status = No Relationship Exists
ggplot(bank,aes(bank$job,bank$marital)) + geom_jitter(aes(colour=marital)) + 
  labs(title='Is there any relationship between Job and Marital Status', x='Job', y='Marital Status')

#Check whether is there any association between Job and Education?
ggplot(bank,aes(bank$job,bank$education)) + geom_jitter(aes(colour=education)) +
  labs(title='Is there any association between Job and Education', x='Job', y='Level Of Education')
