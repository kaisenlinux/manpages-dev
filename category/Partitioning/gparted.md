GPARTED(8)                                                                            GParted Manual                                                                            GPARTED(8)

NAME
       gparted - GNOME Partition Editor for manipulating disk partitions.

SYNOPSIS
       gparted [device]...

DESCRIPTION
       The gparted application is the GNOME partition editor for creating, reorganizing, and deleting disk partitions.

       A  disk  device can be subdivided into one or more partitions.  The gparted application enables you to change the partition organization on a disk device while preserving the con‐
       tents of the partition.

       With gparted you can accomplish the following tasks:
       - Create a partition table on a disk device.
       - Enable and disable partition flags such as boot and hidden.
       - Perform actions with partitions such as create, delete, resize, move, check, label, copy, and paste.

       More documentation can be found in the application help manual, and online at:
       https://gparted.org

EXAMPLES
       You can run gparted from a command line and specify one or more disk devices.

       For example, to start gparted with the devices /dev/sda and /dev/sdc you would use the following command:

       gparted /dev/sda /dev/sdc

NOTES
       Editing partitions has the potential to cause LOSS of DATA.

       The gparted application is designed to enable you to edit partitions while reducing the risk of data loss.  The application is carefully tested and is used by the GParted  project
       team.  However, loss of data might occur due to software bugs, hardware problems, or power failure.

       You can help to reduce the risk of data loss by not mounting or unmounting partitions outside of the gparted application while gparted is running.

       You are advised to BACKUP your DATA before using the gparted application.

REPORTING BUGS
       Report bugs at:
       https://gparted.org/bugs.php

AUTHOR
       Manual page written by Curtis Gedak <gedakc@users.sf.net>

SEE ALSO
       parted(8), fdisk(8), mkfs(8), ntfsprogs(8)

gparted                                                                               Jan 16th, 2011                                                                            GPARTED(8)
