lxc-console(1)                                                                                                                                                              lxc-console(1)

NAME
       lxc-console - Launch a console for the specified container

SYNOPSIS
       lxc-console {-n name} [-e escape character] [-t ttynum]

DESCRIPTION
       If the tty service has been configured and is available for the container specified as parameter, this command will launch a console allowing to log on the container.

       The  available  tty  are free slots taken by this command. That means if the container has four ttys available and the command has been launched four times each taking a different
       tty, the fifth command will fail because no console will be available.

       The command will connect to a tty. If the connection is lost or broken, the command can be launched again and regain the tty at the state it was before the disconnection.

       A ttynum of 0 may be given to attach to the container's /dev/console instead of its dev/tty<ttynum>.

       A keyboard escape sequence may be used to disconnect from the tty and quit lxc-console. The default escape sequence is <Ctrl+a q>.

OPTIONS
       -e, --escape escape character
              Specify the escape sequence prefix to use instead of <Ctrl a>.  This may be given as '^letter' or just 'letter'. For example to use <Ctrl+b q> as the escape sequence use -e
              '^b'.

       -t, --tty ttynum
              Specify the tty number to connect to or 0 for the console. If not specified the next available tty number will be automatically chosen by the container.

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
       tty service denied
              No tty is available or there is not enough privilege to use the console. For example, the container belongs to user "foo" and "bar" is trying to open a console to it.

SEE ALSO
       lxc(7),  lxc-create(1), lxc-copy(1), lxc-destroy(1), lxc-start(1), lxc-stop(1), lxc-execute(1), lxc-console(1), lxc-monitor(1), lxc-wait(1), lxc-cgroup(1), lxc-ls(1), lxc-info(1),
       lxc-freeze(1), lxc-unfreeze(1), lxc-attach(1), lxc.conf(5)

AUTHOR
       Daniel Lezcano <daniel.lezcano@free.fr>

                                                                                        2021-01-31                                                                          lxc-console(1)
