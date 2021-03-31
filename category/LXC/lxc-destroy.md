lxc-destroy(1)                                                                                                                                                                   lxc-destroy(1)

NAME
       lxc-destroy - destroy a container.

SYNOPSIS
       lxc-destroy {-n name} [-f] [-s]

DESCRIPTION
       lxc-destroy destroys the system object previously created by the lxc-create command.

OPTIONS
       -f, --force
              If a container is running, stop it first. If this option is not specified and the container is running, then lxc-destroy will be aborted.

       -s, --snapshots
              destroy the specified container including all its snapshots.

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
       The container was not found
              The  specified container for destruction was not found. It is probable it does not exists and was already destroyed.You can use the lxc-ls command to list the available contain‐
              ers on the system.

SEE ALSO
       lxc(7), lxc-create(1), lxc-copy(1), lxc-destroy(1), lxc-start(1), lxc-stop(1), lxc-execute(1), lxc-console(1), lxc-monitor(1), lxc-wait(1), lxc-cgroup(1), lxc-ls(1), lxc-info(1),  lxc-
       freeze(1), lxc-unfreeze(1), lxc-attach(1), lxc.conf(5)

AUTHOR
       Daniel Lezcano <daniel.lezcano@free.fr>

                                                                                           2021-01-31                                                                            lxc-destroy(1)
