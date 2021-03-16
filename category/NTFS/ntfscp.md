NTFSCP(8)                                                              System Manager's Manual                                                             NTFSCP(8)

NAME
       ntfscp - copy file to an NTFS volume.

SYNOPSIS
       ntfscp [options] device source_file destination

DESCRIPTION
       ntfscp  will copy file to an NTFS volume. destination can be either file or directory. In case if destination is directory specified by name then source_file
       is copied into this directory, in case if destination is directory and specified by inode number then unnamed data attribute is created for  this  inode  and
       source_file  is  copied into it (WARNING: it's unusual to have unnamed data streams in the directories, think twice before specifying directory by inode num‐
       ber).

OPTIONS
       Below is a summary of all the options that ntfscp accepts.  Nearly all options have two equivalent names.  The short name is preceded by - and the long  name
       is  preceded  by  --.  Any single letter options, that don't take an argument, can be combined into a single command, e.g.  -fv is equivalent to -f -v.  Long
       named options can be abbreviated to any unique prefix of their name.

       -a, --attribute NUM
              Write to this attribute.

       -i, --inode
              Treat destination as inode number.

       -m, --min-fragments
              Minimize fragmentation when allocating space to the attribute. This is mostly useful when creating big files.

       -N, --attr-name NAME
              Write to attribute with this name.

       -n, --no-action
              Use this option to make a test run before doing the real copy operation.  Volume will be opened read-only and no write will be done.

       -f, --force
              This will override some sensible defaults, such as not working with a mounted volume.  Use this option with caution.

       -h, --help
              Show a list of options with a brief description of each one.

       -q, --quiet
              Suppress some debug/warning/error messages.

       -t, --timestamp
              Copy the modification time of source_file to destination. This is not compatible with --attr-name and --attribute.

       -V, --version
              Show the version number, copyright and license ntfscp.

       -v, --verbose
              Display more debug/warning/error messages.

DATA STREAMS
       All data on NTFS is stored in streams, which can have names. A file can have more than one data streams, but exactly one must have no name.  The  size  of  a
       file  is  the  size of its unnamed data stream. Usually when you don't specify stream name you are access to unnamed data stream. If you want access to named
       data stream you need to add ":stream_name" to the filename. For example: by opening "some.mp3:artist" you will open stream "artist" in "some.mp3".  But  win‐
       dows usually prevent you from accessing to named data streams, so you need to use some program like FAR or utils from cygwin to access named data streams.

EXAMPLES
       Copy new_boot.ini from /home/user as boot.ini to the root of an /dev/hda1 NTFS volume:

              ntfscp /dev/hda1 /home/user/new_boot.ini boot.ini

       Copy myfile to C:\some\path\myfile:stream (assume that /dev/hda1 letter in windows is C):

              ntfscp -N stream /dev/hda1 myfile /some/path

BUGS
       There are no known problems with ntfscp. If you find a bug please send an email describing the problem to the development team:
       ntfs-3g-devel@lists.sf.net

AUTHORS
       ntfscp was written by Yura Pakhuchiy, with contributions from Anton Altaparmakov and Hil Liao.  It was ported to ntfs-3g by Erik Larsson.

DEDICATION
       With love to Marina Sapego.

AVAILABILITY
       ntfscp is part of the ntfs-3g package and is available from:
       http://www.tuxera.com/community/

SEE ALSO
       ntfsprogs(8)

ntfs-3g 2017.3.23AR.3                                                      September 2007                                                                  NTFSCP(8)
