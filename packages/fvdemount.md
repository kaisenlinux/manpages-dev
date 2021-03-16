  fvdemount                                                                       LOCAL                                                                      fvdemount
 
## NAME
      fvdemount — mounts a FileVault Drive Encrypted (FVDE) volume
 
## SYNOPSIS
      fvdemount [-e filename] [-o offset] [-p password] [-r password] [-X extended_options] [-hvV] source
 
## DESCRIPTION
      fvdemount is a utility to mount a FileVault Drive Encrypted (FVDE) volume
 
      fvdemount is part of the libfvde package.  libfvde is a library to acess the FileVault Drive Encryption (FVDE) format
 
      source is the source file.
 
      The options are as follows:
 
      -e filename
              specify the name of the EncryptedRoot.plist.wipekey file
 
      -h      shows this help
 
      -o offset
              specify the volume offset
 
      -p password
              specify the password
 
      -r password
              specify the recovery password
 
      -v      verbose output to stderr
 
      -V      print version
 
      -X extended_options
              extended options to pass to sub system
 
## ENVIRONMENT
      None
 
## FILES
      None
 
## EXAMPLES
      # fvdemount -p Password /dev/sda1
      fvdemount 20121113
 
 DIAGNOSTICS
      Errors, verbose and debug output are printed to stderr when verbose output -v is enabled.  Verbose and debug output are only printed when enabled at compila‐
      tion.
 
## BUGS
      Please report bugs of any kind to <joachim.metz@gmail.com> or on the project website: http://code.google.com/p/libfvde/
 
## AUTHOR
      These man pages were written by Joachim Metz.
 
 COPYRIGHT
      Copyright (C) 2011-2019, Joachim Metz <joachim.metz@gmail.com>.  This is free software; see the source for copying conditions. There is NO warranty; not even
      for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 
## SEE ALSO
      fvdeinfo(1)
 
 libfvde                                                                   January 12, 2014                                                                   libfvde
