TREE(1)                                                                General Commands Manual                                                               TREE(1)

NAME
       tree - list contents of directories in a tree-like format.

SYNOPSIS
       tree  [-acdfghilnpqrstuvxACDFQNSUX]  [-L  level  [-R]]  [-H  baseHREF]  [-T  title] [-o filename] [--nolinks] [-P pattern] [-I pattern] [--inodes] [--device]
       [--noreport] [--dirsfirst] [--version] [--help] [--filelimit #] [--si] [--prune] [--du] [--timefmt format] [--matchdirs] [--fromfile] [--] [directory ...]

DESCRIPTION
       Tree is a recursive directory listing program that produces a depth indented listing of files, which is colorized ala dircolors if the LS_COLORS  environment
       variable  is set and output is to tty.  With no arguments, tree lists the files in the current directory.  When directory arguments are given, tree lists all
       the files and/or directories found in the given directories each in turn.  Upon completion of listing all files/directories found,  tree  returns  the  total
       number of files and/or directories listed.

       By default, when a symbolic link is encountered, the path that the symbolic link refers to is printed after the name of the link in the format:

           name -> real-path

       If the `-l' option is given and the symbolic link refers to an actual directory, then tree will follow the path of the symbolic link as if it were a real di‐
       rectory.

OPTIONS
       Tree understands the following command line switches:

LISTING OPTIONS
       -a     All files are printed.  By default tree does not print hidden files (those beginning with a dot `.').  In no event does tree  print  the  file  system
              constructs `.' (current directory) and `..' (previous directory).

       -d     List directories only.

       -l     Follows  symbolic  links  if they point to directories, as if they were directories. Symbolic links that will result in recursion are avoided when de‐
              tected.

       -f     Prints the full path prefix for each file.

       -x     Stay on the current file-system only.  Ala find -xdev.

       -L level
              Max display depth of the directory tree.

       -R     Recursively cross down the tree each level directories (see -L option), and at each of them execute tree again adding `-o 00Tree.html' as  a  new  op‐
              tion.

       -P pattern
              List  only  those files that match the wild-card pattern.  Note: you must use the -a option to also consider those files beginning with a dot `.'  for
              matching.  Valid wildcard operators are `*' (any zero or more characters), `?' (any single character), `[...]' (any single  character  listed  between
              brackets  (optional - (dash) for character range may be used: ex: [A-Z]), and `[^...]' (any single character not listed in brackets) and `|' separates
              alternate patterns.

       -I pattern
              Do not list those files that match the wild-card pattern.

       --ignore-case
              If a match pattern is specified by the -P or -I option, this will cause the pattern to match without regards to the case of each letter.

       --matchdirs
              If a match pattern is specified by the -P option, this will cause the pattern to be applied to directory names (in addition  to  filenames).   In  the
              event of a match on the directory name, matching is disabled for the directory's contents. If the --prune option is used, empty folders that match the
              pattern will not be pruned.

       --prune
              Makes tree prune empty directories from the output, useful when used in conjunction with -P or -I.  See BUGS AND NOTES below for more  information  on
              this option.

       --noreport
              Omits printing of the file and directory report at the end of the tree listing.

       --charset charset
              Set the character set to use when outputting HTML and for line drawing.

       --filelimit #
              Do not descend directories that contain more than # entries.

       --timefmt format
              Prints (implies -D) and formats the date according to the format string which uses the strftime(3) syntax.

       -o filename
              Send output to filename.

FILE OPTIONS
       -q     Print non-printable characters in filenames as question marks instead of the default.

       -N     Print non-printable characters as is instead of as escaped octal numbers.

       -Q     Quote the names of files in double quotes.

       -p     Print the file type and permissions for each file (as per ls -l).

       -u     Print the username, or UID # if no username is available, of the file.

       -g     Print the group name, or GID # if no group name is available, of the file.

       -s     Print the size of each file in bytes along with the name.

       -h     Print  the size of each file but in a more human readable way, e.g. appending a size letter for kilobytes (K), megabytes (M), gigabytes (G), terabytes
              (T), petabytes (P) and exabytes (E).

       --si   Like -h but use SI units (powers of 1000) instead.

       --du   For each directory report its size as the accumulation of sizes of all its files and sub-directories (and their files, and so on).  The  total  amount
              of  used  space is also given in the final report (like the 'du -c' command.) This option requires tree to read the entire directory tree before emit‐
              ting it, see BUGS AND NOTES below.  Implies -s.

       -D     Print the date of the last modification time or if -c is used, the last status change time for the file listed.

       -F     Append a `/' for directories, a `=' for socket files, a `*' for executable files, a `>' for doors (Solaris) and a `|' for FIFO's, as per ls -F

       --inodes
              Prints the inode number of the file or directory

       --device
              Prints the device number to which the file or directory belongs

SORTING OPTIONS
       -v     Sort the output by version.

       -t     Sort the output by last modification time instead of alphabetically.

       -c     Sort the output by last status change instead of alphabetically.  Modifies the -D option (if used) to print the last status change instead of  modifi‐
              cation time.

       -U     Do not sort.  Lists files in directory order. Disables --dirsfirst.

       -r     Sort the output in reverse order.  This is a meta-sort that alter the above sorts.  This option is disabled when -U is used.

       --dirsfirst
              List directories before files. This is a meta-sort that alters the above sorts.  This option is disabled when -U is used.

       --sort[=]type
              Sort the output by type instead of name. Possible values are: ctime (-c), mtime (-t), size, or version (-v).

GRAPHICS OPTIONS
       -i     Makes tree not print the indentation lines, useful when used in conjunction with the -f option.  Also removes as much whitespace as possible when used
              with the -J or -x options.

       -A     Turn on ANSI line graphics hack when printing the indentation lines.

       -S     Turn on CP437 line graphics (useful when using Linux console mode fonts). This option is now equivalent to `--charset=IBM437' and  may  eventually  be
              depreciated.

       -n     Turn colorization off always, over-ridden by the -C option.

       -C     Turn colorization on always, using built-in color defaults if the LS_COLORS or TREE_COLORS environment variables are not set.  Useful to colorize out‐
              put to a pipe.

XML/JSON/HTML OPTIONS
       -X     Turn on XML output. Outputs the directory tree as an XML formatted file.

       -J     Turn on JSON output. Outputs the directory tree as an JSON formatted array.

       -H baseHREF
              Turn on HTML output, including HTTP references. Useful for ftp sites.  baseHREF gives the base ftp location when using HTML output. That is, the local
              directory may be `/local/ftp/pub', but it must be referenced as `ftp://hostname.organization.domain/pub' (baseHREF should be `ftp://hostname.organiza‐
              tion.domain'). Hint: don't use ANSI lines with this option, and don't give more than one directory in the directory list. If you wish  to  use  colors
              via CSS style-sheet, use the -C option in addition to this option to force color output.

       -T title
              Sets the title and H1 header string in HTML output mode.

       --nolinks
              Turns off hyperlinks in HTML output.

INPUT OPTIONS
       --fromfile Reads a directory listing from a file rather than the file-system.  Paths provided on the command line are files to read from rather than directo‐
       ries to search.  The dot (.) directory indicates that tree should read paths from standard input.

MISC OPTIONS
       --help Outputs a verbose usage listing.

       --version
              Outputs the version of tree.

       --     Option processing terminator.  No further options will be processed after this.

FILES
       /etc/DIR_COLORS          System color database.
       ~/.dircolors        Users color database.

ENVIRONMENT
       LS_COLORS      Color information created by dircolors
       TREE_COLORS    Uses this for color information over LS_COLORS if it is set.
       TREE_CHARSET   Character set for tree to use in HTML mode.
       CLICOLOR       Enables colorization even if TREE_COLORS or LS_COLORS is not set.
       CLICOLOR_FORCE Always enables colorization (effectively -C)
       LC_CTYPE       Locale for filename output.
       LC_TIME        Locale for timefmt output, see strftime(3).
       TZ        Timezone for timefmt output, see strftime(3).

AUTHOR
       Steve Baker (ice@mama.indstate.edu)
       HTML output hacked by Francesc Rocher (rocher@econ.udg.es)
       Charsets and OS/2 support by Kyosuke Tokoro (NBG01720@nifty.ne.jp)

BUGS AND NOTES
       Tree does not prune "empty" directories when the -P and -I options are used by default. Use the --prune option.

       The -h and --si options round to the nearest whole number unlike the ls implementations which rounds up always.

       Pruning files and directories with the -I, -P and --filelimit options will lead to incorrect file/directory count reports.

       The --prune and --du options cause tree to accumulate the entire tree in memory before emitting it. For large directory trees this can  cause  a  significant
       delay in output and the use of large amounts of memory.

       The  timefmt  expansion buffer is limited to a ridiculously large 255 characters.  Output of time strings longer than this will be undefined, but are guaran‐
       teed to not exceed 255 characters.

       XML/JSON trees are not colored, which is a bit of a shame.

       Probably more.

SEE ALSO
       dircolors(1), ls(1), find(1), du(1), strftime(3)

Tree 1.8.0                                                                                                                                                   TREE(1)
