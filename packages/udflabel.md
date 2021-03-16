  UDFLABEL
 
## NAME
        udflabel — show or change UDF filesystem label
 
## SYNOPSIS
        udflabel [encoding-options] [block-options] [identifier-options] device [new-label]
 
## DESCRIPTION
        When udflabel is invoked without identifier-options and without specifying new-label then it shows current label of UDF filesystem on device to standard out‐
        put terminated by new line. Otherwise it updates UDF filesystem (up to the revision 2.60) on device with new specified identifiers  from  identifier-options.
        Specifying new-label is synonym for both --lvid and --vid, see section UDF LABEL AND UUID.
 
## OPTIONS
    GENERAL## OPTIONS
        -h,--help
               Display the usage and the list of options.
 
    BLOCK## OPTIONS
        -b,--blocksize= block-size
               Specify  the  size  of blocks in bytes. Valid block size for a UDF filesystem is a power of two in the range from 512 to 32768 and must match a device
               logical (sector) size. If omitted, udflabel tries to autodetect block size. First it tries logical (sector) size and then all valid block sizes.
 
        --vatblock= vat-block
               Specify the block location of the Virtual Allocation Table. Virtual Allocation Table is present only on UDF disks with Virtual Partition Map and  must
               be at the last written/recorded disk block.
 
               If  omitted,  udflabel for optical disc tries to detect the last recorded block with fallback to the last block of block device or disk file image. In
               most cases, this fallback does not have to work and for disk file images with Virtual Allocation Table it is necessary to specify  the  correct  loca‐
               tion.
 
               Virtual Allocation Table contains Logical Volume Identifier (UDF Label).
 
        --force
               Force  updating UDF disks without write support or write protected UDF disks. Some UDF disks may have set write protect flag. Some media, like CD-ROM,
               DVD-ROM or BD-ROM are read-only. Other media, like CD-RW or DVD-RW, are write-once. UDF is designed also for such media where updating Label or  Iden‐
               tifiers  is  not  possible. But in some rare cases, it could make sense to try and overwrite the existing Label or Identifiers also for UDF filesystem
               which has Access Type either Read-Only or Recordable (Write-Once). This is possible only if underlying media supports overwriting. E.g. UDF  image  of
               CD-ROM  stored  on  hard  disk  or Read-Only UDF image burned to DVD-RAM or BD-RE discs. Option --force ignores UDF Access Type and treats it as Over‐
               writable. Also it ignores UDF SoftWriteProtect and HardWriteProtected flags.
 
        -n,--no-write
               Not really, do not write to device. Just simulate and display what would happen with device. Useful for determining which UDF blocks  would  be  over‐
               written.
 
    IDENTIFIER## OPTIONS
        -u,--uuid= uuid
               Specify  the  UDF uuid. Must be exactly 16 hexadecimal lowercase digits and is used for first 16 characters of --fullvsid option. Special value random
               generates new uuid from local time and a random number. See section UDF LABEL AND UUID.
 
        --lvid= new-logical-volume-identifier
               Specify the new Logical Volume Identifier.
 
        --vid= new-volume-identifier
               Specify the new Volume Identifier.
 
        --vsid= new-volume-set-identifier
               Specify the new 17.–127. character of Volume Set Identifier. See section UDF LABEL AND UUID.
 
        --fsid= new-file-set-identifier
               Specify the new File Set Identifier.
 
        --fullvsid= new-full-volume-set-identifier
               Specify the new Volume Set identifier. Overwrite previous --uuid and --vsid options. See section UDF LABEL AND UUID.
 
    ENCODING## OPTIONS
        --locale
               Treat identifier string options as strings encoded according to current locale settings (default). Must be specified as the first argument.
 
        --u8   Treat identifier string options as strings encoded in 8-bit OSTA Compressed Unicode format without leading Compression ID byte, which is equivalent to
               Latin1 (ISO-8859-1). Must be specified as first argument.
 
        --u16  Treat  identifier  string options as strings encoded in 16-bit OSTA Compressed Unicode format without leading Compression ID byte, which is equivalent
               to UTF-16BE. Note that it is not possible to include zero byte in command line options, therefore any character which has at least one zero byte  can‐
               not be supplied (this applies to all Latin1 characters). Must be specified as the first argument.
 
        --utf8 Treat identifier string options as strings encoded in UTF-8. Must be specified as the first argument.
 
 UDF LABEL AND UUID
        UDF  specification  does  not  say  anything about a disk label but it describes that UDF Logical Volume Identifier is an extremely important field for media
        identification in a jukebox as that field is displayed to the user. And based on this statement it is a common practice for the majority of  UDF  implementa‐
        tions to use UDF Logical Volume Identifier as a UDF disk label.
 
        UDF  specification  does  not  have a concept of disk UUID like other filesystems. But mandates that the first 16 characters of UDF Volume Set Identifier are
        unique, a non-fixed and a non-trivial value. Plus first eight characters are hexadecimal digits. Windows application format.exe  and  Mac  OS  X  application
        newfs_udf are known to violates this requirement and set only the first 8 characters as unique (others are fixed). Since, there are still a lot of UDF imple‐
        mentations which use in the first 16 characters only hexadecimal digits and all compliant UDF implementations have hexadecimal digits in the first 8  charac‐
        ters, the following algorithm for generating stable UUID was informally chosen and now is used by udftools, util-linux, grub2 and other projects:
 
               0. If Volume Set Identifier has less then 8 characters then stop with empty UUID
               1. Take the first 16 bytes from UTF-8 encoded string of Volume Set Identifier
               2. If all bytes are hexadecimal digits then use their lowercase form as UUID
               3.  If  first 8 bytes are not all hexadecimal digits then convert those 8 bytes to their hexadecimal representation (resulting in 16 bytes) and use as
               UUID
               4. Otherwise, compose UUID from two 8 byte parts:
                      1. part: Use the lowercase form of the first 8 bytes (which are hexadecimal digits)
                      2. part: Convert next 4 bytes (9.–12. pos.) to their hexadecimal representation
 
        Which means that this generated UUID has always 16 hexadecimal lowercase digits. In most cases, this UUID matches case-insensitively the first 16  characters
        of UDF Volume Set Identifier and for all disks compliant to the UDF specification the first 8 bytes of UUID matches case-insensitively the first 8 characters
        of UDF Volume Set Identifier. In that algorithm was chosen UTF-8 encoding because it is the only commonly used Unicode transformation  to  bytes  with  fixed
        points in all hexadecimal digits.
 
