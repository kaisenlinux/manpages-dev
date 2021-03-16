pffexport                                                                       LOCAL                                                                      pffexport

NAME
     pffexport — exports items stored in a Personal Folder File (OST, PAB and PST)

SYNOPSIS
     pffexport [-c codepage] [-f format] [-l logfile] [-m mode] [-t target] [-dhqvV] source

DESCRIPTION
     pffexport is a utility to export items stored in a Personal Folder File (OST, PAB and PST)

     pffexport is part of the libpff package.  libpff is a library to access the Personal Folder File (OST, PAB and PST) format

     source is the source file.

     The options are as follows:

     -c codepage
             specify the codepage of ASCII strings, options: ascii, windows-874, windows-932, windows-936, windows-949, windows-950, windows-1250, windows-1251,
             windows-1252 (default), windows-1253, windows-1254, windows-1255, windows-1256, windows-1257 or windows-1258

     -d      dumps the item values in a separate file: ItemValues.txt

     -f format
             specify the preferred output format, options: all, html, rtf, text (default)

     -h      shows this help

     -l logfile
             specify the file in which to log information about the exported items

     -m mode
             export mode, option: all, debug, items (default), recovered. 'all' exports the (allocated) items, orphan and recovered items. 'debug' exports all the
             (allocated) items, also those outside the the root folder. 'items' exports the (allocated) items. 'recovered' exports the orphan and recovered items.

     -q      quiet shows minimal status information

     -t target
             specify the basename of the target directory to export to (default is the source filename) pffexport will add the following suffixes to the basename:
             .export, .orphans, .recovered

     -v      verbose output to stderr

     -V      print version

ENVIRONMENT
     None

FILES
     None

EXAMPLES
     # pffexport file.pst
     pffexport 20110107

     Opening file.
     Exporting items.
     Exporting folder item 1 out of 4.
           ...
     Exporting e-mail item 17 out of 115.
     Exporting attachment 1 out of 3.
     Exporting attachment 2 out of 3.
     Exporting attachment 3 out of 3.
     Exporting e-mail item 18 out of 115.
           ...
     Exporting folder item 4 out of 4.
     Export completed.

DIAGNOSTICS
     Errors, verbose and debug output are printed to stderr when verbose output -v is enabled.  Verbose and debug output are only printed when enabled at compila‐
     tion.

BUGS
     Please report bugs of any kind to <joachim.metz@gmail.com> or on the project website: https://github.com/libyal/libpff/

AUTHOR
     These man pages were written by Joachim Metz.

COPYRIGHT
     Copyright (C) 2008-2018, Joachim Metz <joachim.metz@gmail.com>.  This is free software; see the source for copying conditions. There is NO warranty; not even
     for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
     pffinfo(1)

libpff                                                                     January 1, 2017                                                                    libpff
