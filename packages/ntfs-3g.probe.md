NTFS-3G.PROBE(8)                                                                  System Manager's Manual                                                                 NTFS-3G.PROBE(8)

NAME
       ntfs-3g.probe - Probe an NTFS volume mountability

SYNOPSIS
       ntfs-3g.probe <--readonly|--readwrite> volume

DESCRIPTION
       The  ntfs-3g.probe  utility  tests  a  volume if it's NTFS mountable read-only or read-write, and exits with a status value accordingly.  The volume can be a block device or image
       file.

OPTIONS
       Below is a summary of the options that ntfs-3g.probe accepts.

       -r, --readonly
              Test if the volume can be mounted read-only.

       -w, --readwrite
              Test if the volume can be mounted read-write.

       -h, --help
              Display help and exit.

EXAMPLE
       Test if /dev/sda1 can be mounted read-write:

              ntfs-3g.probe --readwrite /dev/sda1

EXIT CODES
       The exit codes are as follows:

       0      Volume is mountable.

       11     Syntax error, command line parsing failed.

       12     The volume doesn't have a valid NTFS.

       13     Inconsistent NTFS, hardware or device driver fault, or unsetup SoftRAID/FakeRAID hardware.

       14     The NTFS partition is hibernated.

       15     The volume was not cleanly unmounted.

       16     The volume is already exclusively opened and in use by a kernel driver or software.

       17     Unsetup SoftRAID/FakeRAID hardware.

       18     Unknown reason.

       19     Not enough privilege to mount.

       20     Out of memory.

       21     Unclassified FUSE error.

KNOWN ISSUES
       Please see

              https://github.com/tuxera/ntfs-3g/wiki/NTFS-3G-FAQ

       for common questions and known issues.  If you think you have found an undocumented problem in the latest release of the software then please post an ntfs-3g issue  describing  it
       in detail so that the development team can be aware of the issue and take care of it:

              https://github.com/tuxera/ntfs-3g/issues

AUTHORS
       ntfs-3g.probe was written by Szabolcs Szakacsits.

THANKS
       Alon Bar-Lev has integrated the utility into the NTFS-3G build process and tested it with Erik Larsson before the public release.

SEE ALSO
       ntfs-3g(8)

ntfs-3g.probe 2021.8.22                                                                January 2008                                                                       NTFS-3G.PROBE(8)
