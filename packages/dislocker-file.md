DISLOCKER(1)                                                                             DISLOCKER                                                                            DISLOCKER(1)

NAME
       Dislocker-file - Read BitLocker encrypted volumes under Linux, OSX and FreeBSD.

SYNOPSIS
       dislocker-file [-hqrsv] [-l LOG_FILE] [-O OFFSET] [-V VOLUME DECRYPTMETHOD -F[N]] [--] NTFS_FILE

       Where DECRYPTMETHOD = {-p[RECOVERY_PASSWORD] | -f BEK_FILE | -u[USER_PASSWORD] | -k FVEK_FILE | -K VMK_FILE | -c}

DESCRIPTION
       Given a decryption mean, the program is used to decrypt BitLocker encrypted volumes.

       This  process may take a very long time, depending on the initial volume size, as the program will decrypt the encrypted partition linearly. About this size, note that the created
       NTFS file will be of the same size as the BitLocker encrypted partition, so you may want to check that you have enough free space on the volume where you put the NTFS file.

       This NTFS file won't have any link with the original BitLocker encrypted partition, so you may modify it to suit your needs.

OPTIONS
       For program's options description, see dislocker-fuse(1). The only change in the command line is the last argument, which in this case is the NTFS_FILE argument:

       NTFS_FILE
              the newly created file where NTFS data will be put to, once decrypted from the BitLocker encrypted volume.

EXAMPLES
       These are examples you can run directly.

       Dislock the BitLocker encrypted volume:

              % dislocker-file -V /dev/sda2 -p563200-557084-108284-218900-019151-415437-694144-239976 -- decrypted.ntfs

              This will decrypt /dev/sda2 into decrypted.ntfs using the recovery password method.

       To mount the partition once decrypted, use this sort of line:
              % mount -o loop decrypted.ntfs /mnt/clear

       --

       You may have to unmount the NTFS partition before halting the system. In order to do so, you may run this command (replacing your mount point):
              % umount /mnt/clear

       --

       Note that these are examples and, as such, you may need to modify the given command lines. For example, you may want to change the decryption method used in them.

AUTHOR
       This tool is developed by Romain Coltel on behalf of HSC (http://www.hsc.fr/)

       Feel free to send bugs report to <dislocker __AT__ hsc __DOT__ fr>

Linux                                                                                   2011-09-07                                                                            DISLOCKER(1)
