
xfs_info(8)                                                            System Manager's Manual                                                           xfs_info(8)

NAME
       xfs_info - display XFS filesystem geometry information

SYNOPSIS
       xfs_info [ -t mtab ] [ mount-point | block-device | file-image ]
       xfs_info -V

DESCRIPTION
       xfs_info  displays  geometry  information  about an existing XFS filesystem.  The mount-point argument is the pathname of a directory where the filesystem is
       mounted.  The block-device or file-image contain a raw XFS filesystem.  The existing contents of the filesystem are undisturbed.

OPTIONS
       -t     Specifies an alternate mount table file (default is /proc/mounts if it exists, else /etc/mtab).  This is used when working  with  filesystems  mounted
              without writing to /etc/mtab file - refer to mount(8) for further details.  This option has no effect with the block-device or file-image parameters.

       -V     Prints the version number and exits. The mount-point argument is not required with -V.

EXAMPLES
       Understanding xfs_info output.

       Suppose one has the following "xfs_info /dev/sda" output:

         meta-data=/dev/pmem0             isize=512    agcount=8, agsize=5974144 blks
                  =                       sectsz=512   attr=2, projid32bit=1
                  =                       crc=1        finobt=1, sparse=1, rmapbt=1
                  =                       reflink=1
         data     =                       bsize=4096   blocks=47793152, imaxpct=25
                  =                       sunit=32     swidth=128 blks
         naming   =version 2              bsize=4096   ascii-ci=0, ftype=1
         log      =internal log           bsize=4096   blocks=23336, version=2
                  =                       sectsz=512   sunit=0 blks, lazy-count=1
         realtime =none                   extsz=4096   blocks=0, rtextents=0

       Here,  the  data  section  of  the  output  indicates  "bsize=4096",  meaning the data block size for this filesystem is 4096 bytes.  This section also shows
       "sunit=32 swidth=128 blks", which means the stripe unit is 32*4096 bytes = 128 kibibytes and the stripe width is 128*4096 bytes = 512  kibibytes.   A  single
       stripe of this filesystem therefore consists of four stripe units (128 blocks / 32 blocks per unit).

SEE ALSO
       mkfs.xfs(8), md(4), lvm(8), mount(8).

                                                                                                                                                         xfs_info(8)
