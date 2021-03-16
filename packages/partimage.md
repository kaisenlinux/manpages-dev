  partimage
 
## NAME
        partimage - back up and restore disk partitions
 
## SYNOPSIS
        partimage  [  -bcdehimMnoSvwy  ]  [-B 'pattern response string']  [-z compresslevel] [-V volumesize] [-f actionatend] [-s server] [-p port] [-a mountoptions]
        [-U username] [-P password] [-g loglevel] [ save device image_file ]
        partimage [ -bcdehimMnoSvwy ] [-B 'pattern response string'] [-z compresslevel]  [-V volumesize]  [-f actionatend]  [-s server]  [-p port]  [-a mountoptions]
        [-U username] [-P password] [-g loglevel] [ restore device image_file/'stdin' ]
        partimage [ restmbr image_file ]
        partimage [ imginfo image_file ]
 
## DESCRIPTION
        partimage backs up disk partitions into image files and restores them.
 
## OPTIONS
        -z val, --compress val
               Set image file compression level:
               val=0: don't compress: very fast but very big image file
               val=1: compress using gzip: fast and small image file (default)
               val=2: compress using bzip2: very slow and very small image file
 
        -c, --nocheck
               Don't check the partition before saving.
 
        -o, --overwrite
               Overwrite the existing image file without confirmation.
 
        -d, --nodesc
               Don't ask any description for the image file.
 
        -V vol, --volume vol
               Split image into multiple volumes files. vol will be the size in KB of volumes.
 
        -w, --waitvol
               Wait for a confirmation after each volume change.
 
        -e, --erase
               Erase empty blocks on restore with zero bytes.
 
        -m, --allowmnt
               Don't fail if the partition is mounted. Dangerous!
 
        -M, --nombr
               Don't create a backup of the MBR (Mast Boot Record) in the image file.
 
        -h, --help
               Show help.
 
        -v, --version
               Show version.
 
        -f action, --finish action
               Action to do if finished successfully:
               action=0: wait (do nothing)
               action=1: halt (power off the computer)
               action=2: reboot (restart the computer)
               action=3: quit
 
        -b, --batch
               batch mode: the GUI won't wait for an user action.
 
        -B 'pattern response string', --fully-batch 'pattern response string'
               full  batch  mode: the GUI is not being displayed. Rather status messages are displayed as normal text.  The pattern response string has the following
               format:
               ´<glob-pattern>=<response-value>;...´
               where the glob pattern is matched against the string <window-title>/<message-text> of the message dialogue box to be displayed. For dialog boxes  with
               buttons in the window, the <response> must be the exact button text.  The pattern response string usually needs to be quoted as above.
 
        -y, --nosync
               Don't synchronize the disks at the end of the operation. Dangerous!
 
        -s addr, --server addr
               Give partimaged server's ip address.
 
        -p port, --port port
               Give partimaged server's listening port.
 
        -g debuglevel, --debug debuglevel
               Set the debug level to debuglevel (defaults to 1).
 
        -n, --nossl
               Disable SSL in network mode.
 
        -S, --simulate
               Simulation of restoration mode.
 
        -a str, --automnt str
               Automatic mount with X options. Read the doc for more details.
 
        -U name, --username=name
               Username to authenticate to partimage server.
 
        -P pass, --password=pass
               Password for authentication of user to partimage server.
 
## EXAMPLE
        partimage -z1 -o -d save /dev/hda12 /mnt/backup/redhat-6.2.partimg.gz
        partimage -z1 -om save /dev/hda9 /mnt/backup/win95-osr2.partimg.gz
        partimage restore /dev/hda13 /mnt/backup/suse-6.4.partimg
        cat debian.partimg.000 debian.partimg.001 | partimage restore /dev/hda1 stdin
        partimage restmbr /mnt/backup/debian-potato-2.2.partimg.bz2
        partimage imginfo /mnt/backup/debian-potato-2.2.partimg.bz2
 
## SEE ALSO
        partimaged(8)
 
 DIAGNOSTICS
        You can read options set at compile time running 'partimage -i'.
 
        When using batchmode, exit status is normaly 0.
 
 CAVEATS
        Supported file systems: Ext2/3, Reiser3, FAT16/32, HPFS, JFS, XFS, UFS(beta), HFS(beta), NTFS(experimental)
 
        FAT12 will never be supported.
 
## BUGS
        Refer to## BUGSfile to read them.
 
## AUTHOR
        Franck Ladurelle <ladurelf@partimage.org>
        Francois Dupoux  <fdupoux@partimage.org>
 
 3rd Berkeley Distribution                                                   30 May, 2002                                                                partimage(1)
