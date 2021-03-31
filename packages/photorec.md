PHOTOREC(8)                                                                           Administration Tools                                                                          PHOTOREC(8)

NAME
       photorec - Recover lost files from harddisk, digital camera and cdrom

SYNOPSIS
       photorec [/log] [/debug] [/d recup_dir] [device|image.dd|image.e01]

       photorec /version

DESCRIPTION
          PhotoRec is file data recovery software designed to recover lost files including video, documents and archives from Hard Disks and CDRom and lost pictures (Photo Recovery) from dig‐
       ital camera memory. PhotoRec ignores the filesystem and goes after the underlying data, so it'll work even if your media's filesystem is severely damaged or formatted. PhotoRec is safe
       to use, it will never attempt to write to the drive or memory support you are about to recover lost data from.
          For more information on how to use, please visit the wiki pages on www.cgsecurity.org

OPTIONS
       /log   create a photorec.log file

       /debug add debug information

SEE ALSO
       testdisk(8), fdisk(8).

AUTHOR
       PhotoRec 7.1, Data Recovery Utility, July 2019
       Christophe GRENIER <grenier@cgsecurity.org>
       https://www.cgsecurity.org

2019                                                                                          July                                                                                  PHOTOREC(8)
