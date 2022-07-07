#' @title CNV
#' @description Plots Copy Number Variants after Sam files have been processed by bin-by-sam_2.0.py
#' @param file Provide text file produced by bin-by-sam_2.0.py
#' @param Chromosome Specify a particular chromosome or a vector of Chromosomes
#' @param mutantname Specify the mutant sample name hint:Look at header of column 7 in the output file from bin-by-sam_2.0.py
#' @param controlname Specify the mutant sample name hint:Look at header of column 6 in the output file from bin-by-sam_2.0.py
#' @param size Specify size of control sample ("yellow points")
#' @param alpha Specify transparency level of control sample
#' @param color Specify color of control sample
#' @export CNV


CNV <- function(file = NA, Chromosome = NA,mutantname = NA, controlname = NA,size=NA,alpha=N,color=NA){
  table <- read.table(file = file, header = TRUE)
  table <- table %>% dplyr::filter(Chrom %in% Chromosome)
  table[,7] <- as.numeric(table[,7])
  table[,6] <- as.numeric(table[,6])
  y <- rlang::sym(quo_name(enquo(mutantname)))
  z <- rlang::sym(quo_name(enquo(controlname)))
  str(table)
  p <- ggplot2::ggplot(data = table) + ggplot2::scale_x_continuous(breaks = seq(from = 0, to = max(round(table$End),0), by = 10^(floor(log10(max(table$End))))), labels = format_genomic(), name = "Genomic Position (Mb)") + ggplot2::theme(plot.margin = ggplot2::margin(b = 10,l = 20, r = 20, unit = "pt"))
  p <- p + ggplot2::geom_point(ggplot2::aes_string(x=table$Strt, y = y), color="red") + ggplot2::geom_point(ggplot2::aes_string(x=table$Strt, y = z), color = color,size = size,alpha=alpha) + facet_grid(~Chrom) + ggplot2::ggtitle("Copy Number Variation Control Sample") + ylab("CNV Ratio") + xlab("Position")
  
  #d <- geom_point(mapping = aes(x= Strt, y = !! z), color = "black",size=0.65) + facet_grid(~Chrom) 
  #print(d)
  print(p)
  return(table)
}
