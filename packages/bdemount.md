  bdemount                                                                        LOCAL                                                                       bdemount
 
## NAME
      bdemount — mounts a BitLocker Drive Encryption (BDE) encrypted volume
 
## SYNOPSIS
      bdemount [-k keys] [-o offset] [-p password] [-r password] [-s filename] [-X extended_options] [-hvV] source
 
## DESCRIPTION
      bdemount is a utility to mount a BitLocker Drive Encryption (BDE) encrypted volume
 
      bdemount is part of the libbde package.  libbde is a library to access the BitLocker Drive Encryption (BDE) format
 
      source is the source file.
 
      The options are as follows:
 
      -h      shows this help
 
      -k keys
              the full volume encryption key and tweak key formatted in base16 and separated by a : character e.g. FKEV:TWEAK
 
      -o offset
              specify the volume offset in bytes
 
      -p password
              specify the password
 
      -r password
              specify the recovery password
 
      -s filename
              specify the file containing the startup key.  typically this file has the extension .BEK
 
      -v      verbose output to stderr
 
      -V      print version
 
      -X extended_options
              extended options to pass to sub system
 
## ENVIRONMENT
      None
 
## FILES
      None
 
## EXAMPLES
      # bdemount -p Password /dev/sda1
      bdemount 20110821
 
 DIAGNOSTICS
      Errors, verbose and debug output are printed to stderr when verbose output -v is enabled.  Verbose and debug output are only printed when enabled at compila‐
      tion.
 
## BUGS
      Please report bugs of any kind to <joachim.metz@gmail.com> or on the project website: https://github.com/libyal/libbde/
 
## AUTHOR
      These man pages were written by Joachim Metz.
 
 COPYRIGHT
      Copyright (C) 2011-2019, Joachim Metz <joachim.metz@gmail.com>.  This is free software; see the source for copying conditions. There is NO warranty; not even
      for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 
## SEE ALSO
      bdeinfo(1)
 
 libbde                                                                     August 31, 2014                                                                    libbde
