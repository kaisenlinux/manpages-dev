DIRVISH-LOCATE(1)                                                      General Commands Manual                                                     DIRVISH-LOCATE(1)

NAME
       dirvish-locate - locate file versions in dirvish images

SYNOPSIS
       dirvish-locate vault[:branch] pattern

DESCRIPTION
       Locate versions of files in a dirvish vault

       The  index of each image specified vault is searched for paths matching pattern.  Each path found matching the pattern will be reported followed by a modifi‐
       cation time of each version of the file and all images having a link to it.

       The optional branch specification will restrict searching to the specified branch.

       Images with an error status will be skipped as will any without index files.  The index file may be compressed by gzip or  bzip2.   See  tree  and  index  in
       dirvish.conf(5) for details.

       The  pattern  is a perl regular expression to match the final component of the path.  Append .*  to the end of the pattern if you wish to match any substring
       of the whole path or $ if you wish to anchor the pattern to the end of the path.  See perlre(1) for details.

       Directories are excluded from matching as they would wind up matching every file within them anyway.  Symlinks are also excluded from matching.

       If the pattern matches too many paths dirvish-locate will only report the paths matched and not versions.  As a sanity check if the number of matches is  re‐
       ally  excessive  dirvish-locate will limit the number of images searched.  Excessive matches is an indication of an insufficiently specific pattern.  Use the
       resulting path list to compose a more specific one.

EXIT CODES
       To facilitate further automation and integration of dirvish-locate with other tools dirvish-locate provides rationalised exit  codes.   The  exit  codes  are
       range  based.   While the code for a specific error may change from one version to another it will remain within the specified range.  So don't test for spe‐
       cific exit codes but instead test for a range of values.  To the degree possible higher value ranges indicate more severe errors.

       0      success 200-219 An error was encountered in loading a configuration file.

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

       bank/vault/image/index

       bank/vault/image/index.gz

       bank/vault/image/index.bz2
              dirvish index file.

SEE ALSO
       dirvish.conf(5)

BUGS
                                                                                                                                                   DIRVISH-LOCATE(1)
