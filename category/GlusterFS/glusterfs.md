GlusterFS(8)                                                                              Gluster Inc.                                                                             GlusterFS(8)

NAME
       GlusterFS - clustered file system

SYNOPSIS
       glusterfs [options] [mountpoint]

DESCRIPTION
       GlusterFS  is  a  clustered  file system, capable of scaling to several peta-bytes.  It aggregates various storage bricks over Infiniband RDMA or TCP/IP and interconnect into one large
       parallel network file system. Storage bricks can be made of any commodity hardware, such as x86-64 server with SATA-II RAID and Infiniband HBA.

       GlusterFS is fully POSIX compliant file system. On client side, it has dependency on FUSE package, on server side, it works seemlessly on different operating systems.   Currently  sup‐
       ported on GNU/Linux and Solaris.

OPTIONS
   Basic options
       -f, --volfile=VOLUME-FILE
              File to use as VOLUME-FILE.

       -l, --log-file=LOGFILE
              File to use for logging (the default is <INSTALL-DIR>/var/log/glusterfs/<MOUNT-POINT>.log).

       -L, --log-level=LOGLEVEL
              Logging severity.  Valid options are TRACE, DEBUG, INFO, WARNING, ERROR and CRITICAL (the default is INFO).

       -s, --volfile-server=SERVER
              Server to get the volume from.  This option overrides --volfile  option.

       --volfile-max-fetch-attempts=MAX-ATTEMPTS
              Maximum number of connect attempts to server. This option should be provided with --volfile-server option (the default is 1).

   Advanced options
       --acl  Mount the filesystem with POSIX ACL support.

       --localtime-logging
              Enable localtime log timestamps.

       --debug
              Run in debug mode.  This option sets --no-daemon, --log-level to DEBUG, and --log-file to console.

       --enable-ino32=BOOL
              Use 32-bit inodes when mounting to workaround application that doesn't support 64-bit inodes.

       --fopen-keep-cache[=BOOL]
              Do not purge the cache on file open (default: false).

       --mac-compat=BOOL
              Provide stubs for attributes needed for seamless operation on Macs (the default is off).

       -N, --no-daemon
              Run in the foreground.

       -p, --pid-file=PIDFILE
              File to use as PID file.

       --read-only
              Mount the file system in 'read-only' mode.

       --selinux
              Enable SELinux label (extended attributes) support on inodes.

       -S, --socket-file=SOCKFILE
              File to use as unix-socket.

       --volfile-id=KEY
              Key of the volume file to be fetched from the server.

       --volfile-server-port=PORT
              Port number of volfile server.

       --volfile-server-transport=TRANSPORT
              Transport type to get volume file from server (the default is tcp).

       --volume-name=VOLUME-NAME
              Volume name to be used for MOUNT-POINT (the default is top most volume in VOLUME-FILE).

       --worm Mount the filesystem in 'worm' mode.

       --xlator-option=VOLUME-NAME.OPTION=VALUE
              Add/Override a translator option for a volume with the specified value.

       --subdir-mount=SUBDIR-MOUNT-PATH
              Mount subdirectory instead of the '/' of volume.

   Fuse options
       --attr-times-granularity=NANOSECONDS
              Declare supported granularity of file attribute times (default is 0 which kernel handles as unspecified; valid real values are between 1 and 1000000000).

       --attribute-timeout=SECONDS
              Set attribute timeout to SECONDS for inodes in fuse kernel module (the default is 1).

       --background-qlen=N
              Set fuse module's background queue length to N (the default is 64).

       --congestion-threshold=N
              Set fuse module's congestion threshold to N (the default is 48).

       --direct-io-mode=BOOL|auto
              Specify fuse direct I/O strategy (the default is auto).

       --dump-fuse=PATHR
              Dump fuse traffic to PATH

       --entry-timeout=SECONDS
              Set entry timeout to SECONDS in fuse kernel module (the default is 1).

       --gid-timeout=SECONDS
              Set auxiliary group list timeout to SECONDS for fuse translator (the default is 0).

       --kernel-writeback-cache=BOOL
              Enable fuse in-kernel writeback cache.

       --negative-timeout=SECONDS
              Set negative timeout to SECONDS in fuse kernel module (the default is 0).

       --auto-invalidation=BOOL
              controls  whether fuse-kernel can auto-invalidate attribute, dentry and page-cache. Disable this only if same files/directories are not accessed across two different mounts con‐
              currently [default: on].

       --volfile-check
              Enable strict volume file checking.

   Miscellaneous Options
       -?, --help
              Display this help.

       --usage
              Display a short usage message.

       -V, --version
              Print the program version.

FILES
       /var/lib/glusterd/vols/*/*.vol

EXAMPLES
       mount a volume named foo on server bar with log level DEBUG on mount point /mnt/foo

       # glusterfs --log-level=DEBUG --volfile-id=foo --volfile-server=bar /mnt/foo

SEE ALSO
       fusermount(1), mount.glusterfs(8), gluster(8)

COPYRIGHT
       Copyright(c) 2006-2011  Red Hat, Inc.  <http://www.redhat.com>

07 March 2011                                                                        Clustered File System                                                                         GlusterFS(8)
