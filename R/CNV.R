#' @title CNV
#' @description Plots Copy Number Variants after Sam files have been processed by bin-by-sam_2.0.py
#' @param file Provide text file produced by bin-by-sam_2.0.py
#' @param Specify a particular chromosome or a vector of Chromosomes
#' @export CNV


CNV <- function(file = NA, Chromosome = NA){
  table <- read.table(file = file, header = TRUE)
  table <- table %>% dplyr::filter(Chrom %in% Chromosome)
  #x <- length(table$con.2.NA)
  #x <- seq(1,x,1)
  c <- ggplot(data = table, mapping = aes(x=Strt, y = con.2.NA))
  
  d <- c + geom_point() + facet_grid(~Chrom) + ggplot2::ggtitle("Copy Number Variation Control Sample") + ylab("CNV Ratio") + xlab("Position")
  c <- c + geom_point() + geom_point(mapping = aes(x= Strt, y = D2.2.NA), color = "red",size=0.50) + facet_grid(~Chrom) 
  c <- c + ggplot2::ggtitle("Copy Number Variation Mutant and Control Sample") + ylab("CNV Ratio") + xlab("Position")
  print(d)
  print(c)
  return(table)
}

