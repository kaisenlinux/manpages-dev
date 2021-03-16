DIRVISH-EXPIRE(8)                                                      System Manager's Manual                                                     DIRVISH-EXPIRE(8)

NAME
       dirvish-expire - delete expired dirvish images

SYNOPSIS
       dirvish-expire[OPTIONS]

DESCRIPTION
       Delete dirvish image trees or whole images that have expired.

       Each  image  summary  file  is  checked  for the Expire: field.  If that field indicates the image has expired dirvish-expire will delete that image from the
       vault.

       By default all subdirectories of all banks will be treated as vaults and all directories therein except the one named dirvish will  be  checked  for  summary
       files.

       The removal of an image will have no effect on other images.

       Dirvish-expire  will  not  delete an image unless it finds at least one image in that branch that has an intact image tree and Status: success in the summary
       that is not expired.

OPTIONS
       Each option on the command line may be specified any number of times.  Those options that support lists in the config files will accumulate all of their  ar‐
       guments otherwise each specification will override the ones before.

       Each option may be unambiguously abbreviated.

       --time time_expression
              Execute as though time_expression were the current time.

              Time_expression is processed by Time::Parsedate(3pm) so relative time and date strings are permitted.  See Time::Parsedate(3pm) for more details.

       --tree Only delete the image tree, leave in place the rest of the image directory with summary, log and any other image administrative files.

       --vault vault
              Restrict expiration to the specified vault.

       --no-run
              Don't actually do anything.  Just display what would have happened.

       --quiet
              Run quietly, only report errors.

              Normally dirvish-expire will report the images deleted.

EXIT CODES
       To  facilitate  further  automation  and  integration of dirvish-expire with other tools dirvish-expire provides rationalised exit codes.  The exit codes are
       range based.  While the code for a specific error may change from one version to another it will remain within the specified range.  So don't test  for  spe‐
       cific exit codes but instead test for a range of values.  To the degree possible higher value ranges indicate more severe errors.

       0      success

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

       bank/vault/image/summary
              image creation summary.

       bank/vault/image/tree
              actual image of source directory tree.

SEE ALSO
       dirvish.conf(5)
       Time::ParseDate(3pm)

BUGS
       Dirvish-expire  will  walk  the file hierarchy of all banks or the specified vault looking for summary files.  Anything non-dirvish in there may cause excess
       file-walking.

                                                                                                                                                   DIRVISH-EXPIRE(8)
