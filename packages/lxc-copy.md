lxc-copy(1)                                                                                                                                                                    lxc-copy(1)

NAME
       lxc-copy - copy an existing container.

SYNOPSIS
       lxc-copy {-n, --name name} [-P, --lxcpath path] {-N, --newname newname} [-p, --newpath newpath] [-B, --backingstorage backingstorage] [-s, --snapshot] [-a, --allowrunning] [-K,
                --keepname] [-D, --keepdata] [-M, --keepmac] [-L, --fssize size [unit]] [-- hook arguments]
       lxc-copy {-n, --name name} [-P, --lxcpath path] [-N, --newname newname] [-p, --newpath newpath] {-e, --ephemeral} [-B, --backingstorage backingstorage] [-s, --snapshot] [-a,
                --allowrunning] [-K, --keepname] [-D, --keepdata] [-M, --keepmac] [-L, --fssize size [unit]] [-- hook arguments]
       lxc-copy {-n, --name name} [-P, --lxcpath path] [-N, --newname newname] [-p, --newpath newpath] {-e, --ephemeral} [-B, --backingstorage backingstorage] [-s, --snapshot] [-t,
                --tmpfs] [-K, --keepname] [-M, --keepmac] [-- hook arguments]
       lxc-copy {-n, --name name} [-P, --lxcpath path] {-N, --newname newname} [-p, --newpath newpath] {-R, --rename}

DESCRIPTION
       lxc-copy creates and optionally starts (ephemeral or non-ephemeral) copies of existing containers.

       lxc-copy creates copies of existing containers. Copies can be complete clones of the original container. In this case the whole root filesystem of the container is  simply  copied
       to  the  new  container.  Or they can be snapshots, i.e. small copy-on-write copies of the original container. In this case the specified backing storage for the copy must support
       snapshots. This currently includes btrfs, lvm (lvm devices do not support snapshots of snapshots.), overlay, and zfs.

       The copy's backing storage will be of the same type as the original container. overlay snapshots of directory backed containers are exempted from this rule.

       When the -e flag is specified an ephemeral snapshot of the original container is created and started. Ephemeral containers will have lxc.ephemeral = 1 set in their config file and
       will  be destroyed on shutdown. When -e is used in combination with -D a non-ephemeral snapshot of the original container is created and started.  Ephemeral containers can also be
       placed on a tmpfs with -t flag. NOTE: If an ephemeral container that is placed on a tmpfs is rebooted all changes made to it will currently be lost!

       When -e is specified and no newname is given via -N a random name for the snapshot will be chosen.

       Containers created and started with -e can have custom mounts. These are specified with the -m flag. Currently two types of mounts are supported: bind, and  overlay.  Mount  types
       are  specified  as  suboptions  to the -m flag and can be specified multiple times separated by commas. overlay mounts are currently specified in the format -m overlay=/src:/dest.
       When no destination dest is specified dest will be identical to src. Read-only bind mounts are specified -m bind=/src:/dest:ro and read-write bind  mounts  -m  bind=/src:/dest:rw.
       Read-write  bind mounts are the default and rw can be missing when a read-write mount is wanted. When dest is missing dest will be identical to src. An example for multiple mounts
       would be -m bind=/src1:/dest1:ro,bind=/src2:ro,overlay=/src3:/dest3.

       The mounts, their options, and formats supported via the -m flag are subject to change.

OPTIONS
       -N,--newname newname
              The name for the copy.

       -p,--newpath newpath
              The path for the copy.

       -R,--rename
              Rename the original container.

       -s,--snapshot
              Create a snapshot of the original container. The backing storage for the copy must support snapshots. This currently includes btrfs, lvm, overlay, and zfs.

       -a,--allowrunning
              Allow the creation of a Snapshot of an already running container.  This may cause data corruption or data loss depending on the used filesystem and applications.  Use  with
              care.

       -F,--foreground
              Run the snapshot in the foreground. The snapshots console will be attached to the current tty. (This option can only be specified in conjunction with -e.)

       -d, --daemon
              Run  the  snapshot as a daemon (This is the default mode for ephemeral containers.). As the container has no more tty, if an error occurs nothing will be displayed, the log
              file can be used to check the error. (This option can only be specified in conjunction with -e.)

       -m, --mount mounttype
              Specify a mount for a snapshot The opts argument for the mount type can by of type {bind, overlay}. For example -m bind=/src:/dest:ro,overlay=/src:/dest  (This  option  can
              currently only be specified in conjunction with -e.).

       -t, --tmpfs
              When  this option is specified the ephemeral container will be placed on a tmpfs. NOTE: Rebooting an ephemeral container that is located on a tmpfs will currently cause all
              changes made to it to be lost. This flag will only work for ephemeral containers created with the -e flag. The original container, from which the ephemeral snapshot is cre‐
              ated, must be stored as a simple directory.

       -B, --backingstorage backingstorage
              Specify the backing storage type to be used for the copy where 'backingstorage' is of type 'btrfs', 'dir', 'lvm', 'loop', 'overlay', or 'zfs'.

       -L, --fssize size [unit]
              Specify the size for an 'lvm' filesystem.

       -K, --keepname
              When this option is specified the hostname of the original container will be kept for the copy.

       -D, --keepdata
              When this option is specified with -e a non-ephemeral container is created and started.

       -M, --keepmac
              When this option is specified the MAC address of the original container will be kept for the copy.

COPY HOOK
       If  the  container  being copied has one or more lxc.hook.clone specified, then the specified hooks will be called for the new container. The first 3 arguments passed to the clone
       hook will be the container name, a section ('lxc'), and the hook type ('clone'). Extra arguments passed to lxc-copy will be passed to the hook program starting at argument 4.  The
       LXC_ROOTFS_MOUNT  environment variable gives the path under which the container's root filesystem is mounted. The configuration file pathname is stored in LXC_CONFIG_FILE, the new
       container name in LXC_NAME, the old container name in LXC_SRC_NAME, and the path or device on which the rootfs is located is in LXC_ROOTFS_PATH.

COMMON OPTIONS
       These options are common to most of lxc commands.

       -?, -h, --help
              Print a longer usage message than normal.

       --usage
              Give the usage message

       -q, --quiet
              mute on

       -P, --lxcpath=PATH
              Use an alternate container path. The default is /var/lib/lxc.

       -o, --logfile=FILE
              Output to an alternate log FILE. The default is no log.

       -l, --logpriority=LEVEL
              Set log priority to LEVEL. The default log priority is ERROR. Possible values are : FATAL, ALERT, CRIT, WARN, ERROR, NOTICE, INFO, DEBUG, TRACE.

              Note that this option is setting the priority of the events log in the alternate log file. It do not have effect on the ERROR events log on stderr.

       -n, --name=NAME
              Use container identifier NAME.  The container identifier format is an alphanumeric string.

       --rcfile=FILE
              Specify the configuration file to configure the virtualization and isolation functionalities for the container.

              This configuration file if present will be used even if there is already a configuration file present in the previously created container (via lxc-create).

       --version
              Show the version number.

SEE ALSO
       lxc(7), lxc-create(1), lxc-copy(1), lxc-destroy(1), lxc-start(1), lxc-stop(1), lxc-execute(1), lxc-console(1), lxc-monitor(1), lxc-wait(1), lxc-cgroup(1), lxc-ls(1),  lxc-info(1),
       lxc-freeze(1), lxc-unfreeze(1), lxc-attach(1), lxc.conf(5)

AUTHOR
       Christian Brauner <christian.brauner@mailbox.org>

                                                                                        2021-08-27                                                                             lxc-copy(1)
