lxc-start(1)                                                                                                                                                                       lxc-start(1)

NAME
       lxc-start - run an application inside a container.

SYNOPSIS
       lxc-start {-n name} [-f config_file] [-c console_device] [-L console_logfile] [-d] [-F] [-p pid_file] [-s KEY=VAL] [-C] [--share-[net|ipc|uts] name|pid] [command]

DESCRIPTION
       lxc-start runs the specified command inside the container specified by name.

       It will setup the container according to the configuration previously defined with the lxc-create command or with the configuration file parameter.  If no configuration is defined, the
       default isolation is used.

       If no command is specified, lxc-start will use the command defined in lxc.init.cmd or if not set, the default "/sbin/init" command to run a system container.

OPTIONS
       -d, --daemon
              Run the container as a daemon. As the container has no more tty, if an error occurs nothing will be displayed, the log file can be used to check the error. (This is the  default
              mode)

       -F, --foreground
              Run the container in the foreground. In this mode, the container console will be attached to the current tty and signals will be routed directly to the container.

       -p, --pidfile pid_file
              Create a file with the process id.

       -f, --rcfile config_file
              Specify the configuration file to configure the virtualization and isolation functionalities for the container.

              This configuration file if present will be used even if there is already a configuration file present in the previously created container (via lxc-create).

       -c, --console console_device
              Specify a device to use for the container's console, for example /dev/tty8. If this option is not specified the current terminal will be used unless -d is specified.

       -L, --console-log console_logfile
              Specify a file to log the container's console output to.

       -s, --define KEY=VAL
              Assign value VAL to configuration variable KEY. This overrides any assignment done in config_file.

       -C, --close-all-fds
              If any file descriptors are inherited, close them. If this option is not specified, then lxc-start will exit with failure instead. Note: --daemon implies --close-all-fds.

       --share-net name|pid
              Inherit  a  network  namespace from a name container or a pid. The network namespace will continue to be managed by the original owner. The network configuration of the starting
              container is ignored and the up/down scripts won't be executed.

       --share-ipc name|pid
              Inherit an IPC namespace from a name container or a pid.

       --share-uts name|pid
              Inherit a UTS namespace from a name container or a pid. The starting LXC will not set the hostname, but the container OS may do it anyway.

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
       The container is busy
              The specified container is already running an application. You should stop it before reuse this container or create a new one.

SEE ALSO
       lxc(7), lxc-create(1), lxc-copy(1), lxc-destroy(1), lxc-start(1), lxc-stop(1), lxc-execute(1), lxc-console(1), lxc-monitor(1), lxc-wait(1), lxc-cgroup(1), lxc-ls(1), lxc-info(1),  lxc-
       freeze(1), lxc-unfreeze(1), lxc-attach(1), lxc.conf(5)

AUTHOR
       Daniel Lezcano <daniel.lezcano@free.fr>

                                                                                           2021-01-31                                                                              lxc-start(1)
