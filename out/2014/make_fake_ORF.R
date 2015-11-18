make_fake_ORF <- function(number_of_codons) {
  replace_me <- 0  ## Tip: Start by deleting this variable. 
    
  # Stop if input argument is not a number
  if (replace_me) { 
    stop()
  }

  # Stop if input argument is not bigger than 2
  # (we want at least the start codon, one amino acid and a stop codon)
  if (replace_me) { 
    stop()
  }


  # read in codon frequency table for H. sapiens
  # retrieved and modified from http://www.kazusa.or.jp/codon/
  data_dir <- 'http://wurmlab.github.io/2014-MSc-SBSm032-stats_bioinformatics/coursework/data/'
  codon_freq_table <- read.csv(file.path(data_dir, 'codon_frequency_table.csv'), h=T)

  ############################
  ## Middle of the ORF

  # We are going to use the function sample() to create vector of codons for the
  # 'middle' portion of the ORF.
  # This portion does not include the start or stop codon.

  # The length of this portion is the input length - 2:
  length_of_orf_middle <- replace_me

  # Each codon is present in a given proportion (as given in codon_freq_table)
  # however, we want to remove the stop codons from the table, since we do not want
  # them in the middle of the coding sequence:
  # subset of codon_freq_table without the stop codons, c('UAA', 'UAG', 'UGA')
  non_stop_codon_table <- replace_me   

  # recode the frequency of the codons after removal of the stop codons (this may take a few steps):
   # (code goes here if needed)
   # (code goes here if needed)
  non_stop_codon_table$Frequency <- replace_me

  # sample
  orf_middle <- sample(x    = non_stop_codon_table$Codon,
                       size = length_of_orf_middle,
                       prob = non_stop_codon_table$Frequency)
  ############################
  ## Stop codon

  # Sample one stop codon according to the frequency of each stop codon in the first table
  # stop codons are c('UAA', 'UAG', 'UGA')

  # This bit you have to do youself!
  # It is similar to the code above, except that you need to sample 1 codon only.

  ############################
  ## Start codon
  start_codon <- 'AUG'

  ############################
  ## Joining the start and stop codons to the rest of ORF

  # Add the start codon to the beggining of the orf_middle vector:
   # (code goes here)

  # Add the stop codon to the end of the orf_middle vector:
   # (code goes here)

  ############################
  ## U -> T

  # We need to output DNA and not RNA, so we need to change U to T
  # HINT: you may want to paste/collapse the vector into a string and then use a regular expression!

  ############################
  ## Output

  # return a *string*! Its length (nchar()) should be number_of_codons * 3
  return(replace_me)

}
