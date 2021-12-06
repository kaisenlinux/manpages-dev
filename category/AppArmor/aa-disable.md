AA-DISABLE(8)                                                                            AppArmor                                                                            AA-DISABLE(8)

NAME
       aa-disable - disable an AppArmor security profile

SYNOPSIS
       aa-disable <executable> [<executable> ...] [-d /path/to/profiles] [--no-reload] [-r]

OPTIONS
       -d --dir  /path/to/profiles

          Specifies where to look for the AppArmor security profile set.
          Defaults to /etc/apparmor.d.

       --no-reload
          Do not unreload the profile after modifying it.

DESCRIPTION
       aa-disable is used to disable one or more profiles.  This command will unload the profile from the kernel and prevent the profile from being loaded on AppArmor startup.  The aa-
       enforce and aa-complain utilities may be used to to change this behavior.

BUGS
       If you find any bugs, please report them at <https://gitlab.com/apparmor/apparmor/-/issues>.

SEE ALSO
       apparmor(7), apparmor.d(5), aa-enforce(1), aa-complain(1), aa_change_hat(2), and <https://wiki.apparmor.net>.

AppArmor 3.0.3                                                                          2021-11-18                                                                           AA-DISABLE(8)
