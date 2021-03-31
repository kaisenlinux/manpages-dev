IOZONE(1)                                                                           General Commands Manual                                                                           IOZONE(1)

NAME
       Iozone - Filesystem Benchmark

SYNOPSIS
       Iozone [-a|-A] [-s filesize_Kb] [-r record_size_Kb] [-f [path]filename] [-i test] [-E] [-p] [-m] [-M] [-t children] [-h] [-o] [-l min_number_procs] [-u max_number_procs] [-v] [-R] [-x]
       [-d microseconds] [-F path1 path2...]  [-V pattern ] [-j stride] [-T] [-C] [-B] [-D] [-G] [-I] [-H depth] [-k depth] [-U mount_point] [-S cache_size] [-O] [-L line_size] [-K] [-N] [-Q]
       [-P  start_cpu]  [-c] [-e] [-b Excel.xls] [-J milliseconds] [-X [path]filename] [-Y [path]filename] [-w] [-W] [-z] [-Z] [-n min_filesize_Kb] [-g max_filesize_Kb] [-y min_recordsize_Kb]
       [-q max_recordsize_Kb] [-+d] [-+u] [-+m client_filename] [-+n] [-+N] [-+p percent_read] [-+r] [-+t] [-+l] [-+L] [-+D] [-+A madvise_selector]  [-+h  hostname]  [-+T]  [-+w  Percent  de-
       dupable.]

DESCRIPTION
       Iozone  is  a  filesystem benchmark tool. The benchmark generates and measures a variety of file operations.  Iozone has been ported to many machines and runs under many operating sys‐
       tems.  This document will cover the many different types of operations that are tested as well as coverage of all of the command line options.

       Iozone is useful for determining a broad filesystem analysis of a vendor's computer platform. The benchmark tests file I/O performance for the following operations.

                 Read, write, re-read, re-write, read backwards, read strided, fread, fwrite, random read/write, pread/pwrite variants

       While computers are typically purchased with an application in mind it is also likely that over time the application mix will change. Many vendors have enhanced their operating systems
       to perform well for some frequently used applications. Although this accelerates the I/O for those few applications it is also likely that the system may not perform well for other ap‐
       plications that were not targeted by the operating system. An example of this type of enhancement is: Database. Many operating systems have tested and tuned the filesystem so it  works
       well with databases. While the database users are happy, the other users may not be so happy as the entire system may be giving all of the system resources to the database users at the
       expense of all other users. As time rolls on the system administrator may decide that a few more office automation tasks could be shifted to this machine. The load may now shift from a
       random reader application (database) to a sequential reader. The users may discover that the machine is very slow when running this new application and become dissatisfied with the de‐
       cision to purchase this platform. By using Iozone to get a broad filesystem performance coverage the buyer is much more likely to see any hot or cold spots and pick a platform and  op‐
       erating system that is more well balanced.

