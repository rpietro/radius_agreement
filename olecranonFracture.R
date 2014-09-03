#######################################################################################
#olecranonFracture.R is licensed under a Creative Commons Attribution - Non commercial 3.0 Unported License. see full license at the end of this file.
#######################################################################################
#this script follows a combination of the guidelines proposed by Hadley Wickham http://goo.gl/c04kq as well as using the formatR package http://goo.gl/ri6ky
#if this is the first time you are conducting an analysis using this protocol, please watch http://goo.gl/DajIN while following step by step

#link to manuscript

#####################################################################################
#SETTING ENVIRONMENT
#####################################################################################
#Installing packages that will be used in the paper ------------------------------------
lapply(c("sem","ggplot2", "psych", "RCurl", "irr", "nortest", "moments","GPArotation","nFactors",
         "boot","psy","vcd","RSvgDevice"), library, character.only=T)

#uploading data ------------------------------------------------------------------------
#Functions to pull the dara from the internet file 
#options(RCurlOptions = list(capath = system.file("CurlSSL", "cacert.pem", package = "RCurl"), ssl.verifypeer = FALSE))
#see http://goo.gl/mQwxO on how to get this link
#link below won't work until data is entered in the right format
#data <- getURL("https://docs.google.com/spreadsheet/pub?hl=en&hl=en&key=0AoTReYGK49h_dFhMN3FRMUpTb01qbTVJcU9SMGktNXc&single=true&gid=0&output=csv"
#               ,ssl.verifypeer = FALSE)
#olecranon<-read.csv(textConnection(data))

#Functions to pull data directly form you physical computer directory
#Please replace path below with the location of this file on your computer
#olecranon <- read.csv("/Users/apbonilauri/Google Drive/IOT/Cesar Guilherme/OlecranonFracture/OlecranonFracture.csv", header=T)
olecranon <- read.csv("/Users/rpietro/Google Drive/Research Groups/RoR/Applied Projects/Olecranon/OlecranonFracture.csv")
########################################################################################################
#MEXPLORATORY DATA ANALYSIS AND DATA MANAGEMENT
######################################################################################################
#Function to load variables to R's workingspace (You have to run this so R can recognize the name
#of the variable as related to the data set you are working with, e.g. ocelcranon)
# It is important that each time you are going to work with a different data set that you
#unload the previous data with the detach() function, otherwise R might confude datasets)
attach(olecranon)

#This function will show you the characteristic of each variable in the data set indicated
str (olecranon)

#This function will show the first five observatios in the data set. It is useful so you can see
#how your data set is displayed
head(olecranon)

#This function will show the name for each variables in your data set. It is useful to see 
#how your variables were extracted to R's workspace, or to get the exatc name when applying to 
#a different function
names(olecranon)

#Functions to recode varibles, useful to change their properties (e.g. numerical to factor)
#new.Age <-as.factor(car::recode(Age,  "2:4 = '18 to 44'; 5:6 = '45 to 64'; 7:9 = '65 and over'"))
#tabulate(new.Age)
#new.Gender <-as.factor(car::recode(Gender, "1 = 'Male'; 2 = 'Female'"))
#tabulate(new.Gender)

##########################################################################################################################################################
# Table 1. Interobserver agreement measurements of each 
# Classification Systems among Specialists and NonSpecialists groups.
############################################################################################################

#Specialists Colton versus NonSpecialists Colton
#Creating vectors with the aggregated data
olecranon_speccolt <- c(rt1speccoltd1, rt1speccoltd30, rt2speccoltd1, rt2speccoltd30, rt3speccoltd1, rt3speccoltd30, rt4speccoltd1, rt4speccoltd30)
olecranon_nonspeccolt <- c(rt1nonspeccoltd1, rt1nonspeccoltd30, rt2nonspeccoltd1, rt2nonspeccoltd30, rt3nonspeccoltd1, rt3nonspeccoltd30, rt4nonspeccoltd1, rt4nonspeccoltd30)

olecranon_speccoltvsnonspeccolt <- data.frame(as.factor(olecranon_speccolt),
                                              as.factor(olecranon_nonspeccolt))
#Executing agreement nalysis
agreeacolton<-agree(olecranon_speccoltvsnonspeccolt, tolerance=0) #% of Agreement
kappacolton<-kappam.fleiss(olecranon_speccoltvsnonspeccolt) #Kappa-value 

