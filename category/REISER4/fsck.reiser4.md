fsck.reiser4(8)                                                          reiser4progs manual                                                         fsck.reiser4(8)

NAME
       fsck.reiser4 - the program for checking and repairing reiser4 filesystem.

SYNOPSIS
       fsck.reiser4 [ options ] FILE

DESCRIPTION
       fsck.reiser4 is reiser4 filesystem check and repair program.

CHECK OPTIONS
       --check
              the  default action checks the consistency and reports, but does not repair any corruption that it finds.  This option may be used on a read-only file
              system mount.

       --fix  fixes minor corruptions that do not require rebuilding; sets up correct values of bytes unsupported by kernel in the case of transparent compression.

       --build-sb
              fixes all severe corruptions in super blocks, rebuilds super blocks from scratch if needed.

       --build-fs
              fixes all severe fs corruptions, except super block ones; rebuilds reiser4 filesystem from the scratch if needed.

       -L, --logfile
              forces fsck to report any corruption it finds to the specified logfile rather then on stderr.

       -n, --no-log
              prevents fsck from reporting any kind of corruption.

       -a, --auto
              automatically checks the file system without any questions.

       -q, --quiet
              supresses gauges.

       -r     ignored.

PLUGIN OPTIONS
       --print-profile
              prints the plugin profile. This is the set of default plugins used for all parts of a filesystem -- format, nodes, files, directories, hashes, etc. If
              --override is specified, then prints modified plugins.

       -l, --print-plugins
              prints all plugins libreiser4 know about.

       -o, --override TYPE=PLUGIN, ...
              overrides the default plugin of the type "TYPE" by the plugin "PLUGIN" in the plugin profile.

COMMON OPTIONS
       -V, --version
              prints program version

       -?, -h, --help
              prints program help

       -q, --quiet
              suppress messages.

       -y, --yes
              assumes an answer 'yes' to all questions.

       -f, --force
              forces fsck to use whole disk, not block device or mounted partition.

       -p, --preen
              automatically repair minor corruptions on the filesystem.

       -c, --cache N
              tunes number of nodes in the libreiser4 tree buffer cache

REPORTING BUGS
       Report bugs to <reiserfs-devel@vger.kernel.org>

SEE ALSO
       debugfs.reiser4(8), mkfs.reiser4(8), measurefs.reiser4(8)

AUTHOR
       This manual page was written by Vitaly Fertman <vitaly@namesys.com>

reiser4progs                                                              05 February, 2004                                                          fsck.reiser4(8)
