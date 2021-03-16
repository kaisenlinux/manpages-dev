MKEXFATFS(8)                                                           System Manager's Manual                                                          MKEXFATFS(8)

NAME
       mkexfatfs - create an exFAT file system

SYNOPSIS
       mkexfatfs [ -i volume-id ] [ -n volume-name ] [ -p partition-first-sector ] [ -s sectors-per-cluster ] [ -V ] device

DESCRIPTION
       mkexfatfs creates an exFAT file system on a block device.  device is a special file corresponding to the partition on the device. Note that if this is an MBR
       partition then the file system type should be set to 0x07 (NTFS/exFAT) otherwise other operating systems may refuse to mount the file system.

OPTIONS
       Command line options available:

       -i volume-id
              A 32-bit hexadecimal number. By default a value based on current time is set.

       -n volume-name
              Volume name (label), up to 15 characters. By default no label is set.

       -p partition-first-sector
              First sector of the partition starting from the beginning of the whole disk.  exFAT super block has a field for this value but in fact  it's  optional
              and does not affect anything. Default is 0.

       -s sectors-per-cluster
              Number  of physical sectors per cluster (cluster is an allocation unit in exFAT). Must be a power of 2, i.e. 1, 2, 4, 8, etc. Cluster size can not ex‐
              ceed 32 MB. Default cluster sizes are: 4 KB if volume size is less than 256 MB, 32 KB if volume size is from 256 MB to 32 GB, 128 KB if volume size is
              32 GB or larger.

       -V     Print version and copyright.

EXIT CODES
       Zero is returned on successful creation. Any other code means an error.

AUTHOR
       Andrew Nayenko

SEE ALSO
       mkfs(8),fdisk(8)

                                                                            January 2014                                                                MKEXFATFS(8)
