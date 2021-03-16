VMFS6-LVM(8)                                                                 vmfs-tools                                                                 VMFS6-LVM(8)

NAME
       vmfs6-lvm - VMFS6 logical volume manager tool

SYNOPSIS
       vmfs6-lvm VOLUME... COMMAND

DESCRIPTION
       The vmfs6-lvm program allows handle VMFS6 physical and logical volumes.

       The VOLUME to be opened can be either a block device or an image file. When the VMFS spreads accross several extents, all extents must be given.

COMMANDS
       remove
           Removes the last extent of the logical volume. THIS IS EXPERIMENTAL. USE AT YOUR OWN RISK. It is highly recommended that the volume is not mounted at the
           same time. This means the tool shouldn’t be run on the ESX service console.

AUTHORS
       Christophe Fillot <cf@utc.fr[1]>, Mike Hommey <mh@glandium.org[2]> Weafon Tsao <weafon.tsao@accelstor.com[3]> Thomas Ward <teward@ubuntu.com[4]>

SEE ALSO
       vmfs6-fuse(8)

NOTES
        1. cf@utc.fr
           mailto:cf@utc.fr

        2. mh@glandium.org
           mailto:mh@glandium.org

        3. weafon.tsao@accelstor.com
           mailto:weafon.tsao@accelstor.com

        4. teward@ubuntu.com
           mailto:teward@ubuntu.com

  0.0.0-patched                                                              12/29/2019                                                                 VMFS6-LVM(8)
