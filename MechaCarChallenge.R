# Deliverable 1

#3 Load the dplyr package
library(dplyr)

#4 Import and read csv as df
mpg_df <- read.csv('MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

#5 Perform linear regression using lm()
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, mpg_df)

#6 Determine p-value and r-sqr value for linear regression model(above)
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, mpg_df))


# Deliverable 2

#2 Import and read the CSV file
coil_table <- read.csv('Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

#3 Create a total_summary df 
total_summary <- summarize(coil_table,Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')
total_summary
#4 Create a lot_summary df  
lot_summary <- coil_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')
lot_summary


# Deliverable 3

#1 RScript using t.test() to determine PSI (all lots)
t.test(coil_table$PSI,mu=1500)

#2 RScripts using t.test() & subset() for each lot
t.test(subset(coil_table, Manufacturing_Lot=="Lot1")$PSI,mu=1500) 
t.test(subset(coil_table, Manufacturing_Lot=="Lot2")$PSI,mu=1500)
t.test(subset(coil_table, Manufacturing_Lot=="Lot3")$PSI,mu=1500)
