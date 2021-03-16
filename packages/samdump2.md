  SAMDUMP2
 
## NAME
        samdump2 - retrieves syskey and extract hashes from Windows 2k/NT/XP/Vista SAM.
 
## SYNOPSIS
        samdump2 [## OPTIONS] SYSTEM_FILE SAM_FILE
 
## DESCRIPTION
        samdump2 is designed to dump Windows 2k/NT/XP password hashes from a SAM file, using the syskey bootkey from the system hive.
 
        -d     enable debugging
 
        -h     display this help
 
        -o file
               write output to file
 
## EXAMPLE
        samdump2 -o out /mnt/ntfs/WINDOWS/system32/config/system /mnt/ntfs/WINDOWS/system32/config/sam
 
## AUTHOR
        This  manual  page  was  written  by  Adam  Cecile  <gandalf@le-vert.net> for the Debian system (but may be used by others) and modified by Objectif Securite
        <info@objectif-securite.ch> Permission is granted to copy, distribute and/or modify this document under the terms of the GNU General Public License,  Version
        2  or  any  later  version  published  by the Free Software Foundation On Debian systems, the complete text of the GNU General Public License can be found in
        /usr/share/common-licenses/GPL-2.
 
## SEE ALSO
        ophcrack(1)
 
 Version 3.0.0                                                                April 2012                                                                  SAMDUMP2(1)
