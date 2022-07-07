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
# Banana CNV
setwd("/home/michael/Desktop/Banana/Banana_LC_WGS")
devtools::install_github(repo = "PBGLMichaelHall/CNVseq",force = TRUE)
library(CNV)
CNV::CNV(file = "N3_100kbin.txt",Chromosome =  c("NC_025202.1","NC_025203.1","NC_025203.1","NC_025204.1","NC_025205.1","NC_025206.1","NC_025207.1","NC_025208.1","NC_025209.1","NC_025210.1","NC_025211.1","NC_025212.1"),mutantname = "Novaria.Naine",controlname = "Naine.Naine",size = .75,alpha = .25)


```
![Screenshot from 2022-07-07 10-27-12](https://user-images.githubusercontent.com/93121277/177728255-62698bfb-3786-4387-ac1a-bb95dc90a6c7.png)


# Now Chromosome 5

```r 

CNV::CNV(file = "N3_100kbin.txt",Chromosome =  c("NC_025206.1"),mutantname = "Novaria.Naine",controlname = "Naine.Naine",size = .75,alpha = .25)

```

![CNVplotBANA](https://user-images.githubusercontent.com/93121277/177727595-43988650-970d-43a9-a70d-34e317ad0e24.png)



```r


#Sorghum CNV
setwd("/home/michael/Desktop/SorghumBinBySam")
CNV::CNV(file = "N3_100kbin.txt",Chromosome = c("Chr04","Chr05","Chr09"),mutantname = "con.2.NA",controlname = "D2.2.NA",size = .75,alpha = .25)



```
![99](https://user-images.githubusercontent.com/93121277/177728392-50efb398-b35d-4ecc-afee-a00b4ccbf9a2.png)



# Chromosome 9

```r
CNV::CNV(file = "N3_100kbin.txt",Chromosome = c("Chr09"),mutantname = "con.2.NA",controlname = "D2.2.NA",size = .75,alpha = .25)

```

![ch9](https://user-images.githubusercontent.com/93121277/177728520-774759be-2e2f-4acd-9e1d-9edad730289a.png)



