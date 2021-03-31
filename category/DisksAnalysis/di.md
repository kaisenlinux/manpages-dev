di(1)                                                                               General Commands Manual                                                                               di(1)

Name
       di - disk information

Synopsis
       di  [-AacghHklLmnPqRtZ]  [-B block-size] [-d display-size] [-f format] [-I include-fstyp-list] [-s sort-type] [-w block-width] [-W inode-width] [-x exclude-fstyp-list] [-X debug-level]
       [-z zone-name] [file [...]]

       mi

Description
       di Displays usage information on mounted filesystems.  Block values are reported in a human readable format.  If the user or group has a disk quota, the values  reported  are  adjusted
       according the quotas that apply to the user.

       If file is specified, the usage information for the partition on which file is located is printed.

       Unless  the -a flag is specified, the following mounted filesystems will not normally be displayed: filesystems with total space <= 0; loopback filesystems that are duplicates of other
       normally mounted filesystems (filesystem type of 'lofs' , 'none', or 'nullfs'); loopback filesystems that are part of a zone (Solaris).

       Filesystems that the user does not have permissions to access will not be displayed at all.

       mi Displays the mounted filesystem information.

       Several options may be specified to control the output of di and mi:

       -A     Print all fields (used for debugging).  Mount points and special device names are printed at full width.

       -a     (compatibility: --all)
              Prints all mounted devices (normally, those with 0 total space are not printed - e.g. /dev/proc, /dev/fd).

       -B     block-size (compatibility: --block-size, -b)
              Change the base block size from 1024 (default) to the size specified.  block-size may be one of: k - 1024 bytes, si - 1000 bytes, or a specific size.

       -c     (alias: --csv-output)
              Comma separated values are output.  The titles are output as the format string specifiers.  Totals are turned off. See also the -n flag.

       -C     (alias: --csv-tabs)
              Values are output with tab separators.  See also the -c option.

       -d     display-size (alias: --display-size)
              Display the usage in units specified by display-size.  Note that if the base block size is SI units of 1000 bytes, the display  size  is  calculated  using  those  units.   dis‐
              play-size  may be one of: 512 - POSIX, k - kilobytes, m - megabytes, g - gigabytes, t - terabytes, p - petabytes, e - exabytes, z - zettabytes, y - yottabytes, h - Scaled alter‐
              native 1, H - Scaled alternative 2, or a specific value to use as the block size.

              Block display sizes greater than 1024 bytes are displayed with a precision of one decimal place after the radix.

              The Scaled alternatives scale the sizes displayed and appends a suffix (e.g. 48.0k, 3.4M).

              With scaled alternative 1, sizes within a line may scale to different units.

              Scaled alternative 2 scales all the sizes in each individual line to the same unit size (the largest needed).

       -f     format Use the specified format string format.  See the Format Strings section.

       -g     (alias for: -dg)
              Display sizes in gigabytes.

       -h     (alias for: -dh)
              Display partition sizes in scaled alternative 1 format.

       --help
              Display some basic usage information.

       -H     (alias for: -dH; compatibility: --human-readable)
              Display partition sizes in scaled alternative 2 format.

       -I     include-fstype-list (compatibility: -F, --type)
              Include only the file system types listed in include-fstyp-list.  The list is a comma separated list of file system types.  Multiple -I options may be specified.  If the  'fuse'
              filesystem type is specified, all fuse* filesystems will be included.
              e.g. -I nfs,tmpfs or -I nfs -I tmpfs.

       --inodes
              Ignored.  Use the -f option.

       -k     (alias for: -dk)
              Display sizes in Kbytes.

       -l     (compatibility: --local)
              Display only local file systems.

       -L     Turn off check for duplicate filesystems (loopback (lofs/none) mounts).

       -m     (alias for: -dm)
              Display sizes in megabytes.

       -n     Do not print a header line above the list of file systems.  Useful when parsing the output of di.

       --no-sync
              Ignored.

       -P     (compatibility: --portability)
              Output format is POSIX standard.  512 byte block size is the default.  The -k option may be used.

       --print-type
              Ignored.  Use the -f option.

       -q     Disable quota checks.

       -R     (also: --dont-resolve-symlinks)
              Do not resolve symlinks (for mount points that have a trailing UUID).

       -s     sort-type
              Use  sort-type  to  sort the output.  The output of di is normally sorted by mount point.  The following sort flags may be used to change the sort order: m - by mount point (de‐
              fault); n - leave unsorted (as it appears in the mount table); s - by special device name; T - by total space; f - by free space; a - by available space; t - by filesystem type;
              r - reverse the sort order; This will apply to all sort flags following this sort flag.

              These sort options may be combined in any order.  e.g.:
              di -stsrm # by type, special, reversed mount;
              di -strsrm # by type, reversed special, mount.

       --si   An alias for -dH -Bsi.

       --sync Ignored.

       -t     (compatibility: --total)
              Print  a  totals line below the list of file systems.  Pooled filesystems (zfs, advfs) have only the main pool added to the total.  It is up to the user to exclude (using the -x
              option) read-only filesystems (cdfs, iso9660), swap-based (memfs, mfs, tmpfs) filesystems and user (fuse*) filesystems.  Excluding the 'fuse' filesystem will exclude  all  fuse*
              filesystems.

       -w     block-width
              Set the print width for block values.  The default is eight.

       -v     Ignored.

       --version
              Display di's version and default format string.

       -W     inode-width
              Set the print width for inode values.  Default is seven.

       -x     exclude-fstype-list (compatibility: --exclude-type)
              Exclude  the  file  system  types  listed  in exclude-fstyp-list.  The list is a comma separated list of file system types.  Multiple -x options may be specified.  If the 'fuse'
              filesystem type is excluded, all fuse* filesystems will be excluded.  e.g. -x nfs,tmpfs or -x nfs -x tmpfs.

       -X     level
              Set the program's debugging level to debug-level.

       -z     zone-name
              Display the filesystems for the specified zone.  The zone must be visible to the user.

       -Z     (alias for: -z all)
              Display the filesystems for all visible zones.

