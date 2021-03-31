DISLOCKER-FUSE(1)                                                                        DISLOCKER-FUSE                                                                       DISLOCKER-FUSE(1)

NAME
       Dislocker-fuse - Read/write BitLocker encrypted volumes under Linux, OSX and FreeBSD.

SYNOPSIS
       dislocker-fuse [-hqrsv] [-l LOG_FILE] [-O OFFSET] [-V VOLUME DECRYPTMETHOD -F[N]] [-- ARGS...]

       Where DECRYPTMETHOD = {-p[RECOVERY_PASSWORD] | -f BEK_FILE | -u[USER_PASSWORD] | -k FVEK_FILE | -K VMK_FILE | -c}

DESCRIPTION
       Given a decryption mean, the program is used to read or write BitLocker encrypted volumes. Technically, the program will create a virtual NTFS partition that you can mount as any other
       NTFS partition.

       The virtual partition is linked to the underlying BitLocker volume, so any write to this volume is put on the BitLocker volume as well. However, you can use dd(1) to get  rid  of  this
       limitation -- if it's a limitation for you. An example is provided in the EXAMPLES section of this man page.

OPTIONS
       Program's options are described below:

       -c, --clearkey
              decrypt volume using a clear key which is searched on the volume (default)

       -f, --bekfile BEK_FILE
              decrypt volume using the bek file (present on a USB key)

       -F, --force-block=[N]
              force use of metadata block number N (1, 2 or 3).  Without N, the first block is forced.  Without this option, the program will try each block until a valid one is found

       -h     print the help and exit

       -k, --fvek FVEK_FILE
              decrypt volume using the FVEK directly.  See the FVEK FILE section below to understand what is to be put into this FVEK_FILE

       -K, --vmk VMK_FILE
              decrypt volume using the VMK directly.  See the VMK FILE section below to understand what is to be put into this VMK_FILE

       -l, --logfile LOG_FILE
              put messages into this file (stdout by default)

       -O, --offset OFFSET
              BitLocker  partition offset, in bytes, in base 10 (default is 0).  Protip: in your shell, you probably can pass -O $((0xdeadbeef)) if you have a 16-based number and are too lazy
              to convert it in another way.

       -p, --recovery-password=[RECOVERY_PASSWORD]
              decrypt volume using the recovery password method.  If no recovery-password is provided, it will be asked afterward; this has the advantage that the program will  validate  each
              block one by one, on the fly, as you type it and not to leak the password on the commandline

       -q, --quiet
              do NOT display any information.  This option has priority on any previous `-v'. One probably wants to check the return value of the program when using this option

       -r, --readonly
              do not allow one to write on the BitLocker volume (read only mode)

       -s, --stateok
              do not check the volume's state, assume it's ok to mount it.  Do not use this if you don't know what you're doing

       -u, --user-password=[USER_PASSWORD]
              decrypt  the volume using the user password method.  If no user-password is provided, it will be asked afterward; this has the advantage not to leak the password on the command‐
              line

       -v, --verbosity
              increase verbosity (CRITICAL level by default), see also `-q'

       -V, --volume VOLUME
              volume to get metadata and encrypted keys from

       --     mark the end of program's options and the beginning of FUSE's ones (useful if you want to pass something like -d to FUSE)

       ARGS are any arguments you want to pass to FUSE. Note that you need to pass at least the mount-point.

FVEK FILE
       The FVEK file option expects a specific format from the file. The file is split into two major parts:
              - 2 bytes describing the encryption in use, from 0x8000 to 0x8003 for AES 128 or 256 bits, with or without diffuser.

              - 64 bytes (512 bits) which are the FVEK as in the FVEK key protector once decrypted.

       The file is therefore 66 bytes long, not more nor less.  Note that you may have to deal with endianness.

EXAMPLES
       These are examples you can run directly.  First, you may want to copy the BitLocker volume:

              % dd if=/dev/sda2 of=encrypted.bitlocker

              This will copy the entire volume located into /dev/sda2 to encrypted.bitlocker.  You're not forced to do this step, but this will ensure no write whatsoever is performed on  the
              BitLocker volume.

       Then dislock it:

              % dislocker -V encrypted.bitlocker -f /path/to/usb/file.BEK -- /mnt/ntfs

              This will create a file into /mnt/ntfs named dislocker-file.

       To mount partitions once decrypted, use this sort of line:
              % mount -o loop /mnt/ntfs/dislocker-file /mnt/clear

       --

       It  seems  that  you have to unmount the NTFS partition and the dislocker one before halting the system, or you will run into unexpected behaviour. In order to do so, you may run these
       commands (replacing your mount points):
              % umount /mnt/clear && umount /mnt/ntfs/dislocker-file

       --

       Note that these are examples and, as such, may need to be modified. For instance, you may want to change the decryption method used in them.

AUTHOR
       This tool is developed by Romain Coltel on behalf of HSC (http://www.hsc.fr/)

       Feel free to send bugs report to <dislocker __AT__ hsc __DOT__ fr>

Linux                                                                                      2011-09-07                                                                         DISLOCKER-FUSE(1)
