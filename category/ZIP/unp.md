unp(1)                                                                              General Commands Manual                                                                              unp(1)

NAME
       unp - a shell frontend for uncompressing/unpacking tools

SYNOPSIS
       unp [-u] file [ files ... ] [ -- backend args ...  ] ucat file [ files ... ]

       unp  is  a  small  script  with only one goal: Extract as many archives as possible, of any kind and from any path to the current directory, preserving the subdirectory structure where
       needed. Is a Do-What-I-Want utility and helps managing several extraction programs without looking for needed options for the particular tool or worrying about the installation of  the
       needed program.

       Run unp without arguments to see the list of supported archive formats.

       The special version ucat acts as wrapper for commands that can output the extracted data to standard output, like bzip (bzcat), gzip (zcat), tar, zip and others.

USAGE
       unp  extracts  one  or  more  files given as arguments on the command line.  Additionally, it may pass some options to the backend tools (like tar options) when they are appended after
       `--´.

       There is also a special option (-u) which is very useful for extracting Debian packages. Using -u, unp extracts the package (i.e. the ar archive) first, then  extracts  data.tar.gz  in
       the current directory and then control.tar.gz in control/<filename>/.

NOTES
       unp will try to decompress into a FILE.unp if it get trouble with existing files. But don't count on this feature, always look for free working space before using unp.

       Unlike gunzip, which decompresses the file in the target directory of the source file, unp uses the current directory for output.

AUTHOR
       Development started by Andre Karwath <andre.karwath@informatik.tu-chemnitz.de>
       Now maintained and packaged for Debian by Eduard Bloch <blade@debian.org>

                                                                                          18 Feb 2001                                                                                    unp(1)
