VERSION:(8)                                                                     System Administration Utilities                                                                     VERSION:(8)

NAME
       lxctl - utility to manage Linux Containers (LXC)

DESCRIPTION
   Usage:
              lxctl [action] [vmname] [options]

OPTIONS
       --help Print a breif help message and exists

       --man  Prints the manual page and exits.

       start  Starts container specified in 1st argument

              Required arguments:

              vmname - name of the container

       stop   Stops container specified in 1st argument

              Required arguments:

              vmname - name of the container

       create Creates container.

              Required arguments:

              vmname - name of the container

              Optional arguments:

              --ipaddr - IP address of the machine

              --mask/netmask - network mask of the machine

              --defgw - default gateway of the machine

              --dns - primary DNS server

              --ostemplate - template name, by default it is 'lucid_amd64'

              --config - path to configuration file, by default /etc/lxc/<container name> is used

              --root - path to root file system, by default /var/lib/lxctl/<container name> is used

              --addpkg - list of additional packages (comma-separated)

              --pkgopt - list of additional packet manager options (space-separated, but as one argument)

              --rootsz - size of logical volume for root FS, by default it is 10G

              --hostname - sets the hostname of the machine, by default <container name> is used

              --searchdomain - set a custom searchdomain in /etc/resolv.conf

              --macaddr - set the custom mac address of the container

              --autostart - autostart container each reboot host machine

              --no-save - do not save yaml config for new container, by default $CONF_PATH/vmname.yaml is used

              --load - create container from yaml config

              --debug - show more information about install process

              --tz - set custom timezone (Europe/Moscow, UTC, etc)

              --empty - create a clear container for migrate here

       set    Changes container parameters.

              Required arguments:

              vmname - name of the container

              Optional arguments:

              --rootsz - increment of size of logical volume for root FS

              --ipaddr - IP address if the machine

              --mask/netmask - network mask of the machine

              --defgw - default gateway of the machine

              --dns - primary DNS server

              --hostname - sets the hostname of the machine

              --searchdomain - set a custom searchdomain in /etc/resolv.conf

              --macaddr - set the custom mac address if the machine

              --userpasswd user:passwd - sets password for given user

              --onboot {yes,no} - makes containet [do not] start at boot

              --tz - set custom timezone (Europe/Moscow, UTC, etc)

              --cpu-shares - sets the CPU share of the container

              --cpus - sets the CPU cores of the container

              --mem - sets the memory share of the container (in bytes!)

              --io - sets the IO share of the container

       freeze Freezes container

              Required arguments:

              vmname - name of the container

              unfreeze

              Unfreezes container

              Required arguments:

              vmname - name of the container

       list   Lists all containers

              Optional arguments:

              --ipaddr - display with IP addr

              --hostname - display with hostname.

              --cgroup - display with cgroup

              --mount - display with mount point for rootfs

              --diskspace - display with free/full size

              --all - display all information

              --raw - display only vmnames

              migrate Migrate container from localhost to remote host.

              Required arguments

              --vmname - container name

              --tohost - to which host we should migrate

              Optional arguments

              --remuser - remote username for ssh

              --remport - remote port for ssh

              --remname - remote container name

              --onboot - start on boot? 1 or 0

              --userpasswd - 'user:password' formatted password for user

              --clone - cloning, a little bit faster and softer then simple migration

              --rootsz - remote root fs size

              --afterstart - start local container again after migration

              --cpus - cpus allocated to container

              --cpu-shares - cpu time share of the container

              --mem - memory limit of the container

              --io - IO throughput

              --ipaddr - IP of the remote container

              --searchdomain - DNS search domain of the container

              --netmask - network mask

              --defgw - default gateway

              --dns - DNS server

       vz2lxc Migrate VZ-container from remote host to local LXC container.

              Required arguments

              --vmname - container name

              --fromhost - from which host we should migrate

              --remname - remote container name

              Optional arguments

              --remuser - remote username for ssh

              --remport - remote port for ssh

              --onboot - start on boot? 1 or 0

              --rootsz - remote root fs size

              --afterstart - start local container again after migration

              --cpus - cpus allocated to container

              --cpu-shares - cpu time share of the container

              --mem - memory limit of the container

              --io - IO throughput

SEE ALSO
       The full documentation for Version: is maintained as a Texinfo manual.  If the info and Version: programs are properly installed at your site, the command

              info Version:

       should give you access to the complete manual.

Version: 0.3.0                                                                             June 2012                                                                                VERSION:(8)
