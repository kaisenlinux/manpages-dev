DISKTYPE(1)                                                                     BSD General Commands Manual                                                                    DISKTYPE(1)

NAME
     disktype — disk format detector

SYNOPSIS
     disktype file...

DESCRIPTION
     The purpose of disktype is to detect the content format of a disk or disk image. It knows about common file systems, partition tables, and boot codes.

USAGE
     disktype can be run with any number of regular files or device special files as arguments. They will be analyzed in the order given, and the results printed to standard output.
     There are no switches in this version. Note that running disktype on device files like your hard disk will likely require root rights.

     See the online documentation at <http://disktype.sourceforge.net/doc/> for some example command lines.

RECOGNIZED FORMATS
     The following formats are recognized by this version of disktype.

     File systems:
           FAT12/FAT16/FAT32/exFAT, NTFS, HPFS, MFS, HFS, HFS Plus, ISO9660, ext2/ext3/ext4, btrfs, Minix, ReiserFS, Reiser4, Linux romfs, Linux cramfs, Linux squashfs, UFS (some varia‐
           tions), SysV FS (some variations), JFS, XFS, F2FS, Amiga FS/FFS, BeOS BFS, QNX4 FS, UDF, 3DO CD-ROM file system, Veritas VxFS, Xbox DVD file system.

     Partitioning:
           DOS/PC style, Apple, Amiga "Rigid Disk", ATARI ST (AHDI3), BSD disklabel, Linux RAID physical disks, Linux LVM1 physical volumes, Linux LVM2 physical volumes, Solaris x86
           disklabel (vtoc), Solaris SPARC disklabel.

     Other structures:
           Debian split floppy header, Linux swap.

     Disk images:
           Raw CD image (.bin), Virtual PC hard disk image, Apple UDIF disk image (limited).

     Boot codes:
           LILO, GRUB, SYSLINUX, ISOLINUX, Linux kernel, FreeBSD loader, Sega Dreamcast (?).

     Compression formats:
           gzip, compress, bzip2.

     Archive formats:
           tar, cpio, bar, dump/restore.

     Compressed files (gzip, compress, bzip2 formats) will also have their contents analyzed using transparent decompression. The appropriate compression program must be installed on the
     system, i.e.  gzip(1) for the gzip and compress formats, bzip2(1) for the bzip2 format.

     Disk images in general will also have their contents analyzed using the proper mapping, with the exception of the Apple UDIF format.

     See the online documentation at <http://disktype.sourceforge.net/doc/> for more details on the supported formats and their quirks.

HOMEPAGE
     http://disktype.sourceforge.net/

AUTHOR
     Christoph Pfisterer <chrisp@users.sourceforge.net>

SEE ALSO
     file(1), gpart(8)

                                                                                       Feb 21, 2005
