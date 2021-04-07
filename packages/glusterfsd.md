GlusterFS(8)                                                                           Gluster Inc.                                                                           GlusterFS(8)

NAME
       GlusterFS - Clustered Filesystem.

SYNOPSIS
       glusterfsd [options] [mountpoint]

DESCRIPTION
       GlusterFS  is  a  clustered  file-system capable of scaling to several peta-bytes.  It aggregates various storage bricks over Infiniband RDMA or TCP/IP interconnect into one large
       parallel network file system. Storage bricks can be made of any commodity hardware such as x86-64 server with SATA-II RAID and Infiniband HBA.

       GlusterFS is fully POSIX compliant FileSystem. On client side, it has dependency on FUSE package, on server side, it works seemlessly on different OSes.  (Currently  supported  on
       GNU/Linux, Solaris).

OPTIONS
       Mandatory or optional arguments to long options are also mandatory or optional for any corresponding short options.

   Basic options
       -f, --volfile=VOLUME-FILE
              File to use as VOLUME-FILE [default:/etc/glusterfs/glusterfs.vol]

       -l, --log-file=LOGFILE
              File to use for logging [default:/var/log/glusterfs/glusterfs.log]

       -L, --log-level=LOGLEVEL
              Logging severity.  Valid options are TRACE, DEBUG, INFO, WARNING, ERROR and CRITICAL [default: WARNING]

       -s, --volfile-server=SERVER
              Server to get the volume from.  This option overrides --volfile option

   Advanced options
       --localtime-logging
              Enable localtime log timestamps.

       --debug
              Run in debug mode.  This option sets --no-daemon, --log-level to DEBUG and --log-file to console

       -N, --no-daemon
              Run in foreground

       --read-only
              Makes the filesystem read-only

       -p, --pid-file=PIDFILE
              File to use as pid file

       -S SOCKFILE
              Socket file to used for inter-process communication

       --brick-name DIRECTORY
              Directory to be used as export directory for GlusterFS

       --brick-port PORT
              Brick Port to be registered with Gluster portmapper

       --volfile-id=KEY
              KEY of the volume file to be fetched from server

       --volfile-server-port=PORT
              Port number of volfile server

       --volfile-server-transport=TRANSPORT
              Transport type to get volume file from server [default: tcp]

       --volume-name=VOLUME-NAME
              Volume name to be used for MOUNT-POINT [default: top most volume in VOLUME-FILE]

       --xlator-option=VOLUME-NAME.OPTION=VALUE
              Add/override a translator option for a volume with the specified value

   Fuse options
       --attribute-timeout=SECONDS
              Set attribute timeout to SECONDS for inodes in fuse kernel module [default: 1]

       --entry-timeout=SECONDS
              Set entry timeout to SECONDS in fuse kernel module [default: 1]

       --direct-io-mode=BOOL
              Enable/Disable direct-io mode in fuse module [default: enable]

       --resolve-gids
              Resolve all auxiliary groups in fuse translator (max 32 otherwise)

       --auto-invalidation=BOOL
              controls  whether fuse-kernel can auto-invalidate attribute, dentry and page-cache. Disable this only if same files/directories are not accessed across two different mounts
              concurrently [default: on]

   Miscellaneous Options
       -?, --help
              Give this help list

       --usage
              Give a short usage message

       -V, --version
              Print program version

FILES
       /etc/glusterfs/*.vol

EXAMPLES
       Start a GlusterFS server on localhost with volume name foo

       glusterfsd -s localhost --volfile-id foo.server.media-disk-1 -p /var/lib/glusterd/vols/foo/run/server-media-disk-1.pid  -S  /tmp/<uniqueid>.socket  --brick-name  /media/disk-1  -l
       /var/log/glusterfs/bricks/media-disk-1.log --brick-port 24009 --xlator-option foo-server.listen-port=24009

SEE ALSO
       fusermount(1), mount.glusterfs(8), gluster(8)

COPYRIGHT
       Copyright(c) 2006-2011  Gluster, Inc.  <http://www.gluster.com>

19 March 2010                                                                       Cluster Filesystem                                                                        GlusterFS(8)
