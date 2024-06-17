setwd("C:/Users/aaa3/Documents/CRL_Data/Glacier_Retreat/DOI-WGMS-FoG-2023-09/data")

# Read in change.csv file
df_change = read.csv('change.csv')

# Subset relevant columns
df_change_new <- df_change[c('POLITICAL_UNIT', 'WGMS_ID', 'YEAR', 'SURVEY_DATE','THICKNESS_CHG', 'THICKNESS_CHG_UNC', 'VOLUME_CHANGE', 'VOLUME_CHANGE_UNC'
)]

# Write new csv file
write.csv(df_change_new,'final_change.csv')