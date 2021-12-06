S3FS(1)                                                                                User Commands                                                                               S3FS(1)

NAME
       S3FS - FUSE-based file system backed by Amazon S3

SYNOPSIS
   mounting
       s3fs bucket[:/path] mountpoint  [options]

       s3fs mountpoint  [options (must specify bucket= option)]

   unmounting
       umount mountpoint
              For root.

       fusermount -u mountpoint
              For unprivileged user.

   utility mode (remove interrupted multipart uploading objects)
       s3fs --incomplete-mpu-list (-u) bucket

       s3fs --incomplete-mpu-abort[=all | =<expire date format>] bucket

DESCRIPTION
       s3fs is a FUSE filesystem that allows you to mount an Amazon S3 bucket as a local filesystem. It stores files natively and transparently in S3 (i.e., you can use other programs to
       access the same files).

AUTHENTICATION
       s3fs supports the standard AWS credentials file (https://docs.aws.amazon.com/cli/latest/userguide/cli-config-files.html) stored in `${HOME}/.aws/credentials`.  Alternatively, s3fs
       supports  a  custom  passwd  file. Only AWS credentials file format can be used when AWS session token is required.  The s3fs password file has this format (use this format if you
       have only one set of credentials):
           accessKeyId:secretAccessKey

       If you have more than one set of credentials, this syntax is also recognized:
           bucketName:accessKeyId:secretAccessKey

       Password files can be stored in two locations:
            /etc/passwd-s3fs     [0640]
            $HOME/.passwd-s3fs   [0600]

       s3fs also recognizes the AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY environment variables.

OPTIONS
   general options
       -h   --help
              print help

            --version
              print version

       -f     FUSE foreground option - do not run as daemon.

       -s     FUSE single-threaded option (disables multi-threaded operation)

   mount options
       All s3fs options must given in the form where "opt" is:
               <option_name>=<option_value>

       -o bucket
              if it is not specified bucket name (and path) in command line, must specify this option after -o option for bucket name.

       -o default_acl (default="private")
              the default canned acl to apply to all written s3 objects, e.g., "private", "public-read".  see https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl
              for the full list of canned acls.

       -o retries (default="5")
              number of times to retry a failed S3 transaction.

       -o tmpdir (default="/tmp")
              local folder for temporary files.

       -o use_cache (default="" which means disabled)
              local folder to use for local file cache.

       -o check_cache_dir_exist (default is disable)
              If use_cache is set, check if the cache directory exists.  If this option is not specified, it will be created at runtime when the cache directory does not exist.

       -o del_cache - delete local file cache
              delete local file cache when s3fs starts and exits.

       -o storage_class (default="standard")
              store object with specified storage class.  Possible values: standard, standard_ia, onezone_ia, reduced_redundancy, intelligent_tiering, glacier, and deep_archive.

       -o use_rrs (default is disable)
              use Amazon's Reduced Redundancy Storage.  this option can not be specified with use_sse.  (can specify use_rrs=1 for old version) this option has been replaced by new stor‐
              age_class option.

       -o use_sse (default is disable)
              Specify three type Amazon's Server-Site Encryption: SSE-S3, SSE-C or SSE-KMS. SSE-S3 uses Amazon S3-managed encryption keys, SSE-C uses customer-provided  encryption  keys,
              and  SSE-KMS uses the master key which you manage in AWS KMS.  You can specify "use_sse" or "use_sse=1" enables SSE-S3 type (use_sse=1 is old type parameter).  Case of set‐
              ting SSE-C, you can specify "use_sse=custom", "use_sse=custom:<custom key file path>" or "use_sse=<custom key file path>" (only <custom key file path> specified is old type
              parameter).   You  can use "c" for short "custom".  The custom key file must be 600 permission. The file can have some lines, each line is one SSE-C key.  The first line in
              file is used as Customer-Provided Encryption Keys for uploading and changing headers etc.  If there are some keys after first line, those are used downloading object  which
              are  encrypted by not first key.  So that, you can keep all SSE-C keys in file, that is SSE-C key history.  If you specify "custom" ("c") without file path, you need to set
              custom key by load_sse_c option or AWSSSECKEYS environment. (AWSSSECKEYS environment has some SSE-C keys with ":" separator.)  This option is used to decide the  SSE  type.
              So  that if you do not want to encrypt a object at uploading, but you need to decrypt encrypted object at downloading, you can use load_sse_c option instead of this option.
              For setting SSE-KMS, specify "use_sse=kmsid" or "use_sse=kmsid:<kms id>".  You can use "k" for short "kmsid".  If you san specify SSE-KMS type with your  <kms  id>  in  AWS
              KMS,  you  can  set  it  after "kmsid:" (or "k:").  If you specify only "kmsid" ("k"), you need to set AWSSSEKMSID environment which value is <kms id>.  You must be careful
              about that you can not use the KMS id which is not same EC2 region.

       -o load_sse_c - specify SSE-C keys
              Specify the custom-provided encryption keys file path for decrypting at downloading.  If you  use  the  custom-provided  encryption  key  at  uploading,  you  specify  with
              "use_sse=custom".  The file has many lines, one line means one custom key.  So that you can keep all SSE-C keys in file, that is SSE-C key history.  AWSSSECKEYS environment
              is as same as this file contents.

       -o passwd_file (default="")
              specify the path to the password file, which which takes precedence over the password in $HOME/.passwd-s3fs and /etc/passwd-s3fs

       -o ahbe_conf (default="" which means disabled)
              This option specifies the configuration file path which file is the additional HTTP header by file (object) extension.
               The configuration file format is below:
               -----------
               line         = [file suffix or regex] HTTP-header [HTTP-values]
               file suffix  = file (object) suffix, if this field is empty, it means "reg:(.*)".(=all object).
               regex        = regular expression to match the file (object) path. this type starts with "reg:" prefix.
               HTTP-header  = additional HTTP header name
               HTTP-values  = additional HTTP header value
               -----------
               Sample:
               -----------
               .gz                    Content-Encoding  gzip
               .Z                     Content-Encoding  compress
               reg:^/MYDIR/(.*)[.]t2$ Content-Encoding  text2
               -----------
               A sample configuration file is uploaded in "test" directory.  If you specify this option for set "Content-Encoding" HTTP header, please take care for RFC 2616.

       -o profile (default="default")
              Choose a profile from ${HOME}/.aws/credentials to authenticate against S3.  Note that this format matches the AWS CLI format and differs from the s3fs passwd format.

       -o public_bucket (default="" which means disabled)
              anonymously mount a public bucket when set to 1, ignores the $HOME/.passwd-s3fs and /etc/passwd-s3fs files.  S3 does not allow copy object api  for  anonymous  users,  then
              s3fs sets nocopyapi option automatically when public_bucket=1 option is specified.

       -o connect_timeout (default="300" seconds)
              time to wait for connection before giving up.

       -o readwrite_timeout (default="120" seconds)
              time to wait between read/write activity before giving up.

       -o list_object_max_keys (default="1000")
              specify the maximum number of keys returned by S3 list object API. The default is 1000. you can set this value to 1000 or more.

       -o max_stat_cache_size (default="100,000" entries (about 40MB))
              maximum number of entries in the stat cache and symbolic link cache.

       -o stat_cache_expire (default is 900)
              specify expire time (seconds) for entries in the stat cache and symbolic link cache. This expire time indicates the time since cached.

       -o stat_cache_interval_expire (default is 900)
              specify  expire  time (seconds) for entries in the stat cache and symbolic link cache. This expire time is based on the time from the last access time of those cache.  This
              option is exclusive with stat_cache_expire, and is left for compatibility with older versions.

       -o enable_noobj_cache (default is disable)
              enable cache entries for the object which does not exist.  s3fs always has to check whether file (or sub directory) exists under object (path) when s3fs does some  command,
              since  s3fs  has recognized a directory which does not exist and has files or sub directories under itself.  It increases ListBucket request and makes performance bad.  You
              can specify this option for performance, s3fs memorizes in stat cache that the object (file or directory) does not exist.

       -o no_check_certificate (by default this option is disabled)
              server certificate won't be checked against the available certificate authorities.

       -o ssl_verify_hostname (default="2")
              When 0, do not verify the SSL certificate against the hostname.

       -o nodnscache - disable DNS cache.
              s3fs is always using DNS cache, this option make DNS cache disable.

       -o nosscache - disable SSL session cache.
              s3fs is always using SSL session cache, this option make SSL session cache disable.

       -o multireq_max (default="20")
              maximum number of parallel request for listing objects.

       -o parallel_count (default="5")
              number of parallel request for uploading big objects.  s3fs uploads large object (over 20MB) by multipart post request, and sends parallel  requests.   This  option  limits
              parallel request count which s3fs requests at once.  It is necessary to set this value depending on a CPU and a network band.

       -o multipart_size (default="10")
              part size, in MB, for each multipart request.  The minimum value is 5 MB and the maximum value is 5 GB.

       -o multipart_copy_size (default="512")
              part  size,  in  MB,  for each multipart copy request, used for renames and mixupload.  The minimum value is 5 MB and the maximum value is 5 GB.  Must be at least 512 MB to
              copy the maximum 5 TB object size but lower values may improve performance.

       -o max_dirty_data (default="5120")
              Flush dirty data to S3 after a certain number of MB written.  The minimum value is 50 MB.  -1 value means disable.  Cannot be used with nomixupload.

       -o ensure_diskfree (default 0)
              sets MB to ensure disk free space. This option means the threshold of free space size on disk which is used for the cache file by s3fs.  s3fs makes  file  for  downloading,
              uploading and caching files.  If the disk free space is smaller than this value, s3fs do not use diskspace as possible in exchange for the performance.

       -o multipart_threshold (default="25")
              threshold, in MB, to use multipart upload instead of single-part.  Must be at least 5 MB.

       -o singlepart_copy_limit (default="512")
              maximum size, in MB, of a single-part copy before trying multipart copy.

       -o host (default="https://s3.amazonaws.com")
              Set a non-Amazon host, e.g., https://example.com.

       -o servicepath (default="/")
              Set a service path when the non-Amazon host requires a prefix.

       -o url (default="https://s3.amazonaws.com")
              sets  the url to use to access Amazon S3. If you want to use HTTP, then you can set "url=http://s3.amazonaws.com".  If you do not use https, please specify the URL with the
              url option.

       -o endpoint (default="us-east-1")
              sets the endpoint to use on signature version 4.  If this option is not specified, s3fs uses "us-east-1" region as the default.  If the s3fs could not connect to the region
              specified  by  this option, s3fs could not run.  But if you do not specify this option, and if you can not connect with the default region, s3fs will retry to automatically
              connect to the other region.  So s3fs can know the correct region name, because s3fs can find it in an error from the S3 server.

       -o sigv2 (default is signature version 4 falling back to version 2)
              sets signing AWS requests by using only signature version 2.

       -o sigv4 (default is signature version 4 falling back to version 2)
              sets signing AWS requests by using only signature version 4.

       -o mp_umask (default is "0000")
              sets umask for the mount point directory.  If allow_other option is not set, s3fs allows access to the mount point only to the owner.  In the opposite case s3fs allows  ac‐
              cess to all users as the default.  But if you set the allow_other with this option, you can control the permissions of the mount point by this option like umask.

       -o umask (default is "0000")
              sets umask for files under the mountpoint.  This can allow users other than the mounting user to read and write to files that they did not create.

       -o nomultipart - disable multipart uploads

       -o enable_content_md5 (default is disable)
              Allow S3 server to check data integrity of uploads via the Content-MD5 header.  This can add CPU overhead to transfers.

       -o ecs (default is disable)
              This option instructs s3fs to query the ECS container credential metadata address instead of the instance metadata address.

       -o iam_role (default is no IAM role)
              This option requires the IAM role name or "auto". If you specify "auto", s3fs will automatically use the IAM role names that are set to an instance. If you specify this op‐
              tion without any argument, it is the same as that you have specified the "auto".

       -o imdsv1only (default is to use IMDSv2 with fallback to v1)
              AWS instance metadata service, used with IAM role authentication, supports the use of an API token.  If you're using an IAM role in an environment  that  does  not  support
              IMDSv2, setting this flag will skip retrieval and usage of the API token when retrieving IAM credentials.

       -o ibm_iam_auth (default is not using IBM IAM authentication)
              This  option  instructs  s3fs  to  use IBM IAM authentication. In this mode, the AWSAccessKey and AWSSecretKey will be used as IBM's Service-Instance-ID and APIKey, respec‐
              tively.

       -o ibm_iam_endpoint (default is https://iam.cloud.ibm.com)
              Sets the URL to use for IBM IAM authentication.

       -o use_xattr (default is not handling the extended attribute)
              Enable to handle the extended attribute (xattrs).  If you set this option, you can use the extended attribute.  For example, encfs and ecryptfs need to support the extended
              attribute.  Notice: if s3fs handles the extended attribute, s3fs can not work to copy command with preserve=mode.

       -o noxmlns - disable registering xml name space.
              disable   registering   xml  name  space  for  response  of  ListBucketResult  and  ListVersionsResult  etc.  Default  name  space  is  looked  up  from  "http://s3.amazon‐
              aws.com/doc/2006-03-01".  This option should not be specified now, because s3fs looks up xmlns automatically after v1.66.

       -o nomixupload - disable copy in multipart uploads.
              Disable to use PUT (copy api) when multipart uploading large size objects.  By default, when doing multipart upload, the range of unchanged data will  use  PUT  (copy  api)
              whenever possible.  When nocopyapi or norenameapi is specified, use of PUT (copy api) is invalidated even if this option is not specified.

       -o nocopyapi - for other incomplete compatibility object storage.
              For a distributed object storage which is compatibility S3 API without PUT (copy api).  If you set this option, s3fs do not use PUT with "x-amz-copy-source" (copy api). Be‐
              cause traffic is increased 2-3 times by this option, we do not recommend this.

       -o norenameapi - for other incomplete compatibility object storage.
              For a distributed object storage which is compatibility S3 API without PUT (copy api).  This option is a subset of nocopyapi option. The nocopyapi option does not use copy-
              api for all command (ex. chmod, chown, touch, mv, etc), but this option does not use copy-api for only rename command (ex. mv).  If this option is specified with nocopyapi,
              then s3fs ignores it.

       -o use_path_request_style (use legacy API calling style)
              Enable compatibility with S3-like APIs which do not support the virtual-host request style, by using the older path request style.

       -o listobjectsv2 (use ListObjectsV2)
              Issue ListObjectsV2 instead of ListObjects, useful on object stores without ListObjects support.

       -o noua (suppress User-Agent header)
              Usually s3fs outputs of the User-Agent in "s3fs/<version> (commit hash <hash>; <using ssl library name>)" format.  If this option is specified, s3fs suppresses  the  output
              of the User-Agent.

       -o cipher_suites
              Customize  the  list  of  TLS  cipher suites. Expects a colon separated list of cipher suite names.  A list of available cipher suites, depending on your TLS engine, can be
              found on the CURL library documentation: https://curl.haxx.se/docs/ssl-ciphers.html

       -o instance_name
              The instance name of the current s3fs mountpoint.  This name will be added to logging messages and user agent headers sent by s3fs.

       -o complement_stat (complement lack of file/directory mode)
              s3fs complements lack of information about file/directory mode if a file or a directory object does not have x-amz-meta-mode header.  As default, s3fs does not  complements
              stat information for a object, then the object will not be able to be allowed to list/modify.

       -o notsup_compat_dir (not support compatibility directory types)
              As  a  default, s3fs supports objects of the directory type as much as possible and recognizes them as directories.  Objects that can be recognized as directory objects are
              "dir/", "dir", "dir_$folder$", and there is a file object that does not have a directory object but contains that directory path.  s3fs  needs  redundant  communication  to
              support all these directory types.  The object as the directory created by s3fs is "dir/".  By restricting s3fs to recognize only "dir/" as a directory, communication traf‐
              fic can be reduced.  This option is used to give this restriction to s3fs.  However, if there is a directory object other than "dir/" in the bucket, specifying this  option
              is not recommended.  s3fs may not be able to recognize the object correctly if an object created by s3fs exists in the bucket.  Please use this option when the directory in
              the bucket is only "dir/" object.

       -o use_wtf8 - support arbitrary file system encoding.
              S3 requires all object names to be valid UTF-8. But some clients, notably Windows NFS clients, use their own encoding.  This option re-encodes invalid  UTF-8  object  names
              into valid UTF-8 by mapping offending codes into a 'private' codepage of the Unicode set.  Useful on clients not using UTF-8 as their file system encoding.

       -o use_session_token - indicate that session token should be provided.
              If credentials are provided by environment variables this switch forces presence check of AWS_SESSION_TOKEN variable.  Otherwise an error is returned.

       -o requester_pays (default is disable)
              This option instructs s3fs to enable requests involving Requester Pays buckets (It includes the 'x-amz-request-payer=requester' entry in the request header).

       -o mime (default is "/etc/mime.types")
              Specify  the  path of the mime.types file.  If this option is not specified, the existence of "/etc/mime.types" is checked, and that file is loaded as mime information.  If
              this file does not exist on macOS, then "/etc/apache2/mime.types" is checked as well.

       -o logfile - specify the log output file.
              s3fs outputs the log file to syslog. Alternatively, if s3fs is started with the "-f" option specified, the log will be output to the stdout/stderr.  You can use this option
              to  specify  the  log  file  that s3fs outputs.  If you specify a log file with this option, it will reopen the log file when s3fs receives a SIGHUP signal. You can use the
              SIGHUP signal for log rotation.

       -o dbglevel (default="crit")
              Set the debug message level. set value as crit (critical), err (error), warn (warning), info (information) to debug level. default debug level is  critical.   If  s3fs  run
              with "-d" option, the debug level is set information.  When s3fs catch the signal SIGUSR2, the debug level is bump up.

       -o curldbg - put curl debug message
              Put  the  debug message from libcurl when this option is specified.  Specify "normal" or "body" for the parameter.  If the parameter is omitted, it is the same as "normal".
              If "body" is specified, some API communication body data will be output in addition to the debug message output as "normal".

       -o no_time_stamp_msg - no time stamp in debug message
              The time stamp is output to the debug message by default.  If this option is specified, the time stamp will not be output in the debug message.  It is the same even if  the
              environment variable "S3FS_MSGTIMESTAMP" is set to "no".

       -o set_check_cache_sigusr1 (default is stdout)
              If  the  cache is enabled, you can check the integrity of the cache file and the cache file's stats info file.  This option is specified and when sending the SIGUSR1 signal
              to the s3fs process checks the cache status at that time.  This option can take a file path as parameter to output the check result to that file.  The file  path  parameter
              can be omitted. If omitted, the result will be output to stdout or syslog.

   utility mode options
       -u or --incomplete-mpu-list
              Lists multipart incomplete objects uploaded to the specified bucket.

       --incomplete-mpu-abort all or date format (default="24H")
              Delete  the  multipart incomplete object uploaded to the specified bucket.  If "all" is specified for this option, all multipart incomplete objects will be deleted.  If you
              specify no argument as an option, objects older than 24 hours (24H) will be deleted (This is the default value).  You can specify an optional date format.  It can be speci‐
              fied as year, month, day, hour, minute, second, and it is expressed as "Y", "M", "D", "h", "m", "s" respectively.  For example, "1Y6M10D12h30m30s".

FUSE/MOUNT OPTIONS
       Most  of  the  generic mount options described in 'man mount' are supported (ro, rw, suid, nosuid, dev, nodev, exec, noexec, atime, noatime, sync async, dirsync).  Filesystems are
       mounted with '-onodev,nosuid' by default, which can only be overridden by a privileged user.

       There are many FUSE specific mount options that can be specified. e.g. allow_other. See the FUSE README for the full set.

LOCAL STORAGE CONSUMPTION
       s3fs requires local caching for operation. You can enable a local cache with "-o use_cache" or s3fs uses temporary files to cache pending requests to s3.

       Apart from the requirements discussed below, it is recommended to keep enough cache resp. temporary storage to allow one copy each of all files open for reading and writing at any
       one time.

          Local cache with "-o use_cache"

       s3fs  automatically  maintains  a local cache of files. The cache folder is specified by the parameter of "-o use_cache". It is only a local cache that can be deleted at any time.
       s3fs rebuilds it if necessary.

       Whenever s3fs needs to read or write a file on S3, it first creates the file in the cache directory and operates on it.

       The amount of local cache storage used can be indirectly controlled  with "-o ensure_diskfree".

          Without local cache

       Since s3fs always requires some storage space for operation, it creates temporary files to store incoming write requests until the required s3 request size is reached and the seg‐
       ment has been uploaded. After that, this data is truncated in the temporary file to free up storage space.

       Per  file you need at least twice the part size (default 5MB or "-o multipart_size") for writing multipart requests or space for the whole file if single requests are enabled ("-o
       nomultipart").

NOTES
       The maximum size of objects that s3fs can handle depends on Amazon S3. For example, up to 5 GB when using single PUT API. And up to 5 TB is supported when Multipart Upload API  is
       used.

       s3fs  leverages  /etc/mime.types  to "guess" the "correct" content-type based on file name extension. This means that you can copy a website to S3 and serve it up directly from S3
       with correct content-types!

SEE ALSO
       fuse(8), mount(8), fusermount(1), fstab(5)

BUGS
       Due to S3's "eventual consistency" limitations, file creation can and will occasionally fail. Even after a successful create, subsequent reads can fail for an indeterminate  time,
       even  after  one  or  more successful reads. Create and read enough files and you will eventually encounter this failure. This is not a flaw in s3fs and it is not something a FUSE
       wrapper like s3fs can work around. The retries option does not address this issue. Your application must either tolerate or compensate for these failures, for example by  retrying
       creates or reads.

AUTHOR
       s3fs has been written by Randy Rizun <rrizun@gmail.com>.

S3FS                                                                                   February 2011                                                                               S3FS(1)
