vhdiinfo                                                                        LOCAL                                                                       vhdiinfo

NAME
     vhdiinfo — determines information about a Virtual Hard Disk (VHD) image file

SYNOPSIS
     vhdiinfo [-hvV] source

DESCRIPTION
     vhdiinfo is a utility to determine information about a Virtual Hard Disk (VHD) image file

     vhdiinfo is part of the libvhdi package.  libvhdi is a library to access the Virtual Hard Disk (VHD) image format

     source is the source file.

     The options are as follows:

     -h      shows this help

     -v      verbose output to stderr

     -V      print version

ENVIRONMENT
     None

FILES
     None

EXAMPLES
     # vhdiinfo differential.vhd
     vhdiinfo 20130512

     Virtual Hard Disk (VHD) image information:
             Format:                 1.0
             Disk type:              Differential
             Media size:             536870912 bytes
             Identifier:             5577d188-a753-4a80-800a-c627f764c304
             Parent identifier:      44421587-1b53-4972-9ceb-9a31e1618e5b
             Parent filename:        dynamic.vhd

DIAGNOSTICS
     Errors, verbose and debug output are printed to stderr when verbose output -v is enabled.  Verbose and debug output are only printed when enabled at compila‐
     tion.

BUGS
     Please report bugs of any kind to <joachim.metz@gmail.com> or on the project website: https://github.com/libyal/libvhdi/

AUTHOR
     These man pages were written by Joachim Metz.

COPYRIGHT
     Copyright (C) 2012-2018, Joachim Metz <joachim.metz@gmail.com>.

SEE ALSO
libvhdi                                                                   January 19, 2014                                                                   libvhdi
