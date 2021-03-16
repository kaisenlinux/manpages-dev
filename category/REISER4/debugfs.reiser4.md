debugfs.reiser4(8)                                                       reiser4progs manual                                                      debugfs.reiser4(8)

NAME
       debugfs.reiser4 - the program for debugging reiser4 filesystem.

SYNOPSIS
       debugfs.reiser4 [ options ] FILE

DESCRIPTION
       debugfs.reiser4 is reiser4 filesystem debug program. You can disscover the internal reiser4 filesystem structures by using it.

COMMON OPTIONS
       -V, --version
              prints program version.

       -?, -h, --help
              prints program help.

       -y, --yes
              assumes an answer 'yes' to all questions.

       -f, --force
              forces debugfs to use whole disk, not block device or mounted partition.

       -c, --cache N
              sets tree cache node number to passed value. This affects very much behavior of libreiser4. It affects speed, tree allocation, etc.

BROWSING OPTIONS
       -k, --cat
              browses passed file like standard cat and ls programs.

PRINT OPTIONS
       -t, --print-tree
              prints the internal tree.

       -b, --print-block N
              prints the block associated with the passed block number.

       -n, --print-nodes FILE
              prints all nodes that the passed file lies in.

       -i, --print-file
              prints all items that the passed file consists of.

       -s, --print-super
              prints the both super blocks: master super block and format specific one.

       -j, --print-journal
              prints the journal with not yet commited transactions (if any).

       -a, --print-alloc
              prints the block allocator data.

       -d, --print-oid
              prints the oid allocator data.

METADATA OPTIONS
       -P, --pack-metadata
              fetches filesystem metadata and writes them to the standard output.

       -U, --unpack-metadata
              reads filesystem metadata stream from the stdandard input and constructs a new filesystem based on the metadata. debugfs.reiser4 --pack-metadata <FS1>
              | debugfs.reiser4 --unpack-metadata <FS2> and then debugfs.reiser4 --pack-metadata <FS2> produces a stream equivalent to the first one.

PLUGIN OPTIONS
       -p, --print-profile
              prints the plugin profile. This is the set of default plugins used for all parts of a filesystem -- format, nodes, files, directories, hashes, etc. If
              --override is specified, then prints modified plugins.

       -l, --print-plugins
              prints all plugins libreiser4 knows about.

       -o, --override TYPE=PLUGIN, ...
              overrides the default plugin of the type "TYPE" by the plugin "PLUGIN" in the plugin profile.

Examples:
       debugfs.reiser4 -o nodeptr=nodeptr41,hash=rupasov_hash /dev/hda2

REPORTING BUGS
       Report bugs to <reiserfs-devel@vger.kernel.org>

SEE ALSO
       measurefs.reiser4(8), mkfs.reiser4(8), fsck.reiser4(8)

AUTHOR
       This manual page was written by Yury Umanets <umka@namesys.com>

reiser4progs                                                                02 Oct, 2002                                                          debugfs.reiser4(8)
