lxc-info(1)                                                                                                                                              lxc-info(1)

NAME
       lxc-info - query information about a container

SYNOPSIS
       lxc-info {-n name} [-c KEY] [-s] [-p] [-i] [-S] [-H]

DESCRIPTION
       lxc-info queries and shows information about a container.

OPTIONS
       -c, --config KEY
              Print a configuration key from the container. This option may be given multiple times to print out multiple key = value pairs.

       -s, --state
              Just print the container's state.

       -p, --pid
              Just print the container's pid.

       -i, --ips
              Just print the container's IP addresses.

       -S, --stats
              Just  print  the container's statistics.  Note that for performance reasons the kernel does not account kernel memory use unless a kernel memory limit
              is set. If a limit is not set, lxc-info will display kernel memory use as 0. A limit can be set by specifying

                          lxc.cgroup.memory.kmem.limit_in_bytes = number

              in your container configuration file, see lxc.conf(5).

       -H, --no-humanize
              Print the container's statistics in raw, non-humanized form. The default is to print statistics in humanized form.

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

              This configuration file if present will be used even if there is already a configuration file present in the previously created  container  (via  lxc-
              create).

       --version
              Show the version number.

EXAMPLES
       lxc-info -n foo
              Show information for foo.

       lxc-info -n 'ubuntu.*'
              Show information for all containers whose name starts with ubuntu.

       lxc-info -n foo -c lxc.net.0.veth.pair
              prints the veth pair name of foo.

SEE ALSO
       lxc(7),  lxc-create(1),  lxc-copy(1),  lxc-destroy(1), lxc-start(1), lxc-stop(1), lxc-execute(1), lxc-console(1), lxc-monitor(1), lxc-wait(1), lxc-cgroup(1),
       lxc-ls(1), lxc-info(1), lxc-freeze(1), lxc-unfreeze(1), lxc-attach(1), lxc.conf(5)

AUTHOR
       Stéphane Graber <stgraber@ubuntu.com>

                                                                             2020-12-30                                                                  lxc-info(1)
