LXCFS(1)                                                                                 User Commands                                                                                 LXCFS(1)

NAME
       lxcfs - System virtualization filesystem for containers

SYNOPSIS
       lxcfs <directory>

DESCRIPTION
       LXCFS is a simple fuse- and cgroup-based filesystem virtualizing various aspects of the system to extend the useability of containers.

       lxcfs is a FUSE-based proc, sys and cgroup virtualizing filesystem

   Options :
       -d, --debug
              Run lxcfs with debugging enabled

       -f, --foreground
              Run lxcfs in the foreground

       -n, --help
              Print help

       -l, --enable-loadavg Enable loadavg virtualization

       -o     Options to pass directly through fuse

       -p, --pidfile=FILE
              Path to use for storing lxcfs pid Default pidfile is /run/lxcfs.pid

       -u, --disable-swap
              Disable swap virtualization

       -v, --version
              Print lxcfs version

       --enable-cfs
              Enable CPU virtualization via CPU shares

       --enable-pidfd
              Use pidfd for process tracking

SEE ALSO
       lxc(1), lxc.container.conf(5)

lxcfs 4.0.7                                                                              February 2021                                                                                 LXCFS(1)
