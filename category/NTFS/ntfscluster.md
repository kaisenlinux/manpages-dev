NTFSCLUSTER(8)                                                         System Manager's Manual                                                        NTFSCLUSTER(8)

NAME
       ntfscluster - identify files in a specified region of an NTFS volume.

SYNOPSIS
       ntfscluster [options] device

DESCRIPTION
       ntfscluster has three modes of operation: info, sector and cluster.

   Info
       The default mode, info is currently not implemented.  It will display general information about the NTFS volume when it is working.

   Sector
       The sector mode will display a list of files that have data in the specified range of sectors.

   Cluster
       The  cluster  mode will display a list of files that have data in the specified range of clusters.  When the cluster size is one sector, this will be equiva‐
       lent to the sector mode of operation.

OPTIONS
       Below is a summary of all the options that ntfscluster accepts.  Nearly all options have two equivalent names.  The short name is preceded by - and the  long
       name  is  preceded  by  --.  Any single letter options, that don't take an argument, can be combined into a single command, e.g.  -fv is equivalent to -f -v.
       Long named options can be abbreviated to any unique prefix of their name.

       -c, --cluster RANGE
              Any files whose data is in this range of clusters will be displayed.

       -F, --filename NAME
              Show information about this file.

       -f, --force
              This will override some sensible defaults, such as not working with a mounted volume.  Use this option with caution.

       -h, --help
              Show a list of options with a brief description of each one.

       -I, --inode NUM
              Show information about this inode.

       -i, --info
              This option is not yet implemented.

       -q, --quiet
              Reduce the amount of output to a minimum.  Naturally, it doesn't make sense to combine this option with

       -s, --sector RANGE
              Any files whose data is in this range of sectors will be displayed.

       -v, --verbose
              Increase the amount of output that ntfscluster prints.

       -V, --version
              Show the version number, copyright and license for ntfscluster.

EXAMPLES
       Get some information about the volume /dev/hda1.

              ntfscluster /dev/hda1

       Look for files in the first 500 clusters of /dev/hda1.

              ntfscluster -c 0-500 /dev/hda1

BUGS
       The info mode isn't implemented yet.  ntfscluster is quite limited, but it has no known bugs.  If you find a bug please send an email describing the  problem
       to the development team:
       ntfs-3g-devel@lists.sf.net

AUTHORS
       ntfscluster was written by Richard Russon, with contributions from Anton Altaparmakov.  It was ported to ntfs-3g by Erik Larsson.

AVAILABILITY
       ntfscluster is part of the ntfs-3g package and is available from:
       http://www.tuxera.com/community/

SEE ALSO
       ntfsinfo(8), ntfsprogs(8)

ntfs-3g 2017.3.23AR.3                                                       November 2005                                                             NTFSCLUSTER(8)
