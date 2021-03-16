  MEMSTAT
 
## NAME
        memstat - Identify what's using up virtual memory.
 
## SYNOPSIS
        memstat [-n][-v][-w][-p PID]
 
## DESCRIPTION
        memstat  lists  all accessible processes, executables, and shared libraries that are using up virtual memory. To get a complete list memstat has to be run as
        root to be able to access the data of all running processes.
 
        First, the processes are listed.  An amount of memory is shown along with a process ID and the name of the executable which  the  process  is  running.   The
        amount  of memory shown does not include shared memory: it only includes memory which is private to that process.  So, if a process is using a shared library
        like libc, the memory used to hold that library is not included.  The memory used to hold the executable's text-segment is also not included, since that  too
        is shareable.
 
        After  the  processes,  the shared objects are listed.  The amount of memory is shown along with the filename of the shared object, followed by a list of the
        processes using the shared object. The memory is listed as the total amount of memory allocated to this object throughout the whole namespace.   In  brackets
        also the amount that is really shared is listed.
 
        Finally, a grand total is shown.  Note that this program shows the amount of virtual (not real) memory used by the various items.
 
        memstat  gets  its input from the /proc filesystem.  This must be compiled into your kernel and mounted for memstat to work.  The pathnames shown next to the
        shared objects are also read from /proc filesystem if this information is available. If not, memstat  scans  the  disk  to  translate  inode  information  to
        filesnames.   For  this memstat uses a configuration file, /etc/memstat.conf, to determine which directories to scan.  This file should include all the major
        bin and lib directories in your system, as well as the /dev directory.  These directories are scanned recursively, so that files stored in subdirectories are
        seen  by  memstat  as  well.   Note that this traversal of directory trees significantly increases run time.  Executables or shared objects not found will be
        listed as ``[dev]:<inode>''.
 
    Options
        The -n switch causes inode information to be printed as-is, if no file information was given and to not traverse the configured directory trees.
 
        The -v switch prints version information and exits.
 
        The -w switch causes a wide printout: lines are not truncated at 80 columns.
 
        The -p switch causes memstat to only print data gathered from looking at the process with the given PID.
 
## NOTES
        These reports are intended to help identify programs that are using an excessive amount of memory, and to reduce overall memory waste.
 
## FILES
        /etc/memstat.conf
        /proc/*/maps
 
## SEE ALSO
        ps(1), top(1), free(1), vmstat(8), lsof(8), /usr/share/doc/memstat/memstat-tutorial.txt.gz
 
## BUGS
        memstat ignores all devices that just map main memory, though this may cause memstat to ignore some memory usage.
 
        Memory used by the kernel itself is not listed.
 
## AUTHOR
        Originally written by Joshua Yelon <jyelon@uiuc.edu> and patched by Bernd Eckenfels <ecki@debian.org>. Taken over and rewritten by Michael Meskes <meskes@de‐
        bian.org>.
 
 Debian                                                                    01 November 1998                                                                MEMSTAT(1)
