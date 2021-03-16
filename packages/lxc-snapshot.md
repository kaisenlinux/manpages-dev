  lxc-snapshot
 
## NAME
        lxc-snapshot - Snapshot an existing container.
 
## SYNOPSIS
        lxc-snapshot {-n, --name name} [-c, --comment file]
        lxc-snapshot {-n, --name name} {-d, -destroy snapshot-name}
        lxc-snapshot {-n, --name name} {-L, --list } [-C, --showcomments ]
        lxc-snapshot {-n, --name name} {-r, -restore snapshot-name} [-N, --newname newname]
 
## DESCRIPTION
        lxc-snapshot creates, lists, and restores container snapshots.
 
        Snapshots  are stored as snapshotted containers under the container's configuration path. For instance, if the container's configuration path is /var/lib/lxc
        and the container is c1, then the first snapshot will be stored as container snap0 under the path /var/lib/lxc/c1/snaps.  If /var/lib/lxcsnaps,  as  used  by
        LXC 1.0, already exists, then it will continue to be used.
 
## OPTIONS
        -c,--comment comment_file
               Associate the comment in comment_file with the newly created snapshot.
 
        -d,--destroy snapshot-name
               Destroy the named snapshot. If the named snapshot is ALL, then all snapshots will be destroyed.
 
        -L,--list
               List existing snapshots.
 
        -C,--showcomments
               Show snapshot comments in the snapshots listings.
 
        -r,--restore snapshot-name
               Restore the named snapshot, meaning a full new container is created which is a copy of the snapshot.
 
        -N, --newname
               When restoring a snapshot, the last optional argument if not given explicitly via --newname is the name to use for the restored container. If the new‐
               name is identical to the original name of the container, then the original container will be destroyed and the restored container will take its place.
               Note that deleting the original snapshot is not possible in the case of overlayfs or zfs backed snapshots.
 
 COMMON## OPTIONS
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
 
        -n, --name=## NAME
               Use container identifier## NAME.  The container identifier format is an alphanumeric string.
 
        --rcfile=FILE
               Specify the configuration file to configure the virtualization and isolation functionalities for the container.
 
               This  configuration  file  if present will be used even if there is already a configuration file present in the previously created container (via lxc-
               create).
 
        --version
               Show the version number.
 
## SEE ALSO
        lxc(7), lxc-create(1), lxc-copy(1), lxc-destroy(1), lxc-start(1), lxc-stop(1), lxc-execute(1), lxc-console(1),  lxc-monitor(1),  lxc-wait(1),  lxc-cgroup(1),
        lxc-ls(1), lxc-info(1), lxc-freeze(1), lxc-unfreeze(1), lxc-attach(1), lxc.conf(5)
 
## AUTHOR
        Serge Hallyn <serge.hallyn@ubuntu.com >
 
                                                                              2020-10-28                                                              lxc-snapshot(1)
