#!/usr/bin/Rscript

# unzip example data into example/
unzip('example/example_data.zip', exdir = 'example')
cat('\n', 'Data extracted', '\n')

# detect OS
os.type <- Sys.info()['sysname']
# download the latest OS specific version of plink 1.9
ifelse(os.type == 'Linux', 
       download.file('http://www.cog-genomics.org/static/bin/plink150805/plink_linux_x86_64.zip', 
                     'bin/plink_linux_x86_64.zip'),
       ifelse(os.type == 'Windows', 
              download.file('http://www.cog-genomics.org/static/bin/plink150805/plink_win64.zip', 
                            'bin/plink_win64.zip'),
              download.file('http://www.cog-genomics.org/static/bin/plink150805/plink_mac.zip', 
                            'bin/plink_mac.zip')))
cat('\n', 'PLINK downloaded', '\n')

# identify the zip file
plink.zip <- list.files('bin/', pattern = '.zip', full.names = T)
# unzip this file to the bin/ directory within the current working directory
unzip(plink.zip, exdir = 'bin')
# some mac systems seem to require the plink binary to be flagged as executable
if(os.type == 'Darwin') system('chmod +x bin/./plink')

cat('\n', 'PLINK extracted and installed in bin/', '\n')
cat('\n', 'Done', '\n')