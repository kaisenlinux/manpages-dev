jfs_debugfs(8)                                                         JFS file system editor                                                         jfs_debugfs(8)

NAME
       jfs_debugfs - shell-type JFS file system editor

SYNOPSIS
       jfs_debugfs device

DESCRIPTION
       jfs_debugfs is a program which can be used to perform various low-level actions on a JFS formatted device.

       device is the special file name corresponding to the actual device to be edited (e.g. /dev/hdb1).

       jfs_debugfs must be run as root.

COMMANDS
       a[lter] <block> <offset> <hex_string>
               replaces the data located at the <offset> of <block> with <hex_string>

              <block> is the block number - given in decimal

              <offset> is the offset within that block - given in hexadecimal

              <hex_string> is an even-numbered string of hexadecimal digits to write to the disk

       b[tree] <block> [<offset>]
              * not implemented yet *
               displays one node of the btree located at <offset> of <block> and enters a subcommand mode to navigate the btree

              SUBCOMMANDS:
               l => visit left sibling
               m => modify current node
               p => visit parent node
               r => visit right sibling
               [0-9] => visit the n'th child node
               x => exit subcommand mode

       cb[blfsck]
               displays the area used by ClearBadBlockList for communication with fsck

              SUBCOMMANDS:
               m => modify entries
               x => exit subcommand mode

       dir[ectory] <inode_number> [<file_set>]
               displays the directory entries at <inode_number> and enters subcommand mode

              <inode_number> is the directory's inode - given in decimal

              <file_set> currently must be zero

              SUBCOMMANDS:
               m => modify entries
               x => exit subcommand mode

       d[isplay] [<block> [<offset> [<format> [<count>]]]]
              displays <count> objects located at the <offset> of <block> in <format>

              <block> is the block number - given in decimal

              <offset> is the offset within <block> - given in hexadecimal

              <format> is one of the following:
               a => ascii
               b => block allocation map
               d => decimal
               i => inode
               I => inode allocation map
               s => superblock
               x => hexadecimal
               X => extent allocation descriptor

              <count> is the number of objects to display - given in decimal

       dm[ap]
               displays aggregate disk (block) map

              SUBCOMMANDS
               m => modify map fields
               f => display free count
               t => display tree levels
               x => exit subcommand mode

       dt[ree] <inode_number> [<file_set>]
               displays root of the directory btree located at <inode_number> and enters a subcommand mode to navigate the btree

              <inode_number> is the directory's inode - given in decimal

              <file_set> currently must be zero

              SUBCOMMANDS
               l => visit left sibling
               m => modify current node
               p => visit parent node (not parent directory)
               r => visit right sibling
               [0-9] => visit the n'th child node
               x => exit subcommand mode

       fsckw[sphdr]
               displays the header of the fsck workspace in the aggregate

              SUBCOMMANDS:
               m => modify entries
               x => exit subcommand mode

       h[elp] [<command>]
               displays help for <command>
               if no command is given, all possible commands are displayed

       ia[g] [<IAG_number>] [a | s | <file_set>]
               displays IAG information for <IAG_number> and enters subcommand mode

              <IAG_number> is given in decimal

              a is to use the primary aggregate inode table

              s is to use the secondary aggregate inode table

              <file_set> currently must be zero

              SUBCOMMANDS
               e => display/modify inode extents map
               m => modify IAG
               p => display/modify persistent map
               w => display/modify working map
               x => exit subcommand mode

       i[node] [<inode_number>] [a | s | <file_set>]
               displays inode information for <inode_number> and enters subcommand mode

              <inode_number> is given in decimal

              a is to use the primary aggregate inode table

              s is to use the secondary aggregate inode table

              <file_set> currently must be zero

              SUBCOMMANDS
               a => display/modify inode's ACL
               m => modify inode
               x => exit subcommand mode

       logs[uper]
               displays the journal log superblock and enters subcommand mode

              SUBCOMMANDS
               m => modify journal log superblock
               x => exit subcommand mode

       q[uit]
               exits jfs_debugfs

       se[t] [<variable> <value>]
              * not implemented yet *
               set user-defined <variable> to <value>
               if no arguments are given, displays all set variables

              <variable> must begin with an alphabetic character

       su[perblock] [p | s]
               displays superblock data

              p displays the primary superblock

              s displays the secondary superblock

              SUBCOMMANDS:
               m => modify entries
               x => exit subcommand mode

       s2p[erblock] [p | s]
               displays alternate superblock data

              p displays the primary superblock

              s displays the secondary superblock

              SUBCOMMANDS:
               m => modify entries
               x => exit subcommand mode

       u[nset] <variable>
              * not implemented yet *
               deletes user-defined <variable>

       xt[ree] <inode_number> [<file_set>]
               displays root of the non-directory btree located at <inode_number> and enters a subcommand mode to navigate the btree

              <inode_number> is the directory's inode - given in decimal

              <file_set> currently must be zero

              SUBCOMMANDS
               l => visit left sibling
               m => modify current node
               p => visit parent node (not parent directory)
               r => visit right sibling
               [0-9] => visit the n'th child node
               x => exit subcommand mode

REPORTING BUGS
       If you find a bug in JFS or jfs_debugfs, please report it via the bug tracking system ("Report Bugs" section) of the JFS project web site:
       http://jfs.sourceforge.net/

       Please send as much pertinent information as possible, including the complete output of running jfs_fsck with the -v and -n options on the JFS device.

SEE ALSO
       jfs_fsck(8), jfs_mkfs(8), jfs_fscklog(8), jfs_logdump(8), jfs_tune(8),

AUTHORS
       Barry Arndt  (barndt@us.ibm.com)
       William Braswell, Jr.

       jfs_debugfs is maintained by IBM.
       See the JFS project web site for more details:
       http://jfs.sourceforge.net/

                                                                          October 29, 2002                                                            jfs_debugfs(8)
