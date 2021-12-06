AA-FEATURES-ABI(1)                                                                       AppArmor                                                                       AA-FEATURES-ABI(1)

NAME
       aa-features-abi - Extract, validate and manipulate AppArmor feature abis

SYNOPSIS
       aa-features-abi [OPTIONS] <SOURCE> [OUTPUT OPTIONS]

DESCRIPTION
       aa-features-abi is used to extract a features abi and output to either stdout or a specified file. A SOURCE_OPTION must be specified.  If an output option is not specified the
       features abi is written to stdout.

OPTIONS
       aa-features-abi accepts the following arguments:

       -h, --help
           Display a brief usage guide.

       -d, --debug
           show messages with debugging information

       -v, --verbose
           show messages with stats

SOURCE
       -x, --extract
           Extract the features abi for the kernel

       -f FILE, --file=FILE
           Load the features abi from FILE and send it to OUTPUT OPTIONS.

OUTPUT OPTIONS
       --stdout
           Write the features abi to stdout, this is the default if no output option is specified.

       -w FILE, --write FILE
           Write the features abi to FILE.

BUGS
       If you find any bugs, please report them at <https://gitlab.com/apparmor/apparmor/-/issues>.

SEE ALSO
       apparmor(7), apparmor.d(5), aa_features(3), and <https://wiki.apparmor.net>.

AppArmor 3.0.3                                                                          2021-11-18                                                                      AA-FEATURES-ABI(1)
