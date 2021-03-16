MAGICRESCUE(1)                                                              Magic Rescue                                                              MAGICRESCUE(1)

NAME
       magicrescue - Scans a block device and extracts known file types by looking at magic bytes.

SYNOPSIS
       magicrescue [ options ] devices

DESCRIPTION
       Magic Rescue opens devices for reading, scans them for file types it knows how to recover and calls an external program to extract them.  It looks at "magic
       bytes" in file contents, so it can be used both as an undelete utility and for recovering a corrupted drive or partition.  It works on any file system, but
       on very fragmented file systems it can only recover the first chunk of each file.  These chunks are sometimes as big as 50MB, however.

       To invoke magicrescue, you must specify at least one device and the -d and -r options.  See the "USAGE" section in this manual for getting started.

OPTIONS
       -b blocksize
              Default: 1.  This will direct magicrescue to only consider files that start at a multiple of the blocksize argument.  The option applies only to the
              recipes following it, so by specifying it multiple times it can be used to get different behavior for different recipes.

              Using this option you can usually get better performance, but fewer files will be found.  In particular, files with leading garbage (e.g. many mp3
              files) and files contained inside other files are likely to be skipped.  Also, some file systems don't align small files to block boundaries, so those
              won't be found this way either.

              If you don't know your file system's block size, just use the value 512, which is almost always the hardware sector size.

       -d directory
              Mandatory.  Output directory for found files.  Make sure you have plenty of free space in this directory, especially when extracting very common file
              types such as jpeg or gzip files.  Also make sure the file system is able to handle thousands of files in a single directory, i.e. don't use FAT if
              you are extracting many files.

              You should not place the output directory on the same block device you are trying to rescue files from.  This might add the same file to the block
              device ahead of the current reading position, causing magicrescue to find the same file again later.  In the worst theoretical case, this could cause
              a loop where the same file is extracted thousands of times until disk space is exhausted.  You are also likely to overwrite the deleted files you were
              looking for in the first place.

       -r recipe
              Mandatory.  Recipe name, file, or directory.  Specify this as either a plain name (e.g.  "jpeg-jfif") or a path (e.g. recipes/jpeg-jfif).  If it
              doesn't find such a file in the current directory, it will look in ./recipes and /usr/share/magicrescue/recipes.

              If recipe is a directory, all files in that directory will be treated as recipes.

              Browse the /usr/share/magicrescue/recipes directory to see what recipes are available.  A recipe is a text file, and you should read the comments
              inside it before using it.  Either use the recipe as it is or copy it somewhere and modify it.

              For information on creating your own recipes, see the "RECIPES" section.

       -I file
              Reads input files from file in addition to those listed on the command line.  If file is "-", read from standard input.  Each line will be interpreted
              as a file name.

       -M output_mode
              Produce machine-readable output to stdout.  output_mode can be:

              i   Print each input file name before processing

              o   Print each output file name after processing

              io  Print both input and output file names.  Input file names will be prefixed by "i" and a space.  Output file names will be prefixed by "o" and a
                  space.

              Nothing else will be written to standard output in this mode.

       -O [+|-|=][0x]offset
              Resume from the specified offset in the first device.  If prefixed with 0x it will be interpreted as a hex number.

              The number may be prefixed with a sign:

              =   Seek to an absolute position (default)

              +   Seek to a relative position.  On regular files this does the same as the above.

              -   Seek to EOF, minus the offset.

USAGE
       Say you have destroyed the file system on /dev/hdb1 and you want to extract all the jpeg files you lost.  This guide assumes you have installed Magic Rescue
       in /usr/local, which is the default.

       Make sure DMA and other optimizations are enabled on your disk, or it will take hours.  In Linux, use hdparm to set these options:

           $ hdparm -d 1 -c 1 -u 1 /dev/hdb

       Choose your output directory, somewhere with lots of disk space.

           $ mkdir ~/output

       Look in the /usr/local/share/magicrescue/recipes directory for the recipes you want.  Magic Rescue comes with recipes for some common file types, and you can
       make your own too (see the next section).  Open the recipes you want to use in a text editor and read their comments.  Most recipes require 3rd party
       software to work, and you may want to modify some parameters (such as min_output_file) to suit your needs.

       Then invoke magicrescue

           $ magicrescue -r jpeg-jfif -r jpeg-exif -d ~/output /dev/hdb1

       It will scan through your entire hard disk, so it may take a while.  You can stop it and resume later of you want to.  To do so, interrupt it (with CTRL+C)
       and note the progress information saying what address it got to.  Then restart it later with the -O option.

       When it has finished you will probably find thousands of .jpg files in ~/output, including things you never knew was in your browser cache.  Sorting through
       all those files can be a huge task, so you may want to use software or scripts to do it.

       First, try to eliminate duplicates with the dupemap(1) tool included in this package.

           $ dupemap delete,report ~/output

       If you are performing an undelete operation you will want to get rid of all the rescued files that also appear on the live file system.  See the dupemap(1)
       manual for instructions on doing this.

       If that's not enough, you can use use magicsort(1) to get a better overview:

           $ magicsort ~/output

