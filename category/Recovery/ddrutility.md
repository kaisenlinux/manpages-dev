DDRUTILITY(1)                                                               User Commands                                                              DDRUTILITY(1)

NAME
       ddrutility - Tool set to aid in data recovery

SYNOPSIS
       ddrutility [options]

DESCRIPTION
       ddrutility - Tool set to aid in data recovery

       Ddrutility is a toolset designed to help aid in data recovery using GNU ddrescue. It contains the following programs:

       Ddru_findbad - Utility for finding what files are related to bad sectors. For more info on ddru_findbad, try 'ddru_findbad --help'.

       Ddru_ntfsbitmap  -  Utility  to extract the bitmap file from a NTFS partition, and then create a domain log file to use with ddrescue that would only recover
       the used portion of the partition. For more info on ddru_ntfsbitmap, try 'ddru_ntfsbitmap --help'.

       Ddru_ntfsfindbad - Utility for NTFS partitions to find which files are related to bad sectors in a ddrescue log file. You should use this for NTFS partitions
       in place of the original ddru_findbad. For more info on ddru_ntfsfindbad, try 'ddru_ntfsfindbad --help'.

       Ddru_diskutility - Advanced LINUX ONLY utility that can perform several different functions on a disk, using some direct pass-through disk commands. For more
       info on ddru_diskutility, try 'ddru_diskutility --help'.

   OPTIONS:
       -h, --help
              Show help and exit

       -v, --version
              Show version and exit

REPORTING BUGS
       Report bugs to maximus57@hotmail.com
       Or better yet, report bugs at the project home page
       Ddrutility homepage: http://sourceforge.net/projects/ddrutility/

COPYRIGHT
       Copyright © 2016 Scott Dwyer.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       The full documentation for ddrutility is maintained as a Texinfo manual.  If the info and ddrutility programs are properly installed at your site,  the  com‐
       mand

              info ddrutility

       should give you access to the complete manual.

ddrutility 2.8 20161123                                                     November 2016                                                              DDRUTILITY(1)
