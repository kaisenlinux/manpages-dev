FDUPES(1)                                                                         General Commands Manual                                                                        FDUPES(1)

NAME
       fdupes - finds duplicate files in a given set of directories

SYNOPSIS
       fdupes [ options ] DIRECTORY ...

DESCRIPTION
       Searches the given path for duplicate files. Such files are found by comparing file sizes and MD5 signatures, followed by a byte-by-byte comparison.

OPTIONS
       -r --recurse
              for every directory given follow subdirectories encountered within

       -R --recurse:
              for  each directory given after this option follow subdirectories encountered within (note the ':' at the end of option; see the Examples section below for further explana‐
              tion)

       -s --symlinks
              follow symlinked directories

       -H --hardlinks
              normally, when two or more files point to the same disk area they are treated as non-duplicates; this option will change this behavior

       -G --minsize=SIZE
              consider only files greater than or equal to SIZE

       -L --maxsize==SIZE
              consider only files less than or equal to SIZE

       -n --noempty
              exclude zero-length files from consideration

       -A --nohidden
              exclude hidden files from consideration

       -f --omitfirst
              omit the first file in each set of matches

       -1 --sameline
              list each set of matches on a single line

       -S --size
              show size of duplicate files

       -t --time
              show modification time of duplicate files

       -m --summarize
              summarize duplicate file information

       -q --quiet
              hide progress indicator

       -d --delete
              prompt user for files to preserve, deleting all others (see CAVEATS below)

       -P --plain
              with --delete, use line-based prompt (as with older versions of fdupes) instead of screen-mode interface

       -N --noprompt
              when used together with --delete, preserve the first file in each set of duplicates and delete the others without prompting the user

       -I --immediate
              delete duplicates as they are encountered, without grouping into sets; implies --noprompt

       -p --permissions
              don't consider files with different owner/group or permission bits as duplicates

       -o --order=WORD
              order files according to WORD: time - sort by modification time, ctime - sort by status change time, name - sort by filename

       -i --reverse
              reverse order while sorting

       -l --log=LOGFILE
              log file deletion choices to LOGFILE

       -v --version
              display fdupes version

       -h --help
              displays help

NOTES
       Unless -1 or --sameline is specified, duplicate files are listed together in groups, each file displayed on a separate line. The groups are then separated from each other by blank
       lines.

       When -1 or --sameline is specified, spaces and backslash characters  (\) appearing in a filename are preceded by a backslash character.

EXAMPLES
       fdupes a --recurse: b
              will follow subdirectories under b, but not those under a.

       fdupes a --recurse b
              will follow subdirectories under both a and b.

CAVEATS
       When using -d or --delete, care should be taken to insure against accidental data loss.

       When used together with options -s or --symlink, a user could accidentally preserve a symlink while deleting the file it points to.

       Furthermore, when specifying a particular directory more than once, all files within that directory will be listed as their own duplicates, leading to data loss should a user pre‐
       serve a file without its "duplicate" (the file itself!).

AUTHOR
       Adrian Lopez <adrian2@caribe.net>

                                                                                                                                                                                 FDUPES(1)
