F2FSCRYPT(8)                                                                        System Manager's Manual                                                                        F2FSCRYPT(8)

NAME
       f2fscrypt - f2fs filesystem encryption utility

SYNOPSIS
       f2fscrypt add_key -S [ -k keyring ] [-v] [-q] [  path ... ]
       f2fscrypt new_session
       f2fscrypt get_policy path ...
       f2fscrypt set_policy policy path ...

DESCRIPTION
       f2fscrypt performs encryption management for f2fs file systems.

COMMANDS
       f2fscrypt add_key -S [ -k keyring ] [-v] [-q] [  path ... ]
              Prompts the user for a passphrase and inserts it into the specified keyring.  If no keyring is specified, f2fscrypt will use the session keyring if it exists or the user session
              keyring if it does not.

              If one or more directory paths are specified, f2fscrypt will try to set the policy of those directories to use the key just entered by the user.

       f2fscrypt get_policy path ...
              Print the policy for the directories specified on the command line.

       f2fscrypt new_session
              Give the invoking process (typically a shell) a new session keyring, discarding its old session keyring.

       f2fscrypt set_policy policy path ...
              Sets the policy for the directories specified on the command line.  All directories must be empty to set the policy; if the directory already has a policy established, f2fscrypt
              will validate that the policy matches what was specified.  A policy is an encryption key identifier consisting of 16 hexadecimal characters.

NOTES
       The target directory must be empty.

EXAMPLE
       Formats a f2fs filesytem that supports encrypt.

       # mkfs.f2fs -O encrypt /dev/sdxx
       # mount /dev/sdxx /encrypted/
       # mkdir /encrypted/dir

       First create the key in the keyring use an simple salt
       (or generate a random salt).
       Then use it to set the policy for the directory to be encrypted.

       # f2fscrypt add_key -S 0x1234
         Enter passphrase (echo disabled):
         Added key with descriptor [28e21cc0c4393da1]

       # f2fscrypt set_policy 28e21cc0c4393da1 /encrypted/dir
         Key with descriptor [28e21cc0c4393da1] applied to /encrypted/dir.

       # touch /encrypted/dir/test.txt
       # ls -l /encrypted/dir/
         -rw-r--r--. 1 root root 0 Mar  5 21:41 test.txt

       After each reboot, the same command can be used set the key for
       decryption of the directory and its descendants.

       # ls -l /encrypted/dir/
         -rw-r--r--. 1 root root 0 Mar  5 21:41 zbx7tsUEMLzh+AUVMkQcnB

       # f2fscrypt get_policy /encrypted/dir/
         /encrypted/dir/: 28e21cc0c4393da1

       # f2fscrypt add_key -S 0x1234
         Enter passphrase (echo disabled):
         Added key with descriptor [28e21cc0c4393da1]

       # ls -l /encrypted/dir/
         -rw-r--r--. 1 root root 0 Mar  5 21:41 test.txt

       Show process keyrings.

       # keyctl show
         Session Keyring
           84022412 --alswrv      0     0  keyring: _ses
          204615789 --alswrv      0 65534   \_ keyring: _uid.0
          529474961 --alsw-v      0     0   \_ logon: f2fs:28e21cc0c4393da1

AUTHOR
       Written  by Kinglong Mee <kinglongmee@gmail.com>, Migrated from e4crypt that Written by Michael Halcrow <mhalcrow@google.com>, Ildar Muslukhov <muslukhovi@gmail.com>, and Theodore Ts'o
       <tytso@mit.edu>

SEE ALSO
       keyctl(1), mkfs.f2fs(8), mount(8).

                                                                                                                                                                                   F2FSCRYPT(8)
