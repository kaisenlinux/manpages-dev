  DIRVISH
 
## NAME
        dirvish - Disk based virtual image network backup system
 
## SYNOPSIS
        dirvish --vault vault [## OPTIONS]
 
## DESCRIPTION
        Create a backup image of a client directory tree.
 
        Each  image is a directory containing transfer log, summary, tree and if transfer errors were detected an rsync_error file.  The transfer log retains the the
        output of any pre and post processing commands and the rsync log listing all files that were changed or added with some statistical information.  The summary
        file contains all the information about how the image was created and meta-data for managing the image in config file format.  Tree is the copy of the client
        tree.
 
        The client directory tree is compared with an existing image to create a new image.  Unchanged files are shared between images.  For changed files only those
        parts that actually change are transfered over the network.  Unchanged portions of files are copied from the reference image.
 
        The  resulting  images contain complete copies of the original trees preserving ownership and file permissions.  In this way even though the backups are made
        incrementally, each image can be used independently for restores or to make removable-media off-site copies or archives.
 
        The removal of an image will have no effect on other images.
 
## OPTIONS
        Each option on the command line may be specified any number of times.  Those options that support lists in the config files will accumulate all of their  ar‐
        guments otherwise each specification will override the ones before.
 
        As configuration files are loaded they may override options on the command line.
 
        Each option may be unambiguously abbreviated.
 
        --branch [vault:]branch_name
               Specify a branch to use.
 
               A branch is a sequence of images.
 
               If  a  vault  has been specified either here or with --vault the first time this option is used it will attempt to load the config file branch_name or
               branch_name.conf from the vault.
 
        --config config-file
               Load options from the specified file.
 
               If this precedes --vault the --vault option will not load it's own config file.
 
               If vault has been set and config-file is a bare filename the presence of one in the vault will take precedence over one in the current directory.   To
               specify one in the current directory after --vault use ./ to precede the name.
 
               The master configuration file will be read prior to processing options.
 
        --expire expire_date
               Specify a time for the image to expire.
 
               See Time::ParseDate(3pm) for details.
 
               This  does  not  actually  expire  anything.   What it does do is add an Expire: field to the image summary file containing an absolute time so that a
               dirvish-expire or another tool outside of dirvish can decide when to remove old images.
 
        --image image_name
               Specify a name for the image.
 
               image_name is passed through POSIX::strftime
 
               See strftime(3) for details.
 
        --image-time parsedate_expression
               Time to use when creating the image name.
 
               If an absolute time without a date is provided it will be forced into the past.  If this isn't set the current time will be used.
 
               See Time::ParseDate(3pm) for details.
 
        --init Create an initial image.
 
               Create the image entirely from the source tree without the use of a reference image.
 
        --no-run
 
        --dry-run
               Don't actually do anything.
 
               Process all configuration files, options and tests then produce a summary/configuration file on standard output and exit.
 
        --reference branch_name|image_name
               Specify an existing image or a branch from which to create the new image.
 
               If a branch_name is specified, the last existing image from its history file will be used.  A branch will take precedence over an image  of  the  same
               name.
 
        --reset option
               Reset the values in an accumulating option.
 
        --summary  short|long
               Specify summary format.
 
               A short summary will only include final used values.  A long summary will include all configuration values.
 
               Default value: short
 
        --vault vault[:branch_name]
               Specify the vault to store the image in.
 
               If not preceeded by --config this will attempt to load the config file default or default.conf within the vault.
 
               If  branch_name  is  specified here this will behave exactly like the --branch option and branch_name or branch_name.conf will be attempted instead of
               default.conf.
 
        --version
               Print version string and exit.
 
 EXIT CODES
        To facilitate further automation and integration of dirvish with other tools dirvish provides rationalised exit codes.   The  exit  codes  are  range  based.
        While  the code for a specific error may change from one version to another it will remain within the specified range.  So don't test for specific exit codes
        but instead test for a range of values.  To the degree possible higher value ranges indicate more severe errors.
 
        0      success
 
        1-19   The backup job reported warnings.
 
        20-39  An error occurred during index generation and cleanup.
 
        40-49  A post-client or post-server command could not be run.
 
        50-59  The post-client command reported an error.  Its exit code modulo 10 is added to 50
 
        60-69  The post-server command reported an error.  Its exit code modulo 10 is added to 60
 
        70-79  A post-client or post-server command could not be run.
 
        80-89  The pre-server command reported an error.  Its exit code modulo 10 is added to 80
 
        90-99  The pre-server command reported an error.  Its exit code modulo 10 is added to 90
 
        100-149
               Rsync encountered a non-fatal error.
 
        150-199
               Rsync encountered a fatal error.
 
        200-219
               An error was encountered in loading a configuration file.
 
        220-254
               An error was detected in the configuration.
 
        255    Incorrect usage.
 
## FILES
        /etc/dirvish/master.conf
               alternate master configuration file.
 
        /etc/dirvish.conf
               master configuration file.
 
        /etc/dirvish/client[.conf]
               client configuration file.
 
        bank/vault/dirvish/default[.conf]
               default vault configuration file.
 
        bank/vault/dirvish/branch[.conf]
               branch configuration file.
 
        bank/vault/dirvish/branch.hist
               branch history file.
 
        bank/vault/image/summary
               image creation summary.
 
        bank/vault/image/log
               image creation log.
 
        bank/vault/image/tree
               actual image of source directory tree.
 
        bank/vault/image/rsync_error
               Error output from rsync if errors or warnings were detected.
 
## SEE ALSO
        dirvish.conf(5)
        dirvish-runall(8)
        dirvish-expire(8)
        dirvish-locate(8)
        ssh(1)
        rsync(1)
        Time::ParseDate(3pm)
        strftime(3)
 
## AUTHOR
        Dirvish was created by J.W. Schultz of Pegasystems Technologies.
 
## BUGSAND ISSUES
        Fields set in configuration files will override command line options that have been set before the file is read.  This behaviour while consistent  may  occa‐
        sionally confuse.  For this reason most command line options should be specified after any options that may cause a configuration file to be loaded.
 
        In order to preserve permissions it is necessary for dirvish to run as root on the backup server.
 
        The root user must have non-interactive ssh access to the client systems.  It is not necessary that this access be as the root user on the client.
 
        File ownership is preserved using numeric values so it is not necessary to have user accounts on the backup server.  Making the vaults network accessible us‐
        ing protocols that map UIDs based on names instead of number could allow access controls on files to be violated.
 
        Making the vaults writable by users will compromise the integrity of the backups.  Therefore any access to the vaults by users should be done through a read-
        only mount.
 
                                                                                                                                                           DIRVISH(8)