RECIPES
   Creating recipe files
       A recipe file is a relatively simple file of 3-5 lines of text.  It describes how to recognise the beginning of the file and what to do when a file is
       recognised.  For example, all jfif images start with the bytes "0xff 0xd8".  At the 6th byte will be the string "JFIF".  Look at recipes/jpeg-jfif in the
       source distribution to follow this example.

       Matching magic data is done with a "match operation" that looks like this:

       offset operation parameter

       where offset is a decimal integer saying how many bytes from the beginning of the file this data is located, operation refers to a built-in match operation
       in magicrescue, and parameter is specific to that operation.

       •   The string operation matches a string of any length.  In the jfif example this is four bytes.  You can use escape characters, like "\n" or "\xA7".

       •   The int32 operation matches 4 bytes ANDed with a bit mask.  To match all four bytes, use the bit mask "FFFFFFFF".  If you have no idea what a bit mask
           is, just use the string operation instead.  The mask "FFFF0000" in the jfif example matches the first two bytes.

       •   The char operation is like "string", except it only matches a single character.

       To learn these patterns for a given file type, look at files of the desired type in a hex editor, search through the resource files for the file(1) utility
       (<http://freshmeat.net/projects/file>) and/or search the Internet for a reference on the format.

       If all the operations match, we have found the start of the file.  Finding the end of the file is a much harder problem, and therefore it is delegated to an
       external shell command, which is named by the command directive.  This command receives the block device's file descriptor on stdin and must write to the
       file given to it in the $1 variable.  Apart from that, the command can do anything it wants to try and extract the file.

       For some file types (such as jpeg), a tool already exists that can do this.  However, many programs misbehave when told to read from the middle of a huge
       block device.  Some seek to byte 0 before reading (can be fixed by prefixing cat|, but some refuse to work on a file they can't seek in).  Others try to read
       the whole file into memory before doing anything, which will of course fail on a muti-gigabyte block device.  And some fail completely to parse a partially
       corrupted file.

       This means that you may have to write your own tool or wrap an existing program in some scripts that make it behave better.  For example, this could be to
       extract the first 10MB into a temporary file and let the program work on that.  Or perhaps you can use tools/safecat if the file may be very large.

   Recipe format reference
       Empty lines and lines starting with "#" will be skipped.  A recipe contains a series of match operations to find the content and a series of directives to
       specify what to do with it.

       Lines of the format offset operation parameter will add a match operation to the list.  Match operations will be tried in the order they appear in the
       recipe, and they must all match for the recipe to succeed.  The offset describes what offset this data will be found at, counting from the beginning of the
       file.  operation can have the following values:

       string string
              The parameter is a character sequence that may contain escape sequences such as \xFF.

       char character
              The parameter is a single character (byte), or an escape sequence.

       int32 value bitmask
              Both value and bitmask are expressed as 8-character hex strings.  bitmask will be ANDed with the data, and the result will be compared to value.  The
              byte order is as you see it in the hex editor, i.e. big-endian.

       The first match operation in a recipe is special, it will be used to scan through the file.  Only the char and string operations can be used there.  To add
       more operation types, look at the instructions in magicrescue.c.

       A line that doesn't start with an integer is a directive.  This can be:

       extension ext
              Mandatory.  ext names the file extension for this type, such as "jpg".

       command command
              Mandatory.  When all the match operations succeed, this command will be executed to extract the file from the block device.  command is passed to the
              shell with the block device's file descriptor (seeked to the right byte) on stdin.  The shell variable $1 will contain the file its output should be
              written to, and it must respect this.  Otherwise magicrescue cannot tell whether it succeeded.

       rename command
              Optional.  After a successful extraction this command will be run.  Its purpose is to gather enough information about the file to rename it to
              something more meaningful.  The script must not perform the rename command itself, but it should write to standard output the string "RENAME",
              followed by a space, followed by the new file name.  Nothing else must be written to standard output.  If the file should not be renamed, nothing
              should be written to standard output.  Standard input and $1 will work like with the command directive.

       min_output_file size
              Default: 100.  Output files less than this size will be deleted.

       allow_overlap bytes
              By default, recipes will not match on overlapping byte ranges.  allow_overlap disables this, and it should always be used for recipes where the
              extracted file may be larger than it was on disk.  If bytes is negative, overlap checking will be completely disabled.  Otherwise, overlap checking
              will be in effect for everything but the last bytes of the output.  For example, if the output may be up to 512 bytes bigger than the input,
              allow_overlap should be set to 512.

       To test whether your recipe actually works, either just run it on your hard disk or use the tools/checkrecipe script to pick out files that should match but
       don't.

       If you have created a recipe that works, please mail it to me at jbj@knef.dk so I can include it in the distribution.

WHEN TO NOT USE MAGIC RESCUE
       Magic Rescue is not meant to be a universal application for file recovery.  It will give good results when you are extracting known file types from an
       unusable file system, but for many other cases there are better tools available.

       •   If there are intact partitions present somewhere, use gpart to find them.

       •   If file system's internal data structures are more or less undamaged, use The Sleuth Kit.  At the time of writing, it only supports NTFS, FAT, ext[23]
           and FFS, though.

       •   If Magic Rescue does not have a recipe for the file type you are trying to recover, try foremost instead.  It recognizes more file types, but in most
           cases it extracts them simply by copying out a fixed number of bytes after it has found the start of the file.  This makes postprocessing the output
           files more difficult.

       In many cases you will want to use Magic Rescue in addition to the tools mentioned above.  They are not mutually exclusive, e.g. combining magicrescue with
       dls from The Sleuth Kit could give good results.  In many cases you'll want to use magicrescue to extract its known file types and another utility to extract
       the rest.

       When combining the results of more than one tool, dupemap(1) can be used to eliminate duplicates.

SEE ALSO
       Similar programs
           gpart(8)
               <http://www.stud.uni-hannover.de/user/76201/gpart/>.  Tries to rebuild the partition table by scanning the disk for lost partitions.

           foremost(1)
               <http://foremost.sourceforge.net>.  Does the same thing as magicrescue, except that its "recipes" are less complex.  Finding the end of the file must
               happen by either matching an EOF string or just extracting a fixed number of bytes every time.  It supports more file types than Magic Rescue, but
               extracted files usually have lots of trailing garbage, so removal of duplicates and sorting by size is not possible.

           The Sleuth Kit
               <http://www.sleuthkit.org/sleuthkit/>.  This popular package of utilities is extremely useful for undeleting files from a FAT/NTFS/ext2/ext3/FFS file
               system that's not completely corrupted.  Most of the utilities are not very useful if the file system has been corrupted or overwritten.  It is based
               on The Coroner's Toolkit (<http://www.porcupine.org/forensics/tct.html>).

           JPEG recovery tools
               This seems to be the file type most people are trying to recover.  Available utilities include <http://www.cgsecurity.org/?photorec.html>,
               <http://codesink.org/recover.html>, and <http://www.vanheusden.com/findfile/>.

       Getting disk images from failed disks
           dd(1), rescuept(1), <http://www.garloff.de/kurt/linux/ddrescue/>, <http://www.kalysto.org/utilities/dd_rhelp/>, <http://vanheusden.com/recoverdm/>,
           <http://myrescue.sourceforge.net>

       Processing magicrescue's output
           dupemap(1), file(1), magicsort(1), <http://ccorr.sourceforge.net>

       Authoring recipes
           magic(4), hexedit(1), <http://wotsit.org>

       Filesystem-specific undelete utilities
           There are too many to count them, especially for ext2 and FAT.  Find them on Google and Freshmeat.

AUTHOR
       Jonas Jensen <jbj@knef.dk>

LATEST VERSION
       You can find the latest version at <https://github.com/jbj/magicrescue>

1.1.10                                                                       2018-10-16                                                               MAGICRESCUE(1)
