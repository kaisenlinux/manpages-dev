lxc-unshare(1)                                                                                                                                                              lxc-unshare(1)

NAME
       lxc-unshare - Run a task in a new set of namespaces.

SYNOPSIS
       lxc-unshare {-s, --namespaces namespaces} [-u, --user user] [-H, --hostname hostname] [-i, --ifname ifname] [-d, --daemon] [-M, --remount] {command}

DESCRIPTION
       lxc-unshare  can be used to run a task in a cloned set of namespaces. This command is mainly provided for testing purposes.  Despite its name, it always uses clone rather than un‐
       share to create the new task with fresh namespaces. Apart from testing kernel regressions this should make no difference.

OPTIONS
       -s, --namespaces namespaces
              Specify the namespaces to attach to, as a pipe-separated list, e.g. NETWORK|IPC. Allowed values are MOUNT, PID, UTSNAME, IPC, USER and NETWORK. This allows  one  to  change
              the  context  of the process to e.g. the network namespace of the container while retaining the other namespaces as those of the host. (The pipe symbol needs to be escaped,
              e.g.  MOUNT\|PID or quoted, e.g.  "MOUNT|PID".)

       -u, --user user
              Specify a userid which the new task should become.

       -H, --hostname hostname
              Set the hostname in the new container. Only allowed if the UTSNAME namespace is set.

       -i, --ifname interfacename
              Move the named interface into the container. Only allowed if the NETWORK namespace is set. You may specify this argument multiple times to  move  multiple  interfaces  into
              container.

       -d, --daemon
              Daemonize (do not wait for the container to exit before exiting)

       -M, --remount
              Mount default filesystems (/proc /dev/shm and /dev/mqueue) in the container. Only allowed if MOUNT namespace is set.

EXAMPLES
       To spawn a new shell with its own UTS (hostname) namespace,

                 lxc-unshare -s UTSNAME /bin/bash

       If the hostname is changed in that shell, the change will not be reflected on the host.

       To spawn a shell in a new network, pid, and mount namespace,

                 lxc-unshare -s "NETWORK|PID|MOUNT" /bin/bash

       The resulting shell will have pid 1 and will see no network interfaces.  After re-mounting /proc in that shell,

                 mount -t proc proc /proc

       ps output will show there are no other processes in the namespace.

       To spawn a shell in a new network, pid, mount, and hostname namespace.

                 lxc-unshare -s "NETWORK|PID|MOUNT|UTSNAME" -M -H myhostname -i veth1 /bin/bash

       The  resulting  shell will have pid 1 and will see two network interfaces (lo and veth1). The hostname will be "myhostname" and /proc will have been remounted. ps output will show
       there are no other processes in the namespace.

SEE ALSO
       lxc(7), lxc-create(1), lxc-copy(1), lxc-destroy(1), lxc-start(1), lxc-stop(1), lxc-execute(1), lxc-console(1), lxc-monitor(1), lxc-wait(1), lxc-cgroup(1), lxc-ls(1),  lxc-info(1),
       lxc-freeze(1), lxc-unfreeze(1), lxc-attach(1), lxc.conf(5)

AUTHOR
       Daniel Lezcano <daniel.lezcano@free.fr>

                                                                                        2021-01-31                                                                          lxc-unshare(1)
