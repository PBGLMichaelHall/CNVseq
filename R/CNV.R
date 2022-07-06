#' @title CNV
#' @description Plots Copy Number Variants after Sam files have been processed by bin-by-sam_2.0.py
#' @param file Provide text file produced by bin-by-sam_2.0.py
#' @param Chromosome Specify a particular chromosome or a vector of Chromosomes
#' @param mutantname Specify the mutant sample name hint:Look at header of column 7 in the output file from bin-by-sam_2.0.py
#' @param controlname Specify the mutant sample name hint:Look at header of column 6 in the output file from bin-by-sam_2.0.py
#' @export CNV


CNV <- function(file = NA, Chromosome = NA,mutantname = NA, controlname = NA){
  table <- read.table(file = file, header = TRUE)
  table <- table %>% dplyr::filter(Chrom %in% Chromosome)
  table[,7] <- as.numeric(table[,7])
  table[,6] <- as.numeric(table[,7])
  y <- rlang::sym(quo_name(enquo(mutantname)))
  z <- rlang::sym(quo_name(enquo(controlname)))
  
  c <- ggplot(data = table, mapping = aes(x=Strt, y = !! y))
  d <- c + geom_point(color = "black") + facet_grid(~Chrom) + ggplot2::ggtitle("Copy Number Variation Control Sample") + ylab("CNV Ratio") + xlab("Position")
  c <- c + geom_point() + geom_point(mapping = aes(x= Strt, y = !! z), color = "red",size=0.25) + facet_grid(~Chrom) 
  c <- c + ggplot2::ggtitle("Copy Number Variation Mutant and Control Sample") + ylab("CNV Ratio") + xlab("Position")
  print(d)
  print(c)
  return(table)
}