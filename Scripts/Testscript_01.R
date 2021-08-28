#----Libraries----
library(TeachingDemos)
library(ALL)
library(multtest)
library(affy)

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

standardpath = "/home/tobias/Documents/R_Projects/Rstudio_Tutorials/Ressources/"
path <- paste(standardpath, "genetable.Rdata",sep = "")
path
write.csv(gendat, file=path)
