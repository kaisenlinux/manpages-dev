  lxc-checkpoint
 
## NAME
        lxc-checkpoint - checkpoint a container
 
## SYNOPSIS
        lxc-checkpoint {-n name} {-D PATH} [-r] [-s] [-v] [-d] [-F]
 
## DESCRIPTION
        lxc-checkpoint checkpoints and restores containers.
 
## OPTIONS
        -r, --restore
               Restore the checkpoint for the container, instead of dumping it.  This option is incompatible with -s.
 
        -D PATH, --checkpoint-dir=PATH
               The directory to dump the checkpoint metadata.
 
        -s, --stop
               Optionally stop the container after dumping. This option is incompatible with -r.
 
        -v, --verbose
               Enable verbose criu logging.
 
        -d, --daemon
               Restore the container in the background (this is the default).  Only available when providing -r.
 
        -F, --foreground
               Restore the container in the foreground. Only available when providing -r.
 
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
 
## EXAMPLES
        lxc-checkpoint -n foo -D /tmp/checkpoint
               Checkpoint the container foo into the directory /tmp/checkpoint.
 
        lxc-checkpoint -r -n foo -D /tmp/checkpoint
               Restore the checkpoint from the directory /tmp/checkpoint.
 
## SEE ALSO
        lxc(7), lxc-create(1), lxc-copy(1), lxc-destroy(1), lxc-start(1), lxc-stop(1), lxc-execute(1), lxc-console(1),  lxc-monitor(1),  lxc-wait(1),  lxc-cgroup(1),
        lxc-ls(1), lxc-info(1), lxc-freeze(1), lxc-unfreeze(1), lxc-attach(1), lxc.conf(5)
 
## AUTHOR
        Tycho Andersen <tycho.andersen@canonical.com>
 
                                                                              2020-10-28                                                            lxc-checkpoint(1)
