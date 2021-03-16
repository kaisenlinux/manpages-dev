zpool(8)                                                           System Administration Commands                                                           zpool(8)

NAME
       zpool - configures ZFS storage pools

SYNOPSIS
       zpool [-?]

       zpool add [-fn] [-o property=value] pool vdev ...

       zpool attach [-f] [-o property=value] pool device new_device

       zpool clear [-F [-n]] pool [device]

       zpool create [-fn] [-o property=value] ... [-O file-system-property=value]
            ... [-m mountpoint] [-R root] pool vdev ...

       zpool destroy [-f] pool

       zpool detach pool device

       zpool export [-f] pool ...

       zpool get "all" | property[,...] pool ...

       zpool history [-il] [pool] ...

       zpool import [-d dir] [-D]

       zpool import [-o mntopts] [-o property=value] ... [-d dir | -c cachefile]
            [-D] [-f] [-R root] [-F [-n]] -a

       zpool import [-o mntopts] [-o property=value] ... [-d dir | -c cachefile]
            [-D] [-f] [-R root] [-F [-n]] pool |id [newpool]

       zpool iostat [-T u | d ] [-v] [pool] ... [interval[count]]

       zpool list [-H] [-o property[,...]] [pool] ...

       zpool offline [-t] pool device ...

       zpool online pool device ...

       zpool remove pool device ...

       zpool replace [-f] pool device [new_device]

       zpool scrub [-s] pool ...

       zpool set property=value pool

       zpool split [-R altroot] [-n] [-o mntopts] [-o property=value] pool
            newpool [device ...]

       zpool status [-xv] [pool] ...

       zpool upgrade

       zpool upgrade -v

       zpool upgrade [-V version] -a | pool ...

