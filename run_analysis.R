#read test and train data
test <- read.csv("Dataset/test/X_test.txt", sep="", header=F)

train <- read.csv("Dataset/train/X_train.txt", sep="", header=F)

# add activity and subject data to test and train data
test[,562] <- read.csv("Dataset/test/Y_test.txt", sep="", header=F)
test[,563] <- read.csv("Dataset/test/subject_test.txt", sep="", header=F)

train[,562] <- read.csv("Dataset/train/Y_train.txt", sep="", header=F)
train[,563] <- read.csv("Dataset/train/subject_train.txt", sep="", header=F)

#get activity lables
activity <- read.csv("Dataset/activity_labels.txt", sep="", header=F)

#get feature labels
features <- read.csv("Dataset/features.txt", sep="", header=F)

#tidy feature labels
features[,2] <- gsub("-mean", "Mean", features[,2])
features[,2] <- gsub("-std", "Std", features[,2])
features[,2] <- gsub("[-()]", "", features[,2])

#merge test and train data
mergeData <- rbind(test, train)

# columns with std and mean -- I hate regex!
cols <- c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,
          126,161,162,163,164,165,166,201,202,214,215,227,228,240,241,253,254,
          266,267,268,269,270,271,294,295,345,346,347,348,349,350,373,374,375,
          424,425,426,427,428,429,452,453,454,503,504,513,516,517,526,529,530,
          539,542,543,552,555,556,557,558,559,560,561)

#select features we want
features <- features[cols,] #cols are actually in rows field here!

#add activity, subject to our column selection
cols <- c(cols, 562, 563)

#remove unwanted columns from merged data
mergeData <- mergeData[,cols]

#add features labels to merged data
colnames(mergeData) <- c(features[,2], "Activity", "Subject")

# replace activity numbers with activity labels
counter <- 1
for (label in activity[,2]) {
        mergeData$Activity <- gsub(counter, label, mergeData$Activity)
        counter <- counter + 1
}

#lower-case activity labels; convert activity and subject data to factor
mergeData$Activity <- tolower(mergeData$Activity)
mergeData$Activity <- as.factor(mergeData$Activity)
mergeData$Subject <- as.factor(mergeData$Subject)

#prepare summary data
summaryData <- aggregate(mergeData, by=list(activity = mergeData$Activity, 
                                            subject = mergeData$Subject), mean)
summaryData$Subject <- NULL #why is it creating these?
summaryData$Activity <- NULL

#write csv file
write.csv(summaryData, "summary.csv")