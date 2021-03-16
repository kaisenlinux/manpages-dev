GRSYNC(1)                                                                  rsync frontend                                                                  GRSYNC(1)

NAME
       GRSYNC - GTK+ frontend for rsync

SYNOPSIS
       grsync [-e] [-s] [session_name]

       grsync -i session_file_name

DESCRIPTION
       GRSYNC  is  a graphical interface using GTK2 for the rsync command line program.  It currently supports the most important rsync features and can be used ef‐
       fectively for local directory synchronization.

OPTIONS
       You can specify a session to load instead of the default one, by typing it as a command line option.  The "-e" commandline option automatically executes  the
       session  and closes grsync when finished, unless an error has been encountered.  You can have grsync stay open anyway using the "-s" option (even if the ses‐
       sion run has been successfull).

       The alternative syntax, using the "-i" switch, will open the "import session" dialog on the file you specified as argument.

SEE ALSO
       Website <http://www.opbyte.it/grsync/>

AUTHOR
       GRSYNC was written by Piero Orsoni <info@opbyte.it>.

       This manual page was written by Daniel Baumann <daniel.baumann@panthera-systems.net>, for the Debian project (but may be used by others).  Updated  by  Piero
       Orsoni.

1.0.0                                                                        2010-01-07                                                                    GRSYNC(1)
