CPULIMIT(1)                                                                            User commands                                                                           CPULIMIT(1)

NAME
       cpulimit -- limits the CPU usage of a process

SYNOPSIS
       cpulimit [TARGET] [OPTIONS...] [ -- PROGRAM]

DESCRIPTION
       TARGET must be exactly one of these:

       -p, --pid=N
              pid of the process

       -e, --exe=FILE
              name of the executable program file

       -P, --path=PATH
              absolute path name of the executable program file

       OPTIONS

       -b, --background
              run cpulimit in the background, freeing up the terminal

       -f, --foreground
              run cpulimit in foreground while waiting for launched process to finish

       -c, --cpu
              specify the number of CPU cores available. Usually this is detected for us.

       -l, --limit=N
              percentage of CPU allowed from 1 up. Usually 1 - 100, but can be higher on multi-core CPUs. (mandatory)

       -q, --quiet
              Runs in quiet mode, avoids writing update messages to console.

       -k, --kill
              kill target process instead of throttling its CPU usage

       -m, --monitor-forks
              watch  and throttle child processes of the target process Warning: It is usually a bad idea to use this flag on a shell script. The commands in the script will each spawn a
              process which will, in turn, spawn more copies of this program to throttle them, bogging down the system.

       -r, --restore
              restore a process killed using the -k flag.

       -s, --signal
              send an alternative signal to the watched process when we exit. Default is SIGCONT.

       -v, --verbose
              show control statistics

       -z, --lazy
              exit if there is no suitable target process, or if it dies

       --     This is the final CPUlimit option. All following options are for another program we will launch.

       -h, --help
              display this help and exit

EXAMPLES
       Assuming you have started `foo --bar` and you find out with top(1) or ps(1) that this process uses all your CPU time you can either

       # cpulimit -e foo -l 50
              limits the CPU usage of the process by acting on the executable program file (note: the argument "--bar" is omitted)

       # cpulimit -p 1234 -l 50
              limits the CPU usage of the process by acting on its PID, as shown by ps(1)

       # cpulimit -P /usr/bin/foo -l 50
              same as -e but uses the absolute path name

       # /usr/bin/someapp

       # cpulimit -p $! -l 25 -b
              Useful for scripts where you want to throttle the last command run.

       # cpulimit -l 20 firefox
              Launch Firefox web browser and limit its CPU usage to 20%

       # cpulimit -l 25 -- firefox -private
              Launch Firefox web browser in private mode and limit its CPU usage to 25%

       # cpulimit -c 2 -p 12345 -l 25
              The -c flag sets the number of CPU cores the program thinks are available. Usually this is detected for us, but can be over-ridden.

       # cpulimit -l 20 -k firefox
              Launch the Firefox program and kill it if the process goes over 20% CPU usage.

       # cpulimit -l 20 -p 1234 -s SIGTERM
              Throttle process 1234 at 20% CPU usage. If cpulimit is forced to exit, it sends the watched process the SIGTERM signal.

NOTES
       •   cpulimit always sends the SIGSTOP and SIGCONT signals to a process, both to verify that it can control it and to limit the average amount of CPU it consumes.  This can  result
           in  misleading  (annoying) job control messages that indicate that the job has been stopped (when actually it was, but immediately restarted).  This can also cause issues with
           interactive shells that detect or otherwise depend on SIGSTOP/SIGCONT.   For example, you may place a job in the foreground, only to see it immediately stopped  and  restarted
           in the background.  (See also <http://bugs.debian.org/558763>.)

       •   When  invoked  with  the -e or -P options, cpulimit looks for any process under /proc with a name that matches the process name argument given.  Furthermore, it uses the first
           instance of the process found.  To control a specific instance of a process, use the -p option and provide a PID.

       •   The current version of cpulimit assumes the kernel HZ value 100.

AUTHOR
       This manpage was written for the Debian project by gregor herrmann <gregoa@debian.org> but may be used by others.

cpulimit                                                                                 June 2012                                                                             CPULIMIT(1)
