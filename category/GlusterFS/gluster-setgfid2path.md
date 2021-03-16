
gluster-setgfid2path(8)                                                System Manager's Manual                                               gluster-setgfid2path(8)

NAME
       gluster-setgfid2path - Gluster tool to set GFID to Path xattrs

SYNOPSIS
       gluster-setgfid2path file

DESCRIPTION
       New feature introduced with Gluster release 3.12, to find full path from GFID.  This feature can be enabled using Volume set command gluster volume set <VOL‐
       UME> storage.gfid2path enable

       Once gfid2path feature is enabled, it starts recording the necessary xattrs required for the feature. But it will not add xattrs  for  the  already  existing
       files. This tool provides facility to update the gfid2path xattrs for the given file path.

EXAMPLES
       To add xattrs of a single file,

              gluster-setgfid2path /bricks/b1/hello.txt

       To set xattr for all the existing files, run the below script on each bricks.

              BRICK=/bricks/b1
              find $BRICK -type d \( -path "${BRICK}/.trashcan" -o -path \
                  "${BRICK}/.glusterfs" \) -prune -o -type f \
                  -exec gluster-setgfid2path {} \;

SEE ALSO
       gluster(8)

COPYRIGHT
       Copyright(c) 2017   Red Hat, Inc.   <http://www.redhat.com>

                                                           Command line utility to set GFID to Path Xattrs                                   gluster-setgfid2path(8)