DESCRIPTION
       The  zpool  command  configures  ZFS  storage  pools.  A  storage pool is a collection of devices that provides physical storage and data replication for ZFS
       datasets.

       All datasets within a storage pool share the same space. See zfs(1M) for information on managing datasets.

   Virtual Devices (vdevs)
       A "virtual device" describes a single device or a collection of devices organized according to certain performance and fault characteristics.  The  following
       virtual devices are supported:

       disk

           A  block  device, typically located under /dev/dsk. ZFS can use individual slices or partitions, though the recommended mode of operation is to use whole
           disks. A disk can be specified by a full path, or it can be a shorthand name (the relative portion of the path under "/dev/dsk"). A  whole  disk  can  be
           specified  by omitting the slice or partition designation. For example, "c0t0d0" is equivalent to "/dev/dsk/c0t0d0s2". When given a whole disk, ZFS auto‐
           matically labels the disk, if necessary.

       file

           A regular file. The use of files as a backing store is strongly discouraged. It is designed primarily for experimental purposes, as the  fault  tolerance
           of a file is only as good as the file system of which it is a part. A file must be specified by a full path.

       mirror

           A mirror of two or more devices. Data is replicated in an identical fashion across all components of a mirror. A mirror with N disks of size X can hold X
           bytes and can withstand (N-1) devices failing before data integrity is compromised.

       raidz
       raidz1
       raidz2
       raidz3

           A variation on RAID-5 that allows for better distribution of parity and eliminates the "RAID-5 write hole" (in which data and parity become  inconsistent
           after a power loss). Data and parity is striped across all disks within a raidz group.

           A  raidz  group can have single-, double- , or triple parity, meaning that the raidz group can sustain one, two, or three failures, respectively, without
           losing any data. The raidz1 vdev type specifies a single-parity raidz group; the raidz2 vdev type specifies a double-parity raidz group; and  the  raidz3
           vdev type specifies a triple-parity raidz group. The raidz vdev type is an alias for raidz1.

           A raidz group with N disks of size X with P parity disks can hold approximately (N-P)*X bytes and can withstand P device(s) failing before data integrity
           is compromised. The minimum number of devices in a raidz group is one more than the number of parity disks. The recommended number is between 3 and 9  to
           help increase performance.

       spare

           A special pseudo-vdev which keeps track of available hot spares for a pool. For more information, see the "Hot Spares" section.

       log

           A  separate-intent log device. If more than one log device is specified, then writes are load-balanced between devices. Log devices can be mirrored. How‐
           ever, raidz vdev types are not supported for the intent log. For more information, see the "Intent Log" section.

       cache

           A device used to cache storage pool data. A cache device cannot be configured as a mirror or raidz group. For more information, see the  "Cache  Devices"
           section.

       Virtual devices cannot be nested, so a mirror or raidz virtual device can only contain files or disks. Mirrors of mirrors (or other combinations) are not al‐
       lowed.

       A pool can have any number of virtual devices at the top of the configuration (known as "root vdevs"). Data is dynamically distributed across  all  top-level
       devices to balance data among devices. As new virtual devices are added, ZFS automatically places data on the newly available devices.

       Virtual  devices  are specified one at a time on the command line, separated by whitespace. The keywords "mirror" and "raidz" are used to distinguish where a
       group ends and another begins. For example, the following creates two root vdevs, each a mirror of two disks:

         # zpool create mypool mirror c0t0d0 c0t1d0 mirror c1t0d0 c1t1d0

   Device Failure and Recovery
       ZFS supports a rich set of mechanisms for handling device failure and data corruption. All metadata and data is checksummed, and  ZFS  automatically  repairs
       bad data from a good copy when corruption is detected.

       In order to take advantage of these features, a pool must make use of some form of redundancy, using either mirrored or raidz groups. While ZFS supports run‐
       ning in a non-redundant configuration, where each root vdev is simply a disk or file, this is strongly discouraged. A single case of bit corruption can  ren‐
       der some or all of your data unavailable.

       A  pool's health status is described by one of three states: online, degraded, or faulted. An online pool has all devices operating normally. A degraded pool
       is one in which one or more devices have failed, but the data is still available due to a redundant configuration. A faulted pool has corrupted metadata,  or
       one or more faulted devices, and insufficient replicas to continue functioning.

       The  health of the top-level vdev, such as mirror or raidz device, is potentially impacted by the state of its associated vdevs, or component devices. A top-
       level vdev or component device is in one of the following states:

       DEGRADED

           One or more top-level vdevs is in the degraded state because one or more component devices are offline. Sufficient replicas exist to  continue  function‐
           ing.

           One  or  more component devices is in the degraded or faulted state, but sufficient replicas exist to continue functioning. The underlying conditions are
           as follows:

               o      The number of checksum errors exceeds acceptable levels and the device is degraded as an indication that something may be wrong. ZFS continues
                      to use the device as necessary.

               o      The  number of I/O errors exceeds acceptable levels. The device could not be marked as faulted because there are insufficient replicas to con‐
                      tinue functioning.

       FAULTED

           One or more top-level vdevs is in the faulted state because one or more component devices are offline. Insufficient replicas exist to continue  function‐
           ing.

           One or more component devices is in the faulted state, and insufficient replicas exist to continue functioning. The underlying conditions are as follows:

               o      The device could be opened, but the contents did not match expected values.

               o      The number of I/O errors exceeds acceptable levels and the device is faulted to prevent further use of the device.

       OFFLINE

           The device was explicitly taken offline by the "zpool offline" command.

       ONLINE

           The device is online and functioning.

       REMOVED

           The device was physically removed while the system was running. Device removal detection is hardware-dependent and may not be supported on all platforms.

       UNAVAIL

           The device could not be opened. If a pool is imported when a device was unavailable, then the device will be identified by a unique identifier instead of
           its path since the path was never correct in the first place.

       If a device is removed and later re-attached to the system, ZFS attempts to put the device online automatically. Device attach detection  is  hardware-depen‐
       dent and might not be supported on all platforms.

   Hot Spares
       ZFS allows devices to be associated with pools as "hot spares". These devices are not actively used in the pool, but when an active device fails, it is auto‐
       matically replaced by a hot spare. To create a pool with hot spares, specify a "spare" vdev with any number of devices. For example,

         # zpool create pool mirror c0d0 c1d0 spare c2d0 c3d0

       Spares can be shared across multiple pools, and can be added with the "zpool add" command and removed with the "zpool remove" command. Once a spare  replace‐
       ment  is  initiated,  a new "spare" vdev is created within the configuration that will remain there until the original device is replaced. At this point, the
       hot spare becomes available again if another device fails.

       If a pool has a shared spare that is currently being used, the pool can not be exported since other pools may use this shared spare, which may lead to poten‐
       tial data corruption.

       An  in-progress  spare  replacement  can  be cancelled by detaching the hot spare. If the original faulted device is detached, then the hot spare assumes its
       place in the configuration, and is removed from the spare list of all active pools.

       Spares cannot replace log devices.

   Intent Log
       The ZFS Intent Log (ZIL) satisfies POSIX requirements for synchronous transactions. For instance, databases often require their transactions to be on  stable
       storage  devices  when  returning from a system call. NFS and other applications can also use fsync() to ensure data stability. By default, the intent log is
       allocated from blocks within the main pool. However, it might be possible to get better performance using separate intent log devices such as NVRAM or a ded‐
       icated disk. For example:

         # zpool create pool c0d0 c1d0 log c2d0

       Multiple log devices can also be specified, and they can be mirrored. See the EXAMPLES section for an example of mirroring multiple log devices.

       Log devices can be added, replaced, attached, detached, and imported and exported as part of the larger pool. Mirrored log devices can be removed by specify‐
       ing the top-level mirror for the log.

   Cache Devices
       Devices can be added to a storage pool as "cache devices." These devices provide an additional layer of caching between main memory and disk. For  read-heavy
       workloads,  where  the  working set size is much larger than what can be cached in main memory, using cache devices allow much more of this working set to be
       served from low latency media. Using cache devices provides the greatest performance improvement for random read-workloads of mostly static content.

       To create a pool with cache devices, specify a "cache" vdev with any number of devices. For example:

         # zpool create pool c0d0 c1d0 cache c2d0 c3d0

       Cache devices cannot be mirrored or part of a raidz configuration. If a read error is encountered on a cache device, that read I/O is reissued to the  origi‐
       nal storage pool device, which might be part of a mirrored or raidz configuration.

       The content of the cache devices is considered volatile, as is the case with other system caches.

   Processes
       Each  imported pool has an associated process, named zpool-poolname. The threads in this process are the pool's I/O processing threads, which handle the com‐
       pression, checksumming, and other tasks for all I/O associated with the pool. This process exists to provides visibility into the CPU utilization of the sys‐
       tem's storage pools. The existence of this process is an unstable interface.

   Properties
       Each  pool  has  several properties associated with it. Some properties are read-only statistics while others are configurable and change the behavior of the
       pool. The following are read-only properties:

       alloc

           Amount of storage space within the pool that has been physically allocated.

       capacity

           Percentage of pool space used. This property can also be referred to by its shortened column name, "cap".

       dedupratio

           The deduplication ratio specified for a pool, expressed  as a multiplier. Deduplication can be turned on by entering the command:

             # zfs set dedup=on dataset

           The default value is off.

           dedupratio is expressed as a single decimal number. For example, a dedupratio value of 1.76 indicates that 1.76 units of data were stored but only 1 unit
           of disk space was actually consumed.

       free

           Number of blocks within the pool that are not allocated.

       guid

           A unique identifier for the pool.

       health

           The current health of the pool. Health can be "ONLINE", "DEGRADED", "FAULTED", " OFFLINE", "REMOVED", or "UNAVAIL".

       size

           Total size of the storage pool.

       These  space  usage properties report actual physical space available to the storage pool. The physical space can be different from the total amount of space
       that any contained datasets can actually use. The amount of space used in a raidz configuration depends on the characteristics of the data being written.  In
       addition,  ZFS reserves some space for internal accounting that the zfs(1M) command takes into account, but the zpool command does not. For non-full pools of
       a reasonable size, these effects should be invisible. For small pools, or pools that are close to being completely full, these discrepancies may become  more
       noticeable.  The following property can be set at creation time:

       ashift

           Pool sector size exponent, to the power of 2 (internally referred to as "ashift"). I/O operations will be aligned to the specified size boundaries. Addi‐
           tionally, the minimum (disk) write size will be set to the specified size, so this represents a space vs. performance trade-off.  The  typical  case  for
           setting  this  property  is  when performance is important and the underlying disks use 4KiB sectors but report 512B sectors to the OS (for compatibility
           reasons); in that case, set ashift=12 (which is 1<<12 = 4096).  Since most large disks have had 4K sectors since 2011, ZFS defaults to ashift=12 for  all
           disks larger than 512 GB.

           For  optimal  performance,  the pool sector size should be greater than or equal to the sector size of the underlying disks. Since the property cannot be
           changed after pool creation, if in a given pool, you ever want to use drives that report 4KiB sectors, you must set ashift=12 at pool creation time.

       The following property can be set at creation time and import time:

       altroot

           Alternate root directory. If set, this directory is prepended to any mount points within the pool. This can be used when examining an unknown pool  where
           the  mount points cannot be trusted, or in an alternate boot environment, where the typical paths are not valid. altroot is not a persistent property. It
           is valid only while the system is up. Setting altroot defaults to using cachefile=none, though this may be overridden   using an explicit setting.

       The following properties can be set at creation time and import time, and later changed with the zpool set command:

       autoexpand=on | off

           Controls automatic pool expansion when the underlying LUN is grown. If set to on, the pool will be resized according to the size of the expanded  device.
           If the device is part of a mirror or raidz then all devices within that mirror/raidz group must be expanded before the new space is made available to the
           pool. The default behavior is off. This property can also be referred to by its shortened column name, expand.

       autoreplace=on | off

           Controls automatic device replacement. If set to "off", device replacement must be initiated by the administrator by using the "zpool  replace"  command.
           If  set to "on", any new device, found in the same physical location as a device that previously belonged to the pool, is automatically formatted and re‐
           placed. The default behavior is "off". This property can also be referred to by its shortened column name, "replace".

       bootfs=pool/dataset

           Identifies the default bootable dataset for the root pool. This property is expected to be set mainly by the installation and upgrade programs.

       cachefile=path | none

           Controls the location of where the pool configuration is cached. Discovering all pools on system startup requires a cached copy of the configuration data
           that  is stored on the root file system. All pools in this cache are automatically imported when the system boots. Some environments, such as install and
           clustering, need to cache this information in a different location so that pools are not automatically imported. Setting this property  caches  the  pool
           configuration  in a different location that can later be imported with "zpool import -c". Setting it to the special value "none" creates a temporary pool
           that is never cached, and the special value '' (empty string) uses the default location.

           Multiple pools can share the same cache file. Because the kernel destroys and recreates this file when pools are added and removed, care should be  taken
           when attempting to access this file. When the last pool using a cachefile is exported or destroyed, the file is removed.

       delegation=on | off

           Controls whether a non-privileged user is granted access based on the dataset permissions defined on the dataset. See zfs(1M) for more information on ZFS
           delegated administration.

       failmode=wait | continue | panic

           Controls the system behavior in the event of catastrophic pool failure. This condition is typically a result of a loss of connectivity to the  underlying
           storage device(s) or a failure of all devices within the pool. The behavior of such an event is determined as follows:

           wait

               Blocks  all  I/O access to the pool until the device connectivity is recovered and the errors are cleared. A pool remains in the wait state until the
               device issue is resolved. This is the default behavior.

           continue

               Returns EIO to any new write I/O requests but allows reads to any of the remaining healthy devices. Any write requests that have yet to be  committed
               to disk would be blocked.

           panic

               Prints out a message to the console and generates a system crash dump.

       listsnaps=on | off

           Controls  whether  information  about  snapshots  associated  with this pool is output when "zfs list" is run without the -t option. The default value is
           "off".

       version=version

           The current on-disk version of the pool. This can be increased, but never decreased. The preferred method of updating pools is with the  "zpool  upgrade"
           command,  though  this  property can be used when a specific version is needed for backwards compatibility. This property can be any number between 1 and
           the current version reported by "zpool upgrade -v".

   Subcommands
       All subcommands that modify state are logged persistently to the pool in their original form.

       The zpool command provides subcommands to create and destroy storage pools, add capacity to storage pools, and provide information about the  storage  pools.
       The following subcommands are supported:

       zpool -?

           Displays a help message.

       zpool add [-fn]  [-o property=value] pool vdev ...

           Adds  the  specified  virtual devices to the given pool. The vdev specification is described in the "Virtual Devices" section. The behavior of the -f op‐
           tion, and the device checks performed are described in the "zpool create" subcommand.

           -f

               Forces use of vdevs, even if they appear in use or specify a conflicting replication level. Not all devices can be overridden in this manner.

           -n

               Displays the configuration that would be used without actually adding the vdevs. The actual pool creation can still fail due to  insufficient  privi‐
               leges or device sharing.

           -o property=value

               Sets  the  given pool properties. See the "Properties" section for a list of valid properties that can be set. The only property supported at the mo‐
               ment is "ashift".

           Do not add a disk that is currently configured as a quorum device to a zpool. After a disk is in the pool, that disk can then be configured as  a  quorum
           device.

       zpool attach [-f]  [-o property=value] pool device new_device

           Attaches  new_device  to an existing zpool device. The existing device cannot be part of a raidz configuration. If device is not currently part of a mir‐
           rored configuration, device automatically transforms into a two-way mirror of device and new_device. If device is part of  a  two-way  mirror,  attaching
           new_device creates a three-way mirror, and so on. In either case, new_device begins to resilver immediately.

           -f

               Forces use of new_device, even if its appears to be in use. Not all devices can be overridden in this manner.

           -o property=value

               Sets  the  given pool properties. See the "Properties" section for a list of valid properties that can be set. The only property supported at the mo‐
               ment is "ashift".

       zpool clear [-F [-n]] pool [device] ...

           Clears device errors in a pool. If no arguments are specified, all device errors within the pool are cleared. If one or more devices is  specified,  only
           those errors associated with the specified device or devices are cleared.

           -F

               Initiates  recovery mode for an unopenable pool. Attempts to discard the last few transactions in the pool to return it to an openable state. Not all
               damaged pools can be recovered by using this option. If successful, the data from the discarded transactions is irretrievably lost.

           -n

               Used in combination with the -F flag. Check whether discarding transactions would make the pool openable, but do not actually  discard  any  transac‐
               tions.

       zpool create [-fn] [-o property=value] ... [-O file-system-property=value] ... [-m mountpoint] [-R root] pool vdev ...

           Creates a new storage pool containing the virtual devices specified on the command line. The pool name must begin with a letter, and can only contain al‐
           phanumeric characters as well as underscore ("_"), dash ("-"), and period ("."). The pool names mirror, raidz, spare, and log are reserved, as are  names
           beginning with the pattern c[0-9]. The vdev specification is described in the "Virtual Devices" section.

           The command verifies that each device specified is accessible and not currently in use by another subsystem. There are some uses, such as being currently
           mounted, or specified as the dedicated dump device, that prevents a device from ever being used by ZFS. Other uses, such as having a preexisting UFS file
           system, can be overridden with the -f option.

           The  command  also checks that the replication strategy for the pool is consistent. An attempt to combine redundant and non-redundant storage in a single
           pool, or to mix disks and files, results in an error unless -f is specified. The use of differently sized devices within a single raidz or  mirror  group
           is also flagged as an error unless -f is specified.

           Unless  the  -R option is specified, the default mount point is "/pool". The mount point must not exist or must be empty, or else the root dataset cannot
           be mounted. This can be overridden with the -m option.

           -f

               Forces use of vdevs, even if they appear in use or specify a conflicting replication level. Not all devices can be overridden in this manner.

           -n

               Displays the configuration that would be used without actually creating the pool. The actual pool creation can still fail due to insufficient  privi‐
               leges or device sharing.

           -o property=value [-o property=value] ...

               Sets the given pool properties. See the "Properties" section for a list of valid properties that can be set.

           -O file-system-property=value
           [-O file-system-property=value] ...

               Sets  the  given  file  system properties in the root file system of the pool. See the "Properties" section of zfs(1M) for a list of valid properties
               that can be set.

           -R root

               Equivalent to "-o cachefile=none,altroot=root"

           -m mountpoint

               Sets the mount point for the root dataset. The default mount point is "/pool" or "altroot/pool" if altroot is specified. The mount point must  be  an
               absolute path, "legacy", or "none". For more information on dataset mount points, see zfs(1M).

       zpool destroy [-f] pool

           Destroys the given pool, freeing up any devices for other use. This command tries to unmount any active datasets before destroying the pool.

           -f

               Forces any active datasets contained within the pool to be unmounted.

       zpool detach pool device

           Detaches device from a mirror. The operation is refused if there are no other valid replicas of the data.

       zpool export [-f] pool ...

           Exports  the  given  pools  from  the system. All devices are marked as exported, but are still considered in use by other subsystems. The devices can be
           moved between systems (even those of different endianness) and imported as long as a sufficient number of devices are present.

           Before exporting the pool, all datasets within the pool are unmounted. A pool can not be exported if it has a shared spare that is currently being used.

           For pools to be portable, you must give the zpool command whole disks, not just slices, so that ZFS can label the disks with portable EFI labels.  Other‐
           wise, disk drivers on platforms of different endianness will not recognize the disks.

           -f

               Forcefully unmount all datasets, using the "unmount -f" command.

               This command will forcefully export the pool even if it has a shared spare that is currently being used. This may lead to potential data corruption.

       zpool get "all" | property[,...] pool ...

           Retrieves  the  given  list of properties (or all properties if "all" is used) for the specified storage pool(s). These properties are displayed with the
           following fields:

                    name          Name of storage pool
                     property      Property name
                     value         Property value
                     source        Property source, either 'default' or 'local'.

           See the "Properties" section for more information on the available pool properties.

       zpool history [-il] [pool] ...

           Displays the command history of the specified pools or all pools if no pool is specified.

           -i

               Displays internally logged ZFS events in addition to user initiated events.

           -l

               Displays log records in long format, which in addition to standard format includes, the user name, the hostname, and the zone in which the  operation
               was performed.

       zpool import [-d dir | -c cachefile] [-D]

           Lists  pools available to import. If the -d option is not specified, this command searches for devices in "/dev/dsk". The -d option can be specified mul‐
           tiple times, and all directories are searched. If the device appears to be part of an exported pool, this command displays a summary of the pool with the
           name  of the pool, a numeric identifier, as well as the vdev layout and current health of the device for each device or file. Destroyed pools, pools that
           were previously destroyed with the "zpool destroy" command, are not listed unless the -D option is specified.

           The numeric identifier is unique, and can be used instead of the pool name when multiple exported pools of the same name are available.

           -c cachefile

               Reads configuration from the given cachefile that was created with the "cachefile" pool property. This cachefile is used instead of searching for de‐
               vices.

           -d dir

               Searches for devices or files in dir. The -d option can be specified multiple times.

           -D

               Lists destroyed pools only.

       zpool import [-o mntopts] [ -o property=value] ... [-d dir | -c cachefile] [-D] [-f] [-R root] [-F [-n]] -a

           Imports all pools found in the search directories. Identical to the previous command, except that all pools with a sufficient number of devices available
           are imported. Destroyed pools, pools that were previously destroyed with the "zpool destroy" command, will not be imported unless the -D option is speci‐
           fied.

           -o mntopts

               Comma-separated  list  of  mount options to use when mounting datasets within the pool. See zfs(1M) for a description of dataset properties and mount
               options.

           -o property=value

               Sets the specified property on the imported pool. See the "Properties" section for more information on the available pool properties.

           -c cachefile

               Reads configuration from the given cachefile that was created with the "cachefile" pool property. This cachefile is used instead of searching for de‐
               vices.

           -d dir

               Searches for devices or files in dir. The -d option can be specified multiple times. This option is incompatible with the -c option.

           -D

               Imports destroyed pools only. The -f option is also required.

           -f

               Forces import, even if the pool appears to be potentially active.

           -F

               Recovery  mode  for a non-importable pool. Attempt to return the pool to an importable state by discarding the last few transactions. Not all damaged
               pools can be recovered by using this option. If successful, the data from the discarded transactions is irretrievably lost. This option is ignored if
               the pool is importable or already imported.

           -a

               Searches for and imports all pools found.

           -R root

               Sets the "cachefile" property to "none" and the "altroot" property to "root".

           -n

               Used  with  the -F recovery option. Determines whether a non-importable pool can be made importable again, but does not actually perform the pool re‐
               covery. For more details about pool recovery mode, see the -F option, above.

       zpool import [-o mntopts] [ -o property=value] ... [-d dir | -c cachefile] [-D] [-f] [-R root] [-F [-n]] pool | id [newpool]

           Imports a specific pool. A pool can be identified by its name or the numeric identifier. If newpool is specified, the pool is  imported  using  the  name
           newpool. Otherwise, it is imported with the same name as its exported name.

           If  a device is removed from a system without running "zpool export" first, the device appears as potentially active. It cannot be determined if this was
           a failed export, or whether the device is really in use from another host. To import a pool in this state, the -f option is required.

           -o mntopts

               Comma-separated list of mount options to use when mounting datasets within the pool. See zfs(1M) for a description of dataset  properties  and  mount
               options.

           -o property=value

               Sets the specified property on the imported pool. See the "Properties" section for more information on the available pool properties.

           -c cachefile

               Reads configuration from the given cachefile that was created with the "cachefile" pool property. This cachefile is used instead of searching for de‐
               vices.

           -d dir

               Searches for devices or files in dir. The -d option can be specified multiple times. This option is incompatible with the -c option.

           -D

               Imports destroyed pool. The -f option is also required.

           -f

               Forces import, even if the pool appears to be potentially active.

           -F

               Recovery mode for a non-importable pool. Attempt to return the pool to an importable state by discarding the last few transactions. Not  all  damaged
               pools can be recovered by using this option. If successful, the data from the discarded transactions is irretrievably lost. This option is ignored if
               the pool is importable or already imported.

           -R root

               Sets the "cachefile" property to "none" and the "altroot" property to "root".

           -n

               Used with the -F recovery option. Determines whether a non-importable pool can be made importable again, but does not actually perform the  pool  re‐
               covery. For more details about pool recovery mode, see the -F option, above.

       zpool iostat [-T u | d] [-v] [pool] ... [interval[count]]

           Displays  I/O  statistics  for  the given pools. When given an interval, the statistics are printed every interval seconds until Ctrl-C is pressed. If no
           pools are specified, statistics for every pool in the system is shown. If count is specified, the command exits after count reports are printed.

           -T u | d

               Display a time stamp.

               Specify u for a printed representation of the internal representation of time. See time(2). Specify d for standard date format. See date(1).

           -v

               Verbose statistics. Reports usage statistics for individual vdevs within the pool, in addition to the pool-wide statistics.

       zpool list [-H] [-o props[,...]] [pool] ...

           Lists the given pools along with a health status and space usage. When given no arguments, all pools in the system are listed.

           -H

               Scripted mode. Do not display headers, and separate fields by a single tab instead of arbitrary space.

           -o props

               Comma-separated list of properties to display. See the "Properties" section for a list of valid properties. The default list  is  name,  size,  allo‐
               cated, free, capacity, health, altroot.

       zpool offline [-t] pool device ...

           Takes the specified physical device offline. While the device is offline, no attempt is made to read or write to the device.

           This command is not applicable to spares or cache devices.

           -t

               Temporary. Upon reboot, the specified physical device reverts to its previous state.

       zpool online [-e] pool device...

           Brings the specified physical device online.

           This command is not applicable to spares or cache devices.

           -e

               Expand  the device to use all available space. If the device is part of a mirror or raidz then all devices must be expanded before the new space will
               become available to the pool.

       zpool remove pool device ...

           Removes the specified device from the pool. This command currently only supports removing hot spares, cache, and log devices. A mirrored log  device  can
           be  removed  by specifying the top-level mirror for the log. Non-log devices that are part of a mirrored configuration can be removed using the zpool de‐
           tach command. Non-redundant and raidz devices cannot be removed from a pool.

       zpool replace [-f] pool old_device [new_device]

           Replaces old_device with new_device. This is equivalent to attaching new_device, waiting for it to resilver, and then detaching old_device.

           The size of new_device must be greater than or equal to the minimum size of all the devices in a mirror or raidz configuration.

           new_device is required if the pool is not redundant. If new_device is not specified, it defaults to old_device. This form of replacement is useful  after
           an  existing  disk has failed and has been physically replaced. In this case, the new disk may have the same /dev/dsk path as the old device, even though
           it is actually a different disk. ZFS recognizes this.

           -f

               Forces use of new_device, even if its appears to be in use. Not all devices can be overridden in this manner.

       zpool scrub [-s] pool ...

           Begins a scrub. The scrub examines all data in the specified pools to verify that it checksums correctly. For replicated (mirror or raidz)  devices,  ZFS
           automatically  repairs any damage discovered during the scrub. The "zpool status" command reports the progress of the scrub and summarizes the results of
           the scrub upon completion.

           Scrubbing and resilvering are very similar operations. The difference is that resilvering only examines data that ZFS knows to be out of date (for  exam‐
           ple, when attaching a new device to a mirror or replacing an existing device), whereas scrubbing examines all data to discover silent errors due to hard‐
           ware faults or disk failure.

           Because scrubbing and resilvering are I/O-intensive operations, ZFS only allows one at a time. If a scrub is already in progress, the "zpool scrub"  com‐
           mand terminates it and starts a new scrub. If a resilver is in progress, ZFS does not allow a scrub to be started until the resilver completes.

           -s

               Stop scrubbing.

       zpool set property=value pool

           Sets the given property on the specified pool. See the "Properties" section for more information on what properties can be set and acceptable values.

       zpool split [-R altroot] [-n] [-o mntopts] [-o property=value] pool newpool [device ...]

           Splits off one disk from each mirrored top-level vdev in a pool and creates a new pool from the split-off disks. The original pool must be made up of one
           or more mirrors and must not be in the process of resilvering. The split subcommand chooses the last device in each mirror vdev unless  overridden  by  a
           device specification on the command line.

           When using a device argument, split includes the specified device(s) in a new pool and, should any devices remain unspecified, assigns the last device in
           each mirror vdev to that pool, as it does normally. If you are uncertain about the outcome of a split command, use the -n ("dry-run")  option  to  ensure
           your command will have the effect you intend.

           -R altroot

               Automatically import the newly created pool after splitting, using the specified altroot parameter for the new pool's alternate root. See the altroot
               description in the "Properties" section, above.

           -n

               Displays the configuration that would be created without actually splitting the pool. The actual pool split could  still  fail  due  to  insufficient
               privileges or device status.

           -o mntopts

               Comma-separated  list  of  mount options to use when mounting datasets within the pool. See zfs(1M) for a description of dataset properties and mount
               options. Valid only in conjunction with the -R option.

           -o property=value

               Sets the specified property on the new pool. See the "Properties" section, above, for more information on the available pool properties.

       zpool status [-xv] [pool] ...

           Displays the detailed health status for the given pools. If no pool is specified, then the status of each pool in the system is displayed. For  more  in‐
           formation on pool and device health, see the "Device Failure and Recovery" section.

           If a scrub or resilver is in progress, this command reports the percentage done and the estimated time to completion. Both of these are only approximate,
           because the amount of data in the pool and the other workloads on the system can change.

           -x

               Only display status for pools that are exhibiting errors or are otherwise unavailable.

           -v

               Displays verbose data error information, printing out a complete list of all data errors since the last complete pool scrub.

       zpool upgrade

           Displays all pools formatted using a different ZFS on-disk version. Older versions can continue to be used, but some features may not be available. These
           pools  can be upgraded using "zpool upgrade -a". Pools that are formatted with a more recent version are also displayed, although these pools will be in‐
           accessible on the system.

       zpool upgrade -v

           Displays ZFS versions supported by the current software. The current ZFS versions and all previous supported versions are displayed, along with an expla‐
           nation of the features provided with each version.

       zpool upgrade [-V version] -a | pool ...

           Upgrades  the given pool to the latest on-disk version. Once this is done, the pool will no longer be accessible on systems running older versions of the
           software.

           -a

               Upgrades all pools.

           -V version

               Upgrade to the specified version. If the -V flag is not specified, the pool is upgraded to the most recent version. This option can only be  used  to
               increase the version number, and only up to the most recent version supported by this software.