Format Strings
       The output of di may be specified via a format string.  This string may be given either via the -f command line option or as part of  the  DI_ARGS  environment  variable.   The  format
       string may specify the following columns:

       m      Print the name of the mount point.

       M      Print the name of the mount point, at full length.  The mount point is formatted to the maximum width necessary for the longest mount point name.

       s      Print the file system name (special device or remote mount point).

       S      Print  the file system name (special device or remote mount point), at full length.  The file system name is formatted to the maximum width necessary for the longest file system
              name.

       t      Print the file system type.

       T      Print the file system type at full length.  The file system type is formatted to the maximum width necessary for the longest file system type.

       Total Available

       b      Print the total number of megabytes on the file system.

       B      Print the total number of megabytes on the file system available for use by normal users.

       In Use

       u      Print the number of megabytes in use on the file system (actual number of megabytes used = total - free).

       c      Print the number of megabytes not available for use by normal users (total - available).

       Free

       f      Print the number of free (unused) megabytes on the file system.

       v      Print the number of megabytes available for use by normal users.

       Percentage Used

       p      Print the percentage of megabytes not available for use by normal users (number of megabytes not available for use / total disk space).

       1      Print the percentage of total megabytes in use (actual number of megabytes used / total disk space).

       2      Print the percentage of megabytes in use, BSD-style.  Represents the percentage of user-available space in use.  Note that values  over  100%  are  possible  (actual  number  of
              megabytes used / disk space available to non-root users).

       Percentage Free

       a      Print the percentage of megabytes available for use by normal users (number of megabytes available for use / total disk space).

       3      Print the percentage of total megabytes free (actual number of megabytes free / total disk space).

       Inodes

       i      Print the total number of file slots (inodes) that can be created on the file system.

       U      Print the number of file slots in use.

       F      Print the number of file slots available.

       P      Print the percentage of file slots in use.

       Mount Information

       I      Print the time the filesystem was mounted.  This column is not supported on all systems.

       O      Print the filesystem mount options.

       The default format string for di is smbuvpT.

       The default format string for mi is MSTIO.

       The  format  string  may also contain any other character not listed above.  The character will be printed as is.  e.g. di -f 'mbuvp|iUFP' will print the character '|' between the disk
       usage and the file slot usage.  The command sequence:
              di -f 'mbuvp
              miUFP'
       will print two lines of data for each filesystem.

Examples
       Various df equivalent format strings for System V release 4 are:
              /usr/bin/df -v     di -P -f msbuf1
              /usr/bin/df -k     di -dk -f sbcvpm
              /usr/ucb/df        di -dk -f sbuv2m
       GNU df:
              df                 di -dk -f SbuvpM -w 10
              df -T              di -dk -f STbuvpM -w 10
       AIX df:
              df                 di -d 512 -f Sbf1UPM -w 10
              df -I              di -d 512 -f Sbuf1M
              df -I -M           di -d 512 -f SMbuf1 -w 10
       HP-UX bdf:
              bdf                di -d k -f Sbuv2M
              bdf -i             di -d k -f Sbuv2UFPM

       If you like your numbers to add up/calculate the percentage correctly, try one of the following format strings:

              di -f SMbuf1T
              di -f SMbcvpT
              di -f SMBuv2T

Environment Variables
       The DI_ARGS environment variable may be used to specify command line arguments.  e.g. If you always want gigabytes displayed, set DI_ARGS equal to "-dg".  Any  command  line  arguments
       specified will override the DI_ARGS environment variable.

       The DI_LOCALE_DIR environment variable may be used to specify the location of the di program's locale message files.

       The GNU df POSIXLY_CORRECT, and DF_BLOCK_SIZE and the BSD BLOCKSIZE environment variables are honored.

Note
       For filesystems that do not report available space (e.g. System V release 3), the number of available space is set to the free space.

WARNING
       Do not replace your system's df command with this program.  You will in all likelihood break your installation procedures.

See Also
       df(1), fstab(5), getmnt(2), getmntinfo(2), mnttab(4), mount(1M) statfs(2), statvfs(2)

Bugs
       Send bug reports to: brad.lanam.di_at_gmail.com

       Known Issues:

       di will probably not process a zettabyte or yottabyte sized filesystem properly due to overflow of a long long.

Website
       https://gentoo.com/di/

Author
       This program is Copyright 1994-2011 by Brad Lanam.

       Brad Lanam, Walnut Creek, CA (brad.lanam.di_at_gmail.com)

                                                                                          17 Jan 2013                                                                                     di(1)
