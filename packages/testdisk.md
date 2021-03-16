  TESTDISK
 
## NAME
        testdisk - Scan and repair disk partitions
 
## SYNOPSIS
        testdisk [/log] [/debug] [/dump] [device|image.dd|image.e01]
 
        testdisk /version
 
        testdisk /list [/log]
 
## DESCRIPTION
           TestDisk checks and recovers lost partitions
           It works with :
           - BeFS (BeOS)
           - BSD disklabel (FreeBSD/OpenBSD/NetBSD)
           - CramFS, Compressed File System
           - DOS/Windows FAT12, FAT16 and FAT32
           - HFS and HFS+, Hierarchical File System
           - JFS, IBM's Journaled File System
           - Linux ext2/ext3/ext4
           - Linux Raid
             RAID 1: mirroring
             RAID 4: striped array with parity device
             RAID 5: striped array with distributed parity information
             RAID 6: striped array with distributed dual redundancy information
           - Linux Swap (versions 1 and 2)
           - LVM and LVM2, Linux Logical Volume Manager
           - Mac partition map
           - Novell Storage Services NSS
           - NTFS (Windows NT/2K/XP/2003/Vista/...)
           - ReiserFS 3.5, 3.6 and 4
           - Sun Solaris i386 disklabel
           - Unix File System UFS and UFS2 (Sun/BSD/...)
           - XFS, SGI's Journaled File System
 
           It can undelete files from
           - DOS/Windows FAT12, FAT16 and FAT32
           - Linux ext2
           - NTFS (Windows NT/2K/XP/2003/Vista/...)
 
           For more information on how to use, please visit the wiki pages on www.cgsecurity.org
 
## OPTIONS
        /log   create a testdisk.log file
 
        /debug add debug information
 
        /dump  dump raw sectors
 
        /list  display current partitions
 
## SEE ALSO
        fdisk(8), photorec(8).
 
## AUTHOR
        TestDisk 7.1, Data Recovery Utility, July 2019
        Christophe GRENIER <grenier@cgsecurity.org>
        https://www.cgsecurity.org
 
 2019                                                                            July                                                                     TESTDISK(8)
