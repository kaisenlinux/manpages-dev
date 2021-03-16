NTFSTRUNCATE(8)                                                        System Manager's Manual                                                       NTFSTRUNCATE(8)

NAME
       ntfstruncate - truncate a file on an NTFS volume

SYNOPSIS
       ntfstruncate [options] device file [attr-type [attr-name]] new-length

DESCRIPTION
       ntfstruncate truncates (or extends) a specified attribute belonging to a file or directory, to a specified length.

OPTIONS
       Below is a summary of all the options that ntfstruncate accepts.  Nearly all options have two equivalent names.  The short name is preceded by - and the long
       name is preceded by --.  Any single letter options, that don't take an argument, can be combined into a single command, e.g.  -fv is  equivalent  to  -f  -v.
       Long named options can be abbreviated to any unique prefix of their name.

       -f, --force
              This will override some sensible defaults, such as not using a mounted volume.  Use this option with caution.

       -h, --help
              Show a list of options with a brief description of each one.

       -l     Display licensing information.

       -n, --no-action
              Simulate the truncation without actually write to device.

       -q, --quiet
              Suppress some debug/warning/error messages.

       -v, --verbose
              Display more debug/warning/error messages.

       -V, --version
              Show the version number, copyright and license of ntfstruncate.

       attr-type
              Define  a  particular attribute type to be truncated (advanced use only).  By default, the unnamed $DATA attribute (the contents of a plain file) will
              be truncated. The attribute has to be specified by a number in decimal or hexadecimal :

              ┌───────────────────────────────────────────┐
              │Hex     Decimal   Name                     │
              │0x10    16        "$STANDARD_INFORMATION"  │
              │0x20    32        "$ATTRIBUTE_LIST"        │
              │0x30    48        "$FILE_NAME"             │
              │0x40    64        "$OBJECT_ID"             │
              │0x50    80        "$SECURITY_DESCRIPTOR"   │
              │0x60    96        "$VOLUME_NAME"           │
              │0x70    112       "$VOLUME_INFORMATION"    │
              │0x80    128       "$DATA"                  │
              │0x90    144       "$INDEX_ROOT"            │
              │0xA0    160       "$INDEX_ALLOCATION"      │
              │0xB0    176       "$BITMAP"                │
              │0xC0    192       "$REPARSE_POINT"         │
              │0xD0    208       "$EA_INFORMATION"        │
              │0xE0    224       "$EA"                    │
              │0xF0    240       "$PROPERTY_SET"          │
              │0x100   256       "$LOGGED_UTILITY_STREAM" │
              └───────────────────────────────────────────┘

       attr-name
              Define the name of the particular attribute type to be truncated (advanced use only).

       new-length
              Specify the target size of the file.  It will be rounded up to a multiple of the cluster size.  A suffix of K, M, G, T, P or E may be appended to mean
              a  multiplicative factor of a power of 1000. Similarly a suffix of Ki, Mi, Gi, Ti, Pi or Ei may be appended to mean a multiplicative factor of a power
              of 1024.

EXAMPLES
       Resize to 100MB the file database.db located in the Data directory which is at the root of an NTFS file system.

              ntfstruncate /dev/sda1 Data/database.db 100M

BUGS
       There are no known problems with ntfstruncate.  If you find a bug, please send an email describing the problem to the development team:
       ntfs-3g-devel@lists.sf.net

AUTHORS
       ntfstruncate was written by Anton Altaparmakov.

AVAILABILITY
       ntfstruncate is part of the ntfs-3g package and is available from:
       http://www.tuxera.com/community/

SEE ALSO
       ntfs-3g(8), ntfsfallocate(8), ntfsprogs(8).

ntfs-3g 2017.3.23AR.3                                                         June 2014                                                              NTFSTRUNCATE(8)
