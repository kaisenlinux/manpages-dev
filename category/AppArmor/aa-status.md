AA-STATUS(8)                                                                             AppArmor                                                                             AA-STATUS(8)

NAME
       aa-status - display various information about the current AppArmor policy.

SYNOPSIS
       aa-status [option]

DESCRIPTION
       aa-status will report various aspects of the current state of AppArmor confinement. By default, it displays the same information as if the --verbose argument were given. A sample
       of what this looks like is:

         apparmor module is loaded.
         110 profiles are loaded.
         102 profiles are in enforce mode.
         8 profiles are in complain mode.
         Out of 129 processes running:
         13 processes have profiles defined.
         8 processes have profiles in enforce mode.
         5 processes have profiles in complain mode.

       Other argument options are provided to report individual aspects, to support being used in scripts.

OPTIONS
       aa-status accepts only one argument at a time out of:

       --enabled
           returns error code if AppArmor is not enabled.

       --profiled
           displays the number of loaded AppArmor policies.

       --enforced
           displays the number of loaded enforcing AppArmor policies.

       --complaining
           displays the number of loaded non-enforcing AppArmor policies.

       --kill
           displays the number of loaded enforcing AppArmor policies that will kill tasks on policy violations.

       --special-unconfined
           displays the number of loaded non-enforcing AppArmor policies that are in the special unconfined mode.

       --process-mixed displays the number of processes confined by profile stacks with profiles in different modes.
       --verbose
           displays multiple data points about loaded AppArmor policy set (the default action if no arguments are given).

       --json
           displays multiple data points about loaded AppArmor policy set in a JSON format, fit for machine consumption.

       --pretty-json
           same as --json, formatted to be readable by humans as well as by machines.

       --help
           displays a short usage statement.

EXIT STATUS
       Upon exiting, aa-status will set its exit status to the following values:

       0   if apparmor is enabled and policy is loaded.

       1   if apparmor is not enabled/loaded.

       2   if apparmor is enabled but no policy is loaded.

       3   if the apparmor control files aren't available under /sys/kernel/security/.

       4   if the user running the script doesn't have enough privileges to read the apparmor control files.

       42  if an internal error occurred.

BUGS
       aa-status must be run as root to read the state of the loaded policy from the apparmor module. It uses the /proc filesystem to determine which processes are confined and so is
       susceptible to race conditions.

       If you find any additional bugs, please report them at <https://gitlab.com/apparmor/apparmor/-/issues>.

SEE ALSO
       apparmor(7), apparmor.d(5), and <https://wiki.apparmor.net>.

AppArmor 3.0.3                                                                          2021-11-18                                                                            AA-STATUS(8)