EXAMPLES
       Example 1 Creating a RAID-Z Storage Pool

       The following command creates a pool with a single raidz root vdev that consists of six disks.

         # zpool create tank raidz c0t0d0 c0t1d0 c0t2d0 c0t3d0 c0t4d0 c0t5d0

       Example 2 Creating a Mirrored Storage Pool

       The following command creates a pool with two mirrors, where each mirror contains two disks.

         # zpool create tank mirror c0t0d0 c0t1d0 mirror c0t2d0 c0t3d0

       Example 3 Creating a ZFS Storage Pool by Using Slices

       The following command creates an unmirrored pool using two disk slices.

         # zpool create tank /dev/dsk/c0t0d0s1 c0t1d0s4

       Example 4 Creating a ZFS Storage Pool by Using Files

       The following command creates an unmirrored pool using files. While not recommended, a pool based on files can be useful for experimental purposes.

         # zpool create tank /path/to/file/a /path/to/file/b

       Example 5 Adding a Mirror to a ZFS Storage Pool

       The  following  command  adds two mirrored disks to the pool "tank", assuming the pool is already made up of two-way mirrors. The additional space is immedi‐
       ately available to any datasets within the pool.

         # zpool add tank mirror c1t0d0 c1t1d0

       Example 6 Listing Available ZFS Storage Pools

       The following command lists all available pools on the system.

         # zpool list
         NAME    SIZE  ALLOC   FREE    CAP  DEDUP  HEALTH  ALTROOT
         pool    136G   109M   136G     0%  3.00x  ONLINE  -
         rpool  67.5G  12.6G  54.9G    18%  1.01x  ONLINE  -

       Example 7 Listing All Properties for a Pool

       The following command lists all the properties for a pool.

         % zpool get all pool
         NAME  PROPERTY       VALUE       SOURCE
         pool  size           136G        -
         pool  capacity       0%          -
         pool  altroot        -           default
         pool  health         ONLINE      -
         pool  guid           15697759092019394988  default
         pool  version        21          default
         pool  bootfs         -           default
         pool  delegation     on          default
         pool  autoreplace    off         default
         pool  cachefile      -           default
         pool  failmode       wait        default
         pool  listsnapshots  off         default
         pool  autoexpand     off         default
         pool  dedupratio     3.00x       -
         pool  free           136G        -
         pool  allocated      109M        -

       Example 8 Destroying a ZFS Storage Pool

       The following command destroys the pool "tank" and any datasets contained within.

         # zpool destroy -f tank

       Example 9 Exporting a ZFS Storage Pool

       The following command exports the devices in pool tank so that they can be relocated or later imported.

         # zpool export tank

       Example 10 Importing a ZFS Storage Pool

       The following command displays available pools, and then imports the pool "tank" for use on the system.

       The results from this command are similar to the following:

         # zpool import
           pool: tank
             id: 7678868315469843843
          state: ONLINE
         action: The pool can be imported using its name or numeric identifier.
         config:

                 tank        ONLINE
                   mirror-0  ONLINE
                     c1t2d0  ONLINE
                     c1t3d0  ONLINE

         # zpool import tank

       Example 11 Upgrading All ZFS Storage Pools to the Current Version

       The following command upgrades all ZFS Storage pools to the current version of the software.

         # zpool upgrade -a
         This system is currently running ZFS pool version 19.

         All pools are formatted using this version.

       Example 12 Managing Hot Spares

       The following command creates a new pool with an available hot spare:

         # zpool create tank mirror c0t0d0 c0t1d0 spare c0t2d0

       If one of the disks were to fail, the pool would be reduced to the degraded state. The failed device can be replaced using the following command:

         # zpool replace tank c0t0d0 c0t3d0

       Once the data has been resilvered, the spare is automatically removed and is made available should another device fails. The hot spare can be permanently re‐
       moved from the pool using the following command:

         # zpool remove tank c0t2d0

       Example 13 Creating a ZFS Pool with Mirrored Separate Intent Logs

       The following command creates a ZFS storage pool consisting of two, two-way mirrors and mirrored log devices:

         # zpool create pool mirror c0d0 c1d0 mirror c2d0 c3d0 log mirror \
            c4d0 c5d0

       Example 14 Adding Cache Devices to a ZFS Pool

       The following command adds two disks for use as cache devices to a ZFS storage pool:

         # zpool add pool cache c2d0 c3d0

       Once  added, the cache devices gradually fill with content from main memory. Depending on the size of your cache devices, it could take over an hour for them
       to fill. Capacity and reads can be monitored using the iostat option as follows:

         # zpool iostat -v pool 5

       Example 15 Removing a Mirrored Log Device

       The following command removes the mirrored log device mirror-2.

       Given this configuration:

            pool: tank
           state: ONLINE
           scrub: none requested
         config:

                  NAME        STATE     READ WRITE CKSUM
                  tank        ONLINE       0     0     0
                    mirror-0  ONLINE       0     0     0
                      c6t0d0  ONLINE       0     0     0
                      c6t1d0  ONLINE       0     0     0
                    mirror-1  ONLINE       0     0     0
                      c6t2d0  ONLINE       0     0     0
                      c6t3d0  ONLINE       0     0     0
                  logs
                    mirror-2  ONLINE       0     0     0
                      c4t0d0  ONLINE       0     0     0
                      c4t1d0  ONLINE       0     0     0

       The command to remove the mirrored log mirror-2 is:

         # zpool remove tank mirror-2

       Example 16 Recovering a Faulted ZFS Pool

       If a pool is faulted but recoverable, a message indicating this state is provided by zpool status if the pool was cached (see cachefile above), or as part of
       the error output from a failed zpool import of the pool.

       Recover a cached pool with the zpool clear command:

         # zpool clear -F data
         Pool data returned to its state as of Tue Sep 08 13:23:35 2009.
         Discarded approximately 29 seconds of transactions.

       If the pool configuration was not cached, use zpool import with the recovery mode flag:

         # zpool import -F data
         Pool data returned to its state as of Tue Sep 08 13:23:35 2009.
         Discarded approximately 29 seconds of transactions.

EXIT STATUS
       The following exit values are returned:

       0

           Successful completion.

       1

           An error occurred.

       2

           Invalid command line options were specified.

ATTRIBUTES
       See attributes(5) for descriptions of the following attributes:

       ┌─────────────────────────────┬─────────────────────────────┐
       │      ATTRIBUTE TYPE         │      ATTRIBUTE VALUE        │
       ├─────────────────────────────┼─────────────────────────────┤
       │Availability                 │SUNWzfsu                     │
       ├─────────────────────────────┼─────────────────────────────┤
       │Interface Stability          │Committed                    │
       └─────────────────────────────┴─────────────────────────────┘

SEE ALSO
       zfs(1M), attributes(5)

SunOS 5.11                                                                   4 Jan 2010                                                                     zpool(8)
