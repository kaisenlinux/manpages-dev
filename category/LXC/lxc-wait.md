lxc-wait(1)                                                                                                                                              lxc-wait(1)

NAME
       lxc-wait - wait for a specific container state

SYNOPSIS
       lxc-wait {-n name} {-s states}

DESCRIPTION
       lxc-wait waits for a specific container state before exiting, this is useful for scripting.

OPTIONS
       -s, --state states
              Specify the container state(s) to wait for. The container states can be ORed to specify several states.

       -t, --timeout timeout
              Wait timeout seconds for desired state to be reached.

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

              This  configuration  file  if present will be used even if there is already a configuration file present in the previously created container (via lxc-
              create).

       --version
              Show the version number.

EXAMPLES
       lxc-wait -n foo -s RUNNING
              exits when 'RUNNING' is reached.

       lxc-wait -n foo -s 'RUNNING|STOPPED'
              exits when 'RUNNING' or 'STOPPED' state is reached.

DIAGNOSTIC
       The container was not found
              The specified container was not created before with the lxc-create command.

SEE ALSO
       lxc(7), lxc-create(1), lxc-copy(1), lxc-destroy(1), lxc-start(1), lxc-stop(1), lxc-execute(1), lxc-console(1),  lxc-monitor(1),  lxc-wait(1),  lxc-cgroup(1),
       lxc-ls(1), lxc-info(1), lxc-freeze(1), lxc-unfreeze(1), lxc-attach(1), lxc.conf(5)

AUTHOR
       Daniel Lezcano <daniel.lezcano@free.fr>

                                                                             2020-12-30                                                                  lxc-wait(1)
