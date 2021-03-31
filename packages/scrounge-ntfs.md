scrounge-ntfs(8)                                                                  BSD System Manager's Manual                                                                  scrounge-ntfs(8)

NAME
     scrounge-ntfs — helps retrieve data from corrupted NTFS partitions

SYNOPSIS
     scrounge-ntfs -l disk
     scrounge-ntfs -s disk
     scrounge-ntfs [-m mftoffset] [-c clustersize] [-o outdir] disk start end

DESCRIPTION
     scrounge-ntfs is a utility that can rescue data from corrupted NTFS partitions. It writes the files retrieved to another working file system. Certain information about the partition
     needs to be known in advance.

     The -l mode is meant to be run in advance of the data corruption, with the output stored away in a file. This allows scrounge-ntfs to recover data reliably. See the 'NOTES' section below
     for recover info when this isn't the case.

OPTIONS
     The options are as follows:

     -c          The cluster size (in sectors). When not specified a default of 8 is used.

     -l          List partition information for a drive. This will only work when the partition table for the given drive is intact.

     -m          When recovering data this specifies the location of the MFT from the beginning of the partition (in sectors). If not specified then no directory information can be used, that
                 is, all rescued files will be written to the same directory.

     -o          Directory to put rescued files in. If not specified then files will be placed in the current directory.

     -s          Search disk for partition information. (Not implemented yet).

     disk        The raw device used to access the disk which contains the NTFS partition to rescue files from. eg: '/dev/hdc'

     start       The beginning of the NTFS partition (in sectors).

     end         The end of the NTFS partition (in sectors)

NOTES
     If you plan on using this program successfully you should prepare in advance by storing a copy of the partition information. Use the -l option to do this. Eventually searching for disk
     partition information will be implemented, which will solve this problem.

     When only one partition exists on a disk or you want to rescue the first partition there are ways to guess at the sector sizes and MFT location. See the scrounge-ntfs web page for more
     info:

     http://thewalter.net/stef/software/scrounge

AUTHOR
     Stef Walter <stef@thewalter.net>

scrounge-ntfs                                                                            March 30, 2021                                                                           scrounge-ntfs
