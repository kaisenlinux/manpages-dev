  XCA
 
## NAME
        xca - X Certificate and key management
 
        A GUI for handling X509 certificates, RSA/DSA/EC keys, PKCS#10 Requests and CRLs in Software and on Smartcards.
 
## SYNOPSIS
        xca [-v] [-d] [-x] [-i] [-I]
 
## DESCRIPTION
        This  application is intended as CA, certificate- and Key store.  It uses a SQL database to store the items. By default this is SQLite3, but MySQL and Postr‐
        greSQL are also tested and supported.  Known types are Certificate signing requests (PKCS#10), Certificates (X509v3), RSA, DSA and EC  keys  and  Certificate
        revocation lists.  The signing of requests, and the creation of self-signed certificates is supported. Both can use templates for simplicity.  The PKI struc‐
        tures can be imported and exported in several formats like PKCS#12, PEM, DER, PKCS#8, PKCS#7.
        XCA enables users to manage smartcards via the PKCS#11 interface
 
## OPTIONS
        A summary of options are included below.  There are some deprecated legacy options: [-k] [-r] [-c] [-p] [-7] [-l] [-t] [-P]
        Before XCA 0.9.0, the type of the items had to be given.  This was removed since.  Just put all keys, certs, requests and the database unsorted on  the  com‐
        mandline.  For backwards compatibility those options are ignored when found.
 
        -v     Show version information and exit.
 
        -d <database-name>
               expect the following argument to be a new database to use.
 
        -x     Exit  after processing all commandline options.  Usually after importing the items from commandline the application will startup as usual. With the -x
               option given it will exit after finishing the import dialog.  This is useful if xca is used as default application for viewing certificates,  keys  or
               requests.
 
        -i <index-file>
               Creates an OpenSSL index file with the file name <index-file>.  The file will contain information about all certificates in the database.
 
        -I <directory>
               Creates OpenSSL index files with the file name <directory>/<ca-internal-name>.txt for each CA with issued certificates.  Each file will contain infor‐
               mation about all issued certificates of the CA. The target directory must exist.
 
## SEE ALSO
        A more detailed HTML documentation can be found in the doc directory, in the "Help" menu of the application or on http://hohnstaedt.de/documentation
 
## AUTHOR
        This manual page was written by Christian Hohnstaedt <christian@hohnstaedt.de>
 
                                                                                                                                                               XCA(1)
