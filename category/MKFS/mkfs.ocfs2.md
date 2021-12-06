mkfs.ocfs2(8)                                                                       OCFS2 Manual Pages                                                                       mkfs.ocfs2(8)

NAME
       mkfs.ocfs2 - Creates an OCFS2 file system.

SYNOPSIS
       mkfs.ocfs2  [-b  block-size]  [-C  cluster-size] [-L volume-label] [-M mount-type] [-N number-of-nodes] [-J journal-options] [--fs-features=[no]sparse...] [--fs-feature-level=fea‐
       ture-level] [-T filesystem-type] [--cluster-stack=stackname] [--cluster-name=clustername] [--global-heartbeat] [--discard | --nodiscard] [-FqvV] device [blocks-count]

DESCRIPTION
       mkfs.ocfs2 is used to create an OCFS2 file system on a device, usually a partition on a shared disk. In order to prevent data loss, mkfs.ocfs2 will not format  an  existing  OCFS2
       volume if it detects that it is mounted on another node in the cluster. This tool requires the cluster service to be online.

OPTIONS
       -b, --block-size block-size
              Valid block size values are 512, 1K, 2K and 4K bytes per block. If omitted, a value will be heuristically determined based on the expected usage of the file system (see the
              -T option). A block size of 512 bytes is never recommended. Choose 1K, 2K or 4K.

       -C, --cluster-size cluster-size
              Valid cluster size values are 4K, 8K, 16K, 32K, 64K, 128K, 256K, 512K and 1M. If omitted, a value will be heuristically determined based on the expected usage of  the  file
              system  (see  the -T option). For volumes expected to store large files, like database files, while a cluster size of 128K or more is recommended, one can opt for a smaller
              size as long as that value is not smaller than the database block size.  For others, use 4K.

       -F, --force
              For existing OCFS2 volumes, mkfs.ocfs2 ensures the volume is not mounted on any node in the cluster before formatting. For that to work, mkfs.ocfs2 expects the cluster ser‐
              vice to be online.  Specify this option to disable this check.

       -J, --journal-options options
              Create the journal using options specified on the command-line. Journal options are comma separated, and may take an argument using the equals ('=') sign. The following op‐
              tions are supported:

              size=journal-size
                     Create a journal of size journal-size. Minimum size is 4M.  If omitted, a value is heuristically determined based upon the file system size.

              block32
                     Use a standard 32bit journal.  The journal will be able to access up to 2^32-1 blocks.  This is the default.  It has been the journal format for OCFS2 volumes  since
                     the beginning.  The journal is compatible with all versions of OCFS2.  Prepending no is equivalent to the block64 journal option.

              block64
                     Use  a 64bit journal.  The journal will be able to access up to 2^64-1 blocks.  This allows large filesystems that can extend to the theoretical limits of OCFS2.  It
                     requires a new-enough filesystem driver that uses the new journalled block device, JBD2. Prepending no is equivalent to the block32 journal option.

       -L, --label volume-label
              Set the volume label for the file system. This is useful for mounting-by-label. Limit the label to under 64 bytes.

       -M, --mount mount-type
              Valid types are local and cluster. Local mount allows users to mount the volume without the cluster overhead and works only with OCFS2 bundled with Linux kernels 2.6.20  or
              later. Defaults to cluster.

       -N, --node-slots number-of-node-slots
              Valid  number  ranges  from  1 to 255. This number specifies the maximum number of nodes that can concurrently mount the partition. If omitted, the number depends on volume
              size, for volume size < 2G, it's 2, for 2G <= size < 10G, it's 4, for 10G <= size < 1T, it's 8, for other size, it's 16. The number of slots can be later tuned up  or  down
              using tunefs.ocfs2.

       -T filesystem-type
              Specify how the filesystem is going to be used, so that mkfs.ocfs2 can chose optimal filesystem parameters for that use. The supported filesystem types are:

              mail   Appropriate for file systems that will host lots of small files.

              datafiles
                     Appropriate for file systems that will host a relatively small number of very large files.

              vmstore
                     Appropriate for file systems that will host Virtual machine images.

       --fs-features=[no]sparse...
              Turn specific file system features on or off. A comma separated list of feature flags can be provided, and mkfs.ocfs2 will try to create the file system with those features
              set according to the list. To turn a feature on, include it in the list. To turn a feature off, prepend no to the name. Choices here will override individual  features  set
              via the --fs-feature-level option. Refer to the section titled feature compatibility before selecting specific features. The following flags are supported:

              backup-super
                     mkfs.ocfs2,  by  default,  makes  up to 6 backup copies of the super block at offsets 1G, 4G, 16G, 64G, 256G and 1T depending on the size of the volume.  This can be
                     useful in disaster recovery. This feature is fully compatible with all versions of the file system and generally should not be disabled.

              local  Create the file system as a local mount, so that it can be mounted without a cluster stack.

              sparse Enable support for sparse files. With this, OCFS2 can avoid allocating (and zeroing) data to fill holes. Turn this feature on if you can, otherwise extends and  some
                     writes might be less performant.

              unwritten
                     Enable  unwritten extents support. With this turned on, an application can request that a range of clusters be pre-allocated within a file. OCFS2 will mark those ex‐
                     tents with a special flag so that expensive data zeroing doesn't have to be performed. Reads and writes to a pre-allocated region act as reads and writes to a  hole,
                     except a write will not fail due to lack of data allocation. This feature requires sparse file support to be turned on.

              inline-data
                     Enable  inline-data support. If this feature is turned on, OCFS2 will store small files and directories inside the inode block. Data is transparently moved out to an
                     extent when it no longer fits inside the inode block. In some cases, this can also make a positive impact on cold-cache directory and file operations.

              extended-slotmap
                     The slot-map is a hidden file on an OCFS2 fs which is used to map mounted nodes to system file resources. The extended slot map allows a  larger  range  of  possible
                     node numbers, which is useful for userspace cluster stacks. If required, this feature is automatically turned on by mkfs.ocfs2.

              metaecc
                     Enables metadata checksums. With this enabled, the file system computes and stores the checksums in all metadata blocks. It also computes and stores an error correc‐
                     tion code capable of fixing single bit errors.

              refcount
                     Enables creation of reference counted trees. With this enabled, the file system allows users to create inode-based snapshots and clones known as reflinks.

              xattr  Enable extended attributes support. With this enabled, users can attach name:value pairs to objects within the file system. In OCFS2, the names  can  be  up  to  255
                     bytes  in  length, terminated by the first NUL byte. While it is not required, printable names (ASCII) are recommended. The values can be up to 64KB of arbitrary bi‐
                     nary data. Attributes can be attached to all types of inodes: regular files, directories, symbolic links, device nodes, etc. This feature is required for users want‐
                     ing to use extended security facilities like POSIX ACLs or SELinux.

              usrquota
                     Enable user quota support. With this feature enabled, filesystem will track amount of space and number of inodes (files, directories, symbolic links) each user owns.
                     It is then possible to limit the maximum amount of space or inodes user can have. See a documentation of quota-tools package for more details.

              grpquota
                     Enable group quota support. With this feature enabled, filesystem will track amount of space and number of inodes (files, directories,  symbolic  links)  each  group
                     owns. It is then possible to limit the maximum amount of space or inodes user can have. See a documentation of quota-tools package for more details.

              indexed-dirs
                     Enable directory indexing support. With this feature enabled, the file system creates indexed tree for non-inline directory entries. For large scale directories, di‐
                     rectory entry lookup performance from the indexed tree is faster then from the legacy directory blocks.

              discontig-bg
                     Enables discontiguous block groups. With this feature enabled, the file system is able to grow the inode and the extent allocators even when there is  no  contiguous
                     free chunk available. It allows the file system to grow the allocators in smaller (discontiguous) chunks.

              clusterinfo
                     Enables storing the cluster stack information in the superblock. This feature is needed to support userspace cluster stacks and the global heartbeat mode in the o2cb
                     cluster stack. If needed, this feature is automatically turned on by mkfs.ocfs2.

       --fs-feature-level=feature-level
              Choose from a set of pre-determined file-system features. This option is designed to allow users to conveniently choose a set of  file  system  features  which  fits  their
              needs.  There  is no downside to trying a set of features which your module might not support - if it won't mount the new file system simply reformat at a lower level. Fea‐
              ture levels can be fine-tuned via the --fs-features option. Currently, there are 3 types of feature levels:

              max-compat
                     Chooses fewer features but ensures that the file system can be mounted from older versions of the OCFS2 module.

              default
                     The default feature set tries to strike a balance between providing new features and maintaining compatibility with relatively recent versions of OCFS2. It currently
                     enables sparse, unwritten, inline-data, xattr, indexed-dirs, discontig-bg, refcount, extended-slotmap and clusterinfo.

              max-features
                     Choose  the  maximum  amount of features available. This will typically provide the best performance from OCFS2 at the expense of creating a file system that is only
                     compatible with very recent versions of the OCFS2 kernel module.

       --cluster-stack
              Specify the cluster stack. This option is normally not required as mkfs.ocfs2 chooses the currently active cluster stack. It is required only if the cluster  stack  is  not
              online  and the user wishes to use a stack other than the default, o2cb. Other supported cluster stacks are pcmk (Pacemaker) and cman (rgmanager). Once set, OCFS2 will only
              allow mounting the volume if the active cluster stack and cluster name matches the one specified on-disk.

       --cluster-name
              Specify the name of the cluster. This option is mandatory if the user has specified a cluster-stack. This name is restricted to a max of 16  characters.  Additionally,  the
              o2cb cluster stack allows only alpha-numeric characters.

       --global-heartbeat
              Enable  the global heartbeat mode of the o2cb cluster stack. This option is not required if the o2cb cluster stack with global heartbeat is online as mkfs.ocfs2 will detect
              the active stack. However, if the cluster stack is not up, then this option is required alongwith cluster-stack and cluster-name.  For more, refer to o2cb(7).

       --discard
              Attempt to discard blocks at mkfs time (discarding blocks initially is useful on solid state devices and sparse / thin-provisioned storage). When the device advertises that
              discard  also zeroes data (any subsequent read after the discard and before write returns zero), then mark all not-yet-zeroed blocks as zeroed. This significantly speeds up
              filesystem initialization. This is set as default.

       --nodiscard
              Do not attempt to discard blocks at mkfs time.

       --no-backup-super
              This option is deprecated, please use --fs-features=nobackup-super instead.

       -n, --dry-run
              Display the heuristically determined values without overwriting the existing file system.

       -q, --quiet
              Quiet mode.

       -U uuid
              Specify a custom UUID in the plain (2A4D1C581FAA42A1A41D26EFC90C1315) or traditional (2a4d1c58-1faa-42a1-a41d-26efc90c1315) format. This option in not  recommended  because
              the file system uses the UUID to uniquely identify a file system. If more than one file system were to have the same UUID, one is very likely to encounter erratic behavior,
              if not, outright file system corruption.

       -v, --verbose
              Verbose mode.

       -V, --version
              Print version and exit.

       blocks-count
              Usually mkfs.ocfs2 automatically determines the size of the given device and creates a file system that uses all of the available space on the device.  This optional  argu‐
              ment specifies that the file system should only consume the given number of file system blocks (see -b) on the device.

