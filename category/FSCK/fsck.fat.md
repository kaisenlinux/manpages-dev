FSCK.FAT(8)                                                            System Manager's Manual                                                           FSCK.FAT(8)

NAME
       fsck.fat - check and repair MS-DOS filesystems

SYNOPSIS
       fsck.fat [OPTIONS] DEVICE

DESCRIPTION
       fsck.fat verifies the consistency of MS-DOS filesystems and optionally tries to repair them.

       The following filesystem problems can be corrected (in this order):

       *   FAT contains invalid cluster numbers.  Cluster is changed to EOF.

       *   File's cluster chain contains a loop.  The loop is broken.

       *   Bad clusters (read errors).  The clusters are marked bad and they are removed from files owning them.  This check is optional.

       *   Directories with a large number of bad entries (probably corrupt).  The directory can be deleted.

       *   Files . and .. are non-directories.  They can be deleted or renamed.

       *   Directories . and .. in root directory.  They are deleted.

       *   Bad filenames.  They can be renamed.

       *   Duplicate directory entries.  They can be deleted or renamed.

       *   Directories with non-zero size field.  Size is set to zero.

       *   Directory . does not point to parent directory.  The start pointer is adjusted.

       *   Directory .. does not point to parent of parent directory.  The start pointer is adjusted.

       *   Start cluster number of a file is invalid.  The file is truncated.

       *   File contains bad or free clusters.  The file is truncated.

       *   File's cluster chain is longer than indicated by the size fields.  The file is truncated.

       *   Two  or  more files share the same cluster(s).  All but one of the files are truncated.  If the file being truncated is a directory file that has already
           been read, the filesystem check is restarted after truncation.

       *   File's cluster chain is shorter than indicated by the size fields.  The file is truncated.

       *   Clusters are marked as used but are not owned by a file.  They are marked as free.

       Additionally, the following problems are detected, but not repaired:

       *   Invalid parameters in boot sector

       *   Absence of . and .. entries in non-root directories

       When fsck.fat checks a filesystem, it accumulates all changes in memory and performs them only after all checks are complete.  This can be disabled with  the
       -w option.

OPTIONS
       -a  Automatically  repair  the filesystem.  No user intervention is necessary.  Whenever there is more than one method to solve a problem, the least destruc‐
           tive approach is used.

       -A  Use Atari variation of the MS-DOS filesystem.  This is default if fsck.fat is run on an Atari, then this option turns off Atari format.  There  are  some
           minor  differences in Atari format: Some boot sector fields are interpreted slightly different, and the special FAT entries for end-of-file and bad clus‐
           ter can be different.  Under MS-DOS 0xfff8 is used  for  EOF  and  Atari  employs  0xffff  by  default,  but  both  systems  recognize  all  values  from
           0xfff8...0xffff  as  end-of-file.  MS-DOS uses only 0xfff7 for bad clusters, where on Atari values 0xfff0...0xfff7 are for this purpose (but the standard
           value is still 0xfff7).

       -b  Make read-only boot sector check.

       -c PAGE
           Use DOS codepage PAGE to decode short file names.  By default codepage 437 is used.

       -d PATH
           Delete the specified file.  If more than one file with that name exist, the first one is deleted.  This option can be given more than once.

       -f  Salvage unused cluster chains to files.  By default, unused clusters are added to the free disk space except in auto mode (-a).

       -l  List path names of files being processed.

       -n  No-operation mode: non-interactively check for errors, but don't write anything to the filesystem.

       -p  Same as -a, for compatibility with other *fsck.

       -r  Interactively repair the filesystem.  The user is asked for advice whenever there is more than one approach to fix an inconsistency.  This is the default
           mode and the option is only retained for backwards compatibility.

       -t  Mark unreadable clusters as bad.

       -u PATH
           Try  to  undelete  the specified file.  fsck.fat tries to allocate a chain of contiguous unallocated clusters beginning with the start cluster of the un‐
           deleted file.  This option can be given more than once.

       -v  Verbose mode.  Generates slightly more output.

       -V  Perform a verification pass.  The filesystem check is repeated after the first run.  The second pass should never report any fixable errors.  It may take
           considerably longer than the first pass, because the first pass may have generated long list of modifications that have to be scanned for each disk read.

       -w  Write changes to disk immediately.

       -y  Same as -a (automatically repair filesystem) for compatibility with other fsck tools.

EXIT STATUS
       0   No recoverable errors have been detected.

       1   Recoverable errors have been detected or fsck.fat has discovered an internal inconsistency.

       2   Usage error.  fsck.fat did not access the filesystem.

FILES
       fsck0000.rec, fsck0001.rec, ...
           When recovering from a corrupted filesystem, fsck.fat dumps recovered data into files named 'fsckNNNN.rec' in the top level directory of the filesystem.

BUGS
       Does  not create . and .. files where necessary.  Does not remove entirely empty directories.  Should give more diagnostic messages.  Undeleting files should
       use a more sophisticated algorithm.

SEE ALSO
       fatlabel(8)
       mkfs.fat(8)

HOMEPAGE
       The home for the dosfstools project is its GitHub project page ⟨https://github.com/dosfstools/dosfstools⟩.

AUTHORS
       dosfstools were written by Werner Almesberger ⟨werner.almesberger@lrc.di.epfl.ch⟩, Roman Hodek  ⟨Roman.Hodek@informatik.uni-erlangen.de⟩,  and  others.   The
       current maintainer is Andreas Bombe ⟨aeb@debian.org⟩.

dosfstools 4.1                                                               2015-04-16                                                                  FSCK.FAT(8)
