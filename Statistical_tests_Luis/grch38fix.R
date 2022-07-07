setwd("/home/lpaz/Documents/baylor/sedlazeck-lab/sairam")
# read fun
source("friedman_test_with_post_hoc.R")
# read data
g38_f1scores <- read.csv("grch38fix_supptab_5_6.csv",  header=T)

g38_f1scores
with(g38_f1scores , boxplot( F1.score ~ Mapping ))  # box-plotting
friedman.test(F1.score ~ Mapping | Type ,g38_f1scores)
friedman.test.with.post.hoc(F1.score ~ Mapping | Type ,g38_f1scores, to.plot.parallel = FALSE, to.plot.boxplot = FALSE)


# read data

g38_f1scores_genes_masked <- read.csv("grch38fix_supptab_12.csv",  header=T)
g38_f1scores_genes_collap <- read.csv("grch38fix_supptab_13.csv",  header=T)

boxplot(list("Original (masked)"=g38_f1scores_genes_masked$Original.mapping, "Remapped (masked)"=g38_f1scores_genes_masked$Remapping,
"Original (collapsed)"=g38_f1scores_genes_collap$Original.mapping, "Remapped (collapsed)"=g38_f1scores_genes_collap$Remapping))

par(mfrow=c(2,2))
hist(g38_f1scores_genes_masked$Original.mapping, main="Original mapping (masked)", xlab="F1 score")
hist(g38_f1scores_genes_masked$Remapping, main="Remapping (masked)", xlab="F1 score")
hist(g38_f1scores_genes_collap$Original.mapping, main="Original mapping (collapsed)", xlab="F1 score")
hist(g38_f1scores_genes_collap$Remapping, main="Remapping (collapsed)", xlab="F1 score")

ks.test(g38_f1scores_genes_masked$Original.mapping, g38_f1scores_genes_masked$Remapping)
ks.test(g38_f1scores_genes_collap$Original.mapping, g38_f1scores_genes_collap$Remapping)