## EXIST STATUS
        udflabel returns 0 if successful, non-zero if there are problems like block device does not contain UDF filesystem or updating failed.
 
 LIMITATIONS
        udflabel is not able to set new Label, Logical Volume Identifier and File Set Identifier for disks with Virtual Allocation Table (used by Write Once media).
 
        udflabel  prior to version 2.2 was unable to print and process Unicode strings with code points above U+FFFF correctly. When option --utf8 was specified then
        input strings were limited to 3-byte UTF-8 sequences and when option --u16 was specified then input strings were limited just to UCS-2BE strings  (subset  of
        UTF-16BE).
 
        udflabel prior to version 2.2 ignored UDF SoftWriteProtect and HardWriteProtected flags and overwritten such disks without any notice.
 
        udflabel  prior  to version 2.2 was not able to set a new Label, Logical Volume Identifier and File Set Identifier for disks with Metadata Partition (used by
        UDF revisions higher then 2.01).
 
        udflabel prior to version 2.1 was not able to read Label correctly if the disk had Virtual Allocation Table stored outside of Information Control Block.
 
## AUTHOR
        Pali Rohár <pali.rohar@gmail.com>
 
 AVAILABILITY
        udflabel is part of the udftools package since version 2.0 and is available from https://github.com/pali/udftools/.
 
## SEE ALSO
        mkudffs(8), pktsetup(8), cdrwtool(1), udfinfo(1), wrudf(1)
 
 Commands                                                                      udftools                                                                   UDFLABEL(8)
