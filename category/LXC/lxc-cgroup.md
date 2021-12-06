lxc-cgroup(1)                                                                                                                                                                lxc-cgroup(1)

NAME
       lxc-cgroup - manage the control group associated with a container

SYNOPSIS
       lxc-cgroup {-n name} {state-object} [value]

DESCRIPTION
       lxc-cgroup  gets  or sets the value of a state-object (e.g., 'cpuset.cpus') in the container's cgroup for the corresponding subsystem (e.g., 'cpuset'). If no [value] is specified,
       the current value of the state-object is displayed; otherwise it is set.

       Note that lxc-cgroup does not check that the state-object is valid for the running kernel, or that the corresponding subsystem is contained in any mounted cgroup hierarchy.

OPTIONS
       state-object
              Specify the state object name.

       [value]
              Specify the value to assign to the state object.

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

EXAMPLES
       lxc-cgroup -n foo devices.list
              display the allowed devices to be used.

       lxc-cgroup -n foo cpuset.cpus "0,3"
              assign the processors 0 and 3 to the container.

DIAGNOSTIC
       The container was not found
              The container is not running.

SEE ALSO
       lxc(7), lxc-create(1), lxc-copy(1), lxc-destroy(1), lxc-start(1), lxc-stop(1), lxc-execute(1), lxc-console(1), lxc-monitor(1), lxc-wait(1), lxc-cgroup(1), lxc-ls(1),  lxc-info(1),
       lxc-freeze(1), lxc-unfreeze(1), lxc-attach(1), lxc.conf(5)

AUTHOR
       Daniel Lezcano <daniel.lezcano@free.fr>

                                                                                        2021-08-27                                                                           lxc-cgroup(1)