#Agreement Plot (vcd package)
opar<-par(mfrow=c(2,2)) #Setting the plot environment
obj1<-ckappa(olecranon_speccoltvsnonspeccolt) #Calculating agreement table (observedXExpected)
agreementplot(obj1$table, main = "Colton
              ",xlab_rot=0, ylab_rot=0, 
              xlab_just="center", ylab_just="center", xlab="NonSpecialists / N",
              ylab="Specialists / N",  margin=c(5, 0, 4, 0) )
text(4, 2.8, agreeacolton$value)

labels = seq_along(x), adj = NULL,
     pos = NULL, offset = 0.5, vfont = NULL,
     cex = 1, col = NULL, font = NULL, ...)


#Specialists Schatzker versus NonSpecialists Schatzker
olecranon_specschat <- c(rt1specschatd1, rt1specschatd30, rt2specschatd1, rt2specschatd30, rt3specschatd1, rt3specschatd30, rt4specschatd1, rt4specschatd30)
olecranon_nonspecschat <- c(rt1nonspecschatd1, rt1nonspecschatd30, rt2nonspecschatd1, rt2nonspecschatd30, rt3nonspecschatd1, rt3nonspecschatd30, rt4nonspecschatd1, rt4nonspecschatd30)

olecranon_specschatvsnonspecschat <- data.frame(olecranon_specschat, olecranon_nonspecschat)

agree(olecranon_specschatvsnonspecschat, tolerance=0)
kappam.fleiss(olecranon_specschatvsnonspecschat)

#Agreement Plot (vcd package)
obj1<-ckappa(olecranon_specschatvsnonspecschat)
agreementplot(obj1$table, main = "Schatzker
              ",xlab_rot=0, ylab_rot=0, 
              xlab_just="center", ylab_just="center", xlab="NonSpecialists / N",
              ylab="Specialists / N")

#Specialists Mayo versus NonSpecialists Mayo
olecranon_specmay <- c(rt1specmayd1, rt1specmayd30, rt2specmayd1, rt2specmayd30, rt3specmayd1, rt3specmayd30, rt4specmayd1, rt4specmayd30)
olecranon_nonspecmay <- c(rt1nonspecmayd1, rt1nonspecmayd30, rt2nonspecmayd1, rt2nonspecmayd30, rt3nonspecmayd1, rt3nonspecmayd30, rt4nonspecmayd1, rt4nonspecmayd30)

olecranon_specmayvsnonspecmay <- data.frame(olecranon_specmay, olecranon_nonspecmay)

agree(olecranon_specmayvsnonspecmay, tolerance=0)
kappam.fleiss(olecranon_specmayvsnonspecmay)

#Agreement Plot (vcd package)
obj1<-ckappa(olecranon_specmayvsnonspecmay)
agreementplot(obj1$table, main = "Mayo
              ",xlab_rot=0, ylab_rot=0, 
              xlab_just="center", ylab_just="center", xlab="NonSpecialists / N",
              ylab="Specialists / N")

#Specialists AO versus NonSpecialists AO
olecranon_specao <- c(rt1specaod1, rt1specaod30, rt2specaod1, rt2specaod30, rt3specaod1, rt3specaod30, rt4specaod1, rt4specaod30)
olecranon_nonspecao <- c(rt1nonspecaod1, rt1nonspecaod30, rt2nonspecaod1, rt2nonspecaod30, rt3nonspecaod1, rt3nonspecaod30, rt4nonspecaod1, rt4nonspecaod30)

olecranon_specaovsnonspecao <- data.frame(olecranon_specao, olecranon_nonspecao)

agree(olecranon_specaovsnonspecao, tolerance=0)
kappam.fleiss(olecranon_specaovsnonspecao)

#Agreement Plot (vcd package)
obj1<-ckappa(olecranon_specaovsnonspecao)
agreementplot(obj1$table, main = "AO
              ",xlab_rot=0, ylab_rot=0, 
              xlab_just="center", ylab_just="center", xlab="NonSpecialists / N",
              ylab="Specialists / N")

