VMFS-LVM(8)                                                                                vmfs-tools                                                                               VMFS-LVM(8)

NAME
       vmfs-lvm - VMFS logical volume manager tool

SYNOPSIS
       vmfs-lvm VOLUME... COMMAND

DESCRIPTION
       The vmfs-lvm program allows handle VMFS physical and logical volumes.

       The VOLUME to be opened can be either a block device or an image file. When the VMFS spreads accross several extents, all extents must be given.

COMMANDS
       remove
           Removes the last extent of the logical volume. THIS IS EXPERIMENTAL. USE AT YOUR OWN RISK. It is highly recommended that the volume is not mounted at the same time. This means the
           tool shouldn’t be run on the ESX service console.

AUTHORS
       Christophe Fillot <cf@utc.fr[1]>, Mike Hommey <mh@glandium.org[2]>

SEE ALSO
       vmfs-fuse(8)

NOTES
        1. cf@utc.fr
           mailto:cf@utc.fr

        2. mh@glandium.org
           mailto:mh@glandium.org

  0.0.0.0.                                                                                 03/25/2012                                                                               VMFS-LVM(8)
