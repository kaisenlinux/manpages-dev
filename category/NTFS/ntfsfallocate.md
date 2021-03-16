NTFSFALLOCATE(8)                                                       System Manager's Manual                                                      NTFSFALLOCATE(8)

NAME
       ntfsfallocate - preallocate space to a file on an NTFS volume

SYNOPSIS
       ntfsfallocate [options] -l length device file [attr-type [attr-name]]

DESCRIPTION
       ntfsfallocate  preallocates space for any attribute of a file or directory, thus reserving space before actual contents is written. This is similar to fallo‐
       cate(1).

OPTIONS
       Below is a summary of all the options that ntfsfallocate accepts.  Nearly all options have two equivalent names.  The short name is preceded  by  -  and  the
       long  name  is  preceded by --.  Any single letter options, that don't take an argument, can be combined into a single command, e.g.  -fv is equivalent to -f
       -v.  Long named options can be abbreviated to any unique prefix of their name.

       -f, --force
              This will override some sensible defaults, such as not using a mounted volume.  Use this option with caution.

       -h, --help
              Show a list of options with a brief description of each one.

       -l, --length LENGTH
              This is a mandatory option to specify the number of bytes to preallocate.  It will be rounded up to a multiple of the cluster size.  A suffix of K, M,
              G,  T,  P  or  E may be appended to mean a multiplicative factor of a power of 1000. Similarly a suffix of Ki, Mi, Gi, Ti, Pi or Ei may be appended to
              mean a multiplicative factor of a power of 1024.

       -n, --no-size-change
              Do not change the apparent size of the file. The space allocated beyond the apparent size is not zeroed, but subsequent writing  beyond  the  apparent
              end of file will force zeroing the inner allocated space as it cannot be considered as a hole any more, and this may take significant time.

       -N, --no-action
              Simulate the allocation without actually write to device.

       -o, --offset OFFSET
              Specify  the offset in the file where preallocation starts. By default, the preallocation is counted from the beginning of the file. Space already al‐
              located in the area defined by offset and length is preserved.

       -q, --quiet
              Suppress some debug/warning/error messages.

       -v, --verbose
              Display more debug/warning/error messages.

       -V, --version
              Show the version number, copyright and license of ntfsfallocate.

       attr-type
              Define a particular attribute type to be preallocated (advanced use only).  By default, the unnamed $DATA attribute (the contents  of  a  plain  file)
              will be preallocated. The attribute has to be specified by a number in decimal or hexadecimal :

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
              Define the name of the particular attribute type to be preallocated (advanced use only).

EXAMPLES
       Preallocate 100MB to the file database.db located in the Data directory which is at the root of an NTFS file system.

              ntfsfallocate -l 100M /dev/sda1 Data/database.db

BUGS
       There  are  no known problems with ntfsfallocate, however it can lead to configurations not supported by Windows and Windows may crash (BSOD) when writing to
       preallocated clusters which were not written to earlier. Files with preallocated space should be fully be written to before they are updated by Windows.

       If you find a bug in ntfsfallocate proper, please send an email describing the problem to the development team:
       ntfs-3g-devel@lists.sf.net

AUTHORS
       ntfsfallocate was written by Jean-Pierre Andre.

AVAILABILITY
       ntfsfallocate is part of the ntfs-3g package and is available from:
       http://www.tuxera.com/community/

SEE ALSO
       ntfs-3g(8), ntfstruncate(8), ntfsprogs(8), fallocate(1)

ntfs-3g 2017.3.23AR.3                                                         June 2014                                                             NTFSFALLOCATE(8)