#to obtain a 95%confidence interval of the four classification systems, using the boot package
ckappa.boot <- function(data,x) {ckappa(data[x,])[[2]]}
icsp <- boot(olecranon_speccoltvsnonspeccolt,ckappa.boot,1000)
quantile(icsp$t,c(0.025,0.975)) # two-sided bootstrapped confidence interval of kappa
boot.ci(icsp,type="bca") # adjusted bootstrap percentile (BCa) confidence interval (better)
icnsp <- boot(olecranon_specschatvsnonspecschat,ckappa.boot,1000)
quantile(icnsp$t,c(0.025,0.975)) # two-sided bootstrapped confidence interval of kappa
boot.ci(icnsp,type="bca") # adjusted bootstrap percentile (BCa) confidence interval (better)
icsp <- boot(olecranon_specmayvsnonspecmay,ckappa.boot,1000)
quantile(icsp$t,c(0.025,0.975)) # two-sided bootstrapped confidence interval of kappa
boot.ci(icsp,type="bca") # adjusted bootstrap percentile (BCa) confidence interval (better)
icnsp <- boot(olecranon_specaovsnonspecao,ckappa.boot,1000)
quantile(icnsp$t,c(0.025,0.975)) # two-sided bootstrapped confidence interval of kappa
boot.ci(icnsp,type="bca") # adjusted bootstrap percentile (BCa) confidence interval (better)

########################################################################################################
#Table 2. Intraobserver agreement measurements 
# at Day 1 and Day 30 of Colton Classification
######################################################################################################

#Specialist Colton Day1 versus Specialist Colton Day30
#Aggregating data
olecranon_speccoltd1 <- c(rt1speccoltd1, rt2speccoltd1, rt3speccoltd1, rt4speccoltd1)
olecranon_speccoltd30 <- c(rt1speccoltd30, rt2speccoltd30, rt3speccoltd30, rt4speccoltd30)

olecranon_speccoltday1vsspeccoltday30 <- data.frame(olecranon_speccoltd1, olecranon_speccoltd30)

agreecoltonsp<-agree(olecranon_speccoltday1vsspeccoltday30, tolerance=0)
kappacoltonsp<-kappam.fleiss(olecranon_speccoltday1vsspeccoltday30)

#NonSpecialist Colton Day1 versus NonSpecialist Colton Day30
olecranon_nonspeccoltd1 <- c(rt1nonspeccoltd1, rt2nonspeccoltd1, rt3nonspeccoltd1, rt4nonspeccoltd1)
olecranon_nonspeccoltd30 <- c(rt1nonspeccoltd30, rt2nonspeccoltd30, rt3nonspeccoltd30, rt4nonspeccoltd30)

olecranon_nonspeccoltday1vsnonspeccoltday30 <- data.frame(olecranon_nonspeccoltd1, olecranon_nonspeccoltd30)

agreecoltonnsp<-agree(olecranon_nonspeccoltday1vsnonspeccoltday30, tolerance=0)
kappacoltonnsp<-kappam.fleiss(olecranon_nonspeccoltday1vsnonspeccoltday30)

#to obtain a 95%confidence interval, using the boot package
ckappa.boot <- function(data,x) {ckappa(data[x,])[[2]]}
icsp <- boot(olecranon_speccoltday1vsspeccoltday30,ckappa.boot,1000)
quantile(icsp$t,c(0.025,0.975)) # two-sided bootstrapped confidence interval of kappa
cicoltonsp<-boot.ci(icsp,type="bca") # adjusted bootstrap percentile (BCa) confidence interval (better)
icnsp <- boot(olecranon_nonspeccoltday1vsnonspeccoltday30,ckappa.boot,1000)
quantile(icnsp$t,c(0.025,0.975)) # two-sided bootstrapped confidence interval of kappa
cicoltonnsp<-boot.ci(icnsp,type="bca") # adjusted bootstrap percentile (BCa) confidence interval (better)

########################################################################################################
#Table 3. Intraobserver agreement measurements 
# at Day 1 and Day 30 of Schatzker Classification
######################################################################################################

#Specialist Schatzker Day1 versus Specialist Schatzker Day30
olecranon_specschatd1 <- c(rt1specschatd1, rt2specschatd1, rt3specschatd1, rt4specschatd1)
olecranon_specschatd30 <- c(rt1specschatd30, rt2specschatd30, rt3specschatd30, rt4specschatd30)

