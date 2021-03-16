CTOP(1)                                                                                                                                                      CTOP(1)

NAME
       ctop - command line / text based Linux Containers monitoring tool

SYNOPSYS
       ctop [options]

DESCRIPTION
       ctop will help you see what’s going on at the container level. Basically, containers are a logical group of processes isolated using kernel’s cgroups and
       namespaces. Recently, they have been made popular by Docker and they are also heavily used under the hood by systemd and a load of container tools like lxc,
       rocket, lmctfy and many others.

       Under the hood, ctop will collect all metrics it can from cgroups in realtime and render them to instantly give you an overview of the global system health.

       It currently collects metrics related to cpu, memory and block IO usage as well as metadata such as owning user (mostly for systemd based containers), uptime
       and attempts to guess the container managing technology behind.

OPTIONS
       -h, --help
           show this help message and exit

       --tree
           show tree view by default

       --refresh=REFRESH
           Refresh display every <seconds>

       --follow=FOLLOW
           Follow cgroup path

       --fold=FOLD
           Fold cgroup sub tree

       --columns=COLUMNS
           List of optional columns to display. Always includes ‘name’

       --sort-col=SORT_COL
           Select column to sort by initially. Can be changed dynamically.

AUTHOR
       This manual page was written by ChangZhuo Chen <czchen@debian.org> for the Debian GNU/Linux system (but may be used by others).

                                                                             01/02/2021                                                                      CTOP(1)
