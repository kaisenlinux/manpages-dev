  gfs2_lockcapture
 
## NAME
        gfs2_lockcapture - capture locking information from GFS2 file systems and DLM.
 
## SYNOPSIS
        gfs2_lockcapture [-dqyP] [-o output directory] [-r number of runs] [-s seconds to sleep] [-n name of GFS2 file system]
 
        gfs2_lockcapture [-dqyi]
 
## DESCRIPTION
        gfs2_lockcapture  is  used to capture the GFS2 lockdump data and corresponding DLM data for GFS2 file systems. The number of captures and their frequency can
        be configured. By default all of the mounted GFS2 file systems will have their data collected unless GFS2 file systems are specified.
 
        Please note that sysrq -t (thread) and -m (memory) dumps and the pid directories in /proc are collected unless they are disabled with the -P option.
 
## OPTIONS
        -h,  --help
               Prints out a short usage message and exits.
 
        -d,  --debug
               Enables debug logging.
 
        -q,  --quiet
               Disables logging to console.
 
        -y,  --no_ask
               Disables all questions and assumes yes.
 
        -i,  --info
               Prints information about the mounted GFS2 file systems.
 
        -P,  --disable_process_gather
               The gathering of process information will be disabled.
 
        -o <output directory>, --path_to_output_dir=<output directory>
               The directory where all the collect data will be stored.
 
        -r <number of runs>,  --num_of_runs=<number of runs>
               The number of runs capturing the lockdump data. The default is 3 runs.
 
        -s <seconds to sleep>,  --seconds_sleep=<seconds to sleep>
               The number of seconds to sleep between runs of capturing the lockdump data. The default is 120 seconds.
 
        -n <name of GFS2 filesystem>,  --fs_name=<name of GFS2 filesystem>
               The name of the GFS2 filesystem(s) that will have their lockdump data captured. By default, all mounted GFS2 file systems will have  their  data  cap‐
               tured.
 
## NOTES
        The output of the following commands will be captured:
 
        • uname -a
 
        • uptime
 
        • ps h -AL -o "tid,s,cmd"
 
        • df -h
 
        • lsof
 
        • mount -l
 
        • dlm_tool ls
 
        • dlm_tool lockdebug -v -s -w <lockspace name>
 
        • echo "t" > /proc/sysrq-trigger (If /proc/1/stack does not exist)
 
        • echo "m" > /proc/sysrq-trigger (If /proc/1/stack does not exist)
 
## AUTHOR
        Shane Bradley <sbradley@fedoraproject.org>
 
## FILES
        /proc/mounts
        /proc/slabinfo
        /sys/kernel/config/dlm/cluster/lkbtbl_size
        /sys/kernel/config/dlm/cluster/dirtbl_size
        /sys/kernel/config/dlm/cluster/rsbtbl_size
        /sys/kernel/debug/gfs2/
        /sys/kernel/debug/dlm/
        /proc/<int>/ (If /proc/1/stack does exists)
        /var/log/messages
        /var/log/cluster/
 
## SEE ALSO
                                                                                                                                                  gfs2_lockcapture(8)
