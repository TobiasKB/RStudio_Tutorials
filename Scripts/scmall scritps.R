library(multtest); data(golub)
gol.fac <- factor(golub.cl, levels=0:1, labels= c("ALL","AML"))
mall <- apply(golub[,gol.fac=="ALL"], 1, mean)
maml <- apply(golub[,gol.fac=="AML"], 1, mean)
o <- order(abs(mall-maml), decreasing=TRUE)
print(golub.gnames[o[1:5],2])
# #The row means of the expression values per patient group are computed and
# stored in the object mall and maml, respectively. The absolute values of the
# differences in means are computed and their order numbers (from large to
#                                                            small) are stored in the vector o. Next, the names of the five genes with the
# largest differences in mean are printed to the screen.

