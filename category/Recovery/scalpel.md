SCALPEL(1)                                                           Digital Forensics Solutions                                                          SCALPEL(1)

NAME
       scalpel - Recover files using a header/footer database

SYNOPSIS
       scalpel [-b] [-c <file>] [-d] [-h] [-i <file>] [-m <blocksize>] [-n] [-o <dir>] [-O] [-p] [-r] [-s <num>] [-t] [-u] [-V] [-v] [FILES]...

DESCRIPTION
       Recover files from a disk image or raw block device based on headers and footers specified by the user.

       -b     Carve files even if defined footers aren't discovered within maximum carve size for file type [foremost 0.69 compat mode]

       -c file
              Chooses  which configuration file to use. If this option is omitted, then "scalpel.conf" in the current directory is used. The format for the configu‐
              ration file is described in the default configuration file "scalpel.conf".  See the CONFIGURATION FILE section below for more information.

       -d     Generate header/footer database; will bypass certain optimizations and discover all footers, so performance suffers.  Doesn't affect the set of  files
              carved.  **EXPERIMENTAL**

       -m     Generate/update  carve coverage blockmap file.  The first 32bit unsigned int in the file identifies the block size. Thereafter each 32bit unsigned int
              entry in the blockmap file corresponds to one block in the image file.  Each entry counts how many carved files contain this block. Requires more mem‐
              ory and disk.  **EXPERIMENTAL**

       -h     Show a help screen and exit.

       -i file
              file is used as a list of input files to examine. Each line in the specified file should contain a single filename.

       -o directory
              Recovered  files  are  written to the directory directory.   Scalpel requires that this directory be either empty or not exist.  The directory will be
              created if necessary.

       -O     Don't organize carved files by type. Default is to organize carved files into subdirectories to make previewing of large numbers of carved files  eas‐
              ier.

       -p     Perform image file preview; audit log indicates which files would have been carved, but no files are actually carved.

       -q clustersize
              Carve only when header is cluster-aligned.

       -r     Find only first of overlapping headers/footers [foremost 0.69 compat mode]

       -s number
              Skips number bytes in each input file before beginning the search for file headers and footers.

       -t     Set directory for coverage blockmap.  **EXPERIMENTAL**

       -u     Use  carve coverage blockmap when carving.  Carve only sections of the image whose entries in the blockmap are 0.  These areas are treated as contigu‐
              ous regions.  **EXPERIMENTAL**

       -V     Show copyright information and exit.

       -v     Enables verbose mode. This causes copious amounts of debugging information to be output.

CONFIGURATION FILE
       The configuration file is used to control the types of files Scalpel will attempt to carve.  A sample configuration file, "scalpel.conf",  is  included  with
       this  distribution.  For each file type, the configuration file describes the file's extension, whether the header and footer are case sensitive, the maximum
       file size, and the header and footer for the file. The footer field is optional, but the header, size, case sensitivity, and extension fields are required.

       Important note: The default configuration file has all supported file patterns commented out--you must edit this before before running Scalpel.

       Any line in the configuration file that begins with a pound sign is considered a comment and ignored.

       Headers and footers are decoded before use. To specify a value in hexadecimal use \x[0-f][0-f], and for octal use \[1-9][1-9][1-9].   Spaces  can  be  repre‐
       sented by \s. Example: "\x4F\123\I\sCCI" decodes to "OSI CCI".

       To  match any single character (aka a wildcard) use a '?'. If you need to search for the '?' character, you will need to change the 'wildcard' line *and* ev‐
       ery occurrence of the old wildcard character in the configuration file, including those appearing in hex and octal values. '?' is equal to \x3f and \063.

AUTHORS
       Written by Golden G. Richard III.  The first version of Scalpel was based on foremost 0.69, which was written by Special Agent Kris Kendall and Special Agent
       Jesse Kornblum of the United States Air Force Office of Special Investigations.

BUGS AND LIMITATIONS
       It  is  currently not possible to carve physical block devices directly using the Windows version of Scalpel.  This is a limitation that will be removed in a
       future release of Scalpel.

REPORTING BUGS
       When submitting a bug report, please include a description of the problem, how you found it, and your contact information.

       Send bug reports to:
       golden@digitalforensicssolutions.com

COPYRIGHT
       This is free software.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       More information on Scalpel appears in the README file, distributed with the Scalpel source code.

Digital Forensics Solutions                                             v1.60 - December 2006                                                             SCALPEL(1)
