# Intro to Unix


## Practical

Thanks to [Amazon Web Services](http://aws.amazon.com) for providing free access for this course (grant EDU_E_FY2014_Q4_QueenMaryULondon_Wurm). 

### Connecting and creating your space

1. Use MobaXterm (on Windows) or Terminal to: `ssh mscstudent@inb.io`
   secret: ____arethebest  (you'll have to guess this one!)
   (if connecting from a Mac, ensure that you have XQuartz installed and use `ssh -X mscstudent@inb.io`)
2. In the scratch directory that is inside the main/home folder, create your own directory (subfolder) with your name and go inside. 

```bash
mkdir scratch/kevinmitnick
cd scratch/kevinmitnick
```
Check that you are where you are trying to be!


## Explore some commands 

Here's a list of commands - you'll want to figure out what they do and how they work. (just the basic usage - no need to explore all options!). And FYI, there are tons of "Unix cheat sheets" that you can easily google...

```bash
ls  # -a -l -t -h)
pwd
cd  # dir .. ~ 
mkdir
mv
cp
ln 
rm
rmdir

wget  # download file (first)
head
tail
less
man
R 
```
Other:
```
top  (or htop)
nano
grep
who
finger
```

## Do real stuff

1. Within your directory you created above, launch R - make a plot. 
2. Within your directory, download a gene sequence in fasta from somwhere, BLAST it against Swissprot - monitor with `htop` (in a different window) while this happens. 
   * `blast` may already be installed
   * You can download a BLAST-formatted SwissProt database here:    `http://www.antgenomes.org/~yannickwurm/tmp/2014-10-15-Swissprot.zip`

3. Download a genome sequence, use `seqtk` to extract a specific sequence (the longest one). Use `seqtk` to determine how many CpG sites the sequence contains. 

