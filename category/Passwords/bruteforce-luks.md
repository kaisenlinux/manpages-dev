BRUTEFORCE-LUKS(1)                                                              Bruteforce LUKS encrypted volume                                                             BRUTEFORCE-LUKS(1)

NAME
       bruteforce-luks - try to find the password of a LUKS volume

SYNOPSIS
       bruteforce-luks [options] <path to LUKS volume>

DESCRIPTION
       The purpose of this program is to try to find the password of a LUKS encrypted volume.

       It can be used in two ways:

              •  brute  force  attack:  try all the possible passwords given a character set.  It is especially useful if you know something about the password (i.e. you forgot a part of your
              password but still remember most of it). Finding the password of a volume without knowing anything about it would take way too much time (unless the  password  is  really  short
              and/or weak).

              • dictionary attack: try all the passwords in a file.

       The program can use several threads (the number of threads can be specified with the -t command line option).

       Sending a USR1 signal to a running bruteforce-luks process makes it print progress info to standard error and continue.

OPTIONS
       -b <string>
              Beginning of the password.
              Default: ""

       -e <string>
              End of the password.
              Default: ""

       -f <file>
              Read the passwords from a file instead of generating them.

       -h     Show help and quit.

       -l <length>
              Minimum password length (beginning and end included).
              Default: 1

       -m <length>
              Maximum password length (beginning and end included).
              Default: 8

       -s <string>
              Password character set.
              Default: "0123456789ABCDEFGHIJKLMNOPQRSTU
                        VWXYZabcdefghijklmnopqrstuvwxyz"

       -t <n> Number of threads to use.
              Default: 1

       -v <n> Print progress info every n seconds.

       -w <file>
              Restore the state of a previous session if the file exists,
              then write the state to the file regularly (~ every minute).

EXAMPLES
       Try to find the password of a LUKS encrypted volume using 4 threads, trying only passwords with 5 characters:

           bruteforce-luks -t 4 -l 5 -m 5 /dev/sdb1

       Try to find the password of a LUKS encrypted volume using 8 threads, trying only passwords with 5 to 10 characters beginning with "W4l" and ending with "z":

           bruteforce-luks -t 8 -l 5 -m 10 -b "W4l" -e "z" /dev/sda2

       Try to find the password of a LUKS encrypted volume using 8 threads, trying only passwords with 10 characters using the character set "P情8ŭ":

           bruteforce-luks -t 8 -l 10 -m 10 -s "P情8ŭ" /dev/sdc3

       Try to find the password of a LUKS encrypted volume using 6 threads, trying the passwords contained in a dictionary file:

           bruteforce-luks -t 6 -f dictionary.txt /dev/sdd1

       Instead of passing a block device to the program, you can copy the beginning of the LUKS volume to a file and pass this file to the program:

           sudo dd if=/dev/sda1 of=/tmp/luks-header bs=1M count=10
           bruteforce-luks -t 4 -l 5 -m 5 /tmp/luks-header

       Print progress info:

           pkill -USR1 -f bruteforce-luks

       Print progress info every 30 seconds:

           bruteforce-luks -t 6 -f dictionary.txt -v 30 /dev/sdd1

       Save/restore state between sessions:

           bruteforce-luks -t 6 -f dictionary.txt -w state.txt /dev/sdd1
             (Let the program run for a few minutes and stop it)
           bruteforce-luks -t 6 -w state.txt /dev/sdd1

BRUTEFORCE-LUKS 1.3.1                                                                      July 2017                                                                         BRUTEFORCE-LUKS(1)
