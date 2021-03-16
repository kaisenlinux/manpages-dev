  lxc-monitor
 
## NAME
        lxc-monitor - monitor the container state
 
## SYNOPSIS
        lxc-monitor [-n name] [-Q name]
 
## DESCRIPTION
        lxc-monitor  monitors  the  state of containers. The name argument may be used to specify which containers to monitor. It is a regular expression, conforming
        with posix2, so it is possible to monitor all the containers, several of them or just one. If not specified, name will default to '.*' which will monitor all
        containers in lxcpath.
 
        The  -P,  --lxcpath=PATH  option  may be specified multiple times to monitor more than one container path. Note however that containers with the same name in
        multiple paths will be indistinguishable in the output.
 
## OPTIONS
        -Q, --quit
               Ask the lxc-monitord daemon on each given lxcpath to quit. After receiving this command, lxc-monitord will exit immediately  as  soon  as  it  has  no
               clients instead of waiting the normal 30 seconds for new clients. This is useful if you need to unmount the filesystem lxcpath is on.
 
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
        lxc-monitor -n foo
               will monitor the different states for container foo.
 
        lxc-monitor -n 'foo|bar'
               will monitor the different states for container foo and bar.
 
        lxc-monitor -n '[fb].*'
               will monitor the different states for container with the name beginning with letter 'f' or 'b'.
 
        lxc-monitor -n '.*'
               will monitor the different states for all containers.
 
 DIAGNOSTIC
        The container was not found
               The specified container was not created before with the lxc-create command.
 
## SEE ALSO
        regex(7),
 
## SEE ALSO
        lxc(7), lxc-create(1), lxc-copy(1), lxc-destroy(1), lxc-start(1), lxc-stop(1), lxc-execute(1), lxc-console(1),  lxc-monitor(1),  lxc-wait(1),  lxc-cgroup(1),
        lxc-ls(1), lxc-info(1), lxc-freeze(1), lxc-unfreeze(1), lxc-attach(1), lxc.conf(5)
 
## AUTHOR
        Daniel Lezcano <daniel.lezcano@free.fr>
 
                                                                              2020-10-28                                                               lxc-monitor(1)
