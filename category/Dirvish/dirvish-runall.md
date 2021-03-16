DIRVISH-RUNALL(8)                                                      System Manager's Manual                                                     DIRVISH-RUNALL(8)

NAME
       dirvish-runall - run a set of dirvish backup jobs.

SYNOPSIS
       dirvish-runall[OPTIONS]

DESCRIPTION
       Run all the jobs specified in the Runall field of the dirvish master configuration file.

OPTIONS
       Each option may be unambiguously abbreviated.

       --config configfile
              Read configfile for the Runall: field.  By default dirvish-runall will use the Runall: field from the master configuration file.

              This will only be used by dirvish-runall itself and not be propagated to the dirvish processes.

              See dirvish.conf(5) for more details.

       --no-run

       --dry-run
              Don't actually do anything.  Just display what would have happened.

       --quiet
              Run quietly, only report errors.

              Normally dirvish-runall will report the dirvish commands invoked with timestamps.

       --version
              Print the version information and exit.

EXIT CODES
       To  facilitate  further  automation  and  integration of dirvish-runall with other tools dirvish-runall provides rationalised exit codes.  The exit codes are
       range based.  While the code for a specific error may change from one version to another it will remain within the specified range.  So don't test  for  spe‐
       cific exit codes but instead test for a range of values.  To the degree possible higher value ranges indicate more severe errors.

       0      success

       1-199  Number of dirvish jobs that failed.  If more than 199 jobs failed 199 will be the exit code.

       200-219
              An error was encountered in loading a configuration file.

       220-254
              An error was detected in the configuration.

       255    Incorrect usage.

FILES
       /etc/dirvish/master.conf
              alternate master configuration file.

       /etc/dirvish.conf
              master configuration file.

SEE ALSO
       dirvish.conf(5)

BUGS
                                                                                                                                                   DIRVISH-RUNALL(8)
