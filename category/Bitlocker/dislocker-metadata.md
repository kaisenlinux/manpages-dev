dislocker-metadata(1)                                  printing information about a BitLocker-encrypted volume                                 dislocker-metadata(1)

NAME
       dislocker-metadata - printing information about a BitLocker-encrypted volume

SYNOPSIS
       dislocker-metadata [OPTIONS]

DESCRIPTION
       Dislocker has been designed to read BitLocker encrypted partitions under a Linux system. The driver used to read volumes encrypted in Windows system versions
       of the Vista to 10 and BitLocker-To-Go encrypted partitions,that's USB/FAT32 partitions.

       The software works with driver composed of a library, with multiple binaries using this library. Decrypting the partition, you have to give it a mount  point
       where,  once  keys  are decrypted, a file named dislocker-file appears.  This file is a virtual NTFS partition, so you can mount it as any NTFS partition and
       then read from or write to it. Writing to the NTFS virtual file will change the underlying BitLocker partition content.

       This tool is useful in cryptography managing and forensics investigations.

OPTIONS
       -h     print all options to help

       -o     partition offset

       -v     increase verbosity to debug level

       -V VOLUME
              volume to get metadata from

AUTHOR
       The DISLOCKER was written by Romain Coltel <romain.coltel@gmail.com> and Hervé Schauer Consultants <Secretariat@hsc.fr>

       This manual page was written by Giovani Augusto Ferreira <giovani@debian.org> for the Debian project (but may be used by others).

DISLOCKER-METADATA 0.7.1                                                      Jul 2017                                                         dislocker-metadata(1)
