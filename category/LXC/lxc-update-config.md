lxc-update-config(1)                                                                                                                            lxc-update-config(1)

NAME
       lxc-update-config - update a legacy pre LXC 2.1 configuration file

SYNOPSIS
       lxc-update-config {-c config}

DESCRIPTION
       lxc-update-config detects any legacy configuration keys in the given config file and will replace them with the appropriate new configuration keys.

       lxc-update-config  will first create a backup of the old config file in the same directory and name it config.backup and then update the original config file
       in place. In case the update fails to apply or leads to an invalid config file that cannot be used to start a container users can either compare config  with
       config.backup  and  try to manually repair any the invalid configuration keys or simply rollback to the legacy configuration file by copying config.backup to
       config.

       Any failures for lxc-update-config to generate a useable config file are a bug and should be reported upstream.

OPTIONS
       -c, --config
              Path to the configuration file to update.

       -h, --help

SEE ALSO
       lxc(7), lxc-create(1), lxc-copy(1), lxc-destroy(1), lxc-start(1), lxc-stop(1), lxc-execute(1), lxc-console(1),  lxc-monitor(1),  lxc-wait(1),  lxc-cgroup(1),
       lxc-ls(1), lxc-info(1), lxc-freeze(1), lxc-unfreeze(1), lxc-attach(1), lxc.conf(5)

AUTHOR
       Christian Brauner <christian.brauner@ubuntu.com>

                                                                             2020-12-30                                                         lxc-update-config(1)
