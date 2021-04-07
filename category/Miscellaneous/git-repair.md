()                                                                                                                                                                                      ()

NAME
       git-repair - Fix a broken git repository

SYNOPSIS
       git-repair [--force]

DESCRIPTION
       This can fix a corrupt or broken git repository, which git fsck would only complain has problems.

       It does by deleting all corrupt objects, and retreiving all missing objects that it can from the remotes of the repository.

       If  that is not sufficient to fully recover the repository, it can also reset branches back to commits before the corruption happened, delete branches that are no longer available
       due to the lost data, and remove any missing files from the index. It will only do this if run with the --force option, since that rewrites history and throws  out  missing  data.
       Note that the --force option never touches tags, even if they are no longer usable due to missing data.

       After  running this command, you will probably want to run git fsck to verify it fixed the repository. Note that fsck may still complain about objects referenced by the reflog, or
       the stash, if they were unable to be recovered. This command does not try to clean up either the reflog or the stash.

       Since this command unpacks all packs in the repository, you may want to run git gc afterwards.

TESTING
       git-repair is able to test itself, by making a temporary copy of the git reposiory it's run in, damaging it in random ways, and checking that it can repair it so that git fsck re‐
       ports no problems.

       This is done using the --test parameter and associated --numtests and --retry parameters.

       Note  that  the  testing  will sometimes find repositories that can only be repaired when --force is used; this is expected. On the other hand, if it fails to recover a repository
       with --force, then the testing has found a bug!

AUTHOR
       Joey Hess <joey@kitenet.net>

       <http://git-repair.branchable.com/>

                                                                                                                                                                                        ()
