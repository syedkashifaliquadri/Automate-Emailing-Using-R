# Library For Sending Emails
library(mailR)


#Read .csv File
mail_list <- read.csv2("users.csv",as.is=TRUE,na.strings = c("",NA),sep=",")



# Send Email To n number of Rows That Is Present In .csv File
for (recipient in 1:nrow(mail_list)) {
  
  
  #Conditions For Accepting Null CC And BCC
  if(is.na(as.character(mail_list[recipient,]$CC))){
    cc=NULL
  }
  else{
    cc=as.character(mail_list[recipient,]$CC)
  }
  if(is.na(as.character(mail_list[recipient,]$CC2))){
    cc2=NULL
  }
  else{
    cc2=as.character(mail_list[recipient,]$CC2)
  }
  if(is.na(as.character(mail_list[recipient,]$CC3))){
    cc3=NULL
  }
  else{
    cc3=as.character(mail_list[recipient,]$CC3)
  }
  if(is.na(as.character(mail_list[recipient,]$BCC))){
    bcc=NULL
  }
  else{
    bcc=as.character(mail_list[recipient,]$BCC)
  }
  if(is.na(as.character(mail_list[recipient,]$BCC2))){
    bcc2=NULL
  }
  else{
    bcc2=as.character(mail_list[recipient,]$BCC2)
  }
  if(is.na(as.character(mail_list[recipient,]$BCC3))){
    bcc3=NULL
  }
  else{
    bcc3=as.character(mail_list[recipient,]$BCC3)
  }
  
  # Function send.mail Is Used To Send Emails Using SMTP Protocol
  send.mail(from="email@gmail.com",
            to=as.character(mail_list[recipient,]$TO),
            cc=c(cc,cc2,cc3),
            bcc=c(bcc,bcc2,bcc3),
            subject=as.character(mail_list[recipient,]$SUBJECT),
            body=as.character(mail_list[recipient,]$BODY),
            html=TRUE,
            authenticate=TRUE,
            smtp = list(host.name = "smtp.gmail.com", port = 465 ,
                        user.name = "enteryour_email@gmail.com", passwd = "enteryour_pass", ssl = TRUE),
            encoding = "utf-8",send=TRUE)
  
  #Time Stamp
  emailTime=Sys.time() #built-in function of time
  convertingTimeInToChar=as.character(emailTime) #conversion from double to character
  write.table(c(mail_list[recipient,],convertingTimeInToChar), "DetailsWithTime.csv", sep = ",", col.names = FALSE, row.names = FALSE, append=TRUE) #open file and append details in .csv
  
  print(mail_list[recipient,])
  print(convertingTimeInToChar)
}
