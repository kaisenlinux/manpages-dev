FSCK.VMFS(8)                                                                               vmfs-tools                                                                              FSCK.VMFS(8)

NAME
       fsck.vmfs - VMFS file system check utility

SYNOPSIS
       fsck.vmfs VOLUME...

DESCRIPTION
       The fsck.vmfs performs various integrity checks on a VMFS file system.

       The VOLUME to be opened can be either a block device or an image file. When the VMFS spreads accross several extents, all extents must be given.

AUTHORS
       Christophe Fillot <cf@utc.fr[1]>, Mike Hommey <mh@glandium.org[2]>

SEE ALSO
       debugvmfs(8)

NOTES
        1. cf@utc.fr
           mailto:cf@utc.fr

        2. mh@glandium.org
           mailto:mh@glandium.org

  0.0.0.0.                                                                                 03/25/2012                                                                              FSCK.VMFS(8)
