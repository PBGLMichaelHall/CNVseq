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
  c <- c + geom_point() + facet_grid(~Chrom)
  print(c)
  return(table)
}



