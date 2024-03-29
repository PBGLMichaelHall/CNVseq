% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CNV.R
\name{CNV}
\alias{CNV}
\title{CNV}
\usage{
CNV(
  file = NA,
  Chromosome = NA,
  mutantname = NA,
  controlname = NA,
  size = NA,
  alpha = N,
  color = NA
)
}
\arguments{
\item{file}{Provide text file produced by bin-by-sam_2.0.py}

\item{Chromosome}{Specify a particular chromosome or a vector of Chromosomes}

\item{mutantname}{Specify the mutant sample name hint:Look at header of column 7 in the output file from bin-by-sam_2.0.py}

\item{controlname}{Specify the mutant sample name hint:Look at header of column 6 in the output file from bin-by-sam_2.0.py}

\item{size}{Specify size of control sample ("yellow points")}

\item{alpha}{Specify transparency level of control sample}

\item{color}{Specify color of control sample}
}
\description{
Plots Copy Number Variants after Sam files have been processed by bin-by-sam_2.0.py
}
