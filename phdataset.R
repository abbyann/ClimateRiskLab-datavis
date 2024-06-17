setwd("C:/Users/aaa3/Downloads/original_ph_data")

## Indian Ocean
# Read in original files
df_indian = read.csv('GLODAPv2.2023_Indian_Ocean.csv')
df_arctic = read.csv('GLODAPv2.2023_Arctic_Ocean.csv')
df_atlantic = read.csv('GLODAPv2.2023_Atlantic_Ocean.csv')
df_pacific = read.csv('GLODAPv2.2023_Pacific_Ocean.csv')

#Add ocean column
df_indian$ocean <- 'Indian'
df_arctic$ocean <- 'Arctic'
df_atlantic$ocean <- 'Atlantic'
df_pacific$ocean <- 'Pacific'

write.csv(df_indian,'clean_Indian_Ocean.csv')
write.csv(df_arctic,'clean_arctic_Ocean.csv')
write.csv(df_atlantic,'clean_atlantic_Ocean.csv')
write.csv(df_pacific,'clean_pacific_Ocean.csv')

setwd("C:/Users/aaa3/Downloads/clean_ph_data")

#Combine all oceans into one datatset
library(dplyr)
library(readr)
df <- list.files(path='C:/Users/aaa3/Downloads/clean_ph_data') %>% 
  lapply(read_csv) %>% 
  bind_rows 
colnames(df)

df = df[c('G2latitude','G2longitude','G2year','G2month','G2day', 'G2hour','G2minute', 'G2station','G2phts25p0','ocean')]
nrow(df)
#Remove all the null ph rows
df = df[df$G2phts25p0!=-9999,]

#Add date column
df$Date<-as.Date(with(df,paste(G2year,G2month,G2day,sep="-")),"%Y-%m-%d")

write.csv(df,'final_merge.csv')