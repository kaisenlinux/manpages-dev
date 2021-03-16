xfs_estimate(8)                                                        System Manager's Manual                                                       xfs_estimate(8)

NAME
       xfs_estimate - estimate the space that an XFS filesystem will take

SYNOPSIS
       xfs_estimate [ -h ] [ -b blocksize ] [ -i logsize ]
                    [ -e logsize ] [ -v ] directory ...
       xfs_estimate -V

DESCRIPTION
       For  each directory argument, xfs_estimate estimates the space that directory would take if it were copied to an XFS filesystem.  xfs_estimate does not cross
       mount points.  The following definitions are used:
              KB = *1024
              MB = *1024*1024
              GB = *1024*1024*1024

       The xfs_estimate options are:

       -b blocksize
              Use blocksize instead of the default blocksize of 4096 bytes.  The modifier k can be used after the number to indicate multiplication  by  1024.   For
              example,

                   xfs_estimate -b 64k /

              requests an estimate of the space required by the directory / on an XFS filesystem using a blocksize of 64K (65536) bytes.

       -v     Display more information, formatted.

       -h     Display usage message.

       -i, -e logsize
              Use  logsize  instead of the default log size of 1000 blocks.  -i refers to an internal log, while -e refers to an external log.  The modifiers k or m
              can be used after the number to indicate multiplication by 1024 or 1048576, respectively.

              For example,

                   xfs_estimate -i 1m /

              requests an estimate of the space required by the directory / on an XFS filesystem using an internal log of 1 megabyte.

       -V     Print the version number and exits.

EXAMPLES
       % xfs_estimate -e 10m /var/tmp
       /var/tmp will take about 4.2 megabytes
               with the external log using 2560 blocks or about 10.0 megabytes

       % xfs_estimate -v -e 10m /var/tmp
       directory                     bsize   blocks    megabytes    logsize
       /var/tmp                       4096      792        4.0MB   10485760

       % xfs_estimate -v /var/tmp
       directory                     bsize   blocks    megabytes    logsize
       /var/tmp                       4096     3352       14.0MB   10485760

       % xfs_estimate /var/tmp
       /var/tmp will take about 14.0 megabytes

                                                                                                                                                     xfs_estimate(8)
