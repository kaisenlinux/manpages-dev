AA-ENABLED(1)                                                                            AppArmor                                                                            AA-ENABLED(1)

NAME
       aa-enabled - test whether AppArmor is enabled

SYNOPSIS
       aa-enabled [options]

DESCRIPTION
       aa-enabled is used to determine if AppArmor is enabled.

OPTIONS
       aa-enabled accepts the following arguments:

       -h, --help
           Display a brief usage guide.

       -q, --quiet
           Do not output anything to stdout. This option is intended to be used by scripts that simply want to use the exit code to determine if AppArmor is enabled.

       -x, --exclusive
           Require AppArmor to have exclusive access to shared LSM interfaces to be considered enabled.

EXIT STATUS
       Upon exiting, aa-enabled will set its exit status to the following values:

       0   if AppArmor is enabled.

       1   if AppArmor is not enabled/loaded.

       2   intentionally not used as an aa-enabled exit status.

       3   if the AppArmor control files aren't available under /sys/kernel/security/.

       4   if aa-enabled doesn't have enough privileges to read the apparmor control files.

       10  AppArmor is enabled but does not have access to shared LSM interfaces.

       64  if any unexpected error or condition is encountered.

BUGS
       If you find any bugs, please report them at <https://gitlab.com/apparmor/apparmor/-/issues>.

SEE ALSO
       apparmor(7), apparmor.d(5), aa_is_enabled(2), and <https://wiki.apparmor.net>.

AppArmor 3.0.3                                                                          2021-11-18                                                                           AA-ENABLED(1)
