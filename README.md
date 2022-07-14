**CNVseq Analysis Banana and Sorghum**


**Banana**

**Procure your raw FASTQ reads from NCBI of two Banana samples, one is a known mutant Novaria and the other is a wildtype Naine and follow the protocol.**
**Efficient Screening Techniques to Identify Mutants with TR4 Resistance in Banana**
p.117 - 127
**Use clumpify script to remove duplicates**


(https://www.ncbi.nlm.nih.gov/bioproject/PRJNA627139)

# Download the r package

```r

devtools::install_github("PBGLMichaelHall/CNVseq")
# Banana CNV
setwd("/home/michael/Desktop/Banana/Banana_LC_WGS")
devtools::install_github(repo = "PBGLMichaelHall/CNVseq",force = TRUE)
library(CNV)
CNV::CNV(file = "N3_100kbin.txt",Chromosome =  c("NC_025202.1","NC_025203.1","NC_025203.1","NC_025204.1","NC_025205.1","NC_025206.1","NC_025207.1","NC_025208.1","NC_025209.1","NC_025210.1","NC_025211.1","NC_025212.1"),mutantname = "Novaria.Naine",controlname = "Naine.Naine",size = .75,alpha = .25,color="green")


```
![777](https://user-images.githubusercontent.com/93121277/177731532-046119d9-b802-4fa1-af91-a88e4eff7022.png)


# Now Chromosome 5

```r 

CNV::CNV(file = "N3_100kbin.txt",Chromosome =  c("NC_025206.1"),mutantname = "Novaria.Naine",controlname = "Naine.Naine",size = .75,alpha = .25,color="green")

```


![Rplot777](https://user-images.githubusercontent.com/93121277/177731971-698c6ff6-bce9-4442-8d12-310344da5d37.png)



```r

# You have two BAM files one is a "mutant" and the other is a "control"

# First convert BAM to SAM
# The sam file must have an ending _aln.sam to work properly in python script

# CONTROL
samtools view -h con-2_S1-Chromes-04-05-09.bam > con-2_S1-Chromes-04-05-09_aln.sam

# MUTANT

samtools view -h D2-1_S7-Chromes-04-05-09.bam > D2-1_S7-Chromes-04-05-09_aln.sam

# Call the python script
```r

$python bin-by-sam_2.0.py -o N3_100kbin.txt -s 100000 -b -p 3 -c con-2_S1-Chromes-04-05-09_aln.sam

```
#Sorghum CNV
setwd("/home/michael/Desktop/SorghumBinBySam")
CNV::CNV(file = "N3_100kbin.txt",Chromosome = c("Chr04","Chr05","Chr09"),mutantname = "con.2.NA",controlname = "D2.2.NA",size = .75,alpha = 5.0,color="green")



```

![Screenshot from 2022-07-07 10-47-11](https://user-images.githubusercontent.com/93121277/177732226-d01f0a94-76c4-4a94-b95b-efff8d06369f.png)




# Chromosome 9

```r
CNV::CNV(file = "N3_100kbin.txt",Chromosome = c("Chr09"),mutantname = "con.2.NA",controlname = "D2.2.NA",size = .75,alpha = 5.0)

```


![Rplot01](https://user-images.githubusercontent.com/93121277/177732470-bb9f650a-7595-428d-95b8-34f300c561a2.png)




