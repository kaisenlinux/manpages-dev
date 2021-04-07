HW-PROBE(1)                                                                            User Commands                                                                           HW-PROBE(1)

NAME
       hw-probe - Hardware probe and system info collection tool

DESCRIPTION
   NAME:
              Hardware Probe (hw-probe) A tool to probe for hardware, check operability and find drivers

   DESCRIPTION:
              Hardware Probe (hw-probe) is a tool to probe for hardware, check its operability and upload result to the Linux hardware database.

              By creating probes you contribute to the "HDD/SSD Real-Life Reliability Test" study: https://github.com/linuxhw/SMART

              This tool is free software: you can redistribute it and/or modify it under the terms of the GNU LGPL 2.1+.

   USAGE:
              sudo -E hw-probe [options]

   EXAMPLE:
              sudo -E hw-probe -all -upload

   PRIVACY:
              Private information (including the username, machine's hostname, IP addresses, MAC addresses and serial numbers) is NOT uploaded to the database.

              The  tool  uploads  32-byte prefix of salted SHA512 hash of MAC addresses and serial numbers to properly identify unique computers and hard drives. All the data is uploaded
              securely via HTTPS.

   INFORMATION OPTIONS:
       -h|-help

              Print this help.

       -v|-version

              Print version info.

       -dumpversion

              Print the tool version (1.5) and don't do anything else.

   GENERAL OPTIONS:
       -all

              Enable all probes.

       -probe

              Probe for hardware. Collect only hardware related logs.

       -logs

              Collect system logs.

       -log-level N

              Set the logging level to N.  Available values:

              - minimal - default - maximal

       -minimal|-min

              Collect minimal number of logs. Equal to --log-level=min.

       -maximal|-max

              Collect maximal number of logs. Equal to --log-level=max.

       -enable LIST

              Comma separated list of logs to enable in addition to current log level.

       -disable LIST

              Comma separated list of logs to disable in current log level. Some logs cannot be disabled. For example, you can disable collecting of 'fstab', but you cannot disable  log‐
              ging of 'smartctl'.

       -printers

              Probe for printers.

       -scanners

              Probe for scanners.

       -check

              Check devices operability.

       -id|-name DESC

              Any description of the probe.

       -upload

              Upload result to the Linux hardware database. You will get a permanent URL to view the probe.

              By use of this option you confirm uploading of 32-byte prefix of salted SHA512 hash of MAC addresses and serial numbers to prevent duplication of computers in the DB.

       -hwinfo-path PATH

              Path to a local hwinfo binary.

   INVENTORY OPTIONS:
       -i|-inventory-id ID

              Mark the probe by inventory ID.

       -generate-inventory-id

              Generate new inventory ID.

       -email ADDR

              Email for node status notifications.

   MONITORING OPTIONS (COMING SOON!):
       -start

              Start monitoring of the node.

       -stop

              Stop monitoring of the node.

       -remind-inventory

              Remind node inventory ID.

   OTHER OPTIONS:
       -save DIR

              Save probe package to DIR. This is useful if you are offline and need to upload a probe later (with the help of -src option).

       -src|-source PATH

              A probe to upload.

       -fix PATH

              Update list of devices and host info in the probe using probe data.

       -show-devices

              Show devices list.

       -show

              Show host info and devices list.

       -verbose

              Use with -show option to show type and status of the device.

       -pci-ids
              PATH

       -usb-ids
              PATH

       -sdio-ids PATH

       -pnp-ids
              PATH

              Path to {pci,usb,sdio,pnp}.ids file to read missed device names.

       -list

              List executed probes (for debugging).

       -clean

              Do nothing. Obsolete option.

       -save-uploaded

              Save uploaded probes.

       -debug|-d

              Do nothing. Obsolete option.

       -dump-acpi

              Probe for ACPI table.

       -decode-acpi

              Decode ACPI table.

       -import DIR

              Import probes from the database to DIR for offline use.

              If you are using Snap or Flatpak package, then DIR will be created in the sandbox data directory.

              Provide inventory ID by -i option in order to import your inventory.

   DATA LOCATION:
              Probes info is saved in the /root/HW_PROBE directory.

       A tool to probe for hardware, check operability and find drivers License: GNU LGPL 2.1+

       Usage: sudo -E hw-probe [options] Example: sudo -E hw-probe -all -upload

AUTHOR
       This manual page was written by Mathieu Malaterre <malat@debian.org> for the Debian GNU/Linux system (but may be used by others).

hw-probe Probe 1.5                                                                     February 2020                                                                           HW-PROBE(1)
