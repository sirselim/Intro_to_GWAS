#!/usr/bin/Rscript

# Install function for CRAN packages 
# should allow detection of already installed packages   
packages <- function(x){
  x <- as.character(match.call()[[2]])
  if (!require(x, character.only = TRUE)){
    install.packages(pkgs = x, repos = "http://cran.r-project.org")
    require(x, character.only = TRUE)
  }
}

# download and install XML to parse html links for plink download
packages(XML)

# unzip example data into example/
unzip('example/example_data.zip', exdir = 'example')
cat('\n', 'Data extracted', '\n')

# detect OS
os.type <- Sys.info()['sysname']
cat('\n', paste0('The system you are running is: ', os.type), '\n')
# download the latest OS specific version of plink 1.9
plink.site <- 'http://www.cog-genomics.org'
ifelse(os.type == 'Linux', 
       download.file(paste0(plink.site, getHTMLLinks(site.html)[grep('plink_linux_x86_64.zip', getHTMLLinks(site.html))]), 
                     'bin/plink_linux_x86_64.zip'),
       ifelse(os.type == 'Windows', 
              download.file(paste0(plink.site, getHTMLLinks(site.html)[grep('plink_win64.zip', getHTMLLinks(site.html))]), 
                            'bin/plink_win64.zip'),
              download.file(paste0(plink.site, getHTMLLinks(site.html)[grep('plink_mac.zip', getHTMLLinks(site.html))]), 
                            'bin/plink_mac.zip')))
cat('\n', 'PLINK downloaded', '\n')

# identify the zip file
plink.zip <- list.files('bin/', pattern = '.zip', full.names = T)
# unzip this file to the bin/ directory within the current working directory
unzip(plink.zip, exdir = 'bin')
# some mac systems seem to require the plink binary to be flagged as executable
if(os.type == 'Darwin') system('chmod +x bin/./plink')

cat('\n', 'PLINK extracted and installed in current working directory bin/', '\n')

## set up R environment (packages) for workshop
cat('\n', 'Checking packages and installing those required for this workshop...', '\n')

# download, install and load required bioconductor packages
# run this before base CRAN packages as Haplin depends on these
cat("\n", "Installing required bioconductor packages...", "\n")
#
# Install function for bioconductor packages 
# should allow detection of already installed packages   
bioc.packages <- function(x){
  x <- as.character(match.call()[[2]])
  if (!require(x, character.only = TRUE)){
    biocLite(pkgs = x)
    require(x, character.only = TRUE)
  }
}
#
source("http://bioconductor.org/biocLite.R")
bioc.packages("GenABEL")
#
cat("\n", "...Done...", "\n")

# use the defined packages function to install and load additional CRAN packages
cat("\n", "Installing required CRAN packages...", "\n")
#
packages(devtools) # used to install packages from source and GitHub
packages(MASS)
packages(Haplin)
packages(genetics)
packages(LDheatmap)
packages(RColorBrewer)
#
cat("\n", "...Done...", "\n")

## required packages from GitHub repositories
# NOTE: certain software will need to be installed to build the following
# further instructions will be available in the GitHub README
cat("\n", "Retrieving and installing Github pacakges...", "\n")
# download, install and load qqman
install_github("stephenturner/qqman", ref="dev")
require("qqman")
# download, install and load gdsfmt
install_github("zhengxwen/gdsfmt")
require("gdsfmt")
# download, install and load SNPRelate
install_github("zhengxwen/SNPRelate")
require("SNPRelate")
#
cat("\n", "...Done. You are ready to start the workshop...", "\n")
# END
