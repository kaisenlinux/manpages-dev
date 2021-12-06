lxc-ls(1)                                                                                                                                                                        lxc-ls(1)

NAME
       lxc-ls - list the containers existing on the system

SYNOPSIS
       lxc-ls [-1] [--active] [--frozen] [--running] [--stopped] [--defined] [-f] [-F format] [-g groups] [--nesting=NUM] [--filter=regex]

DESCRIPTION
       lxc-ls list the containers existing on the system.

OPTIONS
       -1     Show one entry per line. (default when /dev/stdout isn't a tty)

       --active
              List only active containers (same as --frozen --running).

       --frozen
              List only frozen containers.

       --running
              List only running containers.

       --stopped
              List only stopped containers.

       --defined
              List only defined containers.

       -f,--fancy
              Use a fancy, column-based output.

       -F,--fancy-format format
              Comma separated list of columns to show in the fancy output.  The list of accepted and default fields is listed in --help.

       -g,--groups groups
              Comma separated list of groups the container must have to be displayed.  The parameter may be passed multiple times.

       --nesting=NUM
              Show nested containers. The number of nesting levels to be shown can be specified by passing a number as argument.

       --filter=regex
              The  regular  expression passed to lxc-ls will be applied to the container name. The format is a POSIX extended regular expression. It can also be given as additional argu‐
              ment without explicitly using --filter.

EXAMPLES
       lxc-ls --fancy
              list all the containers, listing one per line along with its name, state, ipv4 and ipv6 addresses.

       lxc-ls --active -1
              list active containers and display the list in one column.

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

HISTORY
       Written originally as a shell script by Daniel Lezcano and Serge Hallyn.  Later reimplemented and extended in Python by Stéphane Graber and then reimplemented and extended in C by
       Christian Brauner.

AUTHOR
       Christian Brauner <christian.brauner@mailbox.org>, Stéphane Graber <stgraber@ubuntu.com>

                                                                                        2021-08-27                                                                               lxc-ls(1)
