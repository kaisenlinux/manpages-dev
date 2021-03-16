  UDFINFO
 
## NAME
        udfinfo — show information about UDF filesystem
 
## SYNOPSIS
        udfinfo [ options ] device
 
## DESCRIPTION
        udfinfo shows various information about a UDF filesystem stored either on the block device or in the disk file image. The output from the udfinfo is suitable
        for parsing by external applications or scripts.
 
## OPTIONS
        -h,--help
               Display the usage and the list of options.
 
        -b,--blocksize= block-size
               Specify the size of blocks in bytes. Valid block size for a UDF filesystem is a power of two in the range from 512 to 32768 and must  match  a  device
               logical (sector) size. If omitted, udfinfo tries to autodetect block size. First it tries logical (sector) size and then all valid block sizes.
 
        --vatblock= vat-block
               Specify  the block location of the Virtual Allocation Table. Virtual Allocation Table is present only on UDF disks with Virtual Partition Map and must
               be at the last written/recorded disk block.
 
               If omitted, udfinfo for optical disc tries to detect the last recorded block with fallback to the last block of block device or disk  file  image.  In
               most cases, this fallback does not have to work and for disk file images with Virtual Allocation Table is necessary to specify the correct location.
 
               Virtual  Allocation  Table  contains  locations  of UDF disk blocks needed to read data storage, determinate used and free space blocks, read File Set
               Identifier and calculate Windows-specific Volume Serial Number. Also, it contains Logical Volume Identifier and overwrite previously stored in Logical
               Volume Descriptor.
 
        --locale
               Encode UDF string identifiers on output according to current locale settings (default).
 
        --u8   Encode  UDF  string  identifiers  on output to 8-bit OSTA Compressed Unicode format without leading Compression ID byte, which is equivalent to Latin1
               (ISO-8859-1).  This will work only for strings which Unicode code points are below U+100.
 
        --u16  Encode UDF string identifiers on output to 16-bit OSTA Compressed Unicode format without leading Compression ID byte, which is equivalent to UTF-16BE.
 
        --utf8 Encode UDF string identifiers on output to UTF-8.
 
## EXIST STATUS
        udfinfo returns 0 if successful, non-zero if there are problems like a block device does not contain UDF filesystem.
 
 OUTPUT FORMAT
        First part of the udfinfo standard output contains information in key=value format. List of all keys with their meaning are in the following table:
 
               filename         File name of the selected block device or disk file image
 
               label            label is an alias for lvid, see udflabel(8) section UDF LABEL AND UUID
 
               uuid             UUID are first 16 hexadecimal lowercase digits of fullvsid, but see udflabel(8) section UDF LABEL AND UUID
 
               lvid             UDF Logical Volume Identifier stored in UDF Logical Volume Descriptor
 
               vid              UDF Volume Identifier stored in UDF Primary Volume Descriptor
 
               vsid             fullvsid after uuid part, typically 17.–127. character
 
               fsid             UDF File Set Identifier stored in UDF File Set Descriptor
 
               fullvsid         UDF Volume Set Identifier stored in UDF Primary Volume Descriptor
 
               winserialnum     Windows-specific Volume Serial Number
 
               blocksize        UDF block size
 
               blocks           Number of all blocks on the selected block device or disk file image
 
               usedblocks       Number of used space blocks on UDF disk for data storage
 
               freeblocks       Number of free space blocks on UDF disk for data storage
 
               behindblocks     Number of blocks which are behind the last block used by UDF disk
 
               numfiles         Number of stored files on UDF disk
 
               numdirs          Number of stored directories on UDF disk
 
               udfrev           UDF revision needed for reading UDF disk
 
               udfwriterev      UDF revision needed for writing or modifying UDF disk
 
               vatblock         UDF block location of the Virtual Allocation Table (visible only when available)
 
               integrity        UDF integrity of Logical Volume, one of: opened, closed, unknown
 
               accesstype       UDF Access Type, one of: overwritable, rewritable, writeonce, readonly, pseudo-overwritable, unknown
 
               softwriteprotect Status of UDF SoftWriteProtect flag, either yes or no (available since udfinfo 2.2)
 
               hardwriteprotect Status of UDF HardWriteProtect flag, either yes or no (available since udfinfo 2.2)
 
        When UDF integrity is not closed it means that the UDF disk was not properly unmounted, is in an inconsistent state and needs repairing.
 
        When either softwriteprotect or hardwriteprotect flag is set then UDF disk should be treated as read-only.
 
        All UDF string identifiers are stored on UDF disk in Unicode, therefore they are locale or code page agnostic. Options --locale, --u8, --u16 and --utf8  con‐
        trols how are identifiers encoded on output.
 
        All newline characters from the UDF string identifiers are removed, so it is guaranteed that the newline character is present only as a separator.
 
        Second part of the udfinfo standard output contains list of UDF block types stored on device, one per line in the following format:
 
               start=block-num, blocks=block-count, type=block-type
 
        With meaning that block-type starts at UDF block block-num and span block-count blocks on device.
 
        Windows-specific  Volume  Serial Number is a non-standard 32-bit checksum, calculated as four separate 8-bit XOR checksums of 512 bytes long UDF File Set De‐
        scriptor. Therefore, it cannot be set or changed as opposed to UUID which is 64-bit long. This non-standard checksum is used only by Windows  systems  (since
        Windows 98 era when it was introduced) and can be displayed on Windows systems by applications like vol, dir or fsutil.exe.
 
 LIMITATIONS
        udfinfo prior to version 2.2 was unable to print Unicode strings with code points above U+FFFF correctly.
 
        udfinfo  prior to version 2.2 was unable to read Metadata Partition.  Therefore, determining used and free space blocks, reading File Set Identifier and cal‐
        culating Windows-specific Volume Serial Number did not have to be available or correctly calculated for disks with UDF revisions higher than 2.01  which  had
        Metadata Partition.
 
        udfinfo prior to version 2.1 was unable to read Virtual Allocation Table stored outside of Information Control Block. Therefore above limitation applied also
        for some Write Once media.
 
## AUTHOR
        Pali Rohár <pali.rohar@gmail.com>
 
 AVAILABILITY
        udfinfo is part of the udftools package since version 2.0 and is available from https://github.com/pali/udftools/.
 
## SEE ALSO
        mkudffs(8), pktsetup(8), udflabel(8), cdrwtool(1), wrudf(1)
 
 Commands                                                                      udftools                                                                    UDFINFO(1)
