CEPH-FUSE(8)                                                                    Ceph                                                                    CEPH-FUSE(8)

NAME
       ceph-fuse - FUSE-based client for ceph

SYNOPSIS
       ceph-fuse [-n client.username] [ -m monaddr:port ] mountpoint [ fuse options ]

DESCRIPTION
       ceph-fuse  is  a FUSE (File system in USErspace) client for Ceph distributed file system. It will mount a ceph file system specified via the -m option or de‐
       scribed by ceph.conf (see below) at the specific mount point. See Mount CephFS using FUSE for detailed information.

       The file system can be unmounted with:

          fusermount -u mountpoint

       or by sending SIGINT to the ceph-fuse process.

OPTIONS
       Any options not recognized by ceph-fuse will be passed on to libfuse.

       -o opt,[opt...]
              Mount options.

       -d     Run in foreground, send all log output to stderr and enable FUSE debugging (-o debug).

       -c ceph.conf, --conf=ceph.conf
              Use ceph.conf configuration file instead of the default /etc/ceph/ceph.conf to determine monitor addresses during startup.

       -m monaddress[:port]
              Connect to specified monitor (instead of looking through ceph.conf).

       -k <path-to-keyring>
              Provide path to keyring; useful when it's absent in standard locations.

       --client_mountpoint/-r root_directory
              Use root_directory as the mounted root, rather than the full Ceph tree.

       -f     Foreground: do not daemonize after startup (run in foreground). Do not generate a pid file.

       -s     Disable multi-threaded operation.

AVAILABILITY
       ceph-fuse is part of Ceph, a massively scalable, open-source, distributed storage system. Please refer to the Ceph documentation at http://ceph.com/docs  for
       more information.

SEE ALSO
       fusermount(8), ceph(8)

COPYRIGHT
       2010-2021, Inktank Storage, Inc. and contributors. Licensed under Creative Commons Attribution Share Alike 3.0 (CC-BY-SA-3.0)

dev                                                                         Jan 15, 2021                                                                CEPH-FUSE(8)