OPTIONS
       -a     Used to select full automatic mode. Produces output that covers all tested file operations for record sizes of 4k to 16M for file sizes of 64k to 512M.

       -A     This  version of automatic mode provides more coverage but consumes a bunch of time.  The -a option will automatically stop using transfer sizes less than 64k once the file size
              is 32M or larger. This saves time. The -A option tells Iozone that you are willing to wait and want dense coverage for small transfers even when the file  size  is  very  large.
              NOTE: This option is deprecated in Iozone version 3.61.  Use -az -i 0 -i 1 instead.

       -b filename
              Used to specify a filename that will be used for output of an Excel compatible file that contains the results.

       -B     Use  mmap()  files. This causes all of the temporary files being measured to be created and accessed with the mmap() interface. Some applications prefer to treat files as arrays
              of memory. These applications mmap() the file and then just access the array with loads and stores to perform file I/O.

       -c     Include close() in the timing calculations. This is useful only if you suspect that close() is broken in the operating system currently under test.  It can  be  useful  for  NFS
              Version 3 testing as well to help identify if the nfs3_commit is working well.

       -C     Show bytes transferred by each child in throughput testing. Useful if your operating system has any starvation problems in file I/O or in process management.

       -d #   Microsecond  delay  out  of barrier. During the throughput tests all threads or processes are forced to a barrier before beginning the test. Normally, all of the threads or pro‐
              cesses are released at the same moment. This option allows one to delay a specified time in microseconds between releasing each of the processes or threads.

       -D     Use msync(MS_ASYNC) on mmap files. This tells the operating system that all the data in the mmap space needs to be written to disk asynchronously.

       -e     Include flush (fsync,fflush) in the timing calculations

       -E     Used to select the extension tests. Only available on some platforms. Uses pread interfaces.

       -f filename
              Used to specify the filename for the temporary file under test. This is useful when the unmount option is used. When testing with unmount between tests it is necessary  for  the
              temporary file under test to be in a directory that can be unmounted. It is not possible to unmount the current working directory as the process Iozone is running in this direc‐
              tory.

       -F filename filename filename ?
              Specify each of the temporary file names to be used in the throughput testing. The number of names should be equal to the number of processes or threads that are specified.

       -g #   Set maximum file size (in Kbytes) for auto mode. One may also specify -g #k (size in Kbytes) or -g #m (size in Mbytes) or -g #g (size in Gbytes). See -n for minimum file size.

       -G     Use msync(MS_SYNC) on mmap files. This tells the operating system that all the data in the mmap space needs to be written to disk synchronously.

       -h     Displays help screen.

       -H #   Use POSIX async I/O with # async operations.  Iozone will use POSIX async I/O with a bcopy from the async buffers back into the applications buffer. Some versions of MSC NASTRAN
              perform I/O this way.  This technique is used by applications so that the async I/O may be performed in a library and requires no changes to the applications internal model.

       -i #   Used  to  specify  which tests to run. (0=write/rewrite, 1=read/re-read, 2=random-read/write, 3=Read-backwards, 4=Re-write-record, 5=stride-read, 6=fwrite/re-fwrite, 7=fread/Re-
              fread, 8=mixed workload, 9=pwrite/Re-pwrite, 10=pread/Re-pread, 11=pwritev/Re-pwritev, 12=preadv/Re-preadv).  One will always need to specify 0 so  that  any  of  the  following
              tests will have a file to measure.  -i # -i # -i # is also supported so that one may select more than one test.

       -I     Use DIRECT IO if possible for all file operations. Tells the filesystem that all operations to the file are to bypass the buffer cache and go directly to disk. (not available on
              all platforms)

       -j #   Set stride of file accesses to (# * record size). The stride read test will read records at this stride.

       -J #   Millisecond delay before each I/O operation. This simulates the cpu compute cycle of an application that precedes an I/O operation.  One may also use -X or  -Y  to  control  the
              compute cycle on a per I/O operation basis.

       -k #   Use  POSIX async I/O (no bcopy) with # async operations.  Iozone will use POSIX async I/O and will not perform any extra bcopys. The buffers used by Iozone will be handed to the
              async I/O system call directly.

       -K     Inject some random accesses in the testing.

       -l #   Set the lower limit on number of processes to run. When running throughput tests this option allows the user to specify the least number of processes or threads to  start.  This
              option should be used in conjunction with the -u option.

       -L #   Set processor cache line size to value (in bytes). Tells Iozone the processor cache line size.  This is used internally to help speed up the test.

       -m     Tells Iozone to use multiple buffers internally. Some applications read into a single buffer over and over. Others have an array of buffers. This option allows both types of ap‐
              plications to be simulated.  Iozone´s default behavior is to re-use internal buffers. This option allows one to override the default and to use multiple internal buffers.

       -M     Iozone will call uname() and will put the string in the output file.

       -n #   Set minimum file size (in Kbytes) for auto mode. One may also specify -n #k (size in Kbytes) or -n #m (size in Mbytes) or -n #g (size in Gbytes). See -g for maximum file size.

       -N     Report results in microseconds per operation.

       -o     Writes are synchronously written to disk. (O_SYNC).  Iozone will open the files with the O_SYNC flag. This forces all writes to the file to go completely to disk before  return‐
              ing to the benchmark.

       -O     Give results in operations per second.

       -p     This  purges  the processor cache before each file operation.  Iozone will allocate another internal buffer that is aligned to the same processor cache boundary and is of a size
              that matches the processor cache.  It will zero fill this alternate buffer before beginning each test.  This will purge the processor cache and allow one to see the memory  sub‐
              system without the acceleration due to the processor cache.

       -P #   Bind  processes/threads  to processors, starting with this cpu #. Only available on some platforms. The first sub process or thread will begin on the specified processor. Future
              processes or threads will be placed on the next processor. Once the total number of cpus is exceeded then future processes or threads will be placed in a round robin fashion.

       -q #   Set maximum record size (in Kbytes) for auto mode. One may also specify -q #k (size in Kbytes) or -q #m (size in Mbytes) or -q #g (size in Gbytes). See  -y  for  minimum  record
              size.

       -Q     Create offset/latency files.  Iozone will create latency versus offset data files that can be imported with a graphics package and plotted. This is useful for finding if certain
              offsets have very high latencies. Such as the point where UFS will allocate its first indirect block.  One can see from the data the impacts of the extent allocations for extent
              based filesystems with this option.

       -r #   Used to specify the record size, in Kbytes, to test. One may also specify -r #k (size in Kbytes) or -r #m (size in Mbytes) or -r #g (size in Gbytes).

       -R     Generate  Excel  report.   Iozone will generate an Excel compatible report to standard out. This file may be imported with Microsoft Excel (space delimited) and used to create a
              graph of the filesystem performance. Note: The 3D graphs are column oriented. You will need to select this when graphing as the default in Excel is row oriented data.

       -s #   Used to specify the size, in Kbytes, of the file to test. One may also specify -s #k (size in Kbytes) or -s #m (size in Mbytes) or -s #g (size in Gbytes).

       -S #   Set processor cache size to value (in Kbytes). This tells Iozone the size of the processor cache.  It is used internally for buffer alignment and for the purge functionality.

       -t #   Run Iozone in a throughput mode. This option allows the user to specify how many threads or processes to have active during the measurement.

       -T     Use POSIX pthreads for throughput tests. Available on platforms that have POSIX threads.

       -u #   Set the upper limit on number of processes to run. When running throughput tests this option allows the user to specify the greatest number of processes  or  threads  to  start.
              This option should be used in conjunction with the -l option.

       -U mountpoint
              Mount  point  to  unmount and remount between tests.  Iozone will unmount and remount this mount point before beginning each test. This guarantees that the buffer cache does not
              contain any of the file under test.

       -v     Display the version of Iozone.

       -V #   Specify a pattern that is to be written to the temporary file and validated for accuracy in each of the read tests.

       -w     Do not unlink temporary files when finished using them.

       -W     Lock file when reading or writing.

       -x     Turn off stone-walling. Stonewalling is a technique used internally to Iozone.  It is used during the throughput tests. The code starts all threads or processes and  then  stops
              them  on a barrier.  Once they are all ready to start then they are all released at the same time. The moment that any of the threads or processes finish their work then the en‐
              tire test is terminated and throughput is calculated on the total I/O that was completed up to this point. This ensures that the entire measurement was taken while  all  of  the
              processes or threads were running in parallel.  This flag allows one to turn off the stonewalling and see what happens.

       -X filename
              Used  to specify a filename that will be used for the write telemetry information. The file contains lines with offset, size, delay_in_milliseconds. Each of these lines are used
              to perform an I/O operation.  This is used when an application's specific I/O operations are known, and one wishes to benchmark the system with this  specific  application  file
              behavior.

       -y #   Set  minimum  record  size  (in Kbytes) for auto mode. One may also specify -y #k (size in Kbytes) or -y #m (size in Mbytes) or -y #g (size in Gbytes). See -q for maximum record
              size.

       -Y filename
              Used to specify a filename that will be used for the read telemetry information. The file contains lines with offset, size, delay_in_milliseconds. Each of these lines  are  used
              to  perform  an  I/O operation.  This is used when an application's specific I/O operations are known, and one wishes to benchmark the system with this specific application file
              behavior.

       -z     Used in conjunction with -a to test all possible record sizes. Normally Iozone omits testing of small record sizes for very large files when used in full  automatic  mode.  This
              option forces Iozone to include the small record sizes in the automatic tests also.

       -Z     Enable mixing of mmap I/O and file I/O.

       -+m filename
              Used  to  specify  a  filename that will be used to specify the clients in a distributed measurement. The file contains one line for each client. The fields are space delimited.
              Field 1 is the client name. Field 2 is the working directory, on the client, where Iozone will run. Field 3 is the path to the executable Iozone on the client.

       -+n    No retests selected. Used to prevent retests from running.

       -+N    No truncating or deleting of previous test file before the sequential write test. Useful only after -w is used in previous command to leave the test file  in  place  for  reuse.
              This flag is of limited use, when a single retest is not enough, or to easily control when sequential write retests occur without file truncation or deletion.

       -+u    Used to enable CPU statistics collection.

       -+d    Diagnostic mode to troubleshoot a broken file I/O subsystem.

       -+p percentage_reads
              Used to set the percentage of threads/processes that will perform read testing in the mixed workload test case.

       -+r    Enable O_RSYNC | O_SYNC on all testing.

       -+l    Enable byte range locking.

       -+L    Enable byte range locking & shared file mode.

       -+D    Enable O_DSYNC on all testing.

       -+t    Enable network performance test. Use with -+m

       -+A#   Enable madvise behavior. 0 = normal, 1=random, 2=sequential, 3=dontneed, 4=willneed

       -+B    Enable sequential mixed workload testing.

       -+T    Enable time stamps logging.

       -+h    Manually set hostname.

       -+w#   Percentage of data to be de-dupable between files.

AUTHOR
       Original Author: William D. Norcott. wnorcott@us.oracle.com

       Features & extensions: Don Capps capps@iozone.org

                                                                                                                                                                                      IOZONE(1)
