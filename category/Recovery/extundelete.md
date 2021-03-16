EXTUNDELETE(1)                                                         General Commands Manual                                                        EXTUNDELETE(1)

NAME
       extundelete - utility to undelete files from an ext3 or ext4 partition.

SYNOPSIS
       extundelete [options] device-file...

DESCRIPTION
       extundelete is a utility that can recover deleted files from an ext3 or ext4 partition
       extundelete uses the information stored in the partition's journal to attempt to recover a file that has been deleted from the partition.
       There  is  no  guarantee  that  any particular file will be able to be undeleted, so always try to have a good backup system in place, or at least put one in
       place after recovering your files!

OPTIONS
       --version
              Prints the version number of extundelete.

       --help Print a brief usage summary for extundelete.

       Partition name
              Name of the partition that has deleted files, such as /dev/sda3.
              Could also be the file name of a copy of the partition, such as that made with dd.

       --superblock
              Prints information about the filesystem from the superblock.

       --journal --superblock
              Prints information about the journal from the journal's superblock.

       --inode #
              Prints the information from the inode number of the filesystem given, such as "--inode 2".

       --block #
              Prints the contents of the block, called as "--block 9652".

       --restore-file path/to/deleted/file
              Attempts to restore the file which was deleted at the given filename, called as "--restore-file dirname/filename".

       --restore-inode #
              Used to restore inodes by number, called as "--restore-inode 2569".
              Also accepts a list of inodes separated by only commas, such as "--restore-inode 2569,5692,6925".

       --restore-files filename
              Restores a list of files. First, construct a list of files in the same style as would be
              used in the --restore-file option, and save it to the file "filename".
              Then, this option may be used to attempt to restore those files with a single call to extundelete.
              This form also reduces redundancy from multiple calls parsing the journal multiple times.

       --restore-all
              Restores all files possible to undelete to their names before deletion, when possible.  Other files are restored to a filename like "file.NNNN".

       --restore-directory path/of/directory
              Restores all files possible to link to specified directory to their names before deletion, when possible.

       -j journal_dev
              Specifies the device that is the external journal of the file system.

       -b block_number
              Specifies the block number of the backup superblock to be used when opening the file system.

       -B block_size
              Specifies the block size of the partition to be used when opening the file system.

       --before date
              Only restore files deleted before the date specified, which should be in the form of the number of seconds since the UNIX epoch.  Use a shell  command
              like
              $ date -d "Aug 1 9:02" +%s
              to  convert a human-readable date to the proper format. The conversion from the number of seconds to a readable format may be found by using either of
              the following:
              $ date -d@1234567890
              $ perl -le "print scalar localtime 1234567890"

       --after date
              Only restore files deleted after the date specified, which should be in the form of the number of seconds since the UNIX epoch.
              See the notes for the --before option for more information.

AUTHOR
       extundelete was written by Nic Case <number9652@users.sourceforge.net> Copyright (C) 2009, 2012

       This manual page was written by Elías Alejandro Año Mendoza <ealmdz@gmail.com>, for the Debian project (and may be used by others).

                                                                         September 29, 2010                                                           EXTUNDELETE(1)
