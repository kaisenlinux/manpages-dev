ANSIBLE-GALAXY(1)                                                  System administration commands                                                  ANSIBLE-GALAXY(1)

NAME
       ansible-galaxy - Perform various Role and Collection related operations.

SYNOPSIS
       usage: ansible-galaxy [-h] [--version] [-v] TYPE ...

DESCRIPTION
       command to manage Ansible roles in shared repositories, the default of which is Ansible Galaxy https://galaxy.ansible.com.

COMMON OPTIONS
       --version
          show program's version number, config file location, configured module search path, module location, executable location and exit

       -h, --help
          show this help message and exit

       -v, --verbose
          verbose mode (-vvv for more, -vvvv to enable connection debugging)

ACTIONS
       collection
              Perform the action on an Ansible Galaxy collection. Must be combined with a further action like init/install as listed below.

       role   Perform the action on an Ansible Galaxy role. Must be combined with a further action like delete/install/init as listed below.

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
       ansible (1), ansible-config (1), ansible-console (1), ansible-doc (1), ansible-inventory (1), ansible-playbook (1), ansible-pull (1), ansible-vault (1)

       Extensive  documentation is available in the documentation site: <https://docs.ansible.com>.  IRC and mailing list info can be found in file CONTRIBUTING.md,
       available in: <https://github.com/ansible/ansible>

Ansible 2.9.16                                                                                                                                     ANSIBLE-GALAXY(1)
