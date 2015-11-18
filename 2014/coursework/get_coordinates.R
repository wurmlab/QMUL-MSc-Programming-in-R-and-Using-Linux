get_coordinates <- function() {

  # Download and read the tables
  data_dir_url <- 'http://wurmlab.github.io/2014-MSc-SBSm032-stats_bioinformatics/coursework/data'
    
  solenopsis_invicta_url     <- file.path(data_dir_url,
                                          'allantwebants-myrmicinaesolenopsis_invicta.csv')
  pheidole_obscurithorax_url <- file.path(data_dir_url,
                                          'alabamaants-myrmicinaepheidole_obscurithorax.csv')

  solenopsis_invicta_collections     <- read.csv(solenopsis_invicta_url,
                                                 h=T,
                                                 na.strings="")
  pheidole_obscurithorax_collections <- read.csv(pheidole_obscurithorax_url,
                                                 h=T,
                                                 na.strings="")

  # Merge the two tables
  # Subset the table to a new one with only the rows that match the Genus provided by the
  # argument of the function.
  # Limit the new table to only the columns DateCollectedStart, LocLatitude and LocLongitude.
  # Remove rows that have NA values
  # return the resulting table
}
