NTFSWIPE(8)                                                            System Manager's Manual                                                           NTFSWIPE(8)

NAME
       ntfswipe - overwrite unused space on an NTFS volume

SYNOPSIS
       ntfswipe [options] device

DESCRIPTION
       ntfswipe clears all or part of unused space on an NTFS volume by overwriting with zeroes or random bytes.

OPTIONS
       Below  is  a  summary  of all the options that ntfswipe accepts.  Nearly all options have two equivalent names.  The short name is preceded by - and the long
       name is preceded by --.  Any single letter options, that don't take an argument, can be combined into a single command, e.g.  -fv is  equivalent  to  -f  -v.
       Long named options can be abbreviated to any unique prefix of their name.

       -a, --all
              Wipe all unused space. This may take significant time. If the option --unused-fast (or -U) is also present, the faster wiping method is used.

       -b, --bytes BYTE-LIST
              Define  the  allowed  replacement bytes which are drawn randomly to overwrite the unused space. BYTE-LIST is a comma-separated list of values in range
              0-255 expressed in octal, decimal or hexadecimal base.

       -c, --count NUM
              Define the number of times the unused space is to be overwritten. If both options --bytes and --count are set, the  space  is  repeatedly  overwritten
              this number of times by each of the values in the list.

       -d, --directory
              Wipe all the directory indexes, which may contain names of deleted files.

       -f, --force
              This will override some sensible defaults, such as not using a mounted volume.  Use this option with caution.

       -h, --help
              Show a list of options with a brief description of each one.

       -i, --info
              Display details about unused space, without wiping anything.

       -l, --logfile
              Overwrite the logfile (update journal).

       -m, --mft
              Overwrite the unused space in the MFT (main file table, which contains the file names, and the contents of short files).

       -n, --no-action
              Executes the wiping process without writing to device.

       -p, --pagefile
              Overwrite the Windows swap space.

       -q, --quiet
              Suppress some debug/warning/error messages.

       -s, --undel
              Overwrite  the  space  which had been allocated to a file which has been deleted recently and is still undeletable. This option is not compatible with
              --bytes and the replacement bytes are random ones or taken from a standard list.

       -t, --tails
              Overwrite the space at the end of files which is unused, but allocated because the allocations are always done by full clusters.

       -u, --unused
              Overwrite the space which is currently not allocated to any file (but may have been used in the past).

       -U, --unused-fast
              Overwrite the space which is currently not allocated to any file, trying not to overwrite the space not written to since the previous wiping.

       -v, --verbose
              Display more debug/warning/error messages. This option may be used twice to display even more messages.

       -V, --version
              Show the version number, copyright and license of ntfswipe.

EXAMPLES
       Wipe out all unused space in an NTFS volume.

              ntfswipe -a /dev/sda1

       Wipe out all deleted file names from an NTFS volume.

              ntfswipe -dms /dev/sda1

BUGS
       There are no known problems with ntfswipe.  If you find a bug please send an email describing the problem to the development team:
       ntfs-3g-devel@lists.sf.net

AUTHORS
       ntfswipe was written by Richard Russon, Anton Altaparmakov and Yura Pakhuchiy.  It was ported to ntfs-3g by Erik Larsson.

AVAILABILITY
       ntfswipe is part of the ntfs-3g package and is available from:
       http://www.tuxera.com/community/

SEE ALSO
       ntfs-3g(8), ntfsls(8), ntfsprogs(8)

ntfs-3g 2017.3.23AR.3                                                         June 2014                                                                  NTFSWIPE(8)
