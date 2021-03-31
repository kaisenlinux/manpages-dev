ANSIBLE-INVENTORY(1)                                                             System administration commands                                                            ANSIBLE-INVENTORY(1)

NAME
       ansible-inventory - None

SYNOPSIS
       usage: ansible-inventory [-h] [--version] [-v] [-i INVENTORY]
              [--vault-id  VAULT_IDS]  [--ask-vault-pass  | --vault-password-file VAULT_PASSWORD_FILES] [--playbook-dir BASEDIR] [--list] [--host HOST] [--graph] [-y] [--toml] [--vars] [--ex‐
              port] [--output OUTPUT_FILE] [host|group]

DESCRIPTION
       used to display or dump the configured inventory as Ansible sees it

COMMON OPTIONS
          None

       --ask-vault-pass
          ask for vault password

       --export
          When doing an --list, represent in a way that is optimized for export,not as an accurate representation of how Ansible has processed it

       --graph
          create inventory graph, if supplying pattern it must be a valid group name

       --host 'HOST'
          Output specific host info, works as inventory script

       --list
          Output all hosts info, works as inventory script

       --list-hosts
          ==SUPPRESS==

       --output 'OUTPUT_FILE'
          When doing --list, send the inventory to a file instead of to the screen

       --playbook-dir 'BASEDIR'
          Since this tool does not use playbooks, use this as a substitute playbook directory.This sets the relative path for many features including roles/ group_vars/ etc.

       --toml
          Use TOML format instead of default JSON, ignored for --graph

       --vars
          Add vars to graph display, ignored unless used with --graph

       --vault-id
          the vault identity to use

       --vault-password-file
          vault password file

       --version
          show program's version number, config file location, configured module search path, module location, executable location and exit

       -h, --help
          show this help message and exit

       -i, --inventory, --inventory-file
          specify inventory host path or comma separated host list. --inventory-file is deprecated

       -l, --limit
          ==SUPPRESS==

       -v, --verbose
          verbose mode (-vvv for more, -vvvv to enable connection debugging)

       -y, --yaml
          Use YAML format instead of default JSON, ignored for --graph

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
       ansible (1), ansible-config (1), ansible-console (1), ansible-doc (1), ansible-galaxy (1), ansible-playbook (1), ansible-pull (1), ansible-vault (1)

       Extensive documentation is available in the documentation site: <https://docs.ansible.com>.  IRC and mailing  list  info  can  be  found  in  file  CONTRIBUTING.md,  available  in:  <‐
       https://github.com/ansible/ansible>

Ansible 2.9.16                                                                                                                                                             ANSIBLE-INVENTORY(1)
