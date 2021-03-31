mkfs.reiser4(8)                                                                       reiser4progs manual                                                                       mkfs.reiser4(8)

NAME
       mkfs.reiser4 - the program for creating reiser4 filesystem.

SYNOPSIS
       mkfs.reiser4 [ options ] FILE1 FILE2 ... [ size[K|M|G] ]

DESCRIPTION
       mkfs.reiser4  is  reiser4  filesystem  creation program. It is based on new libreiser4 library. Since libreiser4 is fully plugin-based, we have the potential to create not just reiser4
       partitions, but any filesystem or database format, which is based on balanced trees.

COMMON OPTIONS
       -V, --version
              prints program version.

       -?, -h, --help
              prints program help.

       -y, --yes
              assumes an answer 'yes' to all questions.

       -f, --force
              forces mkfs to use whole disk, not block device or mounted partition.

MKFS OPTIONS
       -b, --block-size N
              block size to be used (architecture page size by default)

       -L, --label LABEL
              volume label to be used

       -U, --uuid UUID
              universally unique identifier to be used

       -s, --lost-found
              forces mkfs to create lost+found directory.

       -d, --discard
              tells mkfs to discard given device before creating the filesystem (for solid state drives).

PLUGIN OPTIONS
       -p, --print-profile
              prints the plugin profile. This is the set of default plugins used for all parts of a filesystem -- format, nodes, files, directories, hashes, etc. If --override  is  specified,
              then prints modified plugins.

       -l, --print-plugins
              prints all plugins libreiser4 know about.

       -o, --override TYPE=PLUGIN, ...
              overrides the default plugin of the type "TYPE" by the plugin "PLUGIN" in the plugin profile.

              Examples:

              assign short key plugin to "key" field in order to create filesystem with short keys policy:

              mkfs.reiser4 -yf -o key=key_short /dev/hda2

REPORTING BUGS
       Report bugs to <reiserfs-devel@vger.kernel.org>

SEE ALSO
       measurefs.reiser4(8), debugfs.reiser4(8), fsck.reiser4(8)

AUTHOR
       This manual page was written by Yury Umanets <umka@namesys.com>

reiser4progs                                                                              02 Oct, 2002                                                                          mkfs.reiser4(8)
