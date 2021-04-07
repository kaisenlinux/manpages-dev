parallel-slurp(1)                                                                 General Commands Manual                                                                parallel-slurp(1)

NAME
       parallel-slurp — parallel file download program

SYNOPSIS
       parallel-slurp [-vAr] [-h hosts_file] [-H [user@]host[:port]] [-l user] [-p par] [-o outdir] [-e errdir] [-t timeout] [-O options] [-x args] [-X arg] [-L localdir] remote local

DESCRIPTION
       parallel-slurp  is  a program for copying files in parallel from a number of hosts using the scp program.  It provides features such as passing a password to scp, saving output to
       files, and timing out.

OPTIONS
       -h host_file
       --hosts host_file
              Read hosts from the given host_file.  Lines in the host file are of the form [user@]host[:port] and can include blank lines and comments (lines  beginning  with  "#").   If
              multiple  host files are given (the -h option is used more than once), then parallel-slurp behaves as though these files were concatenated together.  If a host is specified
              multiple times, then parallel-slurp will connect the given number of times.

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
              Make connections time out after the given number of seconds.  With a value of 0, parallel-slurp will not timeout any connections.

       -o outdir
       --outdir outdir
              Save standard output to files in the given directory.  Filenames are of the form [user@]host[:port][.num] where the user and port are only included for hosts  that  explic‐
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
              Prompt  for a password and pass it to ssh.  The password may be used for either to unlock a key or for password authentication.  The password is transferred in a fairly se‐
              cure manner (e.g., it will not show up in argument lists).  However, be aware that a root user on your system could potentially intercept the password.

       -v
       --verbose
              Include error messages from ssh with the -i and -e options.

       -r
       --recursive
              Recursively copy directories.

       -L localdir
       --localdir localdir
              Copy files from the remote host to the given local directory.

TIPS
       The ssh_config file can include an arbitrary number of Host sections.  Each host entry specifies ssh options which apply only to the given host.  Host definitions can even  behave
       like aliases if the HostName option is included.  This ssh feature, in combination with pssh host files, provides a tremendous amount of flexibility.

EXIT STATUS
       The exit status codes from parallel-slurp are as follows:

       0      Success

       1      Miscellaneous error

       2      Syntax or usage error

       3      At least one process was killed by a signal or timed out.

       4      All processes completed, but at least one scp process reported an error (exit status other than 0).

AUTHORS
       Written by Brent N. Chun <bnc@theether.org> and Andrew McNabb <amcnabb@mcnabbs.org>.

       http://code.google.com/p/parallel-ssh/

SEE ALSO
       ssh(1), ssh_config(5), parallel-ssh(1), parallel-scp(1), parallel-rsync(1), parallel-nuke(1),

                                                                                     January 24, 2012                                                                    parallel-slurp(1)
