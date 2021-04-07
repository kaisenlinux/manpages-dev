measurefs.reiser4(8)                                                                reiser4progs manual                                                               measurefs.reiser4(8)

NAME
       measurefs.reiser4 - the program for measuring reiser4 filesystem parameters (fragmentation, node packing, etc.).

SYNOPSIS
       measurefs.reiser4 [ options ] FILE

DESCRIPTION
       measurefs.reiser4 is reiser4 filesystem measure program. You can estimate reiser4 filesystem fragmentation, packingm etc. structures by using it.

COMMON OPTIONS
       -V, --version
              prints program version.

       -?, -h, --help
              prints program help.

       -y, --yes
              assumes an answer 'yes' to all questions.

       -f, --force
              forces measurefs to use whole disk, not block device or mounted partition.

       -c, --cache N
              sets tree cache node number to passed value. This affects very much behavior of libreiser4. It affects speed, tree allocation, etc.

MEASUREMENT OPTIONS
       -S, --tree-stat
              shows different tree statistics (node packing, internal nodes, leaves, etc)

       -T, --tree-frag
              measures  total tree fragmentation. The result is fragmentation factor - value from 0.00000 (minimal fragmentation) to 1.00000 (maximal one). Most probably, this factor may
              affect sequential read performance.

       -D, --data-frag
              measures average files fragmentation. This means, that fragmentation of each file in filesystem will be measured separately and results will  be  averaged.  The  result  is
              fragmentation factor - value from 0.00000 (minimal fragmentation) to 1.00000 (maximal one).

              Note, that for the fresh filesystem (created not very long time ago) and even fully filled by data, this value will be pretty small.

       -F, --file-frag FILE
              measures  fragmentation of the specified file. The result is fragmentation factor - value from 0.00000 (minimal fragmentation) to 1.00000 (maximal one). Note, that fragmen‐
              tation of a small file (depends of used tail policy), which consists of tail items, is not very reliable value. That is because, they is always afoot due to balancing.

              Examples:

              measurefs.reiser4 -F /usr/bin /dev/hda2
              measurefs.reiser4 -F /bin/bash /dev/hda2

       -E, --show-file
              show file fragmentation for each file if --data-frag is specified.

PLUGIN OPTIONS
       -p, --print-profile
              prints the plugin profile. This is the set of default plugins used for all parts of a filesystem -- format, nodes, files, directories, hashes, etc. If --override is  speci‐
              fied, then prints modified plugins.

       -l, --print-plugins
              prints all plugins libreiser4 know about.

       -o, --override TYPE=PLUGIN, ...
              overrides the default plugin of the type "TYPE" by the plugin "PLUGIN" in the plugin profile.

              Examples:

              measurefs.reiser4 -o nodeptr=nodeptr41,hash=rupasov_hash /dev/hda2

REPORTING BUGS
       Report bugs to <reiserfs-devel@vger.kernel.org>

SEE ALSO
       debugfs.reiser4(8), mkfs.reiser4(8), fsck.reiser4(8)

AUTHOR
       This manual page was written by Yury Umanets <umka@namesys.com>

reiser4progs                                                                           28 Apr, 2003                                                                   measurefs.reiser4(8)
