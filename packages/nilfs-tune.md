  NILFS-TUNE
 
## NAME
        nilfs-tune - adjust tunable file system parameters on NILFS file system
 
## SYNOPSIS
        nilfs-tune [options] device
 
## DESCRIPTION
        nilfs-tune is a utility to modify tunable file system parameters on NILFS2 file system in device.
 
        This command is valid for inactive NILFS2 file systems.  Modifying active mounts may cause severe damage.
 
## OPTIONS
        -f     Force to modify even the specified file system is mounted.
 
        -i interval
               Set the commit interval of segment.
 
        -m block-max
               Set the threshold of the data amount of the segment construction.
 
        -l     List the contents of the file system superblock, including the current values of the parameters that can be set via this program.
 
        -L volume-label
               Set the volume label of the file system.  NILFS2 file system labels can be at most 80 bytes long.  If volume-label is longer than 80 bytes, nilfs-tune
               will truncate it.  The volume label can be used mount(8) and /etc/fstab(5) (and possibly others) by specifying LABEL=volume-label instead of  a  block
               special device name like /dev/sda5.
 
        -O [^]feature[,...]
               Set or clear the indicated filesystem features (options) in the filesystem.  More than one filesystem feature can be cleared or set by separating fea‐
               tures with commas.  Filesystem features prefixed with a caret character ('^') will be cleared in  the  filesystem's  superblock;  filesystem  features
               without a prefix character will be added to the filesystem.
 
               The following filesystem feature can be set or cleared using nilfs-tune:
 
               block_count
                      Enable  block count per checkpoint.  After setting this option, fsck should be run on the filesystem to make the counts right, but no fsck tool
                      is available yet, sorry.
 
        -U UUID
               Set the universally unique identifier (UUID) of the file system to UUID.  The format of the UUID is a series of hex digits separated by hyphens,  like
               this: "c1b9d5a2-f162-11cf-9ece-0020afc76f16".
 
        -h     Display help message and exit.
 
## AUTHOR
        Jiro SEKIBA <jir@unicus.jp>
 
 AVAILABILITY
        nilfs-tune is part of the nilfs-utils package and is available from https://nilfs.sourceforge.io.
 
## SEE ALSO
        nilfs(8), lscp(1), chcp(8), mkcp(8), rmcp(8).
 
 nilfs-utils version 2.2                                                       Apr 2014                                                                 NILFS-TUNE(8)
