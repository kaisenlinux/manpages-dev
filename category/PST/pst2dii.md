PST2DII(1)                                                         libpst Utilities - Version 0.6                                                         PST2DII(1)

NAME
       pst2dii - extract email messages from an MS Outlook .pst file in DII load format

SYNOPSIS
       pst2dii [-B bates-prefix] [-O dii-output-file] [-V] [-b bates-number] [-c bates-color] [-d debug-file] -f ttf-font-file [-h] [-o output-directory]
               pstfilename

OPTIONS
       -B bates-prefix
           Sets the bates prefix string. The bates sequence number is appended to this string, and printed on each page.

       -O dii-output-file
           Name of the output DII load file.

       -V
           Show program version. Subsequent options are then ignored.

       -b bates-number
           Starting bates sequence number. The default is zero.

       -c bates-color
           Font color for the bates stamp on each page, specified as 6 hex digits as rrggbb values. The default is ff0000 for bright red.

       -d debug-file
           Specify name of debug log file. The log file is now an ascii file, instead of the binary file used in previous versions.

       -f ttf-font-file
           Specify name of a true type font file. This should be a fixed pitch font.

       -h
           Show summary of options. Subsequent options are then ignored.

       -o output-directory
           Specifies the output directory. The directory must already exist.

DESCRIPTION
       pst2dii reads the email messages from an MS Outlook .pst file and produces a DII load file that may be used to import message summaries into a Summation DII
       system. The DII output file contains references to the image and attachment files in the output directory.

COPYRIGHT
       Copyright (C) 2008 by 510 Software Group <carl@five-ten-sg.com>

       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software
       Foundation; either version 2, or (at your option) any later version.

       You should have received a copy of the GNU General Public License along with this program; see the file COPYING. If not, please write to the Free Software
       Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.

VERSION
       0.6.75

pst2dii 0.6.75                                                               2017-12-07                                                                   PST2DII(1)
