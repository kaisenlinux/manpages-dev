  TMFS
 
## NAME
        tmfs - Time Machine File System
 
## SYNOPSIS
        tmfs hfs-root-mount time-machine-mount [fuse options...]
 
## DESCRIPTION
        tmfs  creates  a  read-only  virtual filesystem which helps you to read your Apple Time Machine backup by reconstructing the hard-linked directories from the
        HFS+ metadata directory.
 
        You can browse the mounted time-machine-mount normally and recover data from any backup point.
 
        tmfs must be run as the root user, but the mounted time-machine-mount can be accessed by any user, based upon the options passed to F## USE. See## OPTIONSbelow.
 
## OPTIONS
        hfs-root-mount
               The path to the mount point of your HFS+ Time Machine volume.
               You must mount the Time Machine device prior to running tmfs.  See the EXAMPLES section below.
 
        time-machine-mount
               The path where the Time Machine will be mounted.  This should be an empty directory.
 
        fuse options
               A comma separated list of options that will be passed to fuse(8).  See fuse(8) for available options. To be able to access the volume under  a  normal
               user account you should set the uid, gid and allow_other options.
 
## EXAMPLES
        mkdir /mnt/hfs /mnt/tm
        mount /dev/sdXX /mnt/hfs
        tmfs /mnt/hfs /mnt/tm -ouid=$(id -u $## USER),gid=$(id -g $## USER),allow_other
 
## AUTHORS
        Alexandre Bique <bique.alexandre@gmail.com>
 
        This manual page was contributed for Debian by
        Nicholas Robinson-Wall <nick@robinson-wall.com>
 
## SEE ALSO
        fuse(8)
 
                                                                           October 31, 2012                                                                   TMFS(1)
