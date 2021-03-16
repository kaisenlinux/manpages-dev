NILFS-CLEAN(8)                                                         System Manager's Manual                                                        NILFS-CLEAN(8)

NAME
       nilfs-clean - run garbage collector on NILFS file system

SYNOPSIS
       nilfs-clean [options] [device]

DESCRIPTION
       The nilfs-clean program communicates with nilfs_cleanerd(8) program and controls execution of garbage collection (GC) on NILFS2 file systems.  It can be used
       to manually run garbage collection of a file system mounted on device to increase the free space.

       If a GC command is specified by one of the following options (i.e. ´-c´,´-s´,´-r´,  and  ´-l´  options),  the  command  is  sent  to  and  performed  on  the
       nilfs_cleanerd(8) program.  If no commands are specified, nilfs-clean just triggers a one-pass cleaning.

       When device is omitted, nilfs-clean selects an active NILFS2 file system in the system.

       This command is valid only for mounted NILFS2 file systems, and will fail if the device has no active mounts.

OPTIONS
       -b, --break, --stop
              Stop garbage collection.

       -c, --reload[=conffile]
              Request  reloading  config  file  to  cleaner  process.  If an optional configuration file is given, the file is read by nilfs_cleanerd(8) program and
              cleaner configuration is reset to the information.  If no argument is given, a configuration file selected by nilfs_cleanerd(8) will be reloaded.

       -l, --status
              Display cleaner status.

       -h, --help
              Display help message and exit.

       -m, --min-reclaimable-blocks=COUNT[%]
              Specify the minimum number of reclaimable blocks in a segment before it can be cleaned. If the argument is followed by a percent sign,  it  represents
              the ratio of blocks in a segment. This argument will only have an effect if the use_set_suinfo flag is set in the configuration file.

       -p, --protection-period=interval
              Set protection period for a cleaner run.  The interval parameter is an integer value and specifies the minimum time that deleted or overrode data will
              be preserved in the file system.  Smaller values will increase free space made by garbage collection.  Optionally, the interval parameter may be  suf‐
              fixed  by  one of the following units designators: ´s´, ´m´, ´h´, ´d´,´w´,´M´, or ´Y´, for seconds, minutes, hours, days, weeks, months, or years, re‐
              spectively.

       -q, --quit
              Shutdown cleaner daemon.

       -r, --resume
              Resume garbage collection.

       -s, --suspend
              Suspend garbage collection.  Note that if users manually suspend garbage collection with this option, it will not restart automatically until user re‐
              sumes the garbage collection.

       -S, --speed=COUNT[/SECONDS]
              Set garbage collection speed for a cleaner run.

       -v, --verbose
              Verbose mode.

       -V, --version
              Display version and exit.

AUTHOR
       Ryusuke Konishi <konishi.ryusuke@gmail.com>

AVAILABILITY
       nilfs-clean is part of the nilfs-utils package and is available from https://nilfs.sourceforge.io.

SEE ALSO
       nilfs(8), nilfs_cleanerd(8).

nilfs-utils version 2.2                                                       Apr 2014                                                                NILFS-CLEAN(8)
