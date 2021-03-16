NTFSLS(8)                                                              System Manager's Manual                                                             NTFSLS(8)

NAME
       ntfsls - list directory contents on an NTFS filesystem

SYNOPSIS
       ntfsls [options] device

       ntfsls  [  -a  |  --all  ] [ -F | --classify ] [ -f | --force ] [ -h | --help ] [ -i | --inode ] [ -l | --long ] [ -p | --path PATH ] [ -q | --quiet ] [ -s |
       --system ] [ -V | --version ] [ -v | --verbose ] [ -x | --dos ] device

DESCRIPTION
       ntfsls is used to list information about the files specified by the PATH option (the root directory by default).  DEVICE is the special file corresponding to
       the device (e.g /dev/hdXX) or an NTFS image file.

OPTIONS
       Below  is a summary of all the options that ntfsls accepts.  Nearly all options have two equivalent names.  The short name is preceded by - and the long name
       is preceded by --.  Any single letter options, that don't take an argument, can be combined into a single command, e.g.  -fv is equivalent to  -f  -v.   Long
       named options can be abbreviated to any unique prefix of their name.

       -a, --all
              Display all files.  If this option is not specified file names in the POSIX namespace will not be displayed.

       -F, --classify
              Append indicator (one of */=@|) to entries.

       -f, --force
              Force execution.  For example necessary to run on an NTFS partition stored in a normal file.

       -h, --help
              Print the usage information of ntfsls and exit.

       -i, --inode
              Print inode number of each file.  This is the MFT reference number in NTFS terminology.

       -l, --long
              Use a long listing format.

       -p, --path PATH
              The directory whose contents to list or the file (including the path) about which to display information.

       -q, --quiet
              Suppress some debug/warning/error messages.

       -R, --recursive
              Show the contents of all directories beneath the specified directory.

       -s, --system
              Unless this options is specified, all files beginning with a dollar sign character will not be listed as these files are usually system files.

       -v, --verbose
              Display more debug/warning/error messages.

       -V, --version
              Print the version number of ntfsls and exit.

       -x, --dos
              Display short file names, i.e. files in the DOS namespace, instead of long file names, i.e. files in the WIN32 namespace.

BUGS
       There are no known problems with ntfsls.  If you find a bug please send an email describing the problem to the development team:
       ntfs-3g-devel@lists.sf.net

AUTHORS
       This  version  of  ntfsls  was written by Lode Leroy, Anton Altaparmakov, Richard Russon, Carmelo Kintana and Giang Nguyen.  It was ported to ntfs-3g by Erik
       Larsson.

AVAILABILITY
       ntfsls is part of the ntfs-3g package and is available from:
       http://www.tuxera.com/community/

SEE ALSO
       ntfsprogs(8)

ntfs-3g 2017.3.23AR.3                                                       November 2005                                                                  NTFSLS(8)
