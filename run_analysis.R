#Load all required libraries
library(dplyr)

#Load raw data, merge into one dataset,have descriptive variable names
subject_test<-read.table("subject_test.txt",col.names = "subject_id")
subject_train<-read.table("subject_train.txt",col.names = "subject_id")

label_test<-read.table("y_test.txt",col.names="activity_label")
label_train<-read.table("y_train.txt",col.names = "activity_label")

feature_test<-read.table("X_test.txt")
feature_train<-read.table("X_train.txt")
feature_names<-read.table("features.txt")
valid_feature_names<-make.names(feature_names$V2, unique=TRUE, allow_=TRUE)
names(feature_test)<-valid_feature_names
names(feature_train)<-valid_feature_names

test_data<-cbind(subject_test,label_test,feature_test)
train_data<-cbind(subject_train,label_train,feature_train)

data<-rbind(test_data,train_data)
data_id<-as.factor(c(rep("test",2947),rep("train",7352)))
data<-cbind(data,data_id)

#Extract the mean and standard deviation of each measurement 
data1<-data%>%select(c(1,2,564,grep(".+(mean|std)\\.",names(data))))

# Use descriptive acticitiy names to replace numbers of activity label
data1$activity_label<-gsub("1","walking",data1$activity_label)
data1$activity_label<-gsub("2","walking_upstairs",data1$activity_label)
data1$activity_label<-gsub("3","walking_downstairs",data1$activity_label)
data1$activity_label<-gsub("4","sitting",data1$activity_label)
data1$activity_label<-gsub("5","standing",data1$activity_label)
data1$activity_label<-gsub("6","laying",data1$activity_label)

# Create the second data set with the average of each variable for each activity
# and each subject
data1$subject_id<-as.factor(data1$subject_id)
data1$activity_label<-as.factor(data1$activity_label)
factor_data<-group_by(data1,subject_id,activity_label)
vars<-names(factor_data[,4:69])
data2<-summarise_at(factor_data,vars,mean)

#write out the final tidy datasets
write.table(data1,file="step4_dataset.txt",row.names= FALSE)
write.table(data2,file="step5_dataset.txt",row.names = FALSE)

