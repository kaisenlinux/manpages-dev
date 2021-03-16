  squashfuse
 
## NAME
      squashfuse — mount a SquashFS archive with F## USE
 
## SYNOPSIS
      squashfuse [-o options] archive mountpoint
 
## DESCRIPTION
      squashfuse mounts the SquashFS filesystem archive on the directory mountpoint.  The filesystem can be unmounted using umount(8) or fusermount(8).
 
      A selection of F## USEoptions:
 
      -V, --version
               show F## USEversion
 
      -h, --help
               print help
 
      -d, -o debug
               enable debug output (implies -f)
 
      -f       foreground operation
 
      -o allow_other
               allow access by other users
 
      -o allow_root
               allow access by the superuser
 
## SEE ALSO
      fusermount(8), mount(8), umount(8)
 
      SquashFS ⟨http://squashfs.sourceforge.net/⟩
 
      F## USE⟨http://fuse.sourceforge.net/⟩
 
 BSD                                                                        March 19, 2012                                                                        BSD
