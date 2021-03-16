ANSIBLE-DOC(1)                                                     System administration commands                                                     ANSIBLE-DOC(1)

NAME
       ansible-doc - plugin documentation tool

SYNOPSIS
       usage: ansible-doc [-h] [--version] [-v] [-M MODULE_PATH]
              [--playbook-dir  BASEDIR]  [-t {become,cache,callback,cliconf,connection,httpapi,inventory,lookup,netconf,shell,module,strategy,vars}] [-j] [-F | -l |
              -s | --metadata-dump] [plugin ...]

DESCRIPTION
       displays information on modules installed in Ansible libraries.  It displays a terse listing of plugins and their short descriptions, provides a printout  of
       their DOCUMENTATION strings, and it can create a short "snippet" which can be pasted into a playbook.

COMMON OPTIONS
          Plugin

       --metadata-dump
          For internal testing only Dump json metadata for all plugins.

       --playbook-dir 'BASEDIR'
          Since  this  tool  does  not  use  playbooks,  use  this as a substitute playbook directory.This sets the relative path for many features including roles/
          group_vars/ etc.

       --version
          show program's version number, config file location, configured module search path, module location, executable location and exit

       -F, --list_files
          Show plugin names and their source files without summaries (implies --list)

       -M, --module-path
          prepend colon-separated path(s) to module library (default=~/.ansible/plugins/modules:/usr/share/ansible/plugins/modules)

       -h, --help
          show this help message and exit

       -j, --json
          Change output into json format.

       -l, --list
          List available plugins

       -s, --snippet
          Show playbook snippet for specified plugin(s)

       -t 'TYPE', --type 'TYPE'
          Choose which plugin type (defaults to "module"). Available plugin types are : ('become', 'cache', 'callback', 'cliconf', 'connection', 'httpapi',  'inven‐
          tory', 'lookup', 'netconf', 'shell', 'module', 'strategy', 'vars')

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
       ansible (1), ansible-config (1), ansible-console (1), ansible-galaxy (1), ansible-inventory (1), ansible-playbook (1), ansible-pull (1), ansible-vault (1)

       Extensive  documentation is available in the documentation site: <https://docs.ansible.com>.  IRC and mailing list info can be found in file CONTRIBUTING.md,
       available in: <https://github.com/ansible/ansible>

Ansible 2.9.16                                                                                                                                        ANSIBLE-DOC(1)
