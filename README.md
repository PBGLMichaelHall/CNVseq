# CNVseq

# You have two BAM files one is a "mutant" and the other is a "control"

# First convert BAM to SAM

# CONTROL
samtools view -h con-2_S1-Chromes-04-05-09.bam > con-2_S1-Chromes-04-05-09.sam

# MUTANT

samtools view -h D2-1_S7-Chromes-04-05-09.bam > D2-1_S7-Chromes-04-05-09.sam


