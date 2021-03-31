NILFS_CLEANERD(8)                                                                   System Manager's Manual                                                                   NILFS_CLEANERD(8)

NAME
       nilfs_cleanerd - NILFS2 garbage collector

SYNOPSIS
       nilfs_cleanerd [-hV]

       nilfs_cleanerd [options] device [directory]

DESCRIPTION
       nilfs_cleanerd is a system daemon which reclaims disk space of a NILFS2 file system found in device.

       The optional directory argument specifies the mount point where the daemon operates.  It must be an r/w-mount.

       This program can be invoked either automatically by mount.nilfs2(8) or manually by an administrator.  However, users are recommended to invoke nilfs_cleanerd through mount.nilfs2(8) or
       mount(8) and shutdown it through umount.nilfs2(8) or umount(8) in order to avoid state inconsistencies among administration tools.

       nilfs_cleanerd displays its process ID (pid) to standard output when it started.

OPTIONS
       -V, --version
              Display version and exit.

       -h, --help
              Display help message and exit.

       -c file, --conf=file
              Specify configuration file.

       -p interval, --protection-period=interval
              Override protection period with the specified number of seconds.

SIGNALS
       nilfs_cleanerd reacts to a set of signals.  You may send a signal to nilfs_cleanerd using the PID shown by the mount command (or in /etc/mtab):

              # mount -t nilfs2
              /dev/sdb1 on /nilfs type nilfs2 (rw,gcpid=PID)
              # kill -SIGNAL PID

       SIGHUP This lets nilfs_cleanerd perform a re-initialization.  The configuration file (default is /etc/nilfs_cleanerd.conf) will be reread.

       SIGTERM
              The nilfs_cleanerd will exit cleanly.

       SIGUSR1, SIGUSR2
              Reserved for future use.  These let nilfs_cleanerd die at present.

FILES
       /etc/nilfs_cleanerd.conf
              Configuration file for nilfs_cleanerd.  See nilfs_cleanerd.conf(5) for details.

AUTHOR
       Koji Sato

AVAILABILITY
       nilfs_cleanerd is part of the nilfs-utils package and available from https://nilfs.sourceforge.io.

SEE ALSO
       nilfs(8), mount.nilfs2(8), umount.nilfs2(8), nilfs_cleanerd.conf(5).

nilfs-utils version 2.2                                                                     Apr 2014                                                                          NILFS_CLEANERD(8)
