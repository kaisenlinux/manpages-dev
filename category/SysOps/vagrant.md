VAGRANT(1)                                                                             User Commands                                                                            VAGRANT(1)

NAME
       Vagrant - Tool for building and distributing virtualized development environments.

SYNOPSIS
       vagrant [-v] [-h] command [<args>]

DESCRIPTION
       Vagrant is a tool for building and distributing virtualized development environments.

       Vagrant  provides  the framework and configuration format to create and manage complete portable development environments. These development environments can live on your computer
       or in the cloud, and are portable between Windows, Mac OS X, and Linux.

OPTIONS
       -v, --version
              Print the version and exit.

       -h, --help
              Print this help.

   Available subcommands:
       box    manages boxes: installation, removal, etc.

       destroy
              stops and deletes all traces of the vagrant machine

       halt   stops the vagrant machine

       help   shows the help for a subcommand

       init   initializes a new Vagrant environment by creating a Vagrantfile

       package
              packages a running vagrant environment into a box

       plugin manages plugins: install, uninstall, update, etc.

       provision
              provisions the vagrant machine

       reload restarts vagrant machine, loads new Vagrantfile configuration

       resume resume a suspended vagrant machine

       ssh    connects to machine via SSH

       ssh-config
              outputs OpenSSH valid configuration to connect to the machine

       status outputs status of the vagrant machine

       suspend
              suspends the machine

       up     starts and provisions the vagrant environment

AUTHOR
       Mitchell Hashimoto <mitchell.hashimoto@gmail.com>

SEE ALSO
       For help on any individual command run vagrant COMMAND -h

Vagrant 1.4.3                                                                          January 2014                                                                             VAGRANT(1)
