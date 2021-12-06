AA-EXEC(1)                                                                               AppArmor                                                                               AA-EXEC(1)

NAME
       aa-exec - confine a program with the specified AppArmor profile

SYNOPSIS
       aa-exec [options] [--] [<command> ...]

DESCRIPTION
       aa-exec is used to launch a program confined by the specified profile and or namespace.  If both a profile and namespace are specified command will be confined by profile in the
       new policy namespace.  If only a namespace is specified, the profile name of the current confinement will be used.  If neither a profile or namespace is specified command will be
       run using standard profile attachment (ie. as if run without the aa-exec command).

       If the arguments are to be pasted to the <command> being invoked by aa-exec then -- should be used to separate aa-exec arguments from the command.
         aa-exec -p profile1 -- ls -l

OPTIONS aa-exec accepts the following arguments:
       -p PROFILE, --profile=PROFILE
           confine <command> with PROFILE. If the PROFILE is not specified use the current profile name (likely unconfined).

       -n NAMESPACE, --namespace=NAMESPACE
           use profiles in NAMESPACE.  This will result in confinement transitioning to using the new profile namespace.

       -i, --immediate
           transition to PROFILE before doing executing <command>.  This subjects the running of <command> to the exec transition rules of the current profile.

       -v, --verbose
           show commands being performed

       -d, --debug
           show commands and error codes

       --  Signal the end of options and disables further option processing. Any arguments after the -- are treated as arguments of the command.  This is useful when passing arguments to
           the <command> being invoked by aa-exec.

BUGS
       If you find any bugs, please report them at <https://gitlab.com/apparmor/apparmor/-/issues>

SEE ALSO
       aa-stack(8), aa-namespace(8), apparmor(7), apparmor.d(5), aa_change_profile(3), aa_change_onexec(3) and <https://wiki.apparmor.net>.

AppArmor 3.0.3                                                                          2021-11-18                                                                              AA-EXEC(1)