olecranon_specschatday1vsspecschatday30 <- data.frame(olecranon_specschatd1, olecranon_specschatd30)

agreeschsp<-agree(olecranon_specschatday1vsspecschatday30, tolerance=0)
kappaschsp<-kappam.fleiss(olecranon_specschatday1vsspecschatday30)

#NonSpecialists Schatzker versus NonSpecialists Schatzker
olecranon_nonspecschatd1 <- c(rt1nonspecschatd1, rt2nonspecschatd1, rt3nonspecschatd1, rt4nonspecschatd1)
olecranon_nonspecschatd30 <- c(rt1nonspecschatd30, rt2nonspecschatd30, rt3nonspecschatd30, rt4nonspecschatd30)

olecranon_nonspecschatd1vsnonspecschatd30 <- data.frame(olecranon_nonspecschatd1, olecranon_nonspecschatd30)

agreeschnsp<-agree(olecranon_nonspecschatd1vsnonspecschatd30, tolerance=0)
kappaschnsp<-kappam.fleiss(olecranon_nonspecschatd1vsnonspecschatd30)

#to obtain a 95%confidence interval, using the boot package
ckappa.boot <- function(data,x) {ckappa(data[x,])[[2]]}
icsp <- boot(olecranon_specschatday1vsspecschatday30,ckappa.boot,1000)
quantile(icsp$t,c(0.025,0.975)) # two-sided bootstrapped confidence interval of kappa
cischsp<-boot.ci(icsp,type="bca") # adjusted bootstrap percentile (BCa) confidence interval (better)
icnsp <- boot(olecranon_nonspecschatd1vsnonspecschatd30,ckappa.boot,1000)
quantile(icnsp$t,c(0.025,0.975)) # two-sided bootstrapped confidence interval of kappa
cischnsp<-boot.ci(icnsp,type="bca") # adjusted bootstrap percentile (BCa) confidence interval (better)

########################################################################################################
#Table 4. Intraobserver agreement measurements 
# at Day 1 and Day 30 of Mayo Classification
######################################################################################################

#Specialist Mayo Day1 versus Specialist Mayo Day30
olecranon_specmayd1 <- c(rt1specmayd1, rt2specmayd1, rt3specmayd1, rt4specmayd1)
olecranon_specmayd30 <- c(rt1specmayd30, rt2specmayd30, rt3specmayd30, rt4specmayd30)

olecranon_specmayd1vsspecmayd30 <- data.frame(olecranon_specmayd1, olecranon_specmayd30)

agreemayosp<-agree(olecranon_specmayd1vsspecmayd30, tolerance=0)
kappamayosp<-kappam.fleiss(olecranon_specmayd1vsspecmayd30)

#NonSpecialist Mayo Day1 versus NonSpecialist Mayo Day30
olecranon_nonspecmayd1 <- c(rt1nonspecmayd1, rt2nonspecmayd1, rt3nonspecmayd1, rt4nonspecmayd1)
olecranon_nonspecmayd30 <- c(rt1nonspecmayd30, rt2nonspecmayd30, rt3nonspecmayd30, rt4nonspecmayd30)

olecranon_nonspecmayd1vsnonspecmayd30 <- data.frame(olecranon_nonspecmayd1, olecranon_nonspecmayd30)

agreemayonsp<-agree(olecranon_nonspecmayd1vsnonspecmayd30, tolerance=0)
kappamayonsp<-kappam.fleiss(olecranon_nonspecmayd1vsnonspecmayd30)

#to obtain a 95%confidence interval, using the boot package
ckappa.boot <- function(data,x) {ckappa(data[x,])[[2]]}
icsp <- boot(olecranon_specmayd1vsspecmayd30,ckappa.boot,1000)
quantile(icsp$t,c(0.025,0.975)) # two-sided bootstrapped confidence interval of kappa
cimayosp<-boot.ci(icsp,type="bca") # adjusted bootstrap percentile (BCa) confidence interval (better)
icnsp <- boot(olecranon_nonspecmayd1vsnonspecmayd30,ckappa.boot,1000)
quantile(icnsp$t,c(0.025,0.975)) # two-sided bootstrapped confidence interval of kappa
cimayonsp<-boot.ci(icnsp,type="bca") # adjusted bootstrap percentile (BCa) confidence interval (better)

