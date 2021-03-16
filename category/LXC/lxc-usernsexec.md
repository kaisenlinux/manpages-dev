lxc-usernsexec(1)                                                                                                                                  lxc-usernsexec(1)

NAME
       lxc-usernsexec - Run a task as root in a new user namespace.

SYNOPSIS
       lxc-usernsexec [-m uid-map] {-- command}

DESCRIPTION
       lxc-usernsexec can be used to run a task as root in a new user namespace.

OPTIONS
       -m uid-map
              The  uid  map to use in the user namespace. Each map consists of four colon-separate values. First a character 'u', 'g' or 'b' to specify whether this
              map pertains to user ids, group ids, or both; next the first userid in the user namespace; next the first userid as seen on the host; and finally  the
              number of ids to be mapped.

              More than one map can be specified. If no map is specified, then by default the full uid and gid ranges granted by /etc/subuid and /etc/subgid will be
              mapped to the uids and gids starting at 0 in the container.

              Note that lxc-usernsexec always tries to setuid and setgid to 0 in the namespace. Therefore uid 0 in the namespace must be mapped.

EXAMPLES
       To spawn a shell with the full allotted subuids mapped into the container, use

              lxc-usernsexec

       To run a different shell than /bin/sh, use

              lxc-usernsexec -- /bin/bash

       If your user id is 1000, root in a container is mapped to 190000, and you wish to chown a file you own to root in the container, you can use:

              lxc-usernsexec -m b:0:1000:1 -m b:1:190000:1 -- /bin/chown 1:1 $file

       This maps your userid to root in the user namespace, and 190000 to uid 1.  Since root in the user namespace is privileged over all userids  mapped  into  the
       namespace, you are allowed to change the file ownership, which you could not do on the host using a simple chown.

SEE ALSO
       lxc(7),  lxc-create(1),  lxc-copy(1),  lxc-destroy(1), lxc-start(1), lxc-stop(1), lxc-execute(1), lxc-console(1), lxc-monitor(1), lxc-wait(1), lxc-cgroup(1),
       lxc-ls(1), lxc-info(1), lxc-freeze(1), lxc-unfreeze(1), lxc-attach(1), lxc.conf(5)

AUTHOR
       Serge Hallyn <serge.hallyn@ubuntu.com>

                                                                             2020-12-30                                                            lxc-usernsexec(1)
