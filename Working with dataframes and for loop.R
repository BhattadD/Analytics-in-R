#Alternate way of creating the below dataframe
#var1<-c(1,3,5,6,7,9,11,13,15,17,19,21)
#var2<-c(1,1,1,2,2,2,3,3,3,4,4,4)
#var3<-c(1,2,3,4,1,2,3,4,1,2,3,4)
#df<-data.frame(var1,var2,var3)

new_df <- data.frame(var1 = c(seq(from=1, to=5, by=2),6,seq(from=7, to=21, by=2)),
                     var2 = rep(1:4, each=3), var3 = rep(1:4, times=3))
head(new_df)

#######################################################################################################

#Download the "crime" data (Boston crime) from project1 folder.
#Read the data using "read.csv" function. Set "stringsAsfactors=FALSE".
#The dataframe has 17 columns. Add 18th column with "for" loop where 
#the iteration will start from 1 and go on till the end of the dataframe.
#At each iteration assign value 1 to each cell of the 18th variable. 
#Compute the time taken to complete the for loop.

crime_data <- read.csv("~/Desktop/crime.csv", 
                       stringsAsFactors = FALSE)
start_time <- Sys.time()
for(i in 1:length(crime_data$INCIDENT_NUMBER))
{
  crime_data[i,18] = 1
}
end_time <- Sys.time()
print(paste0("Total time Elapsed: ", (end_time - start_time)))


#####################################################################################################

#The "crime" data frame has a column named "OFFENSE_CODE_GROUP". 
#Design a "for" loop to caclulate how many times the word "Medical Assistance" repeats in the "OFFENSE_CODE_GROUP" column. 
#Compute the time taken to complete the for" loop.

count = 0
start_time1 <- Sys.time()
for (i in 1:length(crime_data$OFFENSE_CODE_GROUP)) {
  if(crime_data$OFFENSE_CODE_GROUP[i] == "Medical Assistance")
  {
    count <- count + 1
  }
}
end_time1 <- Sys.time()
print(paste0("Number of occurences of Medical Assistance: ", count))
print(paste0("Elapsed time: ", (end_time1 - start_time1)))


#####################################################################################################

#Write a "for" loop to read all the csv files from the folder.
#Each loop when you read one csv file, rbind the data of that csv file to the file read earlier. 
#Eventually create a single  dataframe that contains the data of all the 3 csv files

files <- dir("~/Desktop/All_files", pattern = ".csv")
df <- NULL
for(i in 1:length(files))
{
  data <- read.table(files[i],header = TRUE, stringsAsFactors = FALSE, sep = ",")
  df <- rbind(df, data)
}