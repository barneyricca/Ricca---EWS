# Will need to put purl=TRUE in the chunk header to move it to an appendix.
c("apaTables",
  "conflicted",       # For identifying package name conflicts
  #"crqa",             # RQA & CRQA
  #"cusp",              #
  "data.table",       # Faster data access
  #"DescTools",        # Nonlinear distribution stuff
  "devtools",         # For non-CRAN package loading
  #"doParallel",
  "dplyr",            # I think this is all of the tidyverse used here
  "dtplyr",           # For fast dplyr
  #"foreach",
  #"glue",             # To glue_collapse the data sequence
  "haven",            # Read and process SPSS files
  "knitr",
  "lcmm",
  "lmPerm",
  "MANOVA.RM",
  #"markovchain",      # verifyHomogeneity() to compare Markov matrices
  #"parallel",
  "partitions",
  #"poweRlaw",         # Routines for power law fits
  #"pracma",           # for hampel() on time series
  "psych",             # Cohen's d and others
  "pwr",
  #"qgraph",           # Simple plotting of transition matrices
  #"readr",            # For the read_file() in the appendices
  #  "Rcpp",             # Can move the functions to C++, for speed
  #  "statnet",          # Networks, including SNA & ERGM
  "readxl",           # Read XLSX files
  #"spatialEco",       # for local.min.max()
  "stringr",          # For parsing names
  #  "tidytable",        # Fast tidyr
  "tidyverse",
  "tidyr"            # pivot_wider() & pivot_longer()
  #"tseriesChaos"      # Some useful routines
) -> package_names

for(package_name in package_names) {
  if(!is.element(package_name, installed.packages()[,1])) {
    install.packages(package_name)
  }
  library(package_name, character.only=TRUE,
          quietly=TRUE,verbose=FALSE)
}

rm(list=c("package_names","package_name"))

set.seed(04251939)                 # Set a default random seed

# Stuff I prefer
options(show.signif.stars = FALSE) # Don't conflate significance & effect size
options(digits = 3)                # Round to 3 digits

#conflict_prefer("shift", "data.table") # Conflicts with spatialEco::shift()
conflict_prefer("filter", "dplyr")
conflict_prefer("select", "dplyr")

#if(!is.element("NDSToolkit", installed.packages()[,1])) {
#  devtools::install_github("barneyricca/NDSToolkit",
#                           upgrade = "always")
#}
#library(NDSToolkit)

# Problem with package:cmdstanr
#if(!is.element("rethinking", installed.packages()[,1])) {
#devtools::install_github("rmcelreath/rethinking",
#                         upgrade = "always")
#}
#library(rethinking)

if(!is.element("deltamad", installed.packages()[,1])) {
  devtools::install_github("barneyricca/deltamad",
                           upgrade = "always")
}
library(deltamad)

if(dir.exists(here("Output")) == FALSE) {
  dir.create(here("Output"))
}

if(dir.exists(here("Output")) == TRUE) {
  write(Sys.info(),                    # Store information about the machine
        file = here("Output/System Info.txt"))
  write(Sys.getenv(),                  # Store environment variables
        file = here("Output/Environment.txt"))
}

if(dir.exists(here("Images")) == FALSE) {
  dir.create(here("Images"))
}

options(show.signif.stars = FALSE)  # Don't conflate significance & effect size
options(digits = 3)                 # Round to 3 digits


