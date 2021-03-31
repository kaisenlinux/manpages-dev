BTRFS-SEARCH-METADATA(1)                                                             Btrfs Search Metadata                                                             BTRFS-SEARCH-METADATA(1)

NAME
       btrfs-search-metadata - lookup btrfs metadata

SYNOPSIS
       btrfs-search-metadata <subcommand> <args>

DESCRIPTION
       The btrfs-search-metadata program can be used to execute search queries in order to look up metadata items of an online, mounted btrfs filesystem.  Unlike the btrfs inspect-internal
       dump-tree command, which directly reads from disk, btrfs-search-metadata only uses the kernel SEARCH ioctl function.

       Besides being able to get any metadata slice from any tree, there are a number of convenience presets that execute predefined search queries.

GLOBAL OPTIONS
       -h, --help
              Show the built-in help message and exit.

       --format keys|short|long
              Print metadata items as keys only, as a short single line per item (default), or long output with full contents of all fields.

SUBCOMMANDS
       chunks <path>
           Display all chunk items from the chunk tree, as well as the stripe items that they contain.

       block_groups <path>
           Display all block group items from the extent tree.

       dev_extents <path>
           Display all device extent items from the device tree.

       file <path>
           Display all information btrfs knows about a file or directory.

       inode -t|--tree <tree> --inum <inum> <path>
           Display all information about an inode number in a subvolume tree.

       devices <path>
           Display all device items from the device tree.

       orphans <path>
           Display all orphan items from the root tree.

       dump -t|--tree <tree> [--min-key <MIN_KEY>] [--max-key <MAX_KEY>] <path>
           Dump an arbitrary slice of metadata items from any tree. A key should be specified in the regular form as '(<objectid> <type> <offset>)', e.g. '(EXTENT_TREE ROOT_ITEM 0)'. The
           number -1 can be used instead of the maximum value for a field. This can be very useful when dumping all metadata items for a specific objectid. For example, what the inode
           subcommand does is searching with min-key '(<inum> 0 0)' and max-key '(<inum> -1 -1)'

       block_group_contents --vaddr <vaddr> <path>
           Dump the contents of a block group (from the extent tree) from the specified virtual address of the start of the block group to its end. Use the block_groups subcommand to list
           block group addresses.

       block_group_free_space --vaddr <vaddr> <path>
           Dump the free space extents for a block group (from the free space tree) for the block group at the specified virtual address. Use the block_groups subcommand to list block group
           addresses.

SEE ALSO
       This program is an example of what can be done using the python-btrfs library.

       Source and documentation on github: https://github.com/knorrie/python-btrfs

                                                                                              2020                                                                     BTRFS-SEARCH-METADATA(1)
