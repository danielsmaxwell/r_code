
# The file.path() function "constructs file paths that are correct, independent of the
# operating system you work on." This frees the programmer from having to figure out the 
# slashes, whether forward or backward, on a given operating system.

# Additional information can be found at:
# https://www.dummies.com/programming/r/how-to-work-with-files-and-folders-in-r/
#

# Generate a Windows path.
file_path <- file.path('c:','informatics')

# Embed file.path() inside setwd()
setwd(file.path('c:','informatics'))

# Verify that the default path has been set.
getwd()

# On Macs, you need to append a backslash to the first item in the path.
file_path <- file.path("/Users", "jash", "Desktop", "Rtest", "fall2018-R for beginners-sample data", "adult mouse heart nucleotides.xlsx")