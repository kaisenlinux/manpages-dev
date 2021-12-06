f2fs_io(8)                                                                    System Administration Utilities                                                                   f2fs_io(8)

NAME
       f2fs_io - f2fs ioctl utility

DESCRIPTION
       f2fs_io is used to send various commands to the f2fs file system for administrative purposes.

AVAILABLE COMMANDS
       set_verity [file]
              Set the verity flags associated with the specified file.

       getflags [file]
              Get the flags associated with the specified file.

       setflags [flag] [file]
              Set an f2fs file on specified file.  The flag can be casefold, compression, and nocompression.

       shutdown shutdown filesystem
              Freeze and stop all IOs for the file system mounted on dir.  The level parameter can be:

                   0      going down with full sync

                   1      going down with checkpoint only

                   2      going down with no sync

                   3      going down with metadata flush

                   4      going down with fsck mark

       pinfile [get|set] [file]
              Get or set the pinning status on a file.

       fallocate [keep_size] [offset] [length] [file]
              Request that space be allocated on a file.  The keep_size parameter can be either 1 or 0.

       write [chunk_size in 4kb] [offset in chunk_size] [count] [pattern] [IO] [file_path]
              Write a given pattern to file_path.  The pattern parameter can be:

                   zero   zeros

                   inc_num
                          incrementing numbers

                   rand   random numbers

              The IO parameter can be:

                   buffered
                          buffered I/O

                   dio    direct I/O

       read [chunk_size in 4kb] [offset in chunk_size] [count] [IO] [print_nbytes] [file_path]
              Read data in file_path and print print_nbytes.  The IO options can be:

                   buffered
                          buffered I/O

                   dio    direct I/O

       fiemap [offset in 4kb] [count] [file_path]
              get block address in file

       gc_urgent dev [start|end|run] [time in sec]
              Start, end, or run gc_urgent for a given time period

       defrag_file [start] [length] [file_path]
              Defragment a file.

       copy [-d] [-m] [-s] [src_path] [dst_path]
              Copy file from src_path to dst_path.  The pattern parameter can be:

                   -d     use direct I/O

                   -m     use mmap for source file

                   -s     use sendfile to transfer data

       get_cblocks [file]
              Get the number of compressed blocks.

       release_cblocks [file]
              Release compressed blocks to get free space.

       reserve_cblocks [file]
              Reserve free blocks to prepare decompressing blocks in the file.

AUTHOR
       This version of f2fs_io has been written by Jaegeuk Kim <jaegeuk@kernel.org>.

AVAILABILITY
       f2fs_io is available from git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git.

f2fs-tools                                                                              March 2020                                                                              f2fs_io(8)
