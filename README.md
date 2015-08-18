# Intro_to_GWAS
An introductory workshop to GWAS analysis using `PLINK` and `R`.

## Overview
In this workshop we will explore the basics of performing Genome-wide Association Studies (GWAS) using a combination of the software `plink` (http://pngu.mgh.harvard.edu/~purcell/plink/) and `R` (http://www.r-project.org/).

At a later stage (a separate workshop) we will also introduce the `GenABEL` package which offers additional functionality of genomic association analyses in R.

This workshop is written to be accessible to a range of people, from those that have never performed any command-line work, to those that just want a refresher. As such I have written it to include clear and straight forward outlines of all `R` and `plink` operations, most of the time stepping through these one line at at time.

## Workshop Manual
The workshop manual is available in the form of the `GWAS_workshop.pdf` file. This contains all the information and code to run through the entire workshop, as well as hopefully helpful information.

## Before You Begin!! [Please read and follow along carefully]

There are certain steps that are Operating System dependent that need to be performed before starting the workshop. I have tried to cover them off here in as much detail as required.

### Windows

Before starting the workshop you'll need to have the ability to build certain R packages from source. This requires special libraries, which most of the time aren't installed by default. To begin building R packages for Windows you'll need to install RTools.  

The most recent version can be found here: http://cran.us.r-project.org/bin/windows/Rtools/  

The current release is [RTools33](http://cran.us.r-project.org/bin/windows/Rtools/Rtools33.exe). It's as simple as downloading and installing, just follow the prompts.  

Once RTools is installed you should be able to proceed with the workshop.

### Mac (OS X)

The initial set up for Mac is a little more detailed, but should be fairly straight forward and once it's done you don't have to worry about it again.

***Command Line Tools***

To build R packages from source Macs require `command line tools` to be installed. To do this:

  - Launch the Terminal, found in /Applications/Utilities/
  - Type the following command string:

>xcode-select --install

  - Follow the prompts

***Additional R libraries for package building on OS X***

You will also need to install both additional libraries from here: https://cran.r-project.org/bin/macosx/tools/

If you are running OS X 10.5 or higher you'll want to download and install the following:

  - gfortran - https://cran.r-project.org/bin/macosx/tools/gfortran-4.2.3.pkg
  - tcltk - https://cran.r-project.org/bin/macosx/tools/tcltk-8.5.5-x11.pkg

... and then gfortran version from here (there are also a large list of optional packages for Mac here): http://r.research.att.com/libs/ 

Again, for OS X 10.5 or higher download and install the following:

  - gfortran - http://r.research.att.com/libs/gfortran-4.8.2-darwin13.tar.bz2
  - this needs to be extracted and installed in the correct location. You can do this by running the following code in the terminal:

>sudo tar fvxz gfortran-4.8.2-darwin13.tar.bz2 -C /

... or, if you prefer, everything from the terminal:

> curl -O http://r.research.att.com/libs/gfortran-4.8.2-darwin13.tar.bz2
> sudo tar fvxz gfortran-4.8.2-darwin13.tar.bz2 -C /

Once you've performed the above steps you're ready to move on.

### Linux

If you are running Linux I'm assuming that you have your own working set up that you're happy with, so you don't need me to guide the way. If you're new to Linux you'll be pleasantly surprise to find that most popular distro's have the required libraries for building R and it's packages from source. If you do have issues there is plenty of excellent documentation: 

  - R FAQ: https://cran.r-project.org/doc/FAQ/R-FAQ.html
  - R Installation and Admin: https://cran.r-project.org/doc/manuals/r-release/R-admin.html

If you are completely in the woods, a good place to start is by installing the libraries that R is built from (these are the things you'll want installed if you are compiling R from source).

>sudo apt-get install r-base-dev

## Required Files and Steps for Getting Started
All files required for this workshop are contained within this repository.

### Set up
  1. Either clone into this repository or download via the 'Download ZIP' button to the right, then start `RStudio` and ensure this repository is set as your working directory.
  2. In `R` run the following: `source('scripts/GWAS_workshop_setup.R')`. The `GWAS_workshop_setup.R` script is provided to automatically:
    - extract the example data to `example/`
    - download OS specific version of `plink`
    - extract `plink` binary to `bin/`
    - download, build, install and load all R packages you'll need
      + *Note:* if you encounter any errors at this stage try restarting RStudio and running `source('scripts/GWAS_workshop_setup.R')` again.
  3. Once you have performed the above you should be able to follow along with the workshop manual.

Happy GWASing!

 - Miles

