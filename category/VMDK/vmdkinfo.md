vmdkinfo                                                                        LOCAL                                                                       vmdkinfo

NAME
     vmdkinfo — determines information about a VMware Virtual Disk (VMDK) file(s)

SYNOPSIS
     vmdkinfo [-ahvV] vmdk_files

DESCRIPTION
     vmdkinfo is a utility to determine information about a VMware Virtual Disk (VMDK) file(s)

     vmdkinfo is part of the libvmdk package.  libvmdk is a library to access the VMware Virtual Disk (VMDK) format

     vmdk_files the entire set of VMDK segment files or the one containing the descriptor.

     The options are as follows:

     -a      shows allocation information

     -h      shows this help

     -v      verbose output to stderr

     -V      print version

ENVIRONMENT
     None

FILES
     None

EXAMPLES
     # vmdkinfo file.vmdk
     vmdkinfo 20130514

     VMware Virtual Disk (VMDK) information:
             Disk type:                      Monolithic sparse
             Media size:                     8589934592 bytes
             Content identifier:             0x505dcf0a
             Parent content identifier:      0xffffffff

DIAGNOSTICS
     Errors, verbose and debug output are printed to stderr when verbose output -v is enabled.  Verbose and debug output are only printed when enabled at compila‐
     tion.

BUGS
     Please report bugs of any kind to <joachim.metz@gmail.com> or on the project website: https://github.com/libyal/libvmdk/

AUTHOR
     These man pages were written by Joachim Metz.

COPYRIGHT
     Copyright (C) 2009-2020, Joachim Metz <joachim.metz@gmail.com>.  This is free software; see the source for copying conditions. There is NO warranty; not even
     for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
libvmdk                                                                    March 10, 2019                                                                    libvmdk
