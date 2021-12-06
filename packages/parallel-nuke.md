parallel-nuke(1)                                                                  General Commands Manual                                                                 parallel-nuke(1)

NAME
       parallel-nuke — parallel process kill program

SYNOPSIS
       parallel-nuke [-vA] [-h hosts_file] [-H [user@]host[:port]] [-l user] [-p par] [-o outdir] [-e errdir] [-t timeout] [-O options] [-x args] [-X arg] pattern

DESCRIPTION
       parallel-nuke is a program for killing processes in parallel on a number of hosts.  It provides features such as passing a password to ssh, saving output to files, and timing out.

OPTIONS
       -h host_file
       --hosts host_file
              Read  hosts  from  the  given host_file.  Lines in the host file are of the form [user@]host[:port] and can include blank lines and comments (lines beginning with "#").  If
              multiple host files are given (the -h option is used more than once), then parallel-nuke behaves as though these files were concatenated together.  If a host  is  specified
              multiple times, then parallel-nuke will connect the given number of times.

       -H     [user@]host[:port]
       --host [user@]host[:port]
       -H     "[user@]host[:port] [ [user@]host[:port ] ... ]"
       --host "[user@]host[:port] [ [user@]host[:port ] ... ]"
              Add the given host strings to the list of hosts.  This option may be given multiple times, and may be used in conjunction with the -h option.

       -l user
       --user user
              Use the given username as the default for any host entries that don't specifically specify a user.

       -p parallelism
       --par parallelism
              Use the given number as the maximum number of concurrent connections.

       -t timeout
       --timeout timeout
              Make connections time out after the given number of seconds.  With a value of 0, parallel-nuke will not timeout any connections.

       -o outdir
       --outdir outdir
              Save  standard  output to files in the given directory.  Filenames are of the form [user@]host[:port][.num] where the user and port are only included for hosts that explic‐
              itly specify them.  The number is a counter that is incremented each time for hosts that are specified more than once.

       -e errdir
       --errdir errdir
              Save standard error to files in the given directory.  Filenames are of the same form as with the -o option.

       -x args
       --extra-args args
              Passes extra SSH command-line arguments (see the ssh(1) man page for more information about SSH arguments).  This option may be specified multiple times.  The arguments are
              processed to split on whitespace, protect text within quotes, and escape with backslashes.  To pass arguments without such processing, use the -X option instead.

       -X arg
       --extra-arg arg
              Passes a single SSH command-line argument (see the ssh(1) man page for more information about SSH arguments).  Unlike the -x option, no processing is performed on the argu‐
              ment, including word splitting.  To pass multiple command-line arguments, use the option once for each argument.

       -O options
       --options options
              SSH options in the format used in the SSH configuration file (see the ssh_config(5) man page for more information).  This option may be specified multiple times.

       -A
       --askpass
              Prompt for a password and pass it to ssh.  The password may be used for either to unlock a key or for password authentication.  The password is transferred in a fairly  se‐
              cure manner (e.g., it will not show up in argument lists).  However, be aware that a root user on your system could potentially intercept the password.

       -v
       --verbose
              Include error messages from ssh with the -i and -e options.

TIPS
       The  ssh_config file can include an arbitrary number of Host sections.  Each host entry specifies ssh options which apply only to the given host.  Host definitions can even behave
       like aliases if the HostName option is included.  This ssh feature, in combination with parallel-ssh host files, provides a tremendous amount of flexibility.

       Internally uses the pkill command and sends signal 9 (the unblockable KILL signal).

EXIT STATUS
       The exit status codes from parallel-nuke are as follows:

       0      Success

       1      Miscellaneous error

       2      Syntax or usage error

       3      At least one process was killed by a signal or timed out.

       4      All processes completed, but at least one ssh process reported an error (exit status 255).

       5      There were no ssh errors, but at least one remote command had a non-zero exit status.

AUTHORS
       Written by Brent N. Chun <bnc@theether.org> and Andrew McNabb <amcnabb@mcnabbs.org>.

       https://github.com/lilydjwg/parallel-ssh

SEE ALSO
       ssh(1), ssh_config(5), parallel-ssh(1), parallel-scp(1), parallel-rsync(1), parallel-slurp(1),

                                                                                     January 24, 2012                                                                     parallel-nuke(1)
