ecryptfs-generate-tpm-key(1)                                                             eCryptfs                                                             ecryptfs-generate-tpm-key(1)

NAME
       ecryptfs-generate-tpm-key - generate an eCryptfs key for TPM hardware.

SYNOPSIS
       ecryptfs-generate-tpm-key -p PCR  [-p PCR]...

DESCRIPTION
       ecryptfs-generate-tpm-key is a utility to generate a sealing (storage) key bound to a specified set of PCRs values in the current TPM's PCR's.

EXAMPLE
       ecryptfs-generate-tpm-key -p 0 -p 2 -p 3

SEE ALSO
       ecryptfs(7)

       /usr/share/doc/ecryptfs-utils/ecryptfs-faq.html

       http://ecryptfs.org/

AUTHOR
       This  manpage  was  written  by Dustin Kirkland <kirkland@ubuntu.com> for Ubuntu systems (but may be used by others).  Permission is granted to copy, distribute and/or modify this
       document under the terms of the GNU General Public License, Version 2 or any later version published by the Free Software Foundation.

       On Debian and Ubuntu systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

ecryptfs-utils                                                                          2008-07-21                                                            ecryptfs-generate-tpm-key(1)
