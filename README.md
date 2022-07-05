# CNVseq

# You have two BAM files one is a "mutant" and the other is a "control"

# First convert BAM to SAM
# The sam file must have an ending _aln.sam to work properly in python script

# CONTROL
samtools view -h con-2_S1-Chromes-04-05-09.bam > con-2_S1-Chromes-04-05-09_aln.sam

# MUTANT

samtools view -h D2-1_S7-Chromes-04-05-09.bam > D2-1_S7-Chromes-04-05-09_aln.sam

# Call the python script


**python bin-by-sam_2.0.py -o N3_100kbin.txt -s 100000 -b -p 3 -c con-2_S1-Chromes-04-05-09_aln.sam**

# Download the r package

```r

devtools::install_github("PBGLMichaelHall/CNVseq")
CNV::CNV(file = "N3_100kbin.txt",c("Chr04","Chr05","Chr09"))

```



![Rplot](https://user-images.githubusercontent.com/93121277/177341277-c8aeb48c-d44e-45e5-a79c-fcc59339d0d3.png)

