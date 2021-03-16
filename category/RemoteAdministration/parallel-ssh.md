paralllel-ssh(1)                                                       General Commands Manual                                                      paralllel-ssh(1)

NAME
       paralllel-ssh — parallel ssh program

SYNOPSIS
       paralllel-ssh  [-vAiIP]  [-h hosts_file] [-H [user@]host[:port]] [-l user] [-p par] [-o outdir] [-e errdir] [-t timeout] [-O options] [-x args] [-X arg] com‐
       mand ...

       paralllel-ssh -I [-vAiIP] [-h hosts_file] [-H [user@]host[:port]] [-l user] [-p par] [-o outdir] [-e errdir] [-t timeout] [-O options]  [-x  args]  [-X  arg]
       [command ...]

DESCRIPTION
       paralllel-ssh is a program for executing ssh in parallel on a number of hosts.  It provides features such as sending input to all of the processes, passing a
       password to ssh, saving output to files, and timing out.

       The PSSH_NODENUM and PSSH_HOST environment variables are sent to the remote host.  The PSSH_NODENUM variable is assigned a unique number for each ssh connec‐
       tion,  starting  with 0 and counting up.  The PSSH_HOST variable is assigned the name of the host as specified in the hosts list.  Note that sshd drops envi‐
       ronment variables by default, so sshd_config on the remote host must include the line:
              AcceptEnv PSSH_NODENUM PSSH_HOST

OPTIONS
       -h host_file
       --hosts host_file
              Read hosts from the given host_file.  Lines in the host file are of the form [user@]host[:port] and can include blank lines and comments (lines begin‐
              ning  with  "#").  If multiple host files are given (the -h option is used more than once), then paralllel-ssh behaves as though these files were con‐
              catenated together.  If a host is specified multiple times, then paralllel-ssh will connect the given number of times.

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
              Make connections time out after the given number of seconds.  With a value of 0, paralllel-ssh will not timeout any connections.

       -o outdir
       --outdir outdir
              Save standard output to files in the given directory.  Filenames are of the form [user@]host[:port][.num] where the user and port  are  only  included
              for hosts that explicitly specify them.  The number is a counter that is incremented each time for hosts that are specified more than once.

       -e errdir
       --errdir errdir
              Save standard error to files in the given directory.  Filenames are of the same form as with the -o option.

       -x args
       --extra-args args
              Passes  extra  SSH  command-line  arguments (see the ssh(1) man page for more information about SSH arguments).  This option may be specified multiple
              times.  The arguments are processed to split on whitespace, protect text within quotes, and escape with backslashes.  To pass arguments  without  such
              processing, use the -X option instead.

       -X arg
       --extra-arg arg
              Passes  a single SSH command-line argument (see the ssh(1) man page for more information about SSH arguments).  Unlike the -x option, no processing is
              performed on the argument, including word splitting.  To pass multiple command-line arguments, use the option once for each argument.

       -O options
       --options options
              SSH options in the format used in the SSH configuration file (see the ssh_config(5) man page for more information).  This option may be specified mul‐
              tiple times.

       -A
       --askpass
              Prompt for a password and pass it to ssh.  The password may be used for either to unlock a key or for password authentication.  The password is trans‐
              ferred in a fairly secure manner (e.g., it will not show up in argument lists).  However, be aware that a root user on your system  could  potentially
              intercept the password.

       -i
       --inline
              Display standard output and standard error as each host completes.

       --inline-stdout
              Display standard output (but not standard error) as each host completes.

       -v
       --verbose
              Include error messages from ssh with the -i and \ options.

       -I
       --send-input
              Read  input  and  send  to each ssh process.  Since ssh allows a command script to be sent on standard input, the -I option may be used in lieu of the
              command argument.

       -P
       --print
              Display output as it arrives.  This option is of limited usefulness because output from different hosts are interleaved.

EXAMPLES
       Connect to host1 and host2, and print "hello, world" from each:
              parallel-ssh -i -H "host1 host2" echo "hello, world"

       Print "hello, world" from each host specified in the file hosts.txt:
              parallel-ssh -i -h hosts.txt echo "hello, world"

       Run a command as root with a prompt for the root password:
              parallel-ssh -i -h hosts.txt -A -l root echo hi

       Run a long command without timing out:
              parallel-ssh -i -h hosts.txt -t 0 sleep 10000

       If the file hosts.txt has a large number of entries, say 100, then the parallelism option may also be set to 100 to ensure that the commands are run  concur‐
       rently:
              parallel-ssh -i -h hosts.txt -p 100 -t 0 sleep 10000

       Run a command without checking or saving host keys:
              parallel-ssh -i -H host1 -H host2 -x "-O StrictHostKeyChecking=no -O UserKnownHostsFile=/dev/null -O GlobalKnownHostsFile=/dev/null" echo hi

       Print the node number for each connection (this will print 0, 1, and 2):
              parallel-ssh -i -H host1 -H host1 -H host2 'echo $PSSH_NODENUM'

TIPS
       If you have a set of hosts that you connect to frequently with specific options, it may be helpful to create an alias such as:
              alias pssh_servers="parallel-ssh -h /path/to/server_list.txt -l root -A"

       The  ssh_config file can include an arbitrary number of Host sections.  Each host entry specifies ssh options which apply only to the given host.  Host defi‐
       nitions can even behave like aliases if the HostName option is included.  This ssh feature, in combination with parallel-ssh host files, provides  a  tremen‐
       dous amount of flexibility.

EXIT STATUS
       The exit status codes from paralllel-ssh are as follows:

       0      Success

       1      Miscellaneous error

       2      Syntax or usage error

       3      At least one process was killed by a signal or timed out.

       4      All processes completed, but at least one ssh process reported an error (exit status 255).

       5      There were no ssh errors, but at least one remote command had a non-zero exit status.

AUTHORS
       Written by Brent N. Chun <bnc@theether.org> and Andrew McNabb <amcnabb@mcnabbs.org>.

       http://code.google.com/p/parallel-ssh/

SEE ALSO
       ssh(1), ssh_config(5), parallel-scp(1), parallel-rsync(1), parallel-slurp(1), parallel-nuke(1),

                                                                          January 24, 2012                                                          paralllel-ssh(1)
