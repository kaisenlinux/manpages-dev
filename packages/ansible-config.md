ANSIBLE-CONFIG(1)                                                             System administration commands                                                             ANSIBLE-CONFIG(1)

NAME
       ansible-config - View ansible configuration.

SYNOPSIS
       usage: ansible-config [-h] [--version] [-v] {list,dump,view} ...

DESCRIPTION
       Config command line class

COMMON OPTIONS
       --version
          show program's version number, config file location, configured module search path, module location, executable location and exit

       -h, --help
          show this help message and exit

       -v, --verbose
          verbose mode (-vvv for more, -vvvv to enable connection debugging)

ACTIONS
       list   list all current configs reading lib/constants.py and shows env and config file setting names

              -c 'CONFIG_FILE',   --config 'CONFIG_FILE'
                 path to configuration file, defaults to first file found in precedence.

       dump   Shows the current settings, merges ansible.cfg if specified

              --only-changed
                 Only show configurations that have changed from the default

              -c 'CONFIG_FILE',   --config 'CONFIG_FILE'
                 path to configuration file, defaults to first file found in precedence.

       view   Displays the current config file

              -c 'CONFIG_FILE',   --config 'CONFIG_FILE'
                 path to configuration file, defaults to first file found in precedence.

ENVIRONMENT
       The following environment variables may be specified.

       ANSIBLE_CONFIG -- Specify override location for the ansible config file

       Many more are available for most options in ansible.cfg

       For a full list check https://docs.ansible.com/. or use the ansible-config command.

FILES
       /etc/ansible/ansible.cfg -- Config file, used if present

       ~/.ansible.cfg -- User config file, overrides the default config if present

       ./ansible.cfg -- Local config file (in current working directory) assumed to be 'project specific' and overrides the rest if present.

       As mentioned above, the ANSIBLE_CONFIG environment variable will override all others.

AUTHOR
       Ansible was originally written by Michael DeHaan.

COPYRIGHT
       Copyright © 2018 Red Hat, Inc | Ansible.  Ansible is released under the terms of the GPLv3 license.

SEE ALSO
       ansible (1), ansible-console (1), ansible-doc (1), ansible-galaxy (1), ansible-inventory (1), ansible-playbook (1), ansible-pull (1), ansible-vault (1)

       Extensive  documentation  is  available  in  the  documentation site: <https://docs.ansible.com>.  IRC and mailing list info can be found in file CONTRIBUTING.md, available in: <‐
       https://github.com/ansible/ansible>

Ansible 2.10.8                                                                                                                                                           ANSIBLE-CONFIG(1)
