ANSIBLE-VAULT(1)                                                              System administration commands                                                              ANSIBLE-VAULT(1)

NAME
       ansible-vault - encryption/decryption utility for Ansible data files

SYNOPSIS
       usage: ansible-vault [-h] [--version] [-v]
              {create,decrypt,edit,view,encrypt,encrypt_string,rekey} ...

DESCRIPTION
       can  encrypt any structured data file used by Ansible.  This can include group_vars/ or host_vars/ inventory variables, variables loaded by include_vars or vars_files, or variable
       files passed on the ansible-playbook command line with -e @file.yml or -e @file.json.  Role variables and defaults are also included!

       Because Ansible tasks, handlers, and other objects are data, these can also be encrypted with vault.  If you'd like to not expose what variables you are using, you can keep an in‐
       dividual task file entirely encrypted.

COMMON OPTIONS
       --version
          show program's version number, config file location, configured module search path, module location, executable location and exit

       -h, --help
          show this help message and exit

       -v, --verbose
          verbose mode (-vvv for more, -vvvv to enable connection debugging)

ACTIONS
       create create and open a file in an editor that will be encrypted with the provided vault secret when closed

              --ask-vault-pass
                 ask for vault password

              --encrypt-vault-id 'ENCRYPT_VAULT_ID'
                 the vault id used to encrypt (required if more than vault-id is provided)

              --vault-id
                 the vault identity to use

              --vault-password-file
                 vault password file

       decrypt
              decrypt the supplied file using the provided vault secret

              --ask-vault-pass
                 ask for vault password

              --output 'OUTPUT_FILE'
                 output file name for encrypt or decrypt; use - for stdout

              --vault-id
                 the vault identity to use

              --vault-password-file
                 vault password file

       edit   open and decrypt an existing vaulted file in an editor, that will be encrypted again when closed

              --ask-vault-pass
                 ask for vault password

              --encrypt-vault-id 'ENCRYPT_VAULT_ID'
                 the vault id used to encrypt (required if more than vault-id is provided)

              --vault-id
                 the vault identity to use

              --vault-password-file
                 vault password file

       view   open, decrypt and view an existing vaulted file using a pager using the supplied vault secret

              --ask-vault-pass
                 ask for vault password

              --vault-id
                 the vault identity to use

              --vault-password-file
                 vault password file

       encrypt
              encrypt the supplied file using the provided vault secret

              --ask-vault-pass
                 ask for vault password

              --encrypt-vault-id 'ENCRYPT_VAULT_ID'
                 the vault id used to encrypt (required if more than vault-id is provided)

              --output 'OUTPUT_FILE'
                 output file name for encrypt or decrypt; use - for stdout

              --vault-id
                 the vault identity to use

              --vault-password-file
                 vault password file

       encrypt_string
              encrypt the supplied string using the provided vault secret

              --ask-vault-pass
                 ask for vault password

              --encrypt-vault-id 'ENCRYPT_VAULT_ID'
                 the vault id used to encrypt (required if more than vault-id is provided)

              --output 'OUTPUT_FILE'
                 output file name for encrypt or decrypt; use - for stdout

              --stdin-name 'ENCRYPT_STRING_STDIN_NAME'
                 Specify the variable name for stdin

              --vault-id
                 the vault identity to use

              --vault-password-file
                 vault password file

              -n,   --name
                 Specify the variable name

              -p,   --prompt
                 Prompt for the string to encrypt

       rekey  re-encrypt a vaulted file with a new secret, the previous secret is required

              --ask-vault-pass
                 ask for vault password

              --encrypt-vault-id 'ENCRYPT_VAULT_ID'
                 the vault id used to encrypt (required if more than vault-id is provided)

              --new-vault-id 'NEW_VAULT_ID'
                 the new vault identity to use for rekey

              --new-vault-password-file 'NEW_VAULT_PASSWORD_FILE'
                 new vault password file for rekey

              --vault-id
                 the vault identity to use

              --vault-password-file
                 vault password file

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
       ansible (1), ansible-config (1), ansible-console (1), ansible-doc (1), ansible-galaxy (1), ansible-inventory (1), ansible-playbook (1), ansible-pull (1),

       Extensive  documentation  is  available  in  the  documentation site: <https://docs.ansible.com>.  IRC and mailing list info can be found in file CONTRIBUTING.md, available in: <‐
       https://github.com/ansible/ansible>

Ansible 2.9.16                                                                                                                                                            ANSIBLE-VAULT(1)
