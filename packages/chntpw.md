  CHNTPW
 
## NAME
        chntpw - utility to overwrite passwords of Windows systems
 
## SYNOPSIS
        chntpw [options] <samfile> [systemfile] [securityfile] [otherreghive] [...]
 
## DESCRIPTION
        This manual page documents briefly the chntpw command.  This manual page was written for the Debian distribution because the original program does not have a
        manual page.
 
        chntpw is a utility to view some information and reset user passwords in a Windows NT/2000 SAM userdatabase file used by Microsoft Windows  Operating  System
        (in  NT3.x and later versions). This file is usually located at \WINDOWS\system32\config\SAM on the Windows file system. It is not necessary to know the pre‐
        vious passwords to reset them.  In addition it contains a simple registry editor and  ahex-editor with which the information contained in a registry file can
        be browsed and modified.
 
        This program should be able to handle both 32 and 64 bit Microsoft Windows and all versions from NT3.x up to Win8.1.
 
## OPTIONS
        -h     Show a summary of options.
 
        -u username
               Username or username ID (RID) to change. The default is 'Administrator'.
 
        -l     List all users in the SAM database and exit.
 
        -i     Interactive Menu system: list all users (as per -l option) and then ask for the user to change.
 
        -e     Registry editor with limited capabilities (but it does include write support). For a slightly more powerful editor see reged
 
        -d     Use buffer debugger instead (hex editor)
 
               -L  Log all changed filenames to /tmp/changed. When this option is set the program automatically saves the changes in the hive files without prompting
               the user.
 
               Be careful when using the -L option as a root user in a multiuser system.  The filename is fixed and this can be used by malicious users  (dropping  a
               symlink with the same name) to overwrite system files.
 
        -N     Do not allocate more information, only allow the editing of existing values with same size.
 
        -E     Do not expand the hive file (safe mode).
 
        -v     Print verbose information and debug messages.
 
## EXAMPLES
        ntfs-3g /dev/sda1 /media/win ; cd /media/win/WINDOWS/system32/config/
               Mount the Windows file system and enters the directory \WINDOWS\system32\config where Windows stores the SAM database.
 
        chntpw SAM system
               Opens registry hives SAM and system and change administrator account. This will work even if the name has been changed or it has been localized (since
               different language versions of NT use different administrator names).
 
        chntpw -l SAM
               Lists the users defined in the SAM registry file.
 
        chntpw -u jabbathehutt SAM
               Prompts for password for jabbathehutt and changes it in the SAM registry file, if found (otherwise do nothing).
 
 KNOWN## BUGS
        This program uses undocumented structures in the SAM database. Use with caution (i.e. make sure you make a backup of the file before any changes are done).
 
        Password changing is only possible if the program has been specifically compiled with some cryptographic functions. This feature, however, only  works  prop‐
        erly in Windows NT and Windows 2000 systems. It might not work properly in Windows XP, Vista, Win7, Win8 and later systems.
 
        In the Debian distribution this feature is not enabled.
 
## SEE ALSO
        reged, samusrgrp, sampasswd
 
        If you are looking for an automated procedure for password recovery, you might want to check the bootdisks (can be used in CD and USB drives) provided by the
        upstream author at http://pogostick.net/~pnh/ntpasswd/
 
        You will find more information  available  on  how  this  program  works,  including  in-depth  details  on  how  the  registry  works,  in  the  text  files
        /usr/share/doc/chntpw/README.txt and /usr/share/doc/chntpw/MANUAL.txt
 
## AUTHOR
        This program was written by Petter N Hagen.
 
        This manual page was written by Javier Fernandez-Sanguino <jfs@debian.org>, for the Debian GNU/Linux system (but may be used by others).
 
                                                                            13th March 2010                                                                 CHNTPW(8)
