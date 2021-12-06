lxc-device(1)                                                                                                                                                                lxc-device(1)

NAME
       lxc-device - manage devices of running containers

SYNOPSIS
       lxc-device [-h] [-n name] [add] [DEVICE] [NAME]

DESCRIPTION
       lxc-device manages devices in running container.

OPTIONS
       -h     The full command help message.

       -n, --name=NAME
              The name of the target container.

       action What action to perform. Only 'add' is supported at this point.

       DEVICE The device to add to the container.  It can either be the path to a device under /dev or a network interface name.

       [NAME] Name for the device within the container.

EXAMPLES
       lxc-device -n p1 add /dev/video0
              Creates a /dev/video0 device in container p1 based on the matching device on the host.

       lxc-device -n p1 add eth0 eth1
              Moves eth0 from the host as eth1 in p1.

SEE ALSO
       lxc(7),  lxc-create(1), lxc-copy(1), lxc-destroy(1), lxc-start(1), lxc-stop(1), lxc-execute(1), lxc-console(1), lxc-monitor(1), lxc-wait(1), lxc-cgroup(1), lxc-ls(1), lxc-info(1),
       lxc-freeze(1), lxc-unfreeze(1), lxc-attach(1), lxc.conf(5)

AUTHOR
       Stéphane Graber <stgraber@ubuntu.com>

                                                                                        2021-08-27                                                                           lxc-device(1)
