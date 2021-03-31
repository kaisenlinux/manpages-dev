lxc-create(1)                                                                                                                                                                     lxc-create(1)

NAME
       lxc-create - creates a container

SYNOPSIS
       lxc-create {-n name} [-f config_file] {-t template} [-B backingstore] [-- template-options]

DESCRIPTION
       lxc-create  creates  a  system object where is stored the configuration information and where can be stored user information. The identifier name is used to specify the container to be
       used with the different lxc commands.

       The object is a directory created in /var/lib/lxc and identified by its name.

       The object is the definition of the different resources an application can use or can see. The more the configuration file contains information, the more the container is isolated  and
       the more the application is jailed.

       If the configuration file config_file is not specified, the container will be created with the default isolation: processes, sysv ipc and mount points.

OPTIONS
       -f, --config config_file
              Specify the configuration file to configure the virtualization and isolation functionalities for the container.

       -t, --template template
              'template'  is  the  short  name  of  an  existing  'lxc-template'  script  that  is called by lxc-create, eg. busybox, debian, fedora, ubuntu or sshd.  Refer to the examples in
              /usr/share/lxc/templates for details of the expected script structure.  Alternatively, the full path to an executable template script can also be passed as a parameter.   "none"
              can be used to force lxc-create to skip rootfs creation.

       -B, --bdev backingstore
              'backingstore'  is  one  of  'dir',  'lvm',  'loop', 'btrfs', 'zfs', 'rbd', or 'best'. The default is 'dir', meaning that the container root filesystem will be a directory under
              /var/lib/lxc/container/rootfs.  This backing store type allows the optional --dir ROOTFS to be specified, meaning that the container rootfs should be placed under the  specified
              path,  rather than the default. (The 'none' backingstore type is an alias for 'dir'.) If 'btrfs' is specified, then the target filesystem must be btrfs, and the container rootfs
              will be created as a new subvolume. This allows snapshotted clones to be created, but also causes rsync --one-filesystem to treat it as a separate filesystem.   If  backingstore
              is  'lvm', then an lvm block device will be used and the following further options are available: --lvname lvname1 will create an LV named lvname1 rather than the default, which
              is the container name. --vgname vgname1 will create the LV in volume group vgname1 rather than the default, lxc.  --thinpool thinpool1 will create the LV as  a  thin-provisioned
              volume  in  the pool named thinpool1 rather than the default, lxc.  --fstype FSTYPE will create an FSTYPE filesystem on the LV, rather than the default, which is ext4.  --fssize
              SIZE will create a LV (and filesystem) of size SIZE rather than the default, which is 1G.

              If backingstore is 'loop', you can use --fstype FSTYPE and --fssize SIZE as 'lvm'. The default values for these options are the same as 'lvm'.

              If backingstore is 'rbd', then you will need to have a valid configuration in ceph.conf and a ceph.client.admin.keyring defined.  You can specify the following options :  --rbd‐
              name  RBDNAME  will  create a blockdevice named RBDNAME rather than the default, which is the container name.  --rbdpool POOL will create the blockdevice in the pool named POOL,
              rather than the default, which is 'lxc'.

              If backingstore is 'best', then lxc will try, in order, btrfs, zfs, lvm, and finally a directory backing store.

       -- template-options
              This will pass template-options to the template as arguments. To see the list of options supported by the template, you can run lxc-create -t TEMPLATE -h.

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
              Set log priority to LEVEL. The default log priority is ERROR. Possible values are : FATAL, CRIT, WARN, ERROR, NOTICE, INFO, DEBUG.

              Note that this option is setting the priority of the events log in the alternate log file. It do not have effect on the ERROR events log on stderr.

       -n, --name=NAME
              Use container identifier NAME.  The container identifier format is an alphanumeric string.

       --rcfile=FILE
              Specify the configuration file to configure the virtualization and isolation functionalities for the container.

              This configuration file if present will be used even if there is already a configuration file present in the previously created container (via lxc-create).

       --version
              Show the version number.

DIAGNOSTIC
       The container already exists
              As the message mention it, you try to create a container but there is a container with the same name. You can use the lxc-ls command to list the available containers on the sys‐
              tem.

SEE ALSO
       lxc(7),  lxc-create(1), lxc-copy(1), lxc-destroy(1), lxc-start(1), lxc-stop(1), lxc-execute(1), lxc-console(1), lxc-monitor(1), lxc-wait(1), lxc-cgroup(1), lxc-ls(1), lxc-info(1), lxc-
       freeze(1), lxc-unfreeze(1), lxc-attach(1), lxc.conf(5)

AUTHOR
       Daniel Lezcano <daniel.lezcano@free.fr>

                                                                                           2021-01-31                                                                             lxc-create(1)