########################################################################################################
#Table 5. Intraobserver agreement measurements 
# at Day 1 and Day 30 of AO Classification
######################################################################################################

#Specialists AO Day 1 versus Specialists AO Day 30
olecranon_specaod1 <- c(rt1specaod1, rt2specaod1, rt3specaod1, rt4specaod1)
olecranon_specaod30 <- c(rt1specaod30, rt2specaod30, rt3specaod30, rt4specaod30)

olecranon_specaod1vsspecaod30 <- data.frame(olecranon_specaod1, olecranon_specaod30)

agreeaosp<-agree(olecranon_specaod1vsspecaod30, tolerance=0)
kappaaosp<-kappam.fleiss(olecranon_specaod1vsspecaod30)

#NonSpecialists AO Day 1 versus NonSpecialists AO Day 30
olecranon_nonspecaod1 <- c(rt1nonspecaod1, rt2nonspecaod1, rt3nonspecaod1, rt4nonspecaod1)
olecranon_nonspecaod30 <- c(rt1nonspecaod30, rt2nonspecaod30, rt3nonspecaod30, rt4nonspecaod30)

olecranon_nonspecaod1vsnonspecaod30 <- data.frame(olecranon_nonspecaod1, olecranon_nonspecaod30)

agreeaonsp<-agree(olecranon_nonspecaod1vsnonspecaod30, tolerance=0)
kappaaonsp<-kappam.fleiss(olecranon_nonspecaod1vsnonspecaod30)

#to obtain a 95%confidence interval, using the boot package
ckappa.boot <- function(data,x) {ckappa(data[x,])[[2]]}
icsp <- boot(olecranon_specaod1vsspecaod30,ckappa.boot,1000)
quantile(icsp$t,c(0.025,0.975)) # two-sided bootstrapped confidence interval of kappa
ciaosp<-boot.ci(icsp,type="bca") # adjusted bootstrap percentile (BCa) confidence interval (better)
icnsp <- boot(olecranon_nonspecaod1vsnonspecaod30,ckappa.boot,1000)
quantile(icnsp$t,c(0.025,0.975)) # two-sided bootstrapped confidence interval of kappa
ciaonsp<-boot.ci(icnsp,type="bca") # adjusted bootstrap percentile (BCa) confidence interval (better)

#####################################################################################
#GRAPHICAL OPTION
#####################################################################################
setEPS()
postscript(file = "/Users/rpietro/Desktop/olecranon_comparison_plot.eps")
op<-par(mfrow=c(1,4), mar=c(5,2,4,2)) #Setting environment
## Colton #####################################
#Create vectors with kappa coef values
#Create vectors with % of agreement values
# Define 4 mean vectors
data1 <- c(kappacoltonsp$value, kappacoltonnsp$value)
data1a<- c(agreecoltonsp$value/100,agreecoltonnsp$value/100)
# Calculate range from 0 to max value of tests
#g_range <- range(0, data1, data2, data3, data4)
# draw chart
barplot(data1a, col="white", ylim=c(0,1),
     axes=FALSE, ann=FALSE)
lines(data1, type="o", pch=21, lty=1,lwd=2, col="black")
segments(1, cicoltonsp$bca[4], 1, cicoltonsp$bca[5], lty=1, lwd=2) #Plotting CI
segments(2, cicoltonnsp$bca[4], 2, cicoltonnsp$bca[5], lty=1, lwd=2) #Plotting CI
# Make x axis using tests labels
axis(1, at=1:2, lab=c("Sp","NonSp"))
axis(2, at=c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1))
# Create box around plot
#box()
title(xlab="Colton")
#title(ylab="VLT 1")
#legend(1, 2, c("POCD1","POCD2","POCD3","POCD4"), cex=0.8,
#       col=c("gray","black", "black", "darkgrey"), pch=21:24, lty=1:4)
## Schaktar #####################################
#Create vectors with kappa coef values
#Create vectors with % of agreement values
# Define 4 mean vectors
data1 <- c(kappaschsp$value, kappaschnsp$value)
data1a<- c(agreeschsp$value/100,agreeschnsp$value/100)
# Calculate range from 0 to max value of tests
#g_range <- range(0, data1, data2, data3, data4)
# draw chart
barplot(data1a, col="white", ylim=c(0,1),
        axes=FALSE, ann=FALSE)
