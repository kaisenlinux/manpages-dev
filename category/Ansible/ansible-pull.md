ANSIBLE-PULL(1)                                                                  System administration commands                                                                 ANSIBLE-PULL(1)

NAME
       ansible-pull - pulls playbooks from a VCS repo and executes them for the local host

SYNOPSIS
       usage: ansible-pull [-h] [--version] [-v] [-k]
              [--private-key  PRIVATE_KEY_FILE] [-u REMOTE_USER] [-c CONNECTION] [-T TIMEOUT] [--ssh-common-args SSH_COMMON_ARGS] [--sftp-extra-args SFTP_EXTRA_ARGS] [--scp-extra-args SCP_EX‐
              TRA_ARGS] [--ssh-extra-args SSH_EXTRA_ARGS] [--vault-id VAULT_IDS] [--ask-vault-pass  |  --vault-password-file  VAULT_PASSWORD_FILES]  [-e  EXTRA_VARS]  [-t  TAGS]  [--skip-tags
              SKIP_TAGS]  [-i INVENTORY] [--list-hosts] [-l SUBSET] [-M MODULE_PATH] [-K] [--purge] [-o] [-s SLEEP] [-f] [-d DEST] [-U URL] [--full] [-C CHECKOUT] [--accept-host-key] [-m MOD‐
              ULE_NAME] [--verify-commit] [--clean] [--track-subs] [--check] [--diff] [playbook.yml ...]

DESCRIPTION
       is used to up a remote copy of ansible on each managed node, each set to run via cron and update playbook source via a source repository.  This inverts the default push architecture of
       ansible into a pull architecture, which has near-limitless scaling potential.

       The setup playbook can be tuned to change the cron frequency, logging locations, and parameters to ansible-pull.  This is useful both for extreme scale-out as well as periodic remedia‐
       tion.  Usage of the 'fetch' module to retrieve logs from ansible-pull runs would be an excellent way to gather and analyze remote logs from ansible-pull.

COMMON OPTIONS
          Playbook(s)

       --accept-host-key
          adds the hostkey for the repo url if not already added

       --ask-vault-pass
          ask for vault password

       --check
          don't make any changes; instead, try to predict some of the changes that may occur

       --clean
          modified files in the working repository will be discarded

       --diff
          when changing (small) files and templates, show the differences in those files; works great with --check

       --full
          Do a full clone, instead of a shallow one.

       --list-hosts
          outputs a list of matching hosts; does not execute anything else

       --private-key 'PRIVATE_KEY_FILE', --key-file 'PRIVATE_KEY_FILE'
          use this file to authenticate the connection

       --purge
          purge checkout after playbook run

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

       --track-subs
          submodules will track the latest changes. This is equivalent to specifying the --remote flag to git submodule update

       --vault-id
          the vault identity to use

       --vault-password-file
          vault password file

       --verify-commit
          verify GPG signature of checked out commit, if it fails abort running the playbook. This needs the corresponding VCS module to support such an operation

       --version
          show program's version number, config file location, configured module search path, module location, executable location and exit

       -C 'CHECKOUT', --checkout 'CHECKOUT'
          branch/tag/commit to checkout. Defaults to behavior of repository module.

       -K, --ask-become-pass
          ask for privilege escalation password

       -M, --module-path
          prepend colon-separated path(s) to module library (default=~/.ansible/plugins/modules:/usr/share/ansible/plugins/modules)

       -T 'TIMEOUT', --timeout 'TIMEOUT'
          override the connection timeout in seconds (default=10)

       -U 'URL', --url 'URL'
          URL of the playbook repository

       -c 'CONNECTION', --connection 'CONNECTION'
          connection type to use (default=smart)

       -d 'DEST', --directory 'DEST'
          directory to checkout repository to

       -e, --extra-vars
          set additional variables as key=value or YAML/JSON, if filename prepend with @

       -f, --force
          run the playbook even if the repository could not be updated

       -h, --help
          show this help message and exit

       -i, --inventory, --inventory-file
          specify inventory host path or comma separated host list. --inventory-file is deprecated

       -k, --ask-pass
          ask for connection password

       -l 'SUBSET', --limit 'SUBSET'
          further limit selected hosts to an additional pattern

       -m 'MODULE_NAME', --module-name 'MODULE_NAME'
          Repository module name, which ansible will use to check out the repo. Choices are ('git', 'subversion', 'hg', 'bzr'). Default is git.

       -o, --only-if-changed
          only run the playbook if the repository has been updated

       -s 'SLEEP', --sleep 'SLEEP'
          sleep for random interval (between 0 and n number of seconds) before starting. This is a useful way to disperse git requests

       -t, --tags
          only run plays and tasks tagged with these values

       -u 'REMOTE_USER', --user 'REMOTE_USER'
          connect as this user (default=None)

       -v, --verbose
          verbose mode (-vvv for more, -vvvv to enable connection debugging)

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
       ansible (1), ansible-config (1), ansible-console (1), ansible-doc (1), ansible-galaxy (1), ansible-inventory (1), ansible-playbook (1), ansible-vault (1)

       Extensive documentation is available in the documentation site: <https://docs.ansible.com>.  IRC and mailing  list  info  can  be  found  in  file  CONTRIBUTING.md,  available  in:  <‐
       https://github.com/ansible/ansible>

Ansible 2.9.16                                                                                                                                                                  ANSIBLE-PULL(1)
