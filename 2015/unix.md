# Intro to Unix

## Commands 

You'll want to find some Unix cheat sheet on google.

```bash
ls  # -a -l -t -h)
pwd
cd  # dir .. ~ 
mkdir
nano 
mv
cp
ln 
rm
rmdir
wget  # download file (first)
head
tail
less
grep 
getting help; running stuff
R 
```

## Examples 

 * example: run blast of gene against swissprot
   `http://www.antgenomes.org/~yannickwurm/tmp/2014-10-15-Swissprot.zip`

 * example: `seqtk` compile ; extract scaffold00059 


## Resource monitoring
 * htop or top
 * who
 * finger


## Shared computing - HPC concept

Remote: 
 
 * `ssh mscstudent@ec2-54-228-34-62.eu-west-1.compute.amazonaws.com`
 * ssh mpx163@frontend1.apocrita.hpc.qmul.ac.uk
 * qlogin
   qlogin -pe smp 4 -l h_vmem=10G  # four cores and 40 gigs of Ram 
 * (qsub)
 * scp 


## Practical

Thanks to [Amazon Web Services](http://aws.amazon.com) for providing free access for this course (grant EDU_E_FY2014_Q4_QueenMaryULondon_Wurm). 

### Unix

1. Use MobaXterm (on Windows) or Terminal to: `ssh mscstudent@ec2-54-228-34-62.eu-west-1.compute.amazonaws.com`
   secret: ____arethebest
2. In the home folder, create your own directory (subfolder) with your name. 
3. Within this directory, launch R - make a plot. 
5. Within this new directory, download a fasta sequence, BLAST it against Swissprot - monitor with `htop` (in a different window) while this happens. 
6. Download a genome sequence, use seqtk to extract a specific sequence 

### Gene annotation

http://afra.sbcs.qmul.ac.uk



