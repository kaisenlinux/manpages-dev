VMFS6-FUSE(8)                                                                           vmfs-tools                                                                           VMFS6-FUSE(8)

NAME
       vmfs6-fuse - mount VMFS6 file systems

SYNOPSIS
       vmfs6-fuse VOLUME... MOUNT_POINT

DESCRIPTION
       The vmfs6-fuse program allows to mount VMFS file systems.

       The VOLUME to be opened can be either a block device or an image file. When the VMFS spreads accross several extents, all extents must be given.

       The MOUNT_POINT indicates where the file system will be attached on the system.

AUTHORS
       Christophe Fillot <cf@utc.fr[1]>, Mike Hommey <mh@glandium.org[2]> Weafon Tsao <weafon.tsao@accelstor.com[3]> Thomas Ward <teward@ubuntu.com[4]>

SEE ALSO
       debugvmfs6\(8)

NOTES
        1. cf@utc.fr
           mailto:cf@utc.fr

        2. mh@glandium.org
           mailto:mh@glandium.org

        3. weafon.tsao@accelstor.com
           mailto:weafon.tsao@accelstor.com

        4. teward@ubuntu.com
           mailto:teward@ubuntu.com

  0.0.0-patched                                                                         12/29/2019                                                                           VMFS6-FUSE(8)
