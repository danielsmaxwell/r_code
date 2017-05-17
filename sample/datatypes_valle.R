rm(list=ls(all=TRUE))
setwd('U:\\uf\\ufii r coding hours\\code 2017 04 12')
z=read.csv('Diameter.csv')
head(z)
boxplot(dia83~species,data=z)

str(z)

#can I simply replace a string by another string? Not for factors
z[1,'species']='Denis'
z[1,'species']='Sa'

#you'd think that forcing a string into numeric would through an error. It does not for factors!
#each factor level has an underlying number which is not displayed. 
#R just displays the corresponding label
z$species.num=as.numeric(z$species)
unique(z[,c('species','species.num')])

sum(z$species) #this doesn't work despite the underlying numbers
sum(z$species=='Dp')
sum(z$species==1)

#how do I convert back to character?
z$species=as.character(z$species)
#-----------------------------------------------------
#why are factors important? R has different behaviors for different types of variables

#different graphics
plot(dia83~treat,data=z) #scatter plot

z$treat1=as.factor(z$treat)
head(z) #it looks like exactly the same thing
str(z)
unique(z[,c('treat','treat1')])
plot(dia83~treat1,data=z) #boxplot

#different analysis
lm(dia83~treat,data=z) #Regression
#mean treat1 = 267.6+10.8*1
#mean treat2 = 267.6+10.8*2
#mean treat3 = 267.6+10.8*3

lm(dia83~treat1,data=z) #ANOVA 
#mean treat1 = 260.24
#mean treat2 = 260.24+64.29
#mean treat3 = 260.24+20.05
aggregate(dia83~treat1,data=z,mean)
#-----------------------------------------------------
#how can I avoid R from automatically converting strings to factors?
z=read.csv('Diameter.csv',as.is=T)
str(z)

#-----------------------------------------------------
#logical variables
z$my.query=!is.na(z$dia83) & z$dia83>200
head(z)
str(z)

#logical variables also have labels and underlying numbers
z$my.query1=as.numeric(z$my.query)
unique(z[,c('my.query','my.query1')])

#why is this useful to know?

#how many satisfy my query?
sum(z$my.query)

#what is the proportion of observations that satisfy my query?
sum(z$my.query)/nrow(z)
mean(z$my.query)
#------------------------------------------
#matrices vs data.frames
z1=data.matrix(z)
str(z1)
z1$dia83 #now we cannot select certain columns using the dollar sign
z1[,'dia83'] #but this still works

#notice that species was set to missing. Let's plug it in
head(z1)
z1[,'species']=z$species
head(z1)

#matrices can only have one type of data (i.e., it cannot have strings and numeric together)

#how do matrices arise? cbind and rbind
z2=cbind(z$id,z$species,rnorm(nrow(z1)))
class(z2)
#--------------------------------------------------
#lists

mydata=list()
mydata[[1]]=z
mydata[[2]]=z[1:10,]
mydata[[3]]='Rmeetup'

length(mydata)
names(mydata)=c('tab1','tab2','tab3')
head(mydata$tab1); dim(mydata$tab1)
mydata$tab2; dim(mydata$tab2)
mydata$tab3

#multiple levels of nesting
mydata$tab1$species
mydata$tab2[,c('species','dia83')]

#why is this useful? A lot of R output is in a similar format
res=lm(dia85~dia84,data=z)
str(res)
res$coefficients
res$coefficients[1]
res$terms #you can even have lists within lists. Here is an example
res$terms[[1]]
res$terms[[2]]

#how do I get the pvalue?
res1=summary(res); res1
res1$coefficients
res1$coefficients[,4]

