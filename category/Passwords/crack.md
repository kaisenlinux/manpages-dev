CRACK(8)                                                               System Manager's Manual                                                              CRACK(8)

NAME
       Crack, Reporter - programs to break password files

SYNOPSIS
       Crack [options] [-fmt format] [file ...]
       Crack-Reporter [-quiet] [-html]

DESCRIPTION
       This  manual  page  documents briefly the Crack, and Crack-Reporter commands.  This manual page was written for the Debian GNU/Linux distribution because the
       original program does not have a manual page.  Instead, there is some documentation available at /usr/share/doc/crack which you are encouraged to read

       Crack is not a program designed to break the password of every user in the file.  Rather, it is designed to find weak passwords in  the  file,  by  attacking
       those sorts of bad passwords which are most likely to be used, in the order in which they would most easily be found (ie: are most likely to be used by a mo‐
       ronic user).

       Crack is not designed to break user passwords; it is designed to break password files.  This is a subtle but important distinction.

       Crack-Reporter will show what passwords have been cracked, as well as view errors that have been detected in the source password  files,  etc.   Guesses  are
       listed  chronologically,  so users who wish to see incremental changes in the output as Crack continues to run over a course of days or weeks, are encouraged
       to wrap invocations of Crack-Reporter in a script with diff.

OPTIONS
       A summary of options are included below.  For Crack:

       -makedict
              Creates and compresses the dictionaries Crack will use

       -makeonly
              Compiles the binaries for Crack (not necessary for Debian GNU/Linux since they are already provided)

       -debug Lets you see what the Crack script is doing.

       -recover
              Used when restarting an abnormally-terminated run; suppresses rebuild of the gecos-derived dictionaries.

       -fgnd  Runs the password cracker in the foreground, with stdin, stdout and stderr attached to the usual places.

       -fmt format
              Specifies the input file format.

       -from N
              Starts password cracking from rule number "N".

       -keep  Prevents deletion of the temporary file used to store the password cracker's input.

       -mail  E-Mail a warning message to anyone whose password is cracked.  See the script nastygram.

       -network
              Runs the password cracker in network mode.

       -nice N
              Runs the password cracker at a reduced priority, so that other jobs can take priority over the CPU.

       -kill filename

       -remote
              Internal options used to support networking.

              For Crack-Reporter -html Produces output in a fairly basic HTML-readable format.  -quiet Suppresses the reporting of errors in the password file (cor‐
              rupt entries, etc)

EXAMPLES
       To run Crack

          # Crack -nice 10 /etc/passwd

       If a Crack session is killed accidentally, it can be restarted with moderate efficiency by doing:

           mv run/Dhostname.N run/tempfilename
           Crack -recover -fmt spf run/tempfilename

       However if all you wish to do is start cracking passwords from some specific rule number, or to restart a run whilst skipping over a few rulesets, try:

           Crack [-recover] -from N filename ...

       ...where N is the number of the rule to start working from.

FILES
       /usr/share/Crack Location of the Crack program and scripts.  /var/lib/Crack/ Location for the temporary files used by Crack.

SEE ALSO
       You  will find more documentation about Crack in the text files available in /usr/share/doc/crack-common Documentation includes the program's Manual (in HTML
       and Text files), the User's Frequently Asked Questions (FAQ), examples, articles and even some humour.

AUTHOR
       This manual page was written by Javier Fernández-Sanguino Peña <jfs@debian.org>, for the Debian GNU/Linux system (but may be used by others).

       Crack and Crack-Reporter (originally called Reporter) were written by Alec Muffett  <Alec.Muffett@UK.Sun.COM>

                                                                                                                                                            CRACK(8)