FEATURE COMPATIBILITY
       This  section  lists  the  file  system features that have been added to the OCFS2 file system and the version that it first appeared in. The table below lists the versions of the
       mainline Linux kernel and ocfs2-tools. Users should use this information to enable only those features that are available in the file system that they are using.  Before  enabling
       new features, users are advised to review to the section titled feature values.

                                                                      ┌─────────────────┬────────────────┬─────────────────┐
                                                                      │Feature          │ Kernel Version │ Tools Version   │
                                                                      ├─────────────────┼────────────────┼─────────────────┤
                                                                      │local            │  Linux 2.6.20  │ ocfs2-tools 1.2 │
                                                                      ├─────────────────┼────────────────┼─────────────────┤
                                                                      │sparse           │  Linux 2.6.22  │ ocfs2-tools 1.4 │
                                                                      ├─────────────────┼────────────────┼─────────────────┤
                                                                      │unwritten        │  Linux 2.6.23  │ ocfs2-tools 1.4 │
                                                                      ├─────────────────┼────────────────┼─────────────────┤
                                                                      │inline-data      │  Linux 2.6.24  │ ocfs2-tools 1.4 │
                                                                      ├─────────────────┼────────────────┼─────────────────┤
                                                                      │extended-slotmap │  Linux 2.6.27  │ ocfs2-tools 1.6 │
                                                                      ├─────────────────┼────────────────┼─────────────────┤
                                                                      │metaecc          │  Linux 2.6.29  │ ocfs2-tools 1.6 │
                                                                      ├─────────────────┼────────────────┼─────────────────┤
                                                                      │grpquota         │  Linux 2.6.29  │ ocfs2-tools 1.6 │
                                                                      ├─────────────────┼────────────────┼─────────────────┤
                                                                      │usrquota         │  Linux 2.6.29  │ ocfs2-tools 1.6 │
                                                                      ├─────────────────┼────────────────┼─────────────────┤
                                                                      │xattr            │  Linux 2.6.29  │ ocfs2-tools 1.6 │
                                                                      ├─────────────────┼────────────────┼─────────────────┤
                                                                      │indexed-dirs     │  Linux 2.6.30  │ ocfs2-tools 1.6 │
                                                                      ├─────────────────┼────────────────┼─────────────────┤
                                                                      │refcount         │  Linux 2.6.32  │ ocfs2-tools 1.6 │
                                                                      ├─────────────────┼────────────────┼─────────────────┤
                                                                      │discontig-bg     │  Linux 2.6.35  │ ocfs2-tools 1.6 │
                                                                      ├─────────────────┼────────────────┼─────────────────┤
                                                                      │clusterinfo      │  Linux 2.6.37  │ ocfs2-tools 1.8 │
                                                                      └─────────────────┴────────────────┴─────────────────┘

       Users can query the features enabled in the file system as follows:

       # tunefs.ocfs2 -Q "Label: %V\nFeatures: %H %O\n" /dev/sdg1
       Label: apache_files_10
       Features: sparse inline-data unwritten

