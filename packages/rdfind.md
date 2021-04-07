rdfind(1)                                                                                 rdfind                                                                                 rdfind(1)

NAME
       rdfind - finds duplicate files

SYNOPSIS
       rdfind [ options ] directory1 | file1 [ directory2 | file2 ] ...

DESCRIPTION
       rdfind finds duplicate files across and/or within several directories. It calculates checksum only if necessary.  rdfind runs in O(Nlog(N)) time with N being the number of files.

       If  two  (or more) equal files are found, the program decides which of them is the original and the rest are considered duplicates. This is done by ranking the files to each other
       and deciding which has the highest rank. See section RANKING for details.

       By default, no action is taken besides creating a file with the detected files and showing the possible amount of saved space.

       If you need better control over the ranking than given, you can use some preprocessor which sorts the file names in desired order and then run the program using xargs.  See  exam‐
       ples below for how to use find and xargs in conjunction with rdfind.

       To include files or directories that have names starting with -, use rdfind ./- to not confuse them with options.

RANKING
       Given  two or more equal files, the one with the highest rank is selected to be the original and the rest are duplicates. The rules of ranking are given below, where the rules are
       executed from start until an original has been found. Given two files A and B which have equal size and content, the ranking is as follows:

       If A was found while scanning an input argument earlier than than B, A is higher ranked.

       If A was found at a directory depth lower than B, A is higher ranked (A is closer to the root).

       if A and B are found during scanning of the same input argument and share the same directory depth, the one that ranks highest depends on if deterministic  operation  is  enabled.
       This is on by default, see option -deterministic). If enabled, which one ranks highest is unspecified but deterministic. If disabled, the one that was reported first from the file
       system is highest ranked.

OPTIONS
       Searching options etc:

       -ignoreempty true|false
              Ignore empty files. Setting this to true (the default) is equivalent to -minsize 1, false is equivalent to -minsize 0.

       -minsize N
              Ignores files with less than N bytes. Default is 1, meaning empty files are ignored.

       -followsymlinks true|false
              Follow symlinks. Default is false.

       -removeidentinode true|false
              Removes items found which have identical inode and device ID. Default is true.

       -checksum md5|sha1|sha256
              What type of checksum to be used: md5, sha1 or sha256. The default is sha1 since version 1.4.0.

       -deterministic true|false
              If set (the default), sort files of equal rank in an unspecified but deterministic order. This makes the behaviour independent of in  which  order  files  are  listed  when
              querying the file system.

       Action options:

       -makesymlinks true|false
              Replace duplicate files with symbolic links. Default is false.

       -makehardlinks true|false
              Replace duplicate files with hard links. Default is false.

       -makeresultsfile true|false
              Make a results file in the current directory. Default is true. If the file exists, it is overwritten.

       -outputname name
              Make the results file name to be "name" instead of the default results.txt.

       -deleteduplicates true|false
              Delete (unlink) files. Default is false.

       General options:

       -sleep Xms
              Sleeps X milliseconds between reading each file, to reduce load. Default is 0 (no sleep). Note that only a few values are supported at present: 0,1-5,10,25,50,100 millisec‐
              onds.

       -n, -dryrun true|false
              Displays what should have been done, don't actually delete or link anything. Default is false.

       -h, -help, --help
              Displays a brief help message.

       -v, -version, --version
              Displays the version number.

EXAMPLES
       Search for duplicate files in the home directory and a backup directory:
              rdfind ~ /mnt/backup

       Delete duplicates in a backup directory:
              rdfind -deleteduplicates true /mnt/backup

       Search for duplicate files in directories called foo:
              find . -type d -name foo -print0 |xargs -0 rdfind

FILES
       results.txt (the default name is results.txt and can be changed with option outputname, see above) The results file results.txt will contain one  row  per  duplicate  file  found,
       along with a header row explaining the columns.  A text describes why the file is considered a duplicate:

       DUPTYPE_UNKNOWN some internal error

       DUPTYPE_FIRST_OCCURRENCE the file that is considered to be the original.

       DUPTYPE_WITHIN_SAME_TREE files in the same tree (found when processing the directory in the same input argument as the original)

       DUPTYPE_OUTSIDE_TREE the file is found during processing another input argument than the original.

ENVIRONMENT
DIAGNOSTICS
EXIT VALUES
       0 on success, nonzero otherwise.

BUGS/FEATURES
       When specifying the same directory twice, it keeps the first encountered as the most important (original), and the rest as duplicates. This might not be what you want.

       The  symlink  creates  absolute  links.  This might not be what you want. To create relative links instead, you may use the symlinks (2) command, which is able to convert absolute
       links to relative links.

       Older versions unfortunately contained a misspelling on the word occurrence. This is now corrected (since 1.3), which might affect user scripts parsing the output file written  by
       rdfind.

SECURITY CONSIDERATIONS
       Avoid  manipulating  the  directories while rdfind is reading.  rdfind is quite brittle in that case. Especially, when deleting or making links, rdfind can be subject to a symlink
       attack.  Use with care!

AUTHOR
       Paul Dreik 2006-2018, reachable at rdfind@pauldreik.se Rdfind can be found at https://rdfind.pauldreik.se/

       Do you find rdfind useful? Drop me a line! It is always fun to hear from people who actually use it and what data collections they run it on.

THANKS
       Several persons have helped with suggestions and improvements: Niels Möller, Carl Payne and Salvatore Ansani. Thanks also to you who tested the program and sent me feedback.

VERSION
       1.4.1 (release date 2018-11-12)

COPYRIGHT
       This program is distributed under GPLv2 or later, at your option.

SEE ALSO
       md5sum(1), sha1sum(1), find(1), symlinks(2)

Nov 2018                                                                                   1.4.1                                                                                 rdfind(1)
