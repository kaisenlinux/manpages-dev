xfs_bmap(8)                                                            System Manager's Manual                                                           xfs_bmap(8)

NAME
       xfs_bmap - print block mapping for an XFS file

SYNOPSIS
       xfs_bmap [ -adelpv ] [ -n num_extents ] file
       xfs_bmap -V

DESCRIPTION
       xfs_bmap  prints  the map of disk blocks used by files in an XFS filesystem.  The map lists each extent used by the file, as well as regions in the file that
       do not have any corresponding blocks (holes).  Each line of the listings takes the following form:

              extent: [startoffset..endoffset]: startblock..endblock

       Holes are marked by replacing the startblock..endblock with hole.  All the file offsets and disk blocks are in units of 512-byte blocks, no matter  what  the
       filesystem's block size is.

OPTIONS
       -a     If this option is specified, information about the file's attribute fork is printed instead of the default data fork.

       -d     If  portions  of  the file have been migrated offline by a DMAPI application, a DMAPI read event will be generated to bring those portions back online
              before the disk block map is printed.  However if the -d option is used, no DMAPI read event will be generated for a DMAPI file and  offline  portions
              will be reported as holes.

       -e     If  this option is used, xfs_bmap obtains all delayed allocation extents, and does not flush dirty pages to disk before querying extent data. With the
              -v option, the flags column will show which extents have not yet been allocated.

       -l     If this option is used, then

                   <nblocks>  blocks

              will be appended to each line.  nblocks is the length of the extent described on the line in units of 512-byte blocks.

              This flag has no effect if the -v option is used.

       -n num_extents
              If this option is given, xfs_bmap will display at most num_extents extents. In the absence of -n, xfs_bmap will display all extents in the file.

       -p     If this option is used, xfs_bmap obtains all unwritten (preallocated) extents that do not contain written data. With the -v option, the  flags  column
              will show which extents are preallocated/unwritten.

       -v     Shows verbose information. When this flag is specified, additional AG specific information is appended to each line in the following form:

                   agno (startagoffset..endagoffset) nblocks flags

              A second -v option will print out the flags legend.

       -V     Prints the version number and exits.

SEE ALSO
       xfs_fsr(8), xfs(5).

                                                                                                                                                         xfs_bmap(8)