FEATURE VALUES
       This  section  lists the hex values that are associated with the file system features.  This information is useful when debugging mount failures that are due to feature incompati‐
       bility. When a user attempts to mount an OCFS2 volume that has features enabled that are not supported by the running file system software, it will fail with an error like:

       ERROR: couldn't mount because of unsupported optional features (200).

       By referring to the table below, it becomes apparent that the user attempted to mount a volume with the xattr (extended attributes) feature enabled with a version of the file sys‐
       tem software that did not support it. At this stage, the user has the option of either upgrading the file system software, or, disabling that on-disk feature using tunefs.ocfs2.

       Some  features allow the file system to be mounted with an older version of the software provided the mount is read-only. If a user attempts to mount such a volume in a read-write
       mode, it will fail with an error like:

       ERROR: couldn't mount RDWR because of unsupported optional features (1).

       This error indicates that the volume had the unwritten RO compat feature enabled.  This volume can be mounted by an older file system software only in the read-only mode.  In this
       case, the user has the option of either mounting the volume with the ro mount option, or, disabling that on-disk feature using tunefs.ocfs2.

                                                                           ┌─────────────────┬───────────┬───────────┐
                                                                           │Feature          │ Category  │ Hex value │
                                                                           ├─────────────────┼───────────┼───────────┤
                                                                           │local            │ Incompat  │     8     │
                                                                           ├─────────────────┼───────────┼───────────┤
                                                                           │sparse           │ Incompat  │    10     │
                                                                           ├─────────────────┼───────────┼───────────┤
                                                                           │inline-data      │ Incompat  │    40     │
                                                                           ├─────────────────┼───────────┼───────────┤
                                                                           │extended-slotmap │ Incompat  │    100    │
                                                                           ├─────────────────┼───────────┼───────────┤
                                                                           │xattr            │ Incompat  │    200    │
                                                                           ├─────────────────┼───────────┼───────────┤
                                                                           │indexed-dirs     │ Incompat  │    400    │
                                                                           ├─────────────────┼───────────┼───────────┤
                                                                           │metaecc          │ Incompat  │    800    │
                                                                           ├─────────────────┼───────────┼───────────┤
                                                                           │refcount         │ Incompat  │   1000    │
                                                                           ├─────────────────┼───────────┼───────────┤
                                                                           │discontig-bg     │ Incompat  │   2000    │
                                                                           ├─────────────────┼───────────┼───────────┤
                                                                           │clusterinfo      │ Incompat  │   4000    │
                                                                           ├─────────────────┼───────────┼───────────┤
                                                                           │unwritten        │ RO Compat │     1     │
                                                                           ├─────────────────┼───────────┼───────────┤
                                                                           │usrquota         │ RO Compat │     2     │
                                                                           ├─────────────────┼───────────┼───────────┤
                                                                           │grpquota         │ RO Compat │     4     │
                                                                           └─────────────────┴───────────┴───────────┘

SEE ALSO
       debugfs.ocfs2(8) fsck.ocfs2(8) mount.ocfs2(8) mounted.ocfs2(8) o2cb(7) o2cluster(8) o2image(8) o2info(1) tunefs.ocfs2(8)

AUTHORS
       Oracle Corporation

COPYRIGHT
       Copyright © 2004, 2012 Oracle. All rights reserved.

Version 1.8.7                                                                          January 2012                                                                          mkfs.ocfs2(8)
