  ANSIBLE-PLAYBOOK
 
## NAME
        ansible-playbook - Runs Ansible playbooks, executing the defined tasks on the targeted hosts.
 
## SYNOPSIS
        usage: ansible-playbook [-h] [--version] [-v] [-k]
               [--private-key PRIVATE_KEY_FILE] [-u REMOTE_USER] [-c CONNECTION] [-T TIMEOUT] [--ssh-common-args SSH_COMMON_ARGS] [--sftp-extra-args SFTP_EXTRA_ARGS]
               [--scp-extra-args SCP_EXTRA_ARGS] [--ssh-extra-args SSH_EXTRA_ARGS] [--force-handlers] [--flush-cache]  [-b]  [--become-method  BECOME_METHOD]  [--be‐
               come-user  BECOME_USER]  [-K]  [-t  TAGS] [--skip-tags SKIP_TAGS] [-C] [--syntax-check] [-D] [-i INVENTORY] [--list-hosts] [-l SUBSET] [-e EXTRA_VARS]
               [--vault-id VAULT_IDS] [--ask-vault-pass | --vault-password-file  VAULT_PASSWORD_FILES]  [-f  FORKS]  [-M  MODULE_PATH]  [--list-tasks]  [--list-tags]
               [--step] [--start-at-task START_AT_TASK] playbook [playbook ...]
 
## DESCRIPTION
        the  tool to run Ansible playbooks, which are a configuration and multinode deployment system.  See the project home page (https://docs.ansible.com) for more
        information.
 
## COMMON OPTIONS
           Playbook(s)
 
        --ask-vault-pass
           ask for vault password
 
        --become-method 'BECOME_METHOD'
           privilege escalation method to use (default=%(default)s), use ansible-doc -t become -l to list valid choices.
 
        --become-user 'BECOME_USER'
           run operations as this user (default=root)
 
        --flush-cache
           clear the fact cache for every host in inventory
 
        --force-handlers
           run handlers even if a task fails
 
        --list-hosts
           outputs a list of matching hosts; does not execute anything else
 
        --list-tags
           list all available tags
 
        --list-tasks
           list all tasks that would be executed
 
        --private-key 'PRIVATE_KEY_FILE', --key-file 'PRIVATE_KEY_FILE'
           use this file to authenticate the connection
 
        --scp-extra-args 'SCP_EXTRA_ARGS'
           specify extra arguments to pass to scp only (e.g. -l)
 
        --sftp-extra-args 'SFTP_EXTRA_ARGS'
           specify extra arguments to pass to sftp only (e.g. -f, -l)
 
        --skip-tags
           only run plays and tasks whose tags do not match these values
 
        --ssh-common-args 'SSH_COMMON_ARGS'
           specify common arguments to pass to sftp/scp/ssh (e.g. ProxyCommand)
 
        --ssh-extra-args 'SSH_EXTRA_ARGS'
           specify extra arguments to pass to ssh only (e.g. -R)
 
        --start-at-task 'START_AT_TASK'
           start the playbook at the task matching this name
 
        --step
           one-step-at-a-time: confirm each task before running
 
        --syntax-check
           perform a syntax check on the playbook, but do not execute it
 
        --vault-id
           the vault identity to use
 
        --vault-password-file
           vault password file
 
        --version
           show program's version number, config file location, configured module search path, module location, executable location and exit
 
        -C, --check
           don't make any changes; instead, try to predict some of the changes that may occur
 
        -D, --diff
           when changing (small) files and templates, show the differences in those files; works great with --check
 
        -K, --ask-become-pass
           ask for privilege escalation password
 
        -M, --module-path
           prepend colon-separated path(s) to module library (default=~/.ansible/plugins/modules:/usr/share/ansible/plugins/modules)
 
        -T 'TIMEOUT', --timeout 'TIMEOUT'
           override the connection timeout in seconds (default=10)
 
        -b, --become
           run operations with become (does not imply password prompting)
 
        -c 'CONNECTION', --connection 'CONNECTION'
           connection type to use (default=smart)
 
        -e, --extra-vars
           set additional variables as key=value or YAML/JSON, if filename prepend with @
 
        -f 'FORKS', --forks 'FORKS'
           specify number of parallel processes to use (default=5)
 
        -h, --help
           show this help message and exit
 
        -i, --inventory, --inventory-file
           specify inventory host path or comma separated host list. --inventory-file is deprecated
 
        -k, --ask-pass
           ask for connection password
 
        -l 'SUBSET', --limit 'SUBSET'
           further limit selected hosts to an additional pattern
 
        -t, --tags
           only run plays and tasks tagged with these values
 
        -u 'REMOTE_USER', --user 'REMOTE_USER'
           connect as this user (default=None)
 
        -v, --verbose
           verbose mode (-vvv for more, -vvvv to enable connection debugging)
 
## ENVIRONMENT
        The following environment variables may be specified.
 
        ANSIBLE_CONFIG -- Specify override location for the ansible config file
 
        Many more are available for most options in ansible.cfg
 
        For a full list check https://docs.ansible.com/. or use the ansible-config command.
 
## FILES
        /etc/ansible/ansible.cfg -- Config file, used if present
 
        ~/.ansible.cfg -- User config file, overrides the default config if present
 
        ./ansible.cfg -- Local config file (in current working directory) assumed to be 'project specific' and overrides the rest if present.
 
        As mentioned above, the ANSIBLE_CONFIG environment variable will override all others.
 
## AUTHOR
        Ansible was originally written by Michael DeHaan.
 
 COPYRIGHT
        Copyright © 2018 Red Hat, Inc | Ansible.  Ansible is released under the terms of the GPLv3 license.
 
## SEE ALSO
        ansible (1), ansible-config (1), ansible-console (1), ansible-doc (1), ansible-galaxy (1), ansible-inventory (1), ansible-pull (1), ansible-vault (1)
 
        Extensive documentation is available in the documentation site: <https://docs.ansible.com>.  IRC and mailing list info can be found in file  CONTRIBUTING.md,
        available in: <https://github.com/ansible/ansible>
 
 Ansible 2.9.13                                                                                                                                   ANSIBLE-PLAYBOOK(1)
