NVRAM_EXPORT(1)                                                                     General Commands Manual                                                                     NVRAM_EXPORT(1)

NAME
       nvram_export - Cisco NVRAM configuration export

SYNOPSIS
       nvram_export nvram_file config_file [ private_file ]

DESCRIPTION
       Exports configuration files startup-config and private-config from a dynamips NVRAM file to the target files.

OPTIONS
       nvram_file
              File that contains the NVRAM data.  On some platforms, NVRAM is simulated inside the ROM.

       config_file
              File for 'startup-config'.

       private_file
              File for 'private-config'.

REPORTING BUGS
       Please send bug reports to ⟨https://github.com/GNS3/dynamips/issues⟩

SEE ALSO
       dynamips(1), hypervisor_mode(7)
       ⟨http://www.gns3.net/dynamips/⟩
       ⟨http://forum.gns3.net/⟩
       ⟨https://github.com/GNS3/dynamips⟩

OLD WEBSITES
       ⟨http://www.ipflow.utc.fr/index.php/⟩
       ⟨http://www.ipflow.utc.fr/blog/⟩
       ⟨http://hacki.at/7200emu/index.php⟩

AUTHOR
       dynamips is being maintained by Flávio J. Saraiva <flaviojs2005@gmail.com>. This manual page was initially written by Erik Wenzel <erik@debian.org> for the Debian GNU/Linux system.

                                                                                          Sep 28, 2013                                                                          NVRAM_EXPORT(1)
