  PST2LDIF
 
## NAME
        pst2ldif - extract contacts from an MS Outlook .pst file in .ldif format
 
## SYNOPSIS
        pst2ldif [-V] [-b ldap-base] [-c class] [-d debug-file] [-l extra-line] [-o] [-h] pstfilename
 
## OPTIONS
        -V
            Show program version. Subsequent options are then ignored.
 
        -b ldap-base
            Sets the ldap base value used in the dn records. You probably want to use something like "o=organization, c=US".
 
        -c class
            Sets the objectClass values for the contact items. This class needs to be defined in the schema used by your LDAP server, and at a minimum it must
            contain the ldap attributes given below. This option may be specified multiple times to generate entries with multiple object classes.
 
        -d debug-file
            Specify name of debug log file. The log file is now an ascii file, instead of the binary file used in previous versions.
 
        -l extra-line
            Specify an extra line to be added to each ldap entry. This option may be specified multiple times to add multiple lines to each ldap entry.
 
        -o
            Use the old ldap schema, rather than the default new ldap schema. The old schema generates multiple postalAddress attributes for a single entry. The new
            schema generates a single postalAddress (and homePostalAddress when available) attribute with $ delimiters as specified in RFC4517. Using the old schema
            also generates two extra leading entries, one for "dn:ldap base", and one for "dn: cn=root, ldap base".
 
        -h
            Show summary of options. Subsequent options are then ignored.
 
## DESCRIPTION
        pst2ldif reads the contact information from an MS Outlook .pst file and produces a .ldif file that may be used to import those contacts into an LDAP
        database. The following ldap attributes are generated for the old ldap schema:
            cn
            givenName
            sn
            personalTitle
            company
            mail
            postalAddress
            l
            st
            postalCode
            c
            homePhone
            telephoneNumber
            facsimileTelephoneNumber
            mobile
            description
        The following attributes are generated for the new ldap schema:
            cn
            givenName
            sn
            title
            o
            mail
            postalAddress
            homePostalAddress
            l
            st
            postalCode
            c
            homePhone
            telephoneNumber
            facsimileTelephoneNumber
            mobile
            description
            labeledURI
 
 COPYRIGHT
        Copyright (C) 2008 by 510 Software Group <carl@five-ten-sg.com>
 
        This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software
        Foundation; either version 2, or (at your option) any later version.
 
        You should have received a copy of the GNU General Public License along with this program; see the file COPYING. If not, please write to the Free Software
        Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.
 
 VERSION
        0.6.75
 
 pst2ldif 0.6.75                                                              2017-12-07                                                                  PST2LDIF(1)
