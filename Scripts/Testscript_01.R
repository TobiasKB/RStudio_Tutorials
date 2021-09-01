#----Libraries----
library(TeachingDemos)
library(ALL)
library(multtest)
library(affy)
library(here)
#----loading data----
data(ALL)
data(golub)

#----example plots----
plot (dice(12,1))
example(boxplot)


#----example calculations----
2+3
exp(1)
sum(1:5)
prod(1:5)

gene1 <- c (1.00, 1.50,1.25)
gene1
sum(gene1)
mean(gene1)
sum(gene1)/3
#standard deviation
sd(gene1)
sqrt(sum((gene1-mean(gene1))^2)/2)

#----generating sequences----
1:5
seq(0,1,0.1)
#Designed to indicate an experimental condition of a measurement
#or the group to which a patient belongs. When, for instance, 
#for each of three experimental conditions there are measurements 
#from five patients, the corresponding factor can be generated as follows:
factor <- gl(3,5)
factor
# The three conditions are often called “levels” of a factor. Each of these
# levels has five repeats corresponding to the number of observations (patients)
# within each level (type of disease). We shall further illustrate the idea of a
# factor soon because it is very useful for purposes of visualization.

#----Constructing a data matrix ----
gene2 <- c(1.35,1.55,1.00)
gene3 <- c(-1.10,-1.50,-1.25)
gene4 <- c(-1.20,-1.30,-1.00)

rowcolnames <- list(c("gene1","gene2","gene3","gene4"),
                    c("Eric","Peter","Anna"))
gendat <- matrix(c(gene1,gene2,gene3,gene4),nrow = 4, ncol = 3, byrow = TRUE, dimnames = rowcolnames)
#nrow number of rows
#ncol number of columns
#dimnames attaches names to columns
#[i,j] = [rows, columns]
gendat
gendat[1,2]
gendat[1,]
gendat[,1]

#write to file

write.table(gendat,here("Ressources","gendat.Rdata"))
gendatread <- read.table(here("Ressources","gendat.Rdata"))
gendatread

#----computing on Data arrays ----
#1 for rows, 2 for columns
#mean of column
apply (gendat, 2, mean)
#mean of row
apply (gendat, 1, mean)

#order matrix
meanexprsval <- apply(gendat, 1, mean)
o <- order (meanexprsval, decreasing = TRUE)
o
#reorder by vector o:
gendat[o,]
#positive means of first two rows with c(1,2)as row index
gendat[c(1,2),]
gendat[c("gene1","gene2"),]


#evaluation by TRUE and FALSE
meanexprsval > 0
gendat[meanexprsval >0 ,]

#----Application to the GOLUB Data Set ----
#Data from 38 Leukemia Patients, gene expression values of 3051 genes
# 27 patients are diagnosed as acute lymphoblastic leukemia (ALL)
# and eleven as acute myeloid leukemia (AML)
# Tumor class is given by the numeric vector golub.cl where ALL = 0 and AML = 1

golub.gnames[1042, ]
nrow(golub)
ncol(golub)
dim(golub)
golub [1042,2]
golub [,1]
golub[1042,]
#get only ALL patients
golub[1042, 1:27]
#combine a factor with labels and apply function
gol.fac <- factor(golub.cl, levels=0:1, labels= c ("ALL","AML"))
golub[1042, gol.fac=="ALL"]
meanALL <- apply(golub[,gol.fac=="ALL"],1, mean)
meanALL
grep("CD33",golub.gnames[,2])
golub.gnames[808,]

#---- Running Scripts ----
#See script "scmall scritps.R" 