lines(data1, type="o", pch=21, lty=1,lwd=2, col="black")
segments(1, cischsp$bca[4], 1, cischsp$bca[5], lty=1, lwd=2) #Plotting CI
segments(2, cischnsp$bca[4], 2, cischnsp$bca[5], lty=1, lwd=2) #Plotting CI
# Make x axis using tests labels
axis(1, at=1:2, lab=c("Sp","NonSp"))
#axis(2, at=c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1))
# Create box around plot
#box()
title(xlab="Schatzker")
#title(ylab="VLT 1")
#legend(1, 2, c("POCD1","POCD2","POCD3","POCD4"), cex=0.8,
#       col=c("gray","black", "black", "darkgrey"), pch=21:24, lty=1:4)
## Colton #####################################
#Create vectors with kappa coef values
#Create vectors with % of agreement values
# Define 4 mean vectors
data1 <- c(kappamayosp$value, kappamayonsp$value)
data1a<- c(agreemayosp$value/100,agreemayonsp$value/100)
# Calculate range from 0 to max value of tests
#g_range <- range(0, data1, data2, data3, data4)
# draw chart
barplot(data1a, col="white", ylim=c(0,1),
        axes=FALSE, ann=FALSE)
lines(data1, type="o", pch=21, lty=1,lwd=2, col="black")
segments(1, cimayosp$bca[4], 1, cimayosp$bca[5], lty=1, lwd=2) #Plotting CI
segments(2, cimayonsp$bca[4], 2, cimayonsp$bca[5], lty=1, lwd=2) #Plotting CI
# Make x axis using tests labels
axis(1, at=1:2, lab=c("Sp","NonSp"))
#axis(2, at=c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1))
# Create box around plot
#box()
title(xlab="Mayo")
#title(ylab="VLT 1")
#legend(1, 2, c("POCD1","POCD2","POCD3","POCD4"), cex=0.8,
#       col=c("gray","black", "black", "darkgrey"), pch=21:24, lty=1:4)
## Colton #####################################
#Create vectors with kappa coef values
#Create vectors with % of agreement values
# Define 4 mean vectors
data1 <- c(kappaaosp$value, kappaaonsp$value)
data1a<- c(agreeaosp$value/100,agreeaonsp$value/100)
# Calculate range from 0 to max value of tests
#g_range <- range(0, data1, data2, data3, data4)
# draw chart
barplot(data1a, col="white", ylim=c(0,1),
        axes=FALSE, ann=FALSE)
lines(data1, type="o", pch=21, lty=1, lwd=2, col="black")
segments(1, ciaosp$bca[4], 1, ciaosp$bca[5], lty=1, lwd=2) #Plotting CI
segments(2, ciaonsp$bca[4], 2, ciaonsp$bca[5], lty=1, lwd=2) #Plotting CI
# Make x axis using tests labels
axis(1, at=1:2, lab=c("Sp","NonSp"))
#axis(2, at=c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1))
# Create box around plot
#box()
title(xlab="AO")
#title(ylab="VLT 1")
legend(0.1, 1, c("Agree (%)","Kappa"), cex=0.8,
       col=c("black","black"), pch=c(22,21), lty=c(0,1))
dev.off()
#######################################################################################
#olecranonFracture.R is licensed under a Creative Commons Attribution - Non commercial 3.0 Unported License. You are free: to Share — to copy, distribute and transmit the work to Remix — to adapt the work, under the following conditions: Attribution — You must attribute the work in the manner specified by the author or licensor (but not in any way that suggests that they endorse you or your use of the work). Noncommercial — You may not use this work for commercial purposes. With the understanding that: Waiver — Any of the above conditions can be waived if you get permission from the copyright holder. Public Domain — Where the work or any of its elements is in the public domain under applicable law, that status is in no way affected by the license. Other Rights — In no way are any of the following rights affected by the license: Your fair dealing or fair use rights, or other applicable copyright exceptions and limitations; The author's moral rights; Rights other persons may have either in the work itself or in how the work is used, such as publicity or privacy rights. Notice — For any reuse or distribution, you must make clear to others the license terms of this work. The best way to do this is with a link to this web page. For more details see http://creativecommons.org/licenses/by-nc/3.0/
#######################################################################################