  VMFS-F## USE
 
## NAME
        vmfs-fuse - mount VMFS file system
 
## SYNOPSIS
        vmfs-fuse VOLUME... MOUNT_POINT
 
## DESCRIPTION
        The vmfs-fuse program allows to mount VMFS file systems.
 
        The VOLUME to be opened can be either a block device or an image file. When the VMFS spreads accross several extents, all extents must be given.
 
        The MOUNT_POINT indicates where the file system will be attached on the system.
 
## AUTHORS
        Christophe Fillot <cf@utc.fr[1]>, Mike Hommey <mh@glandium.org[2]>
 
## SEE ALSO
        debugvmfs(8)
 
## NOTES
         1. cf@utc.fr
            mailto:cf@utc.fr
 
         2. mh@glandium.org
            mailto:mh@glandium.org
 
   0.0.0.0.                                                                   03/25/2012                                                                 VMFS-F## USE(8)
