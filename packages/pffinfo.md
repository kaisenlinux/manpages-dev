  pffinfo                                                                         LOCAL                                                                        pffinfo
 
## NAME
      pffinfo — determines information about a Personal Folder File (OST, PAB and PST)
 
## SYNOPSIS
      pffinfo [-c codepage] [-ahvV] source
 
## DESCRIPTION
      pffinfo is a utility to determine information about a Personal Folder File (OST, PAB and PST)
 
      pffinfo is part of the libpff package.  libpff is a library to access the Personal Folder File (OST, PAB and PST) format
 
      source is the source file.
 
      The options are as follows:
 
      -a      shows allocation information
 
      -c codepage
              specify the codepage of ASCII strings, options: ascii, windows-874, windows-932, windows-936, windows-949, windows-950, windows-1250, windows-1251,
              windows-1252 (default), windows-1253, windows-1254, windows-1255, windows-1256, windows-1257 or windows-1258
 
      -h      shows this help
 
      -v      verbose output to stderr
 
      -V      print version
 
## ENVIRONMENT
      None
 
## FILES
      None
 
## EXAMPLES
      # pffinfo -a file.pst
      pffinfo 20110107
 
      Personal Folder File information:
              File size:              271360 bytes
              File content type:      Personal Storage Tables (PST)
              File type:              64-bit
              Encryption type:        compressible
 
      Message store:
              Folders:                Subtree, Wastbox, Finder
              Password checksum:      N/A
 
      Unallocated index node blocks:
              00018944 (0x00004a00) - 00020480 (0x00005000) size: 1536
            ...
           01051648 (0x00100c00) - 01052160 (0x00100e00) size: 512
 
      Unallocated data blocks:
           00025024 (0x000061c0) - 00025536 (0x000063c0) size: 512
            ...
           01353664 (0x0014a7c0) - 01541120 (0x00178400) size: 187456
 
 DIAGNOSTICS
      Errors, verbose and debug output are printed to stderr when verbose output -v is enabled.  Verbose and debug output are only printed when enabled at compila‐
      tion.
 
## BUGS
      Please report bugs of any kind to <joachim.metz@gmail.com> or on the project website: https://github.com/libyal/libpff/
 
## AUTHOR
      These man pages were written by Joachim Metz.
 
 COPYRIGHT
      Copyright (C) 2008-2018, Joachim Metz <joachim.metz@gmail.com>.  This is free software; see the source for copying conditions. There is NO warranty; not even
      for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 
## SEE ALSO
      pffexport(1)
 
 libpff                                                                     January 1, 2017                                                                    libpff
