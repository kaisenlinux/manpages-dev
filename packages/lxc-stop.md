  lxc-stop
 
## NAME
        lxc-stop - stop the application running inside a container
 
## SYNOPSIS
        lxc-stop {-n name} [-W] [-r] [-t timeout] [-k] [--nokill] [--nolock]
 
## DESCRIPTION
        lxc-stop reboots, cleanly shuts down, or kills all the processes inside the container. By default, it will request a clean shutdown of the container by send‐
        ing lxc.signal.halt (defaults to SIGPWR) to the container's init process, waiting up to 60 seconds for the container to exit, and then returning. If the con‐
        tainer fails to cleanly exit in 60 seconds, it will be sent the lxc.signal.stop (defaults to SIGKILL) to force it to shut down. A request to reboot will send
        the lxc.signal.reboot (defaults to SIGINT) to the container's init process.
 
        The [-W], [-r], [-k] and [--nokill] options specify the action to perform.  [-W] indicates that after performing the specified action, lxc-stop should  imme‐
        diately exit, while [-t TIMEOUT] specifies the maximum amount of time to wait for the container to complete the shutdown or reboot.
 
## OPTIONS
        -r,--reboot
               Request a reboot of the container.
 
        -k,--kill
               Rather than requesting a clean shutdown of the container, explicitly kill all tasks in the container. This is the legacy lxc-stop behavior.
 
        --nokill
               Only request a clean shutdown, do not kill the container tasks if the clean shutdown fails.
 
        --nolock
               This option avoids the use of any of the API lxc locking, and should only be used if lxc-stop is hanging due to a bad system state.
 
        -W,--nowait
               Simply perform the requestion action (reboot, shutdown, or hard kill) and exit.
 
        -t,--timeout TIMEOUT
               Wait TIMEOUT seconds before hard-stopping the container.
 
 EXIT VALUE
        0      The container was successfully stopped.
 
        1      An error occurred while stopping the container.
 
        2      The specified container exists but was not running.
 
 DIAGNOSTIC
        The container was not found
               The specified container was not created before with the lxc-create command.
 
## SEE ALSO
        lxc(7),  lxc-create(1),  lxc-copy(1),  lxc-destroy(1), lxc-start(1), lxc-stop(1), lxc-execute(1), lxc-console(1), lxc-monitor(1), lxc-wait(1), lxc-cgroup(1),
        lxc-ls(1), lxc-info(1), lxc-freeze(1), lxc-unfreeze(1), lxc-attach(1), lxc.conf(5)
 
## AUTHOR
        Daniel Lezcano <daniel.lezcano@free.fr>
 
                                                                              2020-10-28                                                                  lxc-stop(1)
