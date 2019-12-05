rm(list=ls())
require("lubridate")

args = (commandArgs(trailingOnly=TRUE))
if(length(args) == 1){
  a = as.character(args[1])
} else {
  cat('usage: Rscript group3.R <a> <b> \n', file=stderr())
  stop()
}
dat<-read.csv(paste("./data/",a,".csv",sep=""),header=F)
site<-levels(dat[,1])
date1<-as.Date(as.character(dat[,2]),"%Y%m%d")
day1<-yday(date1)




temp.intercept<-vector()
temp.slope<-vector()
#prcp.intercept<-vector()
#prcp.slope<-vector()
j=1
#k=1
for(i in 1:length(site)){
  y1<-dat[which(dat[,1]==site[i] & dat[,3]=="TMAX"),4]/10
  x1<-day1[which(dat[,1]==site[i] & dat[,3]=="TMAX")]
  if(all(is.na(y1))==0 & all(is.na(x1))==0){
    lm1<-lm(y1~x1)
    temp.intercept[j]<-lm1$coefficients[1]
    temp.slope[j]<-lm1$coefficients[2]
    j=j+1
  }
  #y2<-dat[which(dat[,1]==site[i] & dat[,3]=="PRCP"),4]/10
  #x2<-day1[which(dat[,1]==site[i] & dat[,3]=="PRCP")]
  #if(all(is.na(y2))==0 & all(is.na(x2))==0){
  #  lm2<-lm(y2~x2)
  #  prcp.intercept[k]<-lm2$coefficients[1]
  #  prcp.slope[k]<-lm2$coefficients[2]
  #  k=k+1
  #}
}
df.temp<-cbind(mean(temp.intercept,na.rm=T),mean(temp.slope,na.rm=T))
#df.prcp<-cbind(mean(prcp.intercept,na.rm=T),mean(prcp.slope,na.rm=T))
write.csv(df.temp,file=paste("./tem",a,".csv",sep=""))