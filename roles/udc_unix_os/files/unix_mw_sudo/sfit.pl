#!/usr/bin/perl
#
# Copyright (C) 2013-2015, IBM Corporation.
# All Rights Reserved.
#
# Internal to IBM redistribution and use in source and binary forms, with
# or without modification, is permitted provided that the following
# conditions are met:
#
# * Redistributions of source code must retain the above copyright
#   notice, this list of conditions and the following disclaimer.
# * Redistributions in binary form must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer. in
#   the documentation and/or other materials provided with the
#   distribution.
# * Neither the name of the IBM Corporation nor the names of its
#   contributors may be used to endorse or promote products derived
#   from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
# IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
# PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER
# OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# MSG: SFIT2508
# DEF: These aliases require negation IBM_NONE_ALL,IBM_SHELLS_ALL,IBM_NONE_SA 
# RES: Use !IBM_NONE_ALL,!IBM_SHELLS_ALL,!IBM_NONE_SA
#
# MSG: SFIT2509
# DEF: Contains alias requiring negation or NOEXEC 
# RES: Use NOEXEC:IBM_SHELLESCAPE_ALL or !IBM_SHELLESCAPE_ALL
#
# MSG: SFIT2510
# DEF: Required command aliases 
# RES: Each of these must be defined as a command alias: IBM_NONE_ALL,IBM_SHELLS_ALL,IBM_SHELLESCAPE_ALL,IBM_NONE_SA
#
# MSG: SFIT2511
# DEF: Line contains naked ALL
# RES: Remove naked ALL 
#
# MSG: SFIT2515
# DEF: IBM ID found as the target id in "su - "
# RES: Enable secondary logging for this ID
#
# MSG: SFIT2516
# DEF: IBM ID found as the target id in "su"
# RES: Enable /etc/profile logging method for this ID
#
# MSG: SFIT2517
# DEF: Entry contains well-known root equivalents
# RES: Remove entries such as "crontab -e", "su - root", "env"
#
# MSG: SFIT2518
# DEF: Entry contains "su -" or "su" without a userid 
# RES: Add a userid to this entry
#
# MSG: SFIT2519
# DEF: Entry is doing subtractive approach on =*ALL
# RES: Fix the entry by explicitly granting rights
#
# MSG: SFIT2520
# DEF: "chown", "user", "chgrp", "group", "chmod", "mode" commands are not scoped 
# RES: Add userid scoping to the command
#
# MSG: SFIT2521
# DEF: IBM_SHELLESCAPE_ALL commands found not fenced with NOEXEC
# RES: Add NOEXEC limits to these commands
#
# MSG: SFIT2522
# DEF: An editor other than sudoedit was found
# RES: Remove disallowed editors from these entries 
#
# MSG: SFIT2523
# DEF: Entry found with "su" but no hyphen
# RES: Replace with "su -" and a userid for scoping
#
# MSG: SFIT2524
# DEF: Entry found that contains "=ALL" but not IBM_NONE_SA
# RES: 
#
# MSG: SFIT2525
# DEF: File-affecting commands cannot be used with * or empty scoping 
# RES: Change the scoping arguments used with this command
#
# MSG: SFIT2526
# DEF: File-affecting command with * in target and lacks all required negations for specified user
# RES: Add required negations for this command
#
# MSG: SFIT2527
# DEF: Last line in sudoers file does not contain '!SUDOSUDO' 
# RES: Add !SUDOSUDO to the end of the sudoers file
#
# MSG: SFIT4360
# DEF: Required entry not found in Cmnd_alias 
# RES: See details of message for missing alias name
#
# MSG: SFIT4364
# DEF: Required entry not found in Cmnd_alias 
# RES: See details of message for missing alias name
#
# MSG: SFIT4636
# DEF: Syntax problem with sudoers file
# RES: See details of message exact resolution
#
# MSG: SFIT4637
# DEF: Syntax problem with sudoers file
# RES: See details of message exact resolution
#
# MSG: SFIT4638
# DEF: Sudo compiled with noexec but 'NOEXEC' never used in sudoers file
# RES: None, informational only
#
# MSG: SFIT4639
# DEF: 'su' settings in /etc/profile or .profile, or user ID issue 
# RES: See details of message exact resolution
#
# MSG: SFIT4640
# DEF: Required line not found in sudoers file or invalid use of =ALL
# RES: See details of message exact resolution
#
# MSG: SFIT4641
# DEF: The indicated alias was not used as negation as required for the command
# RES: Include the alias to negate the command usage
#
# MSG: SFIT4754
# DEF: Group name does not exist!
# RES: 
#
# MSG: SFIT4755
# DEF: Contains no valid User_Aliases, or groups or userids; invalid or unreferenced header
# RES:
#
# MSG: SFIT4756
# DEF: User entry does not exist!
# RES: Review the line and fix the incorrect user entry
#
# MSG: SFIT4757
# DEF: Empty or invalid group specified
# RES: Review the group name and correct the entry
#
# MSG: SFIT4758
# DEF: User specified is not a valid userid
# RES: Review the userid specified and correct the entry
#
# MSG: SFIT4759
# DEF: Empty or invalid include file
# RES: Review the include statement and correct the specified line
#
# MSG: SFIT4760
# DEF: Contains no valid system groups listed in Alias
# RES: Review the alias definition and correct the entry
#
# MSG: SFIT4761
# DEF: Several possible negation problems
# RES: Review the specific message test and correct the entry indicated
#
# MSG: SFIT4762
# DEF: Entry is not scoped with user/group
# RES: Review the entry and apply scoping to the command
#
# MSG: SFIT4763
# DEF: Entry command is not scoped with user/group or negated
# RES: Review the line number with the entry and apply scoping
#
# MSG: SFIT4764
# DEF: Shell escape command negation problem
# RES: Review the line number with the problem and correct the negation
#
# MSG: SFIT4765
# DEF: Wildcard Command(s) beginning with '$_*' must be followed by '!$_..*' in same command line
# RES:
#
# MSG: SFIT4766
# DEF: Multiple lines use '=ALL' and substractive negations ('!') in sudoers file
# RES: Only one line may have'=ALL' and substractive negations
#
# MSG: SFIT4767
# DEF: Invalid use of Root Equivalent
# RES: Review the line with the root equivalent and correct the entry
#
# MSG: SFIT4768
# DEF: Command contains invalid '/*/*' argument
# RES: Review the line with the command and correct the entry
#
# MSG: SFIT4994
# DEF: Chmod need to use with [0-7][0-7][0145] permission
# RES:
#
# MSG: SFIT5996
# DEF: Command path specified ends with a '/*' but it should end with a /
# RES:
#
# MSG: SFIT10347
# DEF: Privileges are assigned to both IBM and non-IBM userids in the same entry
# RES: Separate privilege assignments for IBM and non-IBM userids
#
# MSG: SFIT10933
# DEF: Use of /su
# RES: The owner of the target userid must ensure secondary logging is active on the target userid
#
# MSG: SFIT10934
# DEF: Defaults env_file=/etc/sudo.env is not set in sudo base file
# RES: Ensure Defaults env_file=/etc/sudo.env is set in sudo base file
#
# MSG: SFIT10936
# DEF: Obsolete message
# RES: No action needed
#
# MSG: SFIT11043
# DEF: Contains no valid Cmnd_Aliases or commands
# RES: Review the line for errors in the entry
#
# MSG: SFIT14163
# DEF: Line endings in input file are not UNIX compatible
# RES: Use a tool such as dos2unix to fix the line endings in the file indicated
#
# MSG: SFIT15983
# DEF: Problem with environment or profile specified
# RES:
#
# MSG: SFIT17033
# DEF: Sudo keyword sudoedit should not be used with a /path/sudoedit specified
# RES: Remove the path from the sudoedit keyword
#
# MSG: SFIT18206
# DEF: Include file permissions incorrect - owner or mode problem
# RES: Review the file permissions and owner for sudo requirements
#
# MSG: SFIT19488
# DEF: The specified path cannot be accessed
# RES: Check for an incorrect path or permissions problem
#
# MSG: SFIT58079
# DEF: Unexpected command was used inside the specified Cmnd_alias 
# RES: Review the command and remove it from the alias
#
# MSG: SFIT60259
# DEF: One or more sysadmin entry problems
# RES:
#
# MSG: SFIT60261
# DEF: Begin or end template comment missing or non-standard
# RES:
#
# MSG: SFIT60266
# DEF: IBM team entry lacks standard header or footer
# RES:
#
# MSG: SFIT60267
# DEF: IBM entry not migrated to included file
# RES:
#
# MSG: SFIT60269
# DEF: Contains disallowed command
# RES: Remove the disallowed command from the entry
#
# MSG: SFIT62413
# DEF: Line contains unreplaced placeholder '<:'
# RES: Review the file for remaining placeholders and update
#
# MSG: SFIT64587
# DEF: In default mode there must be at least one active #include statement in the sudoers file
# RES:
#
# MSG: SFIT65507
# DEF: Use of negations with [:space:] is not permitted
# RES: Remove the [:space:] character class from the entry
#
# MSG: SFIT77555
# DEF: Excessive privilege currently assigned to both BAU and ADM user aliases
# RES: Review the permissions and remove the comman ids from any of the user alias.
#
# MSG: SFIT77558
# DEF: Entry grants customer root privileges 
# RES: Account team must have customer exception and risk acceptance in place
#
# MSG: SFIT77559
# DEF: Grants customer commands with shell escapes giving root privs and violating sudo tech spec 
# RES: Account team must have customer exception and risk acceptance in place
#
# MSG: SFIT77873
# DEF: No IBM labelled userids detected on system 
# RES: All userids treated as IBM owned
#
# MSG: SFIT67619
# DEF: No sudoedit and sudo permission to the file. 
# RES: Remove either edit or execute permission assigned to the file
#
# MSG: SFIT73868
# DEF: For RHEL4, AIX4.3.3, AIX5.2 and AIX5.3 NOEXEC and sudoedit are not functional. 
# RES: sudoedit and NOEXEC does not work on these operating systems.
#
# SFIT80470
# Non root run as user should have access to files/commands with permission 0x500 or strinct. 
# Account team should review and change the permission of violating command/files.
#
# MSG: SFIT140660
# DEF: Delete the output files from /var/log/sfit. 
# RES: Enhancement for cleanning up the log directory.
#
# MSG: SFIT67468
# DEF: violations for command visudo -c -f <inputfile> results. 
# RES: Enhancement for getting input sudoers file checked using visudo command.

# MSG: SFIT147509
# DEF: Add filter functionality to suppress false warnings.
# RES: Enhancement to apply filter to suppress false warning in *.CSV file.

# MSG: SFIT60264
# DEF: Check for multiple usage of user alias IBM_UNIX_SA and host alias IBM_UNIX_SA_HOSTS
# RES: Enhancement to report attention message if SA team entry aliases used more than once.

# MSG: SFIT73866
# DEF: Check for non printing  characters.
# RES: Enhancement to report/issue error message if non-printing character is used.

# MSG: SFIT180707   
# DEF: Add logic to verify that the tar extract command are specified with a destination directory or list files to be extracted
# RES: Checked the destination directory and violations are raised if destination directory doesnt exists

# MSG: SFIT76500
# DEF: Handle ';' or '|' coded outside of single quote marks in command entries
# RES: Checked the sudoers entries for ';' or '|' and removed all entry material after ';' or '|'

# MSG: SFIT60263
# DEF: Issue Attention message if non-standard include file name is used
# RES: Attention message raised if include file does not have the standard file name

# MSG: SFIT60432
# DEF: Issue a warning if IBM_NONE_ALL is used
# RES: Warning message raised if IBM_NONE_ALL is used

# MSG: SFIT136402
# DEF: Search string to use matching the actual userid name. To have another way to tell IBM from non-IBM userids
# RES: 's' flag added while running sfit which match the string. If matched in userid that userid is marked as IBM id.

# MSG: SFIT231521
# DEF: Sudo entry with wild card command, if it is in the world writable directory. 
# RES: Warning message to be raised if any sudo entry with wild card in command name and the containing directory have world writable permission.

# MSG: SFIT76184
# DEF: Add option to use external flat file as a list of IBM userid names in determining IBM userids in extended mode
# RES: New option added which will create the users in flat file as IBM owned/IBM id

# MSG: SFIT124468
# DEF: Negated command aliases should be validated against reference command alias format. 
# RES: Warning message to be raised if negation aliases are not as per given command alias format. 

# MSG: SFIT73863 
# DEF: Included file starting with 4[0-9][0-9] should use at least one command alias with user alias IBM_something_BAU  
# RES: Warning message to be raised if at least one command alias is not used with IBM_something_BAU user alias. 

# MSG: SFIT42903
# DEF: Add a parameter as-host so that in default mode the user can specify the hostname to be used as our frame of reference.
# RES: Warning message to be raised if the as host parameter is not present in the host alias list of sudoers.

# MSG: SFIT67243
# DEF: Add NOTE message when file in the include directory with valid filename is not used in sudoers file.
# RES: NOTE message for files in the include directory which are not used in sudoers.

# MSG: SFIT331843
# DEF: Check if used sudoers standard template used is not an outdated one. 
# RES: Issue warning if version of standard sudoers template file is lower than the minimum expected version. 

# MSG: SFIT331841
# DEF: Check the permission on the NON OSR directories used to host Sudo commands to prevent that the general user can create of modify a command / script defined in the sudo configuration file.
# RES: Issue a warning when sudoers file is located anything other than list of OSR directories having world editable permissions.  

# MSG: SFIT331838
# DEF: Develop a new check to verify the command called in a /bin/<shell> -c  command
# RES: Do not evaluate "<shell> -c" i.e. process only "command" followed after it. 

# MSG: SFIT399272
# DEF: Check that users which are in the sysadmin group isn't part of any middleware groups
# RES: Issue warning if User Alias from Middleware template contains users from system admin group mentioned in standard template 010_STD_SA_GLB

# MSG: SFIT438597
# DEF: Check that filenames used in commands are specified with a path
# RES: Issue warning if command and its file arguments does not start with /.

# MSG: SFIT73861
# DEF: Issue Note if #includedir is used, as it is incompatible on certain platforms.
# RES: Check if valid #includedir is used

# MSG: SFIT451935
# DEF: Issue Warning if permission are assigned to users or groups which are different just by case-intransitiveness 
# RES: Ensure there are no excessive privileges assigned to due case-insensitivity feature

# MSG: SFIT530602
# DEF: Issue warning if each directory containing #include does not specify the full path of the included directory.
# RES: Provide full path of directories to be specified with #includedir.

# MSG: SFIT530608
# DEF: Issue warning if Each file containing #include does not specify the full path of the included file.
# RES: Provide full path of files to be specified with #include.

# MSG: SFIT530614
# DEF: Issue warning if for each command and all existing directories in its path, have settings for "group" of w permission,if owned by default group for general users.
# RES: Ensure that the command has settings for "group" of r-x or more stringent.

# MSG: SFIT530611
# DEF: Issue warning if any file referenced by a  “env_file” directive in the /etc/sudoers is not owned by root or doesn't have 'group' which is one of the OS accepted OSR groups, or is world writable.
# RES: Ensure that the file is owned by root,have 'group' which is one of the OS accepted OSR groups,and must not be world writable.

# MSG: SFIT540074
# DEF: Issue warning if NOPASSWD tag is present.
# RES: Go through the guidelines mentioned in the url "http://ibm.biz/GSudoFAQ" for the usage of NOPASSWD.

# MSG: SFIT569847 
# DEF: Issue warning if for each command/script and all directories in its path, have settings for "other" of r-x or more stringent.  
# RES: Ensure that the command has settings for "other" of r-x or more stringent.

# MSG: SFIT603757
# DEF: Report filters in use (or the lack of) with the version for each filter in use
# RES: Ensure that /etc/sfit/filters folder should contains atleast one filter file and file extension should be .txt 

# MSG: SFIT603754
# DEF: The CSV file must always have the same amount of fields
# RES:

# MSG:SFIT613611 
# DEF: Issue WARNING if nonAscii characters present in sudoers file.
# RES: 

use strict;
#use warnings;
require Getopt::Std;
use Getopt::Std;
use File::Basename;
use File::Path qw/mkpath/;
use Cwd qw/abs_path/;
use Sys::Hostname;
use IO::File;
use IO::Dir;
use File::Copy;

my $pn       = basename($0);
my $PID      = "$$";
my $hostname = hostname();
my $version  = "470.20210319-040732-586";
my ($ShortHostName, $c) = split(/\./x, $hostname, 2); #Regular expression without "/x"
my %user_gecos_hash;                        #strict_use
my $TMPSUDOER1;                             #strict_use
my $TMPSUDOER;                              #strict_use
my $group_mbrs;                             #strict_use
my $group_alias_name_4756 = "";             #strict_use
my $entries_4756          = "";             #strict_use
my $group_mbrs_4756;                        #strict_use
my $group_header;                           #strict_use
#my %command_hash;                          #strict_use #is declared but not used
#my $user_gecos;                                #strict_use #is declared but not used
my @remove_lines    = ();                   #strict_use
my $user_in_parse_sudoers_file = "";        #strict_use
#my %command_aliases_for_user_alias;            #strict_use #is declared but not used
#my $host_writeLineWithGecos;               #strict_use #is declared but not used
#my $AType_writeLineWithGecos;              #strict_use #is declared but not used
#my $name_writeLineWithGecos;               #strict_use #is declared but not used
#my $Aid_writeLineWithGecos;                    #strict_use #is declared but not used
my $match_found=0;                          #strict_use
my $INC_LINE;                               #strict_use
my $CNT;                                    #strict_use
my $msg_CSV;                                #strict_use
my $parm = 0;                               #strict_use
my @sudoers_matches_wt_optn="";             #strict_use
my @sudoers_matches_wo_optn="";             #strict_use
my %User_Alias_hash_copy;                   #strict_use
my @all_matches_check_file_affecting_commands_with_negation="";                 #strict_use

my %UserRPT    = ();
my %NumUserRPT = ();

# To support the latest secondary logging checks
my $SH_LogAllUserids_active=0;

my $getOS=which_OS(); #Sub called with "&"
if(!defined $getOS){$getOS="";} #perl -w

my @CMD_NEG_GROUP_LIST=("IBM_CAT_NEG","IBM_CHGRP_NEG","IBM_CHMOD_NEG","IBM_CHOWN_NEG","IBM_COMPRESS_NEG","IBM_CP_NEG","IBM_DIFF_NEG","IBM_FIND_NEG","IBM_GUNZIP_NEG","IBM_GZIP_NEG","IBM_HEAD_NEG","IBM_LS_NEG","IBM_LN_NEG","IBM_MKDIR_NEG","IBM_MOUNT_NEG","IBM_MV_NEG","IBM_RM_NEG","IBM_RMDIR_NEG","IBM_TAIL_NEG","IBM_TAR_NEG","IBM_TOUCH_NEG","IBM_UMOUNT_NEG","IBM_UNCOMPRESS_NEG","IBM_ZCAT_NEG");

# Negation Arrays below for Enhancement 124468
my @IBM_CAT_NEG_Array=("!/bin/cat /* *","!/bin/cat * /* *","!/bin/cat *..*","!/bin/cat *./*");
my @IBM_CHGRP_NEG_Array=("!/bin/chgrp * /* *","!/bin/chgrp *..*","!/bin/chgrp *./*");
my @IBM_CHMOD_NEG_Array=("!/bin/chmod * /* *","!/bin/chmod *..*","!/bin/chmod *./*");
my @IBM_CHOWN_NEG_Array=("!/bin/chown * /* *","!/bin/chown *..*","!/bin/chown *./*"); 
my @IBM_COMPRESS_NEG_Array=("!/usr/bin/compress /* *","!/usr/bin/compress * /* *","!/usr/bin/compress *..*","!/usr/bin/compress *./*");
my @IBM_CP_NEG_Array=("!/bin/cp /* /* *","!/bin/cp * /* /* *","!/bin/cp *..*","!/bin/cp *./*");
my @IBM_DIFF_NEG_Array=("!/usr/bin/diff /* /* *","!/usr/bin/diff * /* /* *","!/usr/bin/diff *..*","!/usr/bin/diff *./*");
my @IBM_FIND_NEG_Array=("!/usr/bin/find * -exec *","!/usr/bin/find * -ok *","!/usr/bin/find *..*","!/usr/bin/find * -execdir *","!/usr/bin/find * -okdir *");
my @IBM_GUNZIP_NEG_Array=("!/usr/bin/gunzip /* *","!/usr/bin/gunzip -* /* *","!/usr/bin/gunzip *..*","!/usr/bin/gunzip *./*");
my @IBM_GZIP_NEG_Array=("!/usr/bin/gzip /* *","!/usr/bin/gzip -* /* *","!/usr/bin/gzip *..*","!/usr/bin/gzip *./*");
my @IBM_HEAD_NEG_Array=("!/usr/bin/head /* *","!/usr/bin/head * /* *","!/usr/bin/head *..*","!/usr/bin/head *./*");
my @IBM_LN_NEG_Array=("!/bin/ln /* /* *","!/bin/ln -* /* /* *","!/bin/ln *..*","!/bin/ln *./*");
my @IBM_LS_NEG_Array=("!/bin/ls /* *","!/bin/ls -* /* *","!/bin/ls *..*","!/bin/ls *./*");
my @IBM_MKDIR_NEG_Array=("!/bin/mkdir /* *","!/bin/mkdir * /* *","!/bin/mkdir *..*","!/bin/mkdir *./*");
my @IBM_MOUNT_NEG_Array=("!/bin/mount /* *","!/bin/mount * /* *","!/bin/mount *..*","!/bin/mount *./*","!/usr/sbin/mount /* *","!/usr/sbin/mount * /* *","!/usr/sbin/mount *..*","!/usr/sbin/mount *./*");
my @IBM_MV_NEG_Array=("!/bin/mv /* /* *","!/bin/mv * /* /* *","!/bin/mv *..*","!/bin/mv *./*");
my @IBM_RM_NEG_Array=("!/bin/rm /* *","!/bin/rm * /* *","!/bin/rm *..*","!/bin/rm *./*");
my @IBM_RMDIR_NEG_Array=("!/bin/rmdir /* *","!/bin/rmdir * /* *","!/bin/rmdir *..*","!/bin/rmdir *./*");
my @IBM_TAIL_NEG_Array=("!/usr/bin/tail /* *","!/usr/bin/tail -* /* *","!/usr/bin/tail *..*","!/usr/bin/tail *./*");
my @IBM_TAR_NEG_Array=("!/bin/tar /* /* *","!/bin/tar * /* /* *","!/bin/tar *..*","!/bin/tar *./*");
my @IBM_TOUCH_NEG_Array=("!/bin/touch /* *","!/bin/touch * /* *","!/bin/touch *..*","!/bin/touch *./*");
my @IBM_UMOUNT_NEG_Array=("!/bin/umount /* *","!/bin/umount * /* *","!/bin/umount *..*","!/bin/umount *./*","!/usr/sbin/umount /* *","!/usr/sbin/umount * /* *","!/usr/sbin/umount *..*","!/usr/sbin/umount *./*");
my @IBM_UNCOMPRESS_NEG_Array=("!/usr/bin/uncompress /* *","!/usr/bin/uncompress * /* *","!/usr/bin/uncompress *..*","!/usr/bin/uncompress *./*");
my @IBM_ZCAT_NEG_Array=("!/bin/zcat /* *","!/bin/zcat *..*","!/bin/zcat *./*");
my @IBM_ALL_NEG_Array=("IBM_CAT_NEG","IBM_CHGRP_NEG","IBM_CHMOD_NEG","IBM_CHOWN_NEG","IBM_COMPRESS_NEG","IBM_CP_NEG","IBM_DIFF_NEG","IBM_FIND_NEG","IBM_GUNZIP_NEG","IBM_GZIP_NEG","IBM_HEAD_NEG","IBM_LS_NEG","IBM_LN_NEG","IBM_MKDIR_NEG","IBM_MOUNT_NEG","IBM_MV_NEG","IBM_RM_NEG","IBM_RMDIR_NEG","IBM_TAIL_NEG","IBM_TAR_NEG","IBM_TOUCH_NEG","IBM_UMOUNT_NEG","IBM_UNCOMPRESS_NEG","IBM_ZCAT_NEG");
my @IBM_ALL_NEG_Array_ALL_Commands=(@IBM_CAT_NEG_Array,@IBM_CHGRP_NEG_Array,@IBM_CHMOD_NEG_Array,@IBM_CHOWN_NEG_Array,@IBM_COMPRESS_NEG_Array,@IBM_CP_NEG_Array,@IBM_DIFF_NEG_Array,@IBM_FIND_NEG_Array,@IBM_GUNZIP_NEG_Array,@IBM_GZIP_NEG_Array,@IBM_HEAD_NEG_Array,@IBM_LS_NEG_Array,@IBM_LN_NEG_Array,@IBM_MKDIR_NEG_Array,@IBM_MOUNT_NEG_Array,@IBM_MV_NEG_Array,@IBM_RM_NEG_Array,@IBM_RMDIR_NEG_Array,@IBM_TAIL_NEG_Array,@IBM_TAR_NEG_Array,@IBM_TOUCH_NEG_Array,@IBM_UMOUNT_NEG_Array,@IBM_UNCOMPRESS_NEG_Array,@IBM_ZCAT_NEG_Array);
my @all_matches_2521;
my @IBM_SHELLS_ALL = (
"/bin/ash","/usr/bin/ash",
"/bin/bash","/usr/bin/bash",
"/opt/freeware/bin/bash","/usr/opt/freeware/bin/bash",
"/bin/bash1","/usr/bin/bash1",
"/bin/bash2","/usr/bin/bash2",
"/bin/bsh","/usr/bin/bsh",
"/bin/ch","/usr/bin/ch",
"/bin/csh","/usr/bin/csh",
"/bin/jsh","/usr/bin/jsh",
"/bin/ksh","/usr/bin/ksh",
"/bin/ksh93","/usr/bin/ksh93",
"/bin/pfcsh","/usr/bin/pfcsh",
"/bin/pfksh","/usr/bin/pfksh",
"/bin/pfsh","/usr/bin/pfsh",
"/bin/psh","/usr/bin/psh",
"/bin/recsh","/usr/bin/recsh",
"/bin/rksh","/usr/bin/rksh",
"/bin/rsh","/usr/bin/rsh",
"/usr/ucb/rsh","/bin/sh",
"/usr/bin/sh","/usr/samples/tcpip/sendmail/sh",
"/usr/shell","/usr/bin/shell",
"/bin/tclsh","/usr/bin/tclsh",
"/opt/freeware/bin/tclsh","/usr/opt/freeware/bin/tclsh",
"/bin/tclsh8.4","/usr/bin/tclsh8.4",
"/opt/freeware/bin/tclsh8.4","/usr/opt/freeware/bin/tclsh8.4",
"/bin/tcsh","/usr/bin/tcsh",
"/bin/tsh","/usr/bin/tsh",
"/bin/wish","/usr/bin/wish",
"/opt/freeware/bin/wish","/usr/opt/freeware/bin/wish",
"/bin/wish8.4","/usr/bin/wish8.4",
"/opt/freeware/bin/wish8.4","/usr/opt/freeware/bin/wish8.4",
"/bin/wishx","/usr/bin/wishx",
"/bin/zsh"
);

# Below @IBM_UNIQUE_SHELL_NAMES and $shells_regex_list for Enhancement 331838
my @IBM_UNIQUE_SHELL_NAMES = uniq(map { basename($_) } @IBM_SHELLS_ALL); #require block map
my $shells_regex_list=join("|", @IBM_UNIQUE_SHELL_NAMES);


my @IBM_NONE_EDITOR=(
"/bin/vi","/bin/tvi",
"/bin/vim","/bin/rvim",
"/bin/gvim","/bin/evim",
"/bin/emacs","/bin/ed",
"/usr/bin/vi","/usr/bin/tvi",
"/usr/bin/vim","/usr/bin/rvim",
"/usr/bin/gvim","/usr/bin/evim",
"/usr/bin/emacs","/usr/bin/ed",
"/bin/view","/usr/bin/view",
"/bin/rvi","/usr/bin/rvi"
);
#ROOT_EQUIVALENTS_QUALIFICATION array is updated as per enhancement 381748 and enhancement 399268

my @ROOT_EQUIVALENTS_QUALIFICATION = ("/time", "/su root", "/su - root", "/awk", "/mkitab", "/command", "/chitab", "/visudo", "/script","/dsmc","/chuser","/passwd","/pwdadm","/modprpw","/chgrpmem","/mkgroup","/mkuser","/groupadd","/groupmod","/useradd","/usermod","/screen","/chsec");
# As per Task 421736: Disable Enhancement 412268 as per AppScan Review.
# Adding 8 commands by pushing commands to ROOT_EQUIVALENTS_QUALIFICATION
# Removing chage push into ROOT_EQUIVALENTS_QUALIFICATION arrray due to 564784 
push(@ROOT_EQUIVALENTS_QUALIFICATION, ("/faillog","/groups","/logins","/rmuser","/groupdel","/rmgroup","/userdel"));
my @ROOT_EQUIVALENTS_NO_QUALIFICATION = ("/su", "/su -", "/env", "/mount", "/umount", "/crontab", "/crontab -e","/sudosh","/chgroup");
my @ROOT_EQUIVALENTS = ();
my @newarray =();
if ($getOS =~ /AIX/)
{
    push(@ROOT_EQUIVALENTS_NO_QUALIFICATION, ("/smit", "/smitty"));
}

foreach my $root_alias (@ROOT_EQUIVALENTS_QUALIFICATION)
{
    push(@ROOT_EQUIVALENTS, $root_alias);
}

foreach my $root_alias (@ROOT_EQUIVALENTS_NO_QUALIFICATION)
{
    push(@ROOT_EQUIVALENTS, $root_alias);
}

my @SCOPED_COMMANDS = ("chgrp", "chown", "vi", "cat");

my @DISALLOWED_EDITORS = (
                       "/bin/vi",       "/bin/tvi",      "/bin/vim",       "/bin/rvim",    "/bin/gvim",    "/bin/evim",
                       "/bin/emacs",    "/bin/ed",       "/usr/bin/vi",    "/usr/bin/tvi", "/usr/bin/vim", "/usr/bin/rvim",
                       "/usr/bin/gvim", "/usr/bin/evim", "/usr/bin/emacs", "/usr/bin/ed",  "/bin/view",    "/usr/bin/view", 
                       "/bin/rvi",        "/usr/bin/rvi"
                      );

my @NEGATED_ALIASES = ("IBM_SHELLS_ALL", "IBM_NONE_SA", "SUDOSUDO", "IBM_NONE_EDITOR");#60265 - IBM_NONE_ALL is not required alias.

my @REQUIRED_COMMAND_ALIASES = ("IBM_SHELLS_ALL", "IBM_SHELLESCAPE_ALL", "IBM_NONE_SA", "IBM_NONE_EDITOR"); #60265 - IBM_NONE_ALL is not required alias.

#Added alias for workitem 2521

# my @IBM_SHELLESCAPE_ALL = (
                        # "/usr/bin/ed",           "/usr/bin/bash2bug",              "/usr/bin/bashbug",           "/usr/bin/find * -exec *",
                        # "/usr/bin/find * -ok *", "/bin/find * -ok *",              "/bin/find * -exec *",        "/usr/bin/ftp",
                        # "/usr/bin/find * -execdir *", "/usr/bin/find * -okdir *",   "/bin/find * -okdir *",      "/bin/find * -execdir *",
                        # "/usr/bin/less",         "/usr/bin/more",                  "/usr/bin/vi",                "/bin/vi",
                        # "/bin/ex",               "/bin/view",                      "/bin/gvim",                  "/bin/gview",
                        # "/bin/evim",             "/bin/eview",                     "/bin/vimdiff",               "/usr/bin/ex",
                        # "/usr/bin/view",         "/usr/bin/gvim",                  "/usr/bin/gview",             "/usr/bin/evim",
                        # "/usr/bin/eview",        "/usr/bin/vimdiff",               "/bin/ash",                   "/usr/bin/ash",
                        # "/bin/bash",             "/usr/bin/bash",                  "/opt/freeware/bin/bash",     "/usr/opt/freeware/bin/bash",
                        # "/bin/bash1",            "/usr/bin/bash1",                 "/bin/bash2",                 "/usr/bin/bash2",
                        # "/bin/bsh",              "/usr/bin/bsh",                   "/bin/ch",                    "/usr/bin/ch",
                        # "/bin/csh",              "/usr/bin/csh",                   "/bin/jsh",                   "/usr/bin/jsh",
                        # "/bin/ksh",              "/usr/bin/ksh",                   "/bin/ksh93",                 "/usr/bin/ksh93",
                        # "/bin/pfcsh",            "/usr/bin/pfcsh",                 "/bin/pfksh",                 "/usr/bin/pfksh",
                        # "/bin/pfsh",             "/usr/bin/pfsh",                  "/bin/psh",                   "/usr/bin/psh",
                        # "/bin/recsh",            "/usr/bin/recsh",                 "/bin/rksh",                  "/usr/bin/rksh",
                        # "/bin/rsh",              "/usr/bin/rsh",                   "/usr/ucb/rsh",               "/bin/sh",
                        # "/usr/bin/sh",           "/usr/samples/tcpip/sendmail/sh", "/usr/shell",                 "/usr/bin/shell",
                        # "/bin/tclsh",            "/usr/bin/tclsh",                 "/opt/freeware/bin/tclsh",    "/usr/opt/freeware/bin/tclsh",
                        # "/bin/tclsh8.4",         "/usr/bin/tclsh8.4",              "/opt/freeware/bin/tclsh8.4", "/usr/opt/freeware/bin/tclsh8.4",
                        # "/bin/tcsh",             "/usr/bin/tcsh",                  "/bin/tsh",                   "/usr/bin/tsh",
                        # "/bin/wish",             "/usr/bin/wish",                  "/opt/freeware/bin/wish",     "/usr/opt/freeware/bin/wish",
                        # "/bin/wish8.4",          "/usr/bin/wish8.4",               "/opt/freeware/bin/wish8.4",  "/usr/opt/freeware/bin/wish8.4",
                        # "/bin/wishx",            "/usr/bin/wishx",                 "/bin/zsh",                   "/usr/bin/zsh",
                        # "/bin/ftp",              "/bin/more",                      "/bin/less",                  "/bin/ed"
                       # );
# Updated IBM_SHELLESCAPE_ALL alias as per 	Defect 582603: SFIT2521 not generated for some configurations
my @IBM_SHELLESCAPE_ALL = (
    "/usr/bin/ed",                "/bin/ed",
    "/usr/bin/bash2bug",          "/usr/bin/bashbug",
    "/usr/bin/find * -exec *",    "/usr/bin/find * -ok *",
    "/bin/find * -exec *",        "/bin/find * -ok *",
    "/usr/bin/find * -execdir *", "/usr/bin/find * -okdir *",
    "/bin/find * -execdir *",     "/bin/find * -okdir *",
    "/usr/bin/ftp",               "/bin/ftp",
    "usr/bin/ex",                 "/bin/ex",
    "/usr/bin/less",              "/usr/bin/more",
    "/bin/more",                  "/usr/bin/pg",
    "/bin/pg",                    "/usr/bin/man",
    "/bin/man",                   "/usr/bin/vi",
    "/bin/vi",                    "/bin/view",
    "/usr/bin/view",              "/usr/bin/gview",
    "/bin/gview",                 "/usr/bin/eview",
    "/bin/eview",                 "/usr/bin/evim",
    "/bin/evim",                  "/usr/bin/gvim",
    "/bin/gvim",                  "/usr/bin/vimdiff",
    "/bin/vimdiff",               "/usr/bin/vim",
    "/bin/vim",                   "/usr/sbin/format"
);

my @FILE_AFFECTING_COMMANDS_ONE_TRGT = ("/bin/cat","/bin/chgrp","/bin/chmod","/bin/chown","/bin/compress",
                                     "/bin/find","/bin/gunzip","/bin/gzip","/bin/head","/bin/mkdir",
                                     "/bin/rm","/bin/rmdir","/bin/sort","/bin/sortm",
                                     "/bin/tail","/bin/touch","/bin/ls",
                                     "/bin/uncompress","/bin/vi","/bin/grep",
                                     "/bin/egrep","/bin/fgrep","/bin/zcat"
                                     );
my @FILE_AFFECTING_COMMANDS_FIXED_PATH_ONE_TARGET=(
                                                     "/bin/mount",     "/bin/umount",      "/usr/sbin/mount",   "/usr/sbin/umount",
                                                     "/sbin/mount",    "/sbin/umount",     "/usr/bin/strings",  "/usr/bin/ul",
                                                     "/bin/unlink",    "/usr/bin/unlink",  "/usr/sbin/unlink",  "/usr/sbin/exportfs"
                                                );
my @FILE_AFFECTING_COMMANDS_TWO_TRGT =("/bin/diff", "/bin/mv", "/bin/cp", "/bin/ln","/bin/tar");
# prevent duplicates when merging these two arrays

my @FILE_AFFECTING_COMMANDS = (
                                     "/usr/bin/cat",        "/usr/bin/chgrp",    "/usr/bin/chmod",    "/usr/bin/chown",
                                     "/usr/bin/compress",   "/usr/bin/find",     "/usr/bin/gunzip",   "/usr/bin/gzip",
                                     "/usr/bin/head",       "/usr/bin/mkdir",    "/usr/bin/rm",       "/usr/bin/rmdir",
                                     "/usr/bin/sort",       "/usr/bin/sortm",    "/usr/bin/strings",  "/usr/bin/tail",
                                     "/usr/bin/touch",      "/usr/bin/ul",       "/usr/bin/unlink",   
                                     "/usr/bin/ls",         "/usr/bin/tar",
                                     "/usr/bin/uncompress", "/usr/bin/vi",       "/usr/bin/exportfs", "/bin/cat",
                                     "/bin/chgrp",          "/bin/chmod",        "/bin/chown",        "/bin/compress",
                                     "/bin/find",           "/bin/gunzip",       "/bin/gzip",         "/bin/head",
                                     "/bin/mkdir",          "/bin/rm",           "/bin/rmdir",        "/bin/sort",
                                     "/bin/sortm",          "/bin/strings",      "/bin/tail",         "/bin/touch",
                                     "/bin/ul",             "/bin/unlink",       "/bin/ls",
                                     "/bin/tar",            "/bin/uncompress",
                                     "/bin/vi",             "/bin/exportfs",     "/usr/sbin/exportfs",
                                     "/sbin/exportfs",
                                     "/bin/cp", "/bin/mv", "/bin/diff", "/usr/bin/diff", "/usr/bin/mv",
                                     "/usr/bin/cp", "/bin/ln", "/usr/bin/ln",
                                     "/usr/bin/grep","/usr/bin/egrep","/usr/bin/fgrep","/bin/grep","/bin/egrep","/bin/fgrep"
                                    );

my $REQUIRED_IBM_ALIASES = " IBM_SHELLS_ALL IBM_SHELLESCAPE_ALL IBM_NONE_SA SUDOSUDO IBM_NONE_EDITOR "; #60265 - IBM_NONE_ALL is not required alias.
my %USED_IBM_ALIASES     = ();
my %DEFINED_IBM_ALIASES  = ();

# line number traceability

my %line_location = ();


my @IBM_Standard_Aliases= ("SUDOSUDO","IBM_NONE_ALL","IBM_NONE_SA","IBM_UNIX_SA_CMDS","IBM_SHELLS_ALL","IBM_SHELLESCAPE_ALL","IBM_NONE_EDITOR");

my @IBM_ALL_Standard_Aliases=(@IBM_ALL_NEG_Array,@IBM_Standard_Aliases);
my @osr=('/','/usr','/usr/share','/usr/share/dict','/var/adm','/usr/bin','/etc','/var','/bin','/opt','/usr/sbin');                  #331841
my %all_sudoers_files;              #strict_use
my @commands_to_check=("/bin/cat","/usr/bin/cat",
"/bin/chgrp","/usr/bin/chgrp",
"/bin/chmod","/usr/bin/chmod",
"/bin/chown","/usr/bin/chown",
"/usr/bin/compress","/bin/compress",
"/bin/cp","/usr/bin/cp",
"/usr/bin/diff","/bin/diff",
"/usr/bin/find","/bin/find",
"/usr/bin/gunzip","/bin/gunzip",
"/usr/bin/gzip","/bin/gzip",
"/usr/bin/head","/bin/head",
"/bin/ln","/usr/bin/ln",
"/bin/ls","/usr/bin/ls",
"/bin/mkdir","/usr/bin/mkdir",
"/bin/mount","/usr/bin/mount",
"/bin/mv","/usr/bin/mv",
"/bin/rm","/usr/bin/rm",
"/bin/rmdir","/usr/bin/rmdir",
"/usr/bin/tail","/bin/tail",
"/bin/tar","/usr/bin/tar",
"/bin/touch","/usr/bin/touch",
"/bin/umount","/usr/bin/umount",
"/usr/bin/uncompress","/bin/uncompress",
"/bin/zcat","/usr/bin/zcat");
###############################
# Global Variable Definitions #
###############################
my $args = @ARGV;
my $OS   = $^O;

my $HOST = hostname();
$HOST = trim($HOST); #Sub called with "&"
$HOST = (split(/\./x, $HOST))[0]; #Regular expression without "/x"

my $RPTDATE   = trim(`date +%Y%m%d`);    # yyyymmdd format #Sub called with "&"
my $RPTTIME   = trim(`date +%H%M%S`); #Sub called with "&"
my $OUTDIR    = "/var/log/sfitout";
my $no_log    = 0;
my $PKGID     = 1;
my $DEBUG     = "";
my $MERGEMODE = "";
my $WARN      = 0;
my $ERRORS    = 0;
my $NUMPASS   = 0;
my $AS_HOST="";

my $exitErr = 0;
my $exitWarn = 0;
my $exitAttn = 0;
my $exitNote = 0;
my $exitCust = 0;
my $finalexit = 0;

my @DISABLED_MESSAGES = ();
my @sudoers_file_host_expanded = ();
my @sudoers_file_with_runas = ();
my @sudoers_file_with_runas_expanded = ();

my @sudoers_file_without_useralias_expansion = ();
my @sudoers_file_merged = ();
my @comment_array = ();
my @files_refered = ();
my @files_included = ();
my @orig_comment_array = ();
my @metadata_comments = ();
my %violation_hash;
my %security_settings;
my @suppress_msg = ();
my @include_stmts =();
my %users_uid;
my $seclogin_active_all_users;
my $location_sudoers_file;
my $record_number="";
my $tempdir_path="";
my $IGNORE_CUSTOMER_ENTRY=0;
my $GECOS_RELIABLE=0;
my $check_opt_Usr=0;
my %User_Alias_hash=();
###Changes for Enhancement 76184
my $flat_file="";
my @empty_groups=();
my $timestamp="";                               #strict_use

my $ECHO        = 1;
my $NOECHO      = 0;
my $GECOS_TYPE  = "URT";
my $VALID_GECOS = " URT ORIG ";
my $IBM_STR     = 0xdeadbeef;
my $KEY_WORDS = " NOEXEC: EXEC: PASSWD: NOPASSWD: ";
my $ibmid_count="";
###Changes for task 136402
my $STD_STR = "";

my %IBMIDLIST     = ();
my %SEVERITY_LIST = ();    # SEVERITY_LIST{User/group/alias}=DEVIATION/WARNING
my %USER_DIR      = ();
my %USER_SHELL    = ();
my %USER_ASSIGN = ();
my %USER_ASSIGN_SKIP = ();

# --------------------------------------------------------------- #
# setup a trap to ensure all temp files are deleted upon any exit #
# --------------------------------------------------------------- #
local $SIG{INT}  = "INT_handler"; #require localized punctuation vars
local $SIG{QUIT} = "INT_handler"; #require localized punctuation vars
local $SIG{ABRT} = "INT_handler"; #require localized punctuation vars
local $SIG{TERM} = "INT_handler"; #require localized punctuation vars

##########################################################################
#  MAIN
##########################################################################
my $MASTERFILE = 1;
my $template_check = 0;
my $IS_ROOT = 0;
my $command_line = "";
my $count_of_filter_rules = 0;
my $count_of_filter_removals = 0;
my $count_of_warning_removals = 0;
my $count_of_error_removals = 0; 
my @template_files = ();

check_environment();

###Changes for Task 136402
my %opt ;
if(!getopts('hVvmendcEUltag:i:o:f:x:A:q:r:R:s:', \%opt)) #Package variable declared or used #Sub called with "&"
{
    help(); #Sub called with "&"
    show_use(); #Sub called with "&"
    exit 0;
}

HandleOpts(); #Sub called with "&"
my $configfile;
$security_settings{"commandline_sudoersfile"}=$configfile;
$security_settings{"passwd_file"}="/etc/passwd";
$security_settings{"group_file"}="/etc/group";
$security_settings{"etc_directory"}="/etc";
$security_settings{"tmp_directory"}="/tmp";
##########################

if($AS_HOST ne "")
{
    $hostname=$AS_HOST;
    $HOST=$AS_HOST;
    ($ShortHostName, $c) = split(/\./x, $hostname, 2);  #Regular expression without "/x"
    $HOST = trim($HOST); #Sub called with "&"
    $HOST = (split(/\./x, $HOST))[0]; #Regular expression without "/x"
}


##########################
# ---------------- #
# File Definitions #
# ---------------- #
my $logfile       = "$OUTDIR/$pn.$PID.log";
my $final_rptfile = "$OUTDIR/$pn.$PID.rpt";
my $groupfile     = "/etc/group";
my $pswdfile      = "/etc/passwd";

###Changes for Task Task 63893###
my $errfile       = "$OUTDIR/$pn.$PID.err.$$";
my $rptfile       = "$OUTDIR/$pn.$PID.rpt.$$";
my $ERR =  IO::File->new("$errfile", ">>") || die "can't open $errfile"; #prohibit indirect syntax
print $ERR "===================================================================\n";
print $ERR "Warnings and Errors\n";
print $ERR "===================================================================\n";
my $log_file_handle;

####Changes for the enhancement SFIT147509
my $filter_dir = "/etc/sfit/filters";
my $filter_output_file = $OUTDIR."/$pn\.$hostname\.filtered_output.csv" ;  
my @filter_files = ();
my $count1 = 0;
###Changes for Defect 156750
@filter_files = glob "$filter_dir/*.txt"; #@filter_files = <$filter_dir/*.txt>; #perlcritic
foreach my $file(@filter_files)
{
 my $fileN = $1 if $file =~ /([^\/]+)$/;
    if ($fileN =~ /SFIT_FILTER_GLB.+.txt$/) {
     # @files = sort grep { not m/\SFIT_FILTER_GLB.+.txt$/ and -f } glob "$filter_dir/*.txt";
      $count1 = $count1 + 1;
    }
}
if ($count1 >0) {
   
   @filter_files = sort grep { not m/\SFIT_FILTER_GLB.+.txt$/ and -f } glob "$filter_dir/*.txt";
}
my $templates_dir = "/etc/sfit/template_versions";
@template_files = glob "$templates_dir/MINIMUM_TEMPLATE_VERSIONS_*.txt";    

my $CSV     = "$OUTDIR/$pn.$HOST.$RPTDATE$RPTTIME.CSV";
my $CSV_SAVE = "$OUTDIR/$pn.$HOST.$RPTDATE$RPTTIME.unfiltered.CSV";
 
###Changes for Task Task 63893###
my $CSVTMP  = "$OUTDIR/$pn.$PID.tmpcsv";
my $CSVTMP2 = "$OUTDIR/$pn.$PID.tmpcsv2";

Delete_Temp_Files(); #Sub called with "&"

#### Changes for the Enhancement 67468
if (!grep({ /^SFIT67468$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x" 
{
    execute_visudo_on_configfile(); #Sub called with "&"
}
my $input_sudoers_file;                     #strict_use
my $NO_DOWNGRADE="";
my $verbose="";
my $EXTENDED_CHECK_USER;
#our $opt{l};               #strict_use #Package variable declared or used
if ($DEBUG)
{
    print "The following settings are in use:\n";
    print "\tPKGID=$PKGID\n";
    print "\tverbose=$verbose\n";
    print "\tno_log=$no_log\n";
    print "\tDEBUG=$DEBUG\n";
    print "\tconfigfile=$configfile\n";
    print "\tGECOS_TYPE=$GECOS_TYPE\n";
    print "\tIBM_STR=$IBM_STR\n";
    ##Changes for defect 135692
    print "\tProgram's Version=$version\n";
    print "\tSuppress SFIT10933=$AS_HOST\n"; 
    print "\tDowngrade Severity=$NO_DOWNGRADE\n";
    print "\tMERGEMODE=$MERGEMODE\n";
    #print "\tExtendedMode=$EXTENDED_CHECK_USER\n";
    print "\tIGNORE_CUSTOMER_ENTRY=$IGNORE_CUSTOMER_ENTRY\n";   
    #print "\tDISABLE_ALL_SFIT=$opt{l}\n"; #Package variable declared or used
    print "\tOutput Directory=$OUTDIR\n";   
    print "\tLines/Groups to Suppress=\n";
    print "\tProblem/Record Number=$record_number\n";
    print "\tReplace Include Dir Path=$tempdir_path\n";
    print "\tStandard Search String for IBM ID=$STD_STR\n"; 
}

if ($configfile eq "")
{
    $configfile = "/etc/sudoers";
    $location_sudoers_file = dirname($configfile);
    if ($verbose eq "yes")
    {
        print "Using default config file $configfile\n";
    }
}

my $RC = 1;
if (!$no_log)
{
    $log_file_handle = IO::File->new("$logfile", ">>") or die("$pn can't write to $logfile");   #prohibit indirect syntax
    prtlog("$pn Started"); #Sub called with "&"
}

update(); #Sub called with "&"
det_last_mod_date(); #Sub called with "&"

######################
# perform processing #
######################

# ----------------------------------------------- #
# load actual system settings for group, userid   #
#    and ibm-only userid definitions.          #
#    - used to expand alias definitions and    #
#      determine which sudoer lines are valid  #
#      for this host.                          #
# ----------------------------------------------- #
InitializeIBMAliases(); #Sub called with "&"

#Task 81814
if(((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER == 1)))
{
    load_group_file();     # load /etc/group or other appropriate file #Sub called with "&"
    load_passwd_file();    # load /etc/passwd or other appropriate file - identify IBM ids #Sub called with "&"
}

# Following has for minimum versions to be checked for. 
my %Sudo_Template_Versions = ();
load_template_version_file(); #Sub called with "&"

# ----------------- #
# load sudoers file #
# ----------------- #

my $ORIG_SUDOER = $configfile;    # keep original name in case we want to use it in reports
##changes for defect 239361
#SFIT67243
my @previouslyvisited=();
my @previouslyvisited1=();
my @files_refered1=();
my @files_included1=();
#my $foundfile=0;
my $config_abs_path = File::Spec->rel2abs($configfile);
my $config_basefilename = basename($config_abs_path);
check_sudo_template_file_min_reqd_version($config_abs_path,$config_abs_path,$config_abs_path); #Sub called with "&"
#&IncorporateFileIncludes();
IncorporateIncludes(); #Sub called with "&"
checkUnusedIncludes(@files_included); #Sub called with "&"

sub checkUnusedIncludes{
my @files_included_duplicate=@_; #require argument unpacking
my @get_file=();
my %dir_hash;
my $get_filename;
my %files_in_current_dir;
my %get_directory;
my @AllFilesInDir=();
my $get_dir;
#my $for_getline; #Reused variable name in lexical scope
    
my $line_number;
my $master_text;
my $filename;
my $header;
my $dir;
my $checkdir=0;
my @all_files;

if(@files_included_duplicate) 
{ 
    foreach my $inc_file(@files_included_duplicate)
    {       
        if($EXTENDED_CHECK_USER)
        {
            $get_dir=$inc_file;
            foreach my $visited(@previouslyvisited) #perlcritic
            {
                if($get_dir eq $visited)
                {
                    $checkdir=1;
                    last;
                }
                else
                {
                    $checkdir=0;
                    next;
                }
            }
            if($checkdir==0)
            {
                $get_dir =~ s/(.*)\/.*$/$1/x;  #Regular expression without "/x"
            }
            $get_directory{$get_dir}=$get_dir;
            @get_file=split "\/",$inc_file;
            $get_filename=$get_file[-1];
            if(!defined $files_in_current_dir{$get_dir}){$files_in_current_dir{$get_dir}="";}
            #if(defined $files_in_current_dir{$get_dir})
            {
            $files_in_current_dir{$get_dir}="$files_in_current_dir{$get_dir} $get_filename";
            }
            @get_file=();            
            @AllFilesInDir=(map { basename($_) } glob "$get_dir/*"); #require block map
            $dir_hash{$get_dir}=join ' ',@AllFilesInDir;
        }   
    }
    my $checkprevious=0;
    my $checkinclude=0;
    my $for_getline;
    foreach my $dir(%get_directory) #perlcritic
    {
        foreach my $visited(@previouslyvisited) #perlcritic
        {           
            if($dir eq $visited)
            {
                $checkprevious=1;
            }
        }
        if($checkprevious==0)
        {
            #if(defined $files_in_current_dir{$dir} )
            {
            $files_in_current_dir{$dir}=~s/^\s*//x;  #Regular expression without "/x"
            @files_included_duplicate=split " ",$files_in_current_dir{$dir};
            }
            @all_files=split " ",$dir_hash{$dir};
            foreach my $all(@all_files) #perlcritic
            {
                foreach my $included(@files_included_duplicate) #perlcritic
                {
                    $for_getline="#include $dir/$included";
                    ($filename, $line_number, $master_text) = get_line_location_text($for_getline); #Sub called with "&"
                    if($all eq $included)
                    {
                        $checkinclude=1;
                        last;
                    }
                }
                if($checkinclude==0)
                {
                    IssueNote($header,$line_number,$all,"File is not used in sudoers",$master_text,$filename,"SFIT67243");      #Sub called with "&"
                }
                $checkinclude=0;
            }
        }
        push @previouslyvisited,$dir;
        $checkprevious=0;
    }
}
return;  #require final return 
}
###changes for Enhancement 5813 
interpret_colon_as_new_definition(); #Sub called with "&"

sub interpret_colon_as_new_definition
{
    if($DEBUG)
    {
        print "In interpret_colon_as_new_definition\n"; 
    }   
   ###Changes for defect 251788
   copy("$configfile","$configfile.bak") or die "Copy failed: $!";
   my $cfgfile_handle =  IO::File->new("$configfile.bak", "<") or die "$pn: $configfile.bak: $!"; #prohibit indirect syntax
   my $OUT =  IO::File->new('/tmp/temp_file', ">");   #prohibit indirect syntax
   my $i=0;
   my $nline;               #strict_use
   my $header;              #strict_use
   my $header1;             #strict_use
   my $rest;                #strict_use
   my $continuation=0;
   my @bkp_line_array=();
   #my ($f_name, $l_number, $m_text);
   my $f_name="";
   my $l_number=0;
   my $m_text="";
   while (my $line = <$cfgfile_handle>)
   {        
        $line =~ s/\r//xig; #Regular expression without "/x"
        FIXLINE:                                              
        if ($line !~ m/^\s*\#/x and $line =~ /\:\s*(\\)?\s*$/x) #Regular expression without "/x"
        { 
            # handle continuation chars and trailing white space
            chomp($line);               
            ($f_name, $l_number, $m_text) = get_line_location_text($line);          #Sub called with "&"
            if ( $continuation > 0 )
            {               
                ($f_name, $l_number, $m_text) = get_line_location_text($bkp_line_array[0]); #Sub called with "&"
            }   
            
            push(@bkp_line_array,$line);
            
            $nline = <$cfgfile_handle>;         
            $nline =~ s/^\s+//x;                                          # remove any leading spaces             #Regular expression without "/x"
            $line =~ s/\\\s*$//xg;            #Regular expression without "/x"
            $line .= $nline;
            
            if (!eof($cfgfile_handle))
            {
                $continuation++;
                chomp($line);
                goto FIXLINE;
            }           
        }
        else
        {
            $continuation=0;
            @bkp_line_array=();
        }           
        my %replace_hash = ();
        my $replaceString;my $actualString;
        if($line !~ m/^\s*\#/x and $line !~ m/sha224\s*\:/xig and $line !~ m/Defaults\s*\:/xig and $line =~ m/\:\s*(\\)?/xig ) #Regular expression without "/x"
        {          
           $line =~ s/((NOPASSWD)|(PASSWD)|(EXEC)|(NOEXEC)|(SETENV))+\s*\:/<>$1<>/xig;           #Regular expression without "/x" #ProhibitComplexRegexes
           $line =~ s/((NOSETENV)|(LOG_INPUT)|(NOLOG_INPUT))+\s*\:/<>$1<>/xig;           #Regular expression without "/x"
           $line =~ s/((LOG_OUTPUT)|(LOG_OUTPUT))+\s*\:/<>$1<>/xig;  #ProhibitComplexRegexes 
           $line =~ s/chown\s*\-\-from\=\:(.*?)\s*\:(.*?)/chown \-\-from\=<>$1<>$2/xg; #Regular expression without "/x"
           $line =~ s/chown\s*(.*?)\s*\:\s*(.*?)\s*/chown $1<>$2/xg;#Regular expression without "/x"
           my @d1=();
           my @d2 =();
           $line =~ s/\<\:/ESCAPE_LESSTHAN_ESCAPE_COLON/xg;  #Regular expression without "/x"
           $line =~ s/\\\:/ESCAPE_ESCAPE_ESCAPE_COLON/xg;    #Regular expression without "/x"
           ###Changes for defect 251788        
           $line =~ s/\:\s*\!/ BUG/xg;                  #Regular expression without "/x"
            if($line =~ m/\([^\)]+\)/x)  #Regular expression without "/x"
            {   
                my $temp = $line;
                my @matches = $temp =~ m/\(.*?\)/xg; #Regular expression without "/x"                                             
                my $matchedCount = scalar(@matches);                
                my $count=1;                
                while ( $count <= $matchedCount )
                {
                    $replaceString = "Replace$count";  # Ex. Replace1,Replace2                  
                    $actualString=$matches[$count-1];                   
                    $line =~ s/\Q$actualString\E/$replaceString/x; #Regular expression without "/x" # Replace actual pattern with Replace1..Replace2.. likewise                   
                    $replace_hash{$replaceString} = $actualString;                                                          
                    $count++;
                }                                   
            }                               
           @d1 = split(/:/x,$line);    #Regular expression without "/x"       
           my $tmp = $d1[0];                       
           ($header, $rest)=split(/ /,$tmp,2) if($tmp !~ m/^\s*\#/x);  #Regular expression without "/x"         
           ($header1)=split(/\s+/x,$header) if($header !~ m/^\s*\#/x);  #Regular expression without "/x"  

           foreach my $x(@d1) {                    
               $x =~ s/chown\s*\-\-from\=<>(.*?)<>(.*?)/chown \-\-from\=:$1 :$2/xg; #check#Regular expression without "/x"
               $x =~ s/chown\s+(.*?)<>(.*?)/chown $1\:$2/xg; #Regular expression without "/x"                       
               $x =~ s/<>(.*?)<>/$1:/xg; #Regular expression without "/x"
               $x =~ s/ESCAPE_LESSTHAN_ESCAPE_COLON/\<\:/g;
               $x =~ s/ESCAPE_ESCAPE_ESCAPE_COLON/\\\:/g;
               ###Changes for defect 251788
               $x =~ s/ BUG/\: \!/g;                                           
               $x =~ s/\(//xg; #Regular expression without "/x"
               $x=~ s/\)//xg;  #Regular expression without "/x"                          
               $x = $header1." "."$x" if((defined $header1) && ($x !~ /\Q$header1\E/xg));   #Regular expression without "/x"                         
               push(@d2,$x);
            }
            $line = "";         
            foreach my $ele(@d2) #perlcritic
             {
              $line .= "$ele\n";                  
             }                       
      }           
      foreach my $x(keys %replace_hash)
      {
           $x =~ s/\(//xg; #Regular expression without "/x"
           $x=~ s/\)//xg; #Regular expression without "/x" 
           $line =~ s/$x/$replace_hash{$x}/xg; #Regular expression without "/x"                     
      }                   
    print $OUT "$line";
    #{      
        my @line_array = split(/\n/x,$line);  #Regular expression without "/x"
        for my $ln(@line_array)
        {           
            my ($name, $number, $text) = get_line_location_text($ln);           #Sub called with "&"
            my $master_flag;
            if ( $m_text =~ m/^master$/x)  #Regular expression without "/x"
            {
                $master_flag=1;
            }
            else 
            {
                $master_flag=0;
            }
            # Add line location for those multi-line sudoers entries having multiple hosts entries separated by colon. Defect 299783
            add_line_location($ln, "$f_name", $l_number, $master_flag); #Sub called with "&"
            $l_number++;  # Line number increment is used to get real line number, can be removed if same line number is required.              
        }
    #}      
   }    # end of while   
   $cfgfile_handle->close();
   $OUT->close();
   ###Changes for defect 251788
   move("/tmp/temp_file","$configfile.bak") or die "Move failed: $!";
   return ; #require final return 
}

###Changes for defect 247963
remove_blank_line(); #Sub called with "&" #Sub called with "&"
sub remove_blank_line
{ 
   ###Changes for defect 251788 
   my $IN =  IO::File->new("$configfile.bak", "<");   #prohibit indirect syntax
   my $WRITE =  IO::File->new('/tmp/temp_file1', ">"); #prohibit indirect syntax
   while(<$IN>) 
   {       
       if($_ !~ m/^$/x)#Regular expression without "/x"
       {
          print $WRITE "$_";           
       }
   }
   ###Changes for defect 251788
   $IN->close();
   $WRITE->close();
   move("/tmp/temp_file1","$configfile.bak") or die "Move failed: $!";
   return ; #require final return  
}

if (!grep({ /^SFIT19488$/x } @DISABLED_MESSAGES) && ((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER == 1)))  #Regular expression without "/x"#require block grep #prohibit mixed boolean operators
{
    check_security_settings(); #Sub called with "&"
}
# Array @sudoers_file_dot is created for defect 304135
my @sudoers_file_dot=();
my @sudoers_file;           #strict_use
load_sudoers_file_into_array();    # load tmp file into @sudoers_file array #Sub called with "&"
@sudoers_file_dot=@sudoers_file;

my %groups;         #strict_use
my %gids;           #strict_use
my %user_groups;    #strict_use
my %users;          #strict_use
# Process Netgroups here since @sudoers_file array(having Netgroups from sudoers file prefixed with %_PLUS_ ) not available inside sub load_group_file
if(((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER == 1)))
{   
    if ($DEBUG)
    {
        print "Processing Netgroups:\n\n";  
        print "Operating System : $getOS\n"; 
    }   
    
    foreach my $line(grep({ /%_PLUS_/x } @sudoers_file_with_runas))  #Regular expression without "/x" 
    #foreach my $line(grep({ /%_PLUS_/ } @sudoers_file))  #require block grep
    {
        my @headerArray=();
        if ($line =~ m/User_Alias/)                 # processing netgroups from User_Alias sudoers entries                 
        {           
            my ($header,$rest) = split(/=/x, $line, 2); #Regular expression without "/x"
            @headerArray = split(/,/x,$rest);           #Regular expression without "/x"  
        }
        else                                        # processing netgroups from other sudoers entries 
        {
            my @newrestArray=();        
            my ($header,$rest) = split(/=/x, $line, 2);  #Regular expression without "/x"     
            my ($headerField,$host) = split(/\s/x, $header, 2); #Regular expression without "/x"
            @headerArray = split(/,/x,$headerField); #Regular expression without "/x"
            @newrestArray = split(/,/x, $rest); #Regular expression without "/x"
            foreach my $netgroupentry(@newrestArray)
            {
                $netgroupentry =~ s/\(//xg; #Regular expression without "/x"
                $netgroupentry =~ s/\)//xg; #Regular expression without "/x"
                if ($netgroupentry=~/^\s*(%_PLUS_)([A-Za-z0-9_]+)/x)#Regular expression without "/x"
                {
                    
                    $netgroupentry=~s/\s*(%_PLUS_)([A-Za-z0-9_]+)(\s*.*)/$1$2/xg;#Regular expression without "/x"
                    push(@headerArray,$netgroupentry);
                    
                    
                }
            }
        }       
        foreach my $element (@headerArray)
        {
            if( $element =~ m/^%_PLUS_/xg)  #Regular expression without "/x"
            {
                my $netgroupfield = $element;
                $netgroupfield =~ s/%_PLUS_//x;   #Regular expression without "/x"            
                my ($netgroupExistStatus,$users_array_ref) = check_netgroup_and_users($netgroupfield);      #Sub called with "&"
                my @netgroup_users_array=@{$users_array_ref}; #Double-sigil dereference
                if ($DEBUG)
                {
                    print "Netgroup Containing Line :: $line\n";
                    print "Extracted Netgroup Name :: $netgroupfield\n";            
                }
                if ( $netgroupExistStatus == 0 )
                {               
                    my $netgroupUserList=join(',', @netgroup_users_array);
                    # Adding Netgroup as group and Netgroup users to hash   
                    $groups{$netgroupfield} = $netgroupUserList;
                    if ($DEBUG)
                    {
                        print "Users for Netgroup $netgroupfield :: $netgroupUserList\n";   
                    }           
                }
                else
                {
                    if ($DEBUG)
                    {
                        print "Users not found for Netgroup $netgroupfield\n";
                    }           
                }               
            }           
        }       
    }
    if ($DEBUG)
    {
        #Printing Recent groups hash  
        print "\nLOAD_GROUP_FILE\n";
        print "\tUPDATED GROUPS:\n";
        foreach (sort keys %groups)
        {
            print "\t\tgroups{$_}=$groups{$_}\n";
        }
        # GIDS are not available for Netgroups
        print "\tGIDS:\n";
        foreach (sort keys %gids)
        {
            print "\t\tgids{$_}=$gids{$_}\n";
        }
    }       
}

sub check_netgroup_and_users
{
    if ($DEBUG)
    {
        #check for existance of getent command 
        my $getent_path=`which getent 2>/dev/null`;     
        if (!$getent_path) 
        {
            print "getent command does not exist\n";        
        }
        else 
        {
            print "getent command exists at $getent_path\n";
        }   
    }
    my $netgroupname="$_[0]";
    my $netgroupExistStatus;
    my @unique_netgrpUsers=();  
    my $value=`getent netgroup $netgroupname 2>/dev/null`;
    my $extracted_netgrp="";
    #$value="netgroup3             ( , ldapuser2, svl.ibm.com) ( ,ldapuser3, svl.ibm.com) ( ,, svl.ibm.com) ( ,-, svl.ibm.com)";
    #$value="netgroup3             ( ,vaibhavk , svl.ibm.com) ( ,srikantv, svl.ibm.com) ( ,, svl.ibm.com) ( ,-, svl.ibm.com)";
    #if ($value =~ /^\s*(?!<\()([\w-]+)(?!=\))/) 
    if($value =~/\s*$netgroupname\s+\(.*?\)/x)  #Regular expression without "/x"
    {
        #$extracted_netgrp = $1;
        $extracted_netgrp = $netgroupname;
        
    }
    if ( $extracted_netgrp eq $netgroupname ) 
    {
        my @entries=();
        my @netgrpUsers=();     
        push @entries, $1 while $value =~ /\((.*?)\)/xg;  # host1,user1,domain1 #Regular expression without "/x"
        for my $entry (@entries)  #entry[0]=host1,user1,domain1 
        {           
            my ($host, $user, $domain) = split /,/x, $entry; #Regular expression without "/x"
            if ( $user !~ /^\s*$/x  &&  $user !~ /^\s*-\s*$/x ) #Regular expression without "/x"
            {
                push @netgrpUsers, $user;           
            }   
        }
        if ( scalar(@netgrpUsers) > 0 )
        {           
            # Remove Leading and Trailing Spaces before userid.
            for (my $i = 0; $i < scalar(@netgrpUsers); $i++) 
            {
                $netgrpUsers[$i]=~ s/^\s+|\s+$//xg; #Regular expression without "/x"
            }
            # Keep unique userids in array
            #@unique_netgrpUsers = do { my %seen; grep { !$seen{$_}++ } @netgrpUsers }; 
            @unique_netgrpUsers = do { my %seen; grep { !$seen{$_}++ } @netgrpUsers };                      
        }
    $netgroupExistStatus=0;     
    }
    else
    {
        if ($DEBUG)
        {
            print "Netgroup $netgroupname does not exists!\n";          
        }
        $netgroupExistStatus=1; 
    }
    return ($netgroupExistStatus,\@unique_netgrpUsers);
}
my $sudoversion;
my $case_insensitive_group=0; # this is default i.e. 1=enabled,0=disabled 
my $case_insensitive_user=0; # this is default i.e. 1=enabled,0=disabled
my $case_insensitive_enabled_sudo_version=0;

alert_on_forbidden_syntax(); #Sub called with "&"

load_host_aliases();    # load only Host_Aliases valid for this host, remove rest from @sudoers_file #Sub called with "&"
###Changes for defect 204861
@sudoers_file_without_useralias_expansion=@sudoers_file;
my @sudoers_file_without_useralias_expansion_tmp=();
my @sudoers_file_expanded_without_useralias_expansion=ExpandAlias(\@sudoers_file_without_useralias_expansion,\@sudoers_file_without_useralias_expansion_tmp); #Sub called with "&"

process_user_assignment(\@sudoers_file,$check_opt_Usr); #Sub called with "&"
# foreach my $line(grep({ /^\s*User_Alias\s+.*/ } @sudoers_file)) #require block grep
# {
    # my $junk=expand_useralias_groups($line,1); #Sub called with "&"
# }
my @Cmnd_Alias;                 #strict_use
my @User_Alias;                 #strict_use
my @Defaults;                   #strict_use
evaluate_sudo_version_and_case_insensitivity(); #Sub called with "&"

if ( $case_insensitive_group == 1  ) 
{
    #print"\nincaseinsentitve ";
    foreach my $line(grep({ /^\s*User_Alias\s+.*/x } @sudoers_file)) #require block grep #Regular expression without "/x"
    {   
        my $junk=expand_useralias_groups_insensitive($line,1); #Sub called with "&"
        if ($DEBUG)
        {
            print "\njunk1=$junk\n";    
            print "\n$case_insensitive_user "       ;   
        }
    }
}
else 
{
    #print"\n not incaseinsentitve ";
    foreach my $line(grep({ /^\s*User_Alias\s+.*/x } @sudoers_file)) #require block grep #Regular expression without "/x"
    {   
        my $junk=expand_useralias_groups($line,1); #Sub called with "&"
        if ($DEBUG)
        {
            print "\njunk2=$junk\n";    
            print "\n$case_insensitive_user "       ;   
        }
    }
    
}
LoadOtherAliases();     # loads Defaults, User_Alias, Command_Alias, Runas_Aliaslines - expands User_Aliases : invalid items removed from @sudoers_file #Sub called with "&"

# ----------------------------------------------------------------------------------------------------------- #
# Get Installed Sudoers version and evaluate whether case-insensitivity for users and groups is enabled or not#
# ----------------------------------------------------------------------------------------------------------- #

#&evaluate_sudo_version_and_case_insensitivity;

sub evaluate_sudo_version_and_case_insensitivity #Sub called with "&"
{
    if (`sudo -V 2>/dev/null` =~ /^Sudo\s+version\s+(.+)/x) #Regular expression without "/x"
    {
        $sudoversion=$1;
        $sudoversion =~ s/(.+)p\d+/$1/xg; #Regular expression without "/x" # this is to substitute versions with p ex. 1.8.25p1 => 1.8.25
        if ($DEBUG)
        {
            print "Sudo version = $sudoversion\n";
        }
        my $version_return_val = get_larger_version("1.8.23","$sudoversion"); #Sub called with "&"
        if ( $version_return_val == 1 )
        {
            if ($DEBUG)
            {
                print "Sudo version $sudoversion is less than 1.8.23,SFIT451935 will not be applicable\n";
            }
        }
        elsif ( $version_return_val == -1 or $version_return_val == 0 )
        {
            $case_insensitive_enabled_sudo_version=1;
            $case_insensitive_group=1; # this is default i.e. 1=enabled,0=disabled 
            $case_insensitive_user=1; # this is default i.e. 1=enabled,0=disabled
            # Checking value of case_insensitive in @Defaults Array
            # if (grep(/^\s*Defaults\s+\!\s*case_insensitive_group/, @Defaults))
            # {
               # $case_insensitive_group=0; 
            # }
            # if (grep(/^\s*Defaults\s+\!\s*case_insensitive_user/, @Defaults))
            # {
               # $case_insensitive_user=0;
            # }
            my @Defaults_arr = grep({ /^\s*Defaults\s+/x } @sudoers_file);#Regular expression without "/x"
            foreach my $default_line (reverse @Defaults_arr)
            {
                if ($default_line=~/^\s*Defaults\s+(\!?)\s*case_insensitive_group/x)#Regular expression without "/x"
                {
                    my $negated_field=$1;
                    if ($negated_field=~/\!/x)#Regular expression without "/x"
                    {
                        $case_insensitive_group=0;
                        last;
                    }
                    else
                    {
                        $case_insensitive_group=1;
                        last;
                    }
                }
            }
            foreach my $default_line (reverse @Defaults_arr)
            {
                if ($default_line=~/^\s*Defaults\s+(\!?)\s*case_insensitive_user/x)#Regular expression without "/x"
                {
                    my $negated_field=$1;
                    if ($negated_field=~/\!/x) #Regular expression without "/x"
                    {
                        $case_insensitive_user=0;
                        last;
                    }
                    else
                    {
                        $case_insensitive_user=1;
                        last;
                    }
                }
            }
            if ($DEBUG)
            {
                print "Sudo version $sudoversion >= 1.8.23\n";
                print "case_insensitive_group setting = $case_insensitive_group\n"; 
                print "case_insensitive_user setting = $case_insensitive_user\n"; 
            }
        }
    }
    else
    {
        if ($DEBUG)
        {
            print "Unable to fetch Sudo Version\n";  
        }
    }
    
    return;
}
###Changes for defect 204861
if (((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER == 1)))
{
    process_hostwise_entries(); #Sub called with "&"
}
# Below 2 temporary arrays defined for reporting SFIT11043 in all modes. sub ExpandAlias_main is created from sub ExpandAlias subroutine.  
# Warning message has been commented from sub ExpandAlias since &ExpandAlias is called multiple times and same warning mesage was getting displayed multiple times. 
my @temp_alias_array_SFIT11043=();
my @temp_alias_array=();                    #strict_use
my @temp_sudoers_file_expanded_SFIT11043=ExpandAlias_main(\@sudoers_file,\@temp_alias_array); #Sub called with "&"
# 
if (((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER == 1)))
{
    my @temp_alias_array_copy=(); #Reused variable name in lexical scope
    my @temp_sudoers_file_expanded=ExpandAlias(\@sudoers_file,\@temp_alias_array_copy); #called this early because 76845 needs acced to expanded aliases as well #Sub called with "&"
    my $array_ref = Filter_negations(\@temp_sudoers_file_expanded,0);             #Get reference of sudoers array and continue using it #Sub called with "&"
    @temp_sudoers_file_expanded = @{$array_ref};
    process_user_assignment(\@temp_sudoers_file_expanded,0); #Sub called with "&"
}
#expand_useralias_groups();
  
if ( $case_insensitive_group == 1 ) #case 1: group=1 and user=1 #case2 : group=1 and user=0
{
    parse_sudoers_file_insensitive(); #Sub called with "&"
}
else #case 1: group=0 and user=0 #case2 : group=0 and user=1
{
    parse_sudoers_file(); #Sub called with "&"
}


#Changes for SFIT42903 
if (!grep({ /^SFIT42903$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    if(!defined $EXTENDED_CHECK_USER){$EXTENDED_CHECK_USER=0;}
    if(($EXTENDED_CHECK_USER == 0))
    {
        checkAsHost(@sudoers_file); #Sub called with "&"
    }
}

sub checkAsHost
{
    my @sudoers_file_duplicate=@_; #require argument unpacking 
    my $for_filename=0;
    my $basefile;           #strict_use
    my $index;              #strict_use
    my $temphost;           #strict_use
    my $tempHostAlias;      #strict_use
    my @tempHostarr=();     #strict_use
    my %Host_Aliases;       #strict_use
    #my $validhost=0;       #strict_use #Reused variable name in lexical scope
    my $checkhost=0;        #strict_use
    my $filename;           #strict_use
    my $master_text;        #strict_use
    my $line_number;        #strict_use
    
     
    if($AS_HOST ne "")
    {
        if ($DEBUG)
        {
            print "In SFIT42903 Function";
        }
        #for($index=0;$index<=$#sudoers_file_duplicate;$index++)
        for(0..$#sudoers_file_duplicate)
        {
            if($for_filename==0 and $sudoers_file_duplicate[$_]!~/Cmnd_Alias|Runas_Alias|Host_Alias|Defaults/x) #Regular expression without "/x"
            {
            $basefile=$sudoers_file_duplicate[$_];
             ($filename, $line_number, $master_text) = get_line_location_text($basefile); #Sub called with "&"
            $basefile=$filename;
            $for_filename=1;
            }
            if($sudoers_file_duplicate[$_]!~/Cmnd_Alias|Runas_Alias|Host_Alias|Defaults/x)#Regular expression without "/x"
            {
                if($sudoers_file_duplicate[$_]=~/[A-Za-z0-9%_]+\s+([A-Za-z0-9_]+)/x) #Regular expression without "/x" ##Capture variable used outside conditional
                {
                $temphost=$1;
                $tempHostAlias=$Host_Aliases{$temphost};
                }
                if(!defined $tempHostAlias ){$tempHostAlias="";}
                @tempHostarr=split ',',$tempHostAlias;
                my $validhost=0;
                my $checkHost=0;
                foreach(@tempHostarr)
                {
                    if($AS_HOST eq $_)
                    {
                        $validhost=1;
                    }
                }
                if($AS_HOST eq $temphost or $AS_HOST eq $tempHostAlias or $validhost==1)
                {
                    $checkhost=1;
                }
                else
                {
                    if($temphost ne "ALL")
                    {
                        delete $sudoers_file_duplicate[$_];
                        delete $sudoers_file_with_runas[$_];
                    }
                }
                @tempHostarr=();
            }
        }
        if($checkhost==0)
        {
            IssueError("","", $AS_HOST, "Given host value $AS_HOST is not present in the sudoers file",$master_text,$basefile,'SFIT42903'); #Sub called with "&"
        }
    }
    @sudoers_file=@sudoers_file_duplicate;
    return; #require final return 
}

#Task 81814
if(((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER == 1)))
{
    if ($DEBUG)
    {
        print "Value before evaluating seclogin_active_all_users = $seclogin_active_all_users\n";
    }
    CheckAllUsers_EtcProfile(); #Sub called with "&"
    if ($DEBUG)
    {
        print "Evaluated value of seclogin_active_all_users = $seclogin_active_all_users\n";
    }
}
my %Host_Aliases;               #strict_use
#my @User_Alias;                    #strict_use
#my @Cmnd_Alias;                    #strict_use
my @Runas_Alias;                #strict_use
#my @Defaults;                  #strict_use
#my @Unique_Commands;           #strict_use #is declared but not used
my @Groups;                     #strict_use
my @Group_Alias;                #strict_use

if ($DEBUG)
{
    print "********************************************************************\n";
    print "********************************************************************\n";
    print "List of Host_Aliases:\n";
    foreach (sort keys %Host_Aliases)
    {
        print "\tHost_Aliases{$_}=$Host_Aliases{$_}\n";
    }

    print "\nList of User_Alias:\n";
    print join("\n", @User_Alias), "\n";

    print "\nList of Cmnd_Alias:\n";
    print join("\n", @Cmnd_Alias), "\n";

    print "\nList of Runas_Alias:\n";
    print join("\n", @Runas_Alias), "\n";

    print "\nList of Defaults:\n";
    print join("\n", @Defaults), "\n";

    print "\nList of Groups:\n";
    print join("\n", @Groups), "\n";

    print "\nList of Group_Alias:\n";
    print join("\n", @Group_Alias), "\n";

    print "\n********************************************************************\n";
    print "********************************************************************\n";

}
if (((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER == 1)))
{
    
    if ( $case_insensitive_user  == 1 ) 
    {
        validate_userids_insensitive(); #Sub called with "&"
    }
    else 
    {
        validate_userids(); #Sub called with "&"
    }
        
}
# Work item 60264
if (!grep({ /^SFIT60264$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    check_aliases_SA_host_user(\@sudoers_file); #Sub called with "&"
}

JoinMultipleUserLines(); #Sub called with "&"
ProcessHostAlias(); #Sub called with "&"
if (!grep({ /^SFIT60259$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    check_IBM_NONE_SA(\@sudoers_file); #Sub called with "&"
}
if (!grep({ /^SFIT60269$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    check_IBM_MANIAM_entries(\@sudoers_file); #Sub called with "&"
}
####Changes for Task 60432
if (!grep({ /^SFIT60432$/x } @DISABLED_MESSAGES)) # require block grep #Regular expression without "/x"
{
    check_IBM_NONE_ALL_entries(\@sudoers_file); #Sub called with "&"
}
if ($DEBUG)
{
    print "\n********************************************************************************\n";
    print "********************************************************************************\n";
    print "FINAL sudoers :\n";
    print join("\n", @sudoers_file), "\n";
    print "********************************************************************************\n";
    print "********************************************************************************\n";
    print "FINAL sudoers host expanded :\n";
    print join("\n", @sudoers_file_host_expanded), "\n";
    print "********************************************************************************\n";
    print "********************************************************************************\n";
}
my @alias_array=();
my @sudoers_file_expanded=ExpandAlias(\@sudoers_file,\@alias_array); #Sub called with "&"

###changes for the task 76500
@sudoers_file_expanded=handle_delimiter_commands_entries(\@sudoers_file_expanded); #Sub called with "&"

sub handle_delimiter_commands_entries #Sub called with "&"
{
    my ($array_ref) = @_;  #require argument unpacking           #Get reference of sudoers array and continue using it #require argument unpacking 
    my $header;                     #strict_use
    my $rest;                       #strict_use
    my $i;                          #strict_use
    my $original;                   #strict_use
    if($DEBUG)
    {
       print "\n IN handle_delimiter_commands_entries \n";
    }
    my @sudoers_file_copy = @{$array_ref}; #Reused variable name in lexical scope #Double-sigil dereference
    @sudoers_file_copy = grep ({ defined() and length() } @sudoers_file_copy);
    my @sudoers_file_expanded_temp = grep({ !/Cmnd_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_copy); #Regular expression without "/x"    #require block grep

    foreach my $line (@sudoers_file_expanded_temp)
    {
        ($header, $rest) = split(/=/x, $line,2); #Regular expression without "/x"
         if($rest =~ m/[^'][\;|\|]/xg) #Regular expression without "/x"
         {   
            next if($line =~ m/'[a-z0-9A-Z\D+]+[\;|\|]?/xig and $line !~ m/\s+[\;|\|]\s+/xg); #Regular expression without "/x"
            next if($line =~ m/"[a-z0-9A-Z\D+]+[\;|\|]?/xig and $line !~ m/\s+[\;|\|]\s+/xg); #Regular expression without "/x"
            next if($line =~ m/![a-z0-9A-Z\D+]+\;/xg); #Regular expression without "/x"
            
            my ($filename, $line_number, $master_text) = get_line_location_text($line);         #Sub called with "&"
            IssueNote($header, $line_number, "", "portion of entry after delimiter is being ignored",$master_text, $filename, 'SFIT76500');              #Sub called with "&"
         }           
    }
   
    for(0..$#sudoers_file_copy)
    {
         $original=$sudoers_file_copy[$_];                               
         next if ($original =~ m/Cmnd_Alias|Runas_Alias|Host_Alias|Defaults/xg); #Regular expression without "/x"
         if($original =~ m/\'([a-z0-9]*([\;|\|])*)+\'\s*([\;|\|])(.*?)\s*(\,(.*?))?$/xig) #Regular expression without "/x"
         {
            $sudoers_file_copy[$_] =~ s/(\'([a-z0-9]*([\;|\|])*)+\')\s*([\;|\|])(.*?)\s*(\,(.*?))?$/$1 $6/xig;  #Regular expression without "/x"            
         }
         else
         {
            next if($original =~ m/\['|"]([\S+]*([\;|\|])*)+\['|"]/xg); #Regular expression without "/x"
            #next if($original =~ m/\"([a-z0-9\D+]*([\;|\|])*)+\"/ig);
            if($sudoers_file_copy[$_] =~ m/[^\'][\;|\|](.*?)(\,(.*?))?$/x) ##Capture variable used outside conditional #Regular expression without "/x"       
            {
            $sudoers_file_copy[$_] =~ s/[^\'][\;|\|](.*?)(\,(.*?))?$/$2/xg if(defined $2); #Regular expression without "/x"
            }
            $sudoers_file_copy[$_] =~ s/[^'][\;|\|](.*?)$//xg;  #Regular expression without "/x"                      
         }       
         update_line_location($original, $sudoers_file_copy[$_]);   #Sub called with "&"     
    }   
    return @sudoers_file_copy; #require final return  #@sudoers_file; #perl -w
}

if ($DEBUG)
{
    print "\n********************************************************************************\n";
    print "********************************************************************************\n";
    print "FINAL sudoers :\n";
    print join("\n", @sudoers_file), "\n";
    print "********************************************************************************\n";
    print "********************************************************************************\n";
    print "FINAL sudoers expanded :\n";
    print join("\n", @sudoers_file_expanded), "\n";
    print "********************************************************************************\n";
    print "********************************************************************************\n";
    print "FINAL sudoers expanded and concatenated all entries affecting the same person(s) and groups :\n";
    print join("\n", @sudoers_file_merged), "\n";
    print "********************************************************************************\n";
    print "********************************************************************************\n";

}
my $array_ref = Filter_negations(\@sudoers_file_expanded,1);             #Get reference of sudoers array and continue using it #Sub called with "&"
@sudoers_file_expanded = @{$array_ref}; #Double-sigil dereference
merge_user_entries(\@sudoers_file_expanded); #Sub called with "&"
$array_ref = Filter_negations(\@sudoers_file_merged,0);     #Sub called with "&"         #Get reference of sudoers array and continue using it
@sudoers_file_merged = @{$array_ref}; #Double-sigil dereference
my $other_filter = 0x0007;
my $group_filter = 0x0038;
my $user_filter  = 0x01C0;
my $sticky_filter  = 0x0E00;

sub check_security_settings
{
    my $other_filter_copy = 0x0007; #Reused variable name in lexical scope
    my $group_filter_copy = 0x0038; #Reused variable name in lexical scope
    my $user_filter_copy  = 0x01C0; #Reused variable name in lexical scope
    my $filename;
    my $line_number;
    my $master_text;
    my $user;                   #strict_use
    my $group;                  #strict_use
    my $other;                  #strict_use
    if ($DEBUG)
    {
        print "Printing security_settings hash\n";
        foreach (sort keys %security_settings) 
        { 
            print "$_ : $security_settings{$_}\n"; 
        }
    }   
    while(my($key,$val)=each %security_settings)
    {
        $filename="";
        $line_number="";
        $master_text="";
        if($key =~ /included_file|included_directory/x) #Regular expression without "/x"
        {
            my $line=$key;
            $line =~ s/included_file_|included_directory_//xg; #Regular expression without "/x"
            ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
            if($key =~ /included_file/)
            {
                if(!(-f $security_settings{$key}))
                {
                    IssueWarning("Include", $line_number, $val,"Included file $val does not exist or is not a file",$master_text, $filename, 'SFIT19488'); #Sub called with "&"
                }
            }
            if($key =~ /included_directory/)
            {
                if(!(-d $security_settings{$key}))
                {
                    IssueWarning("Include", $line_number, $val,"Included directory $val does not exist or is not a directory",$master_text, $filename, 'SFIT19488'); #Sub called with "&"
                }
            }
            else
            {
                my ($dev, $ino, $mode, $nlink, $uid, $gid, $rdev, $size, $atime, $mtime, $ctime, $blksize, $blocks) = stat $security_settings{$key};
                $user  = ($mode & $user_filter_copy) >> 6;
                $group = ($mode & $group_filter_copy) >> 3;
                $other = $mode & $other_filter_copy;
                if($user < 4 or $user > 7)
                {
                    if($key =~ /included_file/)
                    {
                        IssueWarning("Include", $line_number, $val,"Included file $val is not readable",$master_text, $filename, 'SFIT19488'); #Sub called with "&"
                    }
                    if($key =~ /included_directory/)
                    {
                        IssueWarning("Include", $line_number, $val,"Included directory $val is not readable",$master_text, $filename, 'SFIT19488'); #Sub called with "&"
                    }
                }
            }
        }
        if($key =~ /passwd_file|group_file/x) #Regular expression without "/x"
        {
            if(!(-f $security_settings{$key}))
            {
                if($key =~ /passwd_file/)
                {
                    IssueWarning("", $line_number, $val,"USER file $val does not exist or is not a file",$master_text, $filename, 'SFIT19488'); #Sub called with "&"
                }
                if($key =~ /group_file/)
                {
                    IssueWarning("", $line_number, $val,"GROUP file $val does not exist or is not a file",$master_text, $filename, 'SFIT19488'); #Sub called with "&"
                }
            }
            else
            {
                my ($dev, $ino, $mode, $nlink, $uid, $gid, $rdev, $size, $atime, $mtime, $ctime, $blksize, $blocks) = stat $security_settings{$key};
                $user  = ($mode & $user_filter_copy) >> 6;
                $group = ($mode & $group_filter_copy) >> 3;
                $other = $mode & $other_filter_copy;
                if($user < 4 or $user > 7)
                {
                    if($key =~ /passwd_file/)
                    {
                        IssueWarning("", $line_number, $val,"USER file $val is not readable",$master_text, $filename, 'SFIT19488'); #Sub called with "&"
                    }
                    if($key =~ /group_file/)
                    {
                        IssueWarning("", $line_number, $val,"GROUP file $val is not readable",$master_text, $filename, 'SFIT19488'); #Sub called with "&"
                    }
                }

            }
        }
        if($key =~ /etc_directory|tmp_directory/x)  #Regular expression without "/x"
        {
            if(!(-d $security_settings{$key}))
            {
                IssueWarning("", $line_number, $val,"Directory $val does not exist or is not a directory",$master_text, $filename, 'SFIT19488'); #Sub called with "&"
            }
            else
            {
                my ($dev, $ino, $mode, $nlink, $uid, $gid, $rdev, $size, $atime, $mtime, $ctime, $blksize, $blocks) = stat $security_settings{$key};
                $user  = ($mode & $user_filter_copy) >> 6;
                $group = ($mode & $group_filter_copy) >> 3;
                $other = $mode & $other_filter_copy;
                if($user < 4 or $user > 7)
                {
                    IssueWarning("", $line_number, $val,"Directory $val is not readable",$master_text, $filename, 'SFIT19488'); #Sub called with "&"
                }
            }
        }
    }
    
    if($> != 0)
    {
        IssueWarning("", "", "User ID","Effective user ID (".$>.") must be root (0) to run this program","", "", 'SFIT19488'); #Sub called with "&"
    }
  return; #require final return   
}
@alias_array=("IBM_NONE_SA");
my @sudoers_file_IBM_NONE_SA=ExpandAlias(\@sudoers_file,\@alias_array); #Sub called with "&"
$array_ref = Filter_negations(\@sudoers_file_IBM_NONE_SA,0); #Sub called with "&"
@sudoers_file_IBM_NONE_SA = @{$array_ref}; #Double-sigil dereference
my @temp_runas=ExpandAlias(\@sudoers_file_with_runas,\@alias_array); #Sub called with "&"
if($DEBUG)
{
    print "********************************************************************************\n";
    print "temp runas after expanding :\n";
    #print join("\n", @temp_runas), "\n";
}
my @empty_array=();
my @temp_runas1=ExpandAlias(\@temp_runas,\@empty_array);           #355821 #Sub called with "&"
if($DEBUG)
{
    print "********************************************************************************\n";
    print "temp runas1 after expanding :\n";
    #print join("\n", @temp_runas1), "\n";
    
    
}
@sudoers_file_with_runas_expanded=sudoers_runas_expansion(@temp_runas1); #Sub called with "&"
my @sudoers_file_IBM_NONE_SA_with_runas=@sudoers_file_with_runas_expanded;
$array_ref = Filter_negations_with_runas(\@sudoers_file_IBM_NONE_SA_with_runas,0); #Sub called with "&"
@sudoers_file_IBM_NONE_SA_with_runas = @{$array_ref}; #Double-sigil dereference

$array_ref = Filter_negations(\@sudoers_file,0); #Sub called with "&"
my @sudoers_file_NEGATED_ALIASES = @{$array_ref}; #Double-sigil dereference
if (!grep({ /^SFIT15983$/x } @DISABLED_MESSAGES) && ((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER == 1))) #Regular expression without "/x" #require block grep #prohibit mixed boolean operators
{
    if ( $case_insensitive_user  == 1 || $case_insensitive_group == 1  )  # either group or user case-insenstivity is enabled. 
    { 
        check_user_profile_insensitive(\@sudoers_file_expanded); #Sub called with "&"
    }
    else 
    {
        check_user_profile(\@sudoers_file_expanded); #Sub called with "&"
    }
}
if (!grep({ /^SFIT18206$/x } @DISABLED_MESSAGES) && ((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER == 1))) #Regular expression without "/x" #require block grep #prohibit mixed boolean operators
{
    check_files(); #Sub called with "&"
}

# Work item 2511
if (!grep({ /^SFIT2511$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    check_naked_ALL(\@sudoers_file_expanded); #Sub called with "&"
}

# Work item 2518
if (!grep({ /^SFIT2518$/x } @DISABLED_MESSAGES) && ((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER == 1))) #Regular expression without "/x" #require block grep #prohibit mixed boolean operators
{
    #&check_su_without_target(\@sudoers_file_without_useralias_expansion);
    check_su_without_target(\@sudoers_file_expanded_without_useralias_expansion); #Sub called with "&"
}

# Work item 2524
if (!grep({ /^SFIT2524$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    #Call to new defined alias "IBM_NONE_SA"
    check_deviation_all_and_ibm_none_(\@sudoers_file,"IBM_NONE_SA"); #Sub called with "&"
    #Call to new defined alias "IBM_NONE_EDITOR"
    check_deviation_all_and_ibm_none_(\@sudoers_file,"IBM_NONE_EDITOR"); #Sub called with "&"
}

#Work item 2509
if (!grep( { /^SFIT2509$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    check_aliases_without_noexec(\@sudoers_file); #Sub called with "&"
}

# Work item 2522
if (!grep({ /^SFIT2522$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    check_disallowed_editors(\@sudoers_file_expanded_without_useralias_expansion); #Sub called with "&"
}

# Work item 2523
if(!defined $EXTENDED_CHECK_USER){$EXTENDED_CHECK_USER=0;}
if ((!grep({ /^SFIT2523$/x } @DISABLED_MESSAGES ))  && ($EXTENDED_CHECK_USER=~ /^\d+$/x && $EXTENDED_CHECK_USER == 0) ) #Regular expression without "/x" #require block grep #prohibit mixed boolean operators
{
    #&check_su_without_hyphen_default(\@sudoers_file_without_useralias_expansion);
    check_su_without_hyphen_default(\@sudoers_file_expanded_without_useralias_expansion); #Sub called with "&"
}

# Work item 2516
if (!grep({ /^SFIT2516$/x } @DISABLED_MESSAGES) && ((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER=~ /^\d+$/x && $EXTENDED_CHECK_USER == 1))) #require block grep #Regular expression without "/x" #prohibit mixed boolean operators
{
    check_su_without_hyphen_extended(\@sudoers_file_expanded); #Sub called with "&"
}

# Work item 2527
if (!grep({ /^SFIT2527$/x } @DISABLED_MESSAGES))  #Regular expression without "/x" #require block grep
{
    CheckSUDOSUDO(\@sudoers_file_expanded); #Sub called with "&"
}

# Work item 2508
if (!grep({ /^SFIT2508$/x } @DISABLED_MESSAGES)) #Regular expression without "/x" #require block grep
{
    check_aliases_without_negation(\@sudoers_file_NEGATED_ALIASES); #Sub called with "&"
}

# Work item 2520
if (!grep({ /^SFIT2520$/x } @DISABLED_MESSAGES)) #Regular expression without "/x" #require block grep
{
    check_chown_chgrp_chmod_without_scoping(\@sudoers_file_expanded); #Sub called with "&"
}
my $shell_escape = 'IBM_SHELLESCAPE_ALL[\s\t]+noexec';
if(grep({ /^[\s\t]*Defaults[\s\t]*![\s\t]*$shell_escape[\W]*$/x }@sudoers_file_expanded)) #require block grep #Regular expression without "/x" #ProhibitComplexRegexes
{
    my @SHELL_ESCAPE_LIST = grep ({ /Cmnd_Alias\s+IBM_SHELLESCAPE_ALL/x } @sudoers_file_expanded); #Regular expression without "/x"#require block grep
    my($c_copy, $LIST) = split(/=/x, (join("\n", @SHELL_ESCAPE_LIST)), 2);  #Regular expression without "/x"#pankaj #Reused variable name in lexical scope
    
    
}
elsif (!grep({ /^SFIT2521$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    check_shellescape_aliases(@sudoers_file_with_runas_expanded); #Sub called with "&"
}

# work item 2510 - check required command aliases
if (!grep({ /^SFIT2510$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    check_required_command_aliases(); #Sub called with "&"
}

# work item 2519
# more than one entry doing subtractive approach on =*ALL
if (!grep({ /^SFIT2519$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    check_subtractive_approach_all(\@sudoers_file_IBM_NONE_SA); #Sub called with "&"
}

# Work item 2517
if (!grep({ /^SFIT2517$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
#&check_root_equivalent(\@sudoers_file_with_runas);
check_root_equivalent(\@sudoers_file_with_runas_expanded); #Sub called with "&"
}
# Work item 60267
if (!grep({ /^SFIT60267$/x } @DISABLED_MESSAGES) && ((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER=~ /^\d+$/x && $EXTENDED_CHECK_USER == 1)) && ($template_check == 0)) #Regular expression without "/x" #prohibit mixed boolean operators #require block grep
{
    check_IBM_entryFile(\@sudoers_file_IBM_NONE_SA); #Sub called with "&"
}
# Work item 64587
if (!grep({ /^SFIT64587$/x } @DISABLED_MESSAGES) && ((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER=~ /^\d+$/x && $EXTENDED_CHECK_USER == 0))) #Regular expression without "/x" #require block grep #prohibit mixed boolean operators
{
    check_atleast_one_include(); #Sub called with "&"
}

# Work item 2515
if (!grep({ /^SFIT2515$/x } @DISABLED_MESSAGES) && ((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER=~ /^\d+$/x && $EXTENDED_CHECK_USER == 1)))#Regular expression without "/x"  #require block grep #prohibit mixed boolean operators
{
    check_su_ibmid_with_hyphen_extended(\@sudoers_file_expanded); #Sub called with "&"
}

# Work item 10933
if(!defined $EXTENDED_CHECK_USER){$EXTENDED_CHECK_USER=0;}
if ((!grep({ /^SFIT10933$/x } @DISABLED_MESSAGES)) && ($EXTENDED_CHECK_USER=~ /^\d+$/x && $EXTENDED_CHECK_USER == 0)) #Regular expression without "/x" #require block grep #prohibit mixed boolean operators
{
    check_su_ibmid_with_hyphen_default(\@sudoers_file_expanded); #Sub called with "&"
}

# Work item 2525
if (!grep({ /^SFIT2525$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    check_file_affecting_commands(\@sudoers_file_expanded_without_useralias_expansion); #Sub called with "&"
}

# Work item 2526
if (!grep({ /^SFIT2526$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    check_file_affecting_commands_with_negation(\@sudoers_file_with_runas_expanded); #Sub called with "&"
}

# Work item 4360
if (!grep({ /^SFIT4360$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    validate_alias_contents_and_check_usage(\@sudoers_file_expanded, "IBM_SHELLS_ALL", "SFIT4360", \@IBM_SHELLS_ALL); #Sub called with "&"
}

# Work item 4364
if (!grep({ /^SFIT4364$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
#    validate_alias_contents_and_check_usage(\@sudoers_file_expanded, "IBM_NONE_ALL", "SFIT4364", \@IBM_NONE_ALL); #Sub called with "&"
#    60265 - IBM_NONE_ALL is not required alias, hence content check for IBM_NONE_ALL not expected.

    if($DEBUG)
    {
        print("SFIT4364 disabled, IBM_NONE_ALL is not required alias in sudoers file.\n");
    }
}

# Work item 58079
if (!grep({ /^SFIT58079$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    validate_alias_IBM_NONE_EDITOR(\@sudoers_file_expanded, "IBM_NONE_EDITOR", "SFIT58079", \@IBM_NONE_EDITOR); #Sub called with "&"
}

#Enhancement request 65610 - Disable all the messages.
#if (!grep(/^SFIT10936$/, @DISABLED_MESSAGES))
#{
#    &process_comment_array();
#}

if (!grep({ /^SFIT5996$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    use_directory_as_a_command(\@sudoers_file_expanded); #Sub called with "&"
}

if (!grep({ /^SFIT10934$/x } @DISABLED_MESSAGES) && $getOS =~ /AIX/ && $EXTENDED_CHECK_USER == 1) #Regular expression without "/x" #require block grep #prohibit mixed boolean operators
{
    check_env_keep(\@sudoers_file_expanded); #Sub called with "&"
}

if (!grep({ /^SFIT17033$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    check_sudoedit(\@sudoers_file_expanded); #Sub called with "&"
}

if (!grep({ /^SFIT14163$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    check_unix_format(); #Sub called with "&"
}

if (!grep({ /^SFIT10347$/x } @DISABLED_MESSAGES) && defined ($EXTENDED_CHECK_USER) && $EXTENDED_CHECK_USER=~ /^\d+$/x && $EXTENDED_CHECK_USER == 1) #require block grep #prohibit mixed boolean operators #Regular expression without "/x"
{
process_sudoers_entry(\@sudoers_file_expanded); #Sub called with "&"
}
# Work item 4994

if (!grep({ /^SFIT4994$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    check_chmod_permissions(\@sudoers_file_expanded); #Sub called with "&"
} 
# Work item 60261
if (!grep({ /^SFIT60261$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    check_standard_header_footer(); #Sub called with "&"
}
# Work item 77558
if (!grep({ /^SFIT77558$/x } @DISABLED_MESSAGES) && ((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER=~ /^\d+$/x && $EXTENDED_CHECK_USER == 1))) #Regular expression without "/x" #require block grep #prohibit mixed boolean operators
{
    check_customerentries_root_equivalent(\@sudoers_file_IBM_NONE_SA_with_runas); #Sub called with "&"
}
# Work item 77555
if (!grep({ /^SFIT77555$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    verifyExcessive_Privilege_IBM_BAU(\@sudoers_file_without_useralias_expansion); #Sub called with "&"
}
# Work item 77559
#if (!grep(/^SFIT77559$/, @DISABLED_MESSAGES) and $EXTENDED_CHECK_USER == 1)
#{
#    &check_shellescape_customer_entry(\@sudoers_file_expanded);
#}
if (!grep({ /^SFIT65507$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    check_negation_standards(\@sudoers_file_expanded); #Sub called with "&"
}

if (!grep({ /^SFIT67619$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    execution_priv_with_sudoedit(\@sudoers_file_with_runas_expanded); #Sub called with "&"
}
#if (!grep(/^SFIT80470$/, @DISABLED_MESSAGES) and $EXTENDED_CHECK_USER == 1)
#{
#    &edit_priv_with_runas(\@sudoers_file_with_runas);
#}

if (!grep({ /^SFIT73868$/x } @DISABLED_MESSAGES) && ((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER=~ /^\d+$/x && $EXTENDED_CHECK_USER == 1))) #require block grep #prohibit mixed boolean operators#Regular expression without "/x"
{
    check_noexec_sudoedit_main(\@sudoers_file_expanded); #Sub called with "&"
}

if (!grep({ /^SFIT77556$/x } @DISABLED_MESSAGES) && ((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER=~ /^\d+$/x && $EXTENDED_CHECK_USER == 1))) #require block grep #prohibit mixed boolean operators #Regular expression without "/x"
{
     check_ADM_level_previleges(\@sudoers_file_with_runas); #Sub called with "&"
}

if (!grep({ /^SFIT60271$/x } @DISABLED_MESSAGES) && (((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER=~ /^\d+$/x && $EXTENDED_CHECK_USER == 1)) || ($template_check == 1))) #require block grep #Regular expression without "/x" #prohibit mixed boolean operators
{
    checkIBM_aliases(\@sudoers_file); #Sub called with "&"
}

if (!grep({ /^SFIT73866$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    check_non_printable_chars(\@sudoers_file_expanded); #Sub called with "&"
}

if (!grep({ /^SFIT180707$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    check_tar_extract_destination_directory(\@sudoers_file_expanded); #Sub called with "&"
}

if (!grep({ /^SFIT231521$/x } @DISABLED_MESSAGES) && ((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER=~ /^\d+$/x && $EXTENDED_CHECK_USER == 1))) #Regular expression without "/x" #require block grep #prohibit mixed boolean operators
{   
    check_world_writable_directory_having_command_suffixing_wildcard(\@sudoers_file_expanded_without_useralias_expansion); #Sub called with "&"
}

if (!grep({ /^SFIT124468$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{      
    validate_negated_command_aliases(\@sudoers_file_expanded_without_useralias_expansion);  #Sub called with "&"
}


if (!grep({ /^SFIT73863$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{       
    check_user_alias_in_included_files(\@files_included,\@sudoers_file_without_useralias_expansion); #Sub called with "&"
}

#if (!grep(/^SFIT331840$/, @DISABLED_MESSAGES))
#{      
#   &check_command_and_parent_dir_exists(\@sudoers_file_without_useralias_expansion);
#}

if (!grep({ /^SFIT331841$/x } @DISABLED_MESSAGES) &&  ((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER=~ /^\d+$/x && $EXTENDED_CHECK_USER == 1)) ) #Regular expression without "/x" #require block grep #prohibit mixed boolean operators
{
    check_permission_of_NON_OSR_directories(\@sudoers_file_without_useralias_expansion); #Sub called with "&"
}

if (!grep({ /^SFIT399272$/x } @DISABLED_MESSAGES) && ((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER=~ /^\d+$/x && $EXTENDED_CHECK_USER == 1)) ) #Regular expression without "/x" #require block grep #prohibit mixed boolean operators
{
    if ( $case_insensitive_user  == 1 || $case_insensitive_group == 1  ) 
    {
        check_if_middleware_user_alias_contains_standard_system_admin_users_insensitive(\@files_included,\@sudoers_file_without_useralias_expansion,\@sudoers_file_expanded); #Sub called with "&"
    }
    else 
    {
        check_if_middleware_user_alias_contains_standard_system_admin_users(\@files_included,\@sudoers_file_without_useralias_expansion,\@sudoers_file_expanded); #Sub called with "&"
    }
}

if (!grep({ /^SFIT438957$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
{
    check_if_command_and_arguments_exists(\@sudoers_file_expanded_without_useralias_expansion); #Sub called with "&"
}

if (!grep({ /^SFIT451935$/x } @DISABLED_MESSAGES)) #Regular expression without "/x"
{
    check_if_case_insensitive_user_group_used(\@sudoers_file_with_runas_expanded,$case_insensitive_group,$case_insensitive_user); #Sub called with "&"
}
if (!grep({ /^SFIT530608$/x } @DISABLED_MESSAGES)) #Regular expression without "/x"
{
    check_file(); #Sub called with "&"

}
if (!grep({ /^SFIT530602$/x } @DISABLED_MESSAGES)) #Regular expression without "/x"
{
    check_dir(); #Sub called with "&"

}
if (!grep({ /^SFIT530611$/x } @DISABLED_MESSAGES)) #Regular expression without "/x"
{
    check_for_os_accepted_group(\@sudoers_file_expanded); #Sub called with "&"

}
if (!grep({ /^SFIT530614$/x } @DISABLED_MESSAGES)) #Regular expression without "/x"
{
    check_for_default_group(\@sudoers_file_expanded); #Sub called with "&"

}
if (!grep({ /^SFIT540074$/x } @DISABLED_MESSAGES)) #Regular expression without "/x"
{
    check_for_nopasswd_tag(\@sudoers_file_dot); #Sub called with "&"

}
if (!grep({ /^SFIT569847$/x } @DISABLED_MESSAGES)) #Regular expression without "/x"
{
    check_permission_for_others(\@sudoers_file_expanded); #Sub called with "&"

}

if (!grep({ /^SFIT613611$/x } @DISABLED_MESSAGES)) #Regular expression without "/x"
{
   check_for_nonAsciichars(\@sudoers_file_expanded); #Sub called with "&"
}

sub check_for_nonAsciichars
{
   my ($array_ref_copy) = @_; #Reused variable name in lexical scope
    my @sudoers_file_array = @{$array_ref_copy}; #Double-sigil dereference
    #my @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_array); #Regular expression without "/x"
    foreach my $line (@sudoers_file_array)
    {
        my ($header,$rest) = split(/=/x, $line, 2); #Regular expression without "/x"
        my($header_name,$header_host) = split(/\s+/x,$header,2); #Regular expression without "/x"
        my($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
        if ($line =~ /[^\x00-\x7F]/x) #Regular expression without "/x"
        {
            IssueWarning($header_name, $line_number,"","Non-Ascii Character found.",$master_text, $filename, 'SFIT613611'); #Sub called with "&"
        }
    }
    return;
}

sub check_for_nopasswd_tag #Sub called with "&"
{
    my ($array_ref_copy) = @_; #Reused variable name in lexical scope
    my @sudoers_file_array = @{$array_ref_copy}; #Double-sigil dereference
    my @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_array); #Regular expression without "/x"
    foreach my $line (@sudoers_file_array)
    {   
        my ($header,$rest) = split(/=/x, $line, 2); #Regular expression without "/x"
        my($header_name,$header_host) = split(/\s+/x,$header,2); #Regular expression without "/x"
        my($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
        if($line =~/\s*NOPASSWD\s*:\s*/x) #Regular expression without "/x"
        {
            IssueWarning($header_name, $line_number,"","$header_name assigned with NOPASSWD tag please refer to http://ibm.biz/GSudoFAQ for further guidelines.",$master_text, $filename, 'SFIT540074'); #Sub called with "&"
        }
    }
    return;
}
sub check_permission_for_others #Sub called with "&"
{
    my ($array_ref_copy) = @_; #Reused variable name in lexical scope
    my @sudoers_file_array = @{$array_ref_copy}; #Double-sigil dereference
    my @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_array); #Regular expression without "/x"
    #my @aix_directories = ('/usr/sbin','/usr/etc','/usr','/usr/share','/var/adm','/usr/share/dict','/etc/locks','/etc/security','/','/etc','/bin','/usr/bin','/tmp','/var/tmp','/var');
    #my @linux_directories = ('/etc','/var','/usr','/var/log','/var/tmp','/');
    #my @solaris_directories = ('/platform','/sbin','/usr/sbin','/usr/bin','/var/log','/var/adm','/bin','/etc','/kernel','/lib');
    my @violation_paths=();
    my @violated_paths=();
    my @violated_paths_uniq=();
    # Loop 1. 
    foreach my $line (@sudoers_matches)
    {
        my ($header,$rest) = split(/=/x, $line, 2); #Regular expression without "/x"
        # Replace tags and ! from $rest
        $rest=~s/NOEXEC\s*:\s*|EXEC\s*:\s*|PASSWD\s*:\s*|NOPASSWD\s*:\s*//xg;#Regular expression without "/x"
        $rest =~ s/!//xg; #Regular expression without "/x"
        my @cmds = split(/,/x, $rest); #Regular expression without "/x"
        foreach my $cmd_loop (@cmds) # remvo
        {
            $cmd_loop =~ s/^\s*(\/\S+)\s*.*/$1/xg; #Regular expression without "/x"
            #if (fiel exists and not in @violation_paths)
            if((-e $cmd_loop) && !grep({ /^$cmd_loop$/x } @violation_paths) ) #Mixed high and low-precedence booleans#Regular expression without "/x"
            {
               push(@violation_paths,$cmd_loop); #@all_existing_cmmand_paths
            }
        }
    }
    # Loop 2 
    foreach my $cmd1(@violation_paths)
    {
      my @no_of_directories= split(/\//x,$cmd1);  #Regular expression without "/x"#SPLIT BY '\' TO KNOW HOW MANY DIRECTORIES WE HAVE TO ITERATE THROUGH
      my $count = 0;
      my $directory_count=scalar(@no_of_directories)-1; #no of directories
      
       while($count < $directory_count)
       {
            if (!grep({ /^$cmd1$/x } @violated_paths) )  #@violated_paths #Regular expression without "/x"
            {
                my ($dev, $ino, $mode, $nlink, $uid, $gid, $rdev, $size, $atime, $mtime, $ctime, $blksize, $blocks) = stat $cmd1;
                #my $sticky  = ($mode & $sticky_filter) >> 9; #remove sticky
                my $user  = ($mode & $user_filter) >> 6;
                my $group = ($mode & $group_filter) >> 3;
                my $other = $mode & $other_filter;
                my $permissions1="$user$group$other";#remove sticky
                #my $perms = (stat $cmd1)[2] & oct("777"); #my $perms = (stat("$configfile"))[2] & 07777; #perlcritic
                #my $MODE = sprintf "%o", (stat $cmd1)[2] & oct("777");
                if($permissions1 !~ /(\d\d[4|5|1|0])/x #change
                and ($cmd1 !~ /\/sudoedit/x)) #group can have either 4/5/1 ###put !~ for raising violation  #Regular expression without "/x"
                {
                    push(@violated_paths,$cmd1);
                }
                #--eg./root/krizel/SFIT410.20190314-233040-332.gold
                my $last_occurence =rindex($cmd1,"/"); #get the last occurence of '/' index=12  
                my $head=substr($cmd1,0,$last_occurence);  #a=/root/krizel
                my $rest=substr($cmd1,$last_occurence+1);  #b=SFIT410.20190314-233040-332.gold
                $cmd1=$head;                   #somedir = /root/krizel
                $count=$count+1;
                
            }
            else
            {
               $count=$count+1;
               if($DEBUG){print"\nin else loop\nSKIP COMMAND ,COMMAND already processed";}
            }

        }

    }
    
    foreach my $line (@sudoers_matches)
    {
      my ($header,$rest) = split(/=/x, $line, 2); #Regular expression without "/x"
      $rest=~s/NOEXEC\s*:\s*|EXEC\s*:\s*|PASSWD\s*:\s*|NOPASSWD\s*:\s*//xg; #Regular expression without "/x"
      my @cmds = split(/,/x, $rest); #Regular expression without "/x"
      my($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
      foreach my $cmd1 (@cmds) # with ! or without 
      {
        #condition for negation, tags,arguments
         $cmd1 =~ s/^\s*(\/\S+)\s*.*/$1/xg; #Regular expression without "/x"
         if($cmd1 !~/^\s*!/x and -e $cmd1 ) #Regular expression without "/x"
         {
             my @no_of_directories= split(/\//x,$cmd1);  #Regular expression without "/x"#SPLIT BY '\' TO KNOW HOW MANY DIRECTORIES WE HAVE TO ITERATE THROUGH
             my $count = 0;
             my $directory_count=scalar(@no_of_directories)-1; #no of directories
             while($count < $directory_count)
             {
                 if (grep({ /^$cmd1$/x } @violated_paths)  )  #Regular expression without "/x"
                {
                   
                   IssueWarning("$header", $line_number, $cmd1,"Each active entry's file/command/script executed and all directories in its path must have settings for other of r-x or more stringent.",$master_text, $filename, 'SFIT569847'); #Sub called with "&"
                }
                my $last_occurence =rindex($cmd1,"/"); #get the last occurence of '/' index=12  
                my $head=substr($cmd1,0,$last_occurence);  #a=/root/krizel
                my $rest_copy=substr($cmd1,$last_occurence+1);  #b=SFIT410.20190314-233040-332.gold #Reused variable name in lexical scope
                $cmd1=$head;                   #somedir = /root/krizel
                $count=$count+1;
             
             }
         }
      }
    }
    
    
    return;
}

sub check_for_default_group #Sub called with "&"
{
    my ($array_ref_copy) = @_; #Reused variable name in lexical scope
    my @sudoers_file_array = @{$array_ref_copy}; #Double-sigil dereference
    my @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_array); #Regular expression without "/x"
    foreach my $line (@sudoers_matches)
    {
        my ($header,$rest_copy) = split(/=/x, $line, 2);  #Regular expression without "/x"#Reused variable name in lexical scope
        my @cmds = split(/,/x, $rest_copy); #Regular expression without "/x"
        foreach my $cmd (@cmds)
        {
            
            $cmd=~s/NOEXEC\s*:\s*|EXEC\s*:\s*|PASSWD\s*:\s*|NOPASSWD\s*:\s*//xg; #tags included #Regular expression without "/x"
            if($cmd =~/^\s*\//x)#Regular expression without "/x"
            {
                $cmd =~ s/^\s*(\/\S+)\s*.*/$1/xg; #Regular expression without "/x"
                my ($dev, $ino, $mode, $nlink, $uid, $gid, $rdev, $size, $atime, $mtime, $ctime, $blksize, $blocks) = stat $cmd;#to get the gid
                my $groupname;
                if(defined $gid){$groupname= (getgrgid $gid)[0];} #GET THE GROUPNAME 
                my @no_of_directories= split(/\//x,$cmd);  #Regular expression without "/x"#SPLIT BY '\' TO KNOW HOW MANY DIRECTORIES WE HAVE TO ITERATE THROUGH
                my $count = 0;
                my $directory_count=scalar(@no_of_directories)-1; #no of directories
           
                if(defined $groupname)
                {
                    if((($getOS =~/\s*Solaris\s*[1|2|3|4|5|6|7|8|9|10].*/x) and ($groupname=~ /\s*other\s*/x)) or #Regular expression without "/x"
                    (($getOS =~/\s*Solaris\s*11.*/x) and ($groupname=~ /\s*staff\s*/x))or  #Regular expression without "/x"
                    (($getOS =~/AIX/x) and ($groupname=~ /\s*staff\s*/x))or    #Regular expression without "/x"
                    (($getOS =~/HP-UX/x) and ($groupname=~ /\s*users\s*/x)) or #Regular expression without "/x"
                    (($getOS =~/Linux/x) and ($groupname=~ /\s*users\s*/x))) #Regular expression without "/x"
                    {
                        while($count < $directory_count)
                        {
                            my ($dev_copy, $ino_copy, $mode_copy, $nlinkcopy, $uid_copy, $gid_copy, $rdev_copy, $size_copy, $atime_copy, $mtime_copy, $ctime_copy, $blksize_copy, $blocks_copy) = stat $cmd; #Reused variable name in lexical scope
                            my $sticky  = ($mode_copy & $sticky_filter) >> 9;
                            my $user  = ($mode_copy & $user_filter) >> 6;
                            my $group = ($mode_copy & $group_filter) >> 3;
                            my $other = $mode_copy & $other_filter;
                            my $permissions1="$sticky$user$group$other";
                            
                            my $perms = (stat $cmd)[2] & oct("7777"); #my $perms = (stat("$configfile"))[2] & 07777; #perlcritic
                            my $MODE = sprintf "%o", $perms;
                            $permissions1=$MODE;
                            my($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                            if($permissions1!~/\d[4|5|1|0]\d/x) #group can have either 4/5/1 ###put !~ for raising violation #Regular expression without "/x"
                            {
                                IssueWarning("$header", $line_number, "","Each active entry's file/command/script executed and all existing directories in its path must have settings for group of r-x or more stringent if owned by groups considered to be default groups for general users",$master_text, $filename, 'SFIT530614'); #Sub called with "&"
                                
                            }
                            #--eg./root/krizel/SFIT410.20190314-233040-332.gold
                            my $last_occurence =rindex($cmd,"/"); #get the last occurence of '/' index=12  
                            my $head=substr($cmd,0,$last_occurence);  #a=/root/krizel
                            my $rest=substr($cmd,$last_occurence+1);  #b=SFIT410.20190314-233040-332.gold
                            $cmd=$head;                   #somedir = /root/krizel
                            $count=$count+1;

                        }
                    }
                }
            }
        
        }
    }
    
    return;
}

sub check_for_os_accepted_group #Sub called with "&"
{
    my ($array_ref_copy) = @_; #Reused variable name in lexical scope
    my @sudoers_file_array = @{$array_ref_copy}; #Double-sigil dereference
    
    my @os_accepted_grps_aix = qw(system uucp adm audit bin cron ecs hacmp haemrm imnadm ipsec ldap Ip mail pconsole printq security shutdown snapp sys); #ProhibitQuotedWordLists
    my @os_accepted_grps_solaris=qw(mail smmsp root adm bin cimsrvr daemon ftp gdm imnadm lp mysql netadm nuucp openldap pkg5srv postgres slocate sms sys sysadmin tty upnp uucp webservd xvm); #ProhibitQuotedWordLists
    my @os_accepted_grps_hpux=qw(adm bin cimsrvr daemon imnadm lp mail nogroup nuucp root sys tty); #ProhibitQuotedWordLists
    
    my @env_file_arr = grep({ /^\s*Defaults\s+env_file\s*/x } @sudoers_file_array); #Regular expression without "/x"
    foreach my $line (@env_file_arr)
    {
        my ($header,$rest) = split(/=/x, $line, 2); #Regular expression without "/x"
        $rest =~ s/^\s*//xg; #Regular expression without "/x"
        my ($dev, $ino, $mode, $nlink, $uid, $gid, $rdev, $size, $atime, $mtime, $ctime, $blksize, $blocks) = stat $rest ;#to get the gid
        if( -e $rest)
        {
            my $groupname = (getgrgid $gid)[0]; #GET THE GROUPNAME 
            my $username = (getpwuid $uid)[0]; #GET THE userNAME 
            my $sticky  = ($mode & $sticky_filter) >> 9;
            my $user  = ($mode & $user_filter) >> 6;
            my $group = ($mode & $group_filter) >> 3;
            my $other = $mode & $other_filter;
            my $permissions1="$sticky$user$group$other";
            my $perms = (stat $rest)[2] & oct("7777"); #my $perms = (stat("$configfile"))[2] & 07777; #perlcritic
            my $MODE = sprintf "%o", $perms;
            $permissions1=$MODE;
            my($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
            SWITCH: {  #Cascading if-elsif chain
            if($getOS =~/AIX/)
            {
                if($username!~ /root/ or (!grep({/^$groupname$/x} @os_accepted_grps_aix )) or  $permissions1!~/\d\d[4|5|1|0]/x ) #Regular expression without "/x"
                {
                    IssueWarning("$header", $line_number, $rest,"Must be owned by root have 'group' which is one of the OS accepted OSR groups and must not be world writable",$master_text, $filename, 'SFIT530611'); #Sub called with "&"
                }
                    last SWITCH;
            }
                if($getOS =~/Solaris/) #Cascading if-elsif chain
            {
                if($username!~ /root/ or (!grep({/^$groupname$/x} @os_accepted_grps_solaris )) or  $permissions1!~/\d\d[4|5|1|0]/x ) #Regular expression without "/x"
                {
                    IssueWarning("$header", $line_number, $rest,"Must be owned by root have 'group' which is one of the OS accepted OSR groups and must not be world writable",$master_text, $filename, 'SFIT530611'); #Sub called with "&"
                }
                    last SWITCH;
            }
                if($getOS =~/HP-UX/x)#Regular expression without "/x" #Cascading if-elsif chain
            {
                if($username!~ /root/ or (!grep({/^$groupname$/x} @os_accepted_grps_hpux )) or  $permissions1!~/\d\d[4|5|1|0]/x )  #Regular expression without "/x"
                {
                    IssueWarning("$header", $line_number, $rest,"Must be owned by root have 'group' which is one of the OS accepted OSR groups and must not be world writable",$master_text, $filename, 'SFIT530611'); #Sub called with "&"
                }
                    last SWITCH;
            }
                if($getOS =~/Linux/)  #Cascading if-elsif chain
            {
                    if(($username!~ /root/ or (($getOS=~m/\s*Linux\s*RedHat\s*7.*/x or $getOS=~m/\s*Debian\s*7.*/x)  #Regular expression without "/x"
                        and (($gid == 100) or ($gid > 999)) )or  $permissions1!~/\d\d[4|5|1|0]/x) or 
                       ($username!~ /root/ or (($getOS=~m/\s*Linux\s*RedHat\s*6.*/x or $getOS=~m/\s*Debian\s*6.*/x)  
                        and (($gid == 100) or ($gid > 199)) )or  $permissions1!~/\d\d[4|5|1|0]/x ) ) #Regular expression without "/x" #Cascading if-elsif chain
                {
                    IssueWarning("$header", $line_number, $rest,"Must be owned by root have 'group' which is one of the OS accepted OSR groups and must not be world writable",$master_text, $filename, 'SFIT530611'); #Sub called with "&"
                }
                
                    # elsif($username!~ /root/ or (($getOS=~m/\s*Linux\s*RedHat\s*6.*/x or $getOS=~m/\s*Debian\s*6.*/x)  
                        # and (($gid == 100) or ($gid > 199)) )or  $permissions1!~/\d\d[4|5|1|0]/x ) #Regular expression without "/x"
                    # {
                        # IssueWarning("$header", $line_number, $rest,"Must be owned by root have 'group' which is one of the OS accepted OSR groups and must not be world writable",$master_text, $filename, 'SFIT530611'); #Sub called with "&"
                    # }
                elsif($username!~ /root/ or (($getOS=~m/\s*SUSE\s*Linux\s*Enterprise\s*Server\s*1\d/x ) and (($gid == 100) or ($gid > 499)) ) #Regular expression without "/x"
                or  $permissions1!~/\d\d[4|5|1|0]/x )#Regular expression without "/x"
                {
                    IssueWarning("$header", $line_number, $rest,"Must be owned by root have 'group' which is one of the OS accepted OSR groups and must not be world writable",$master_text, $filename, 'SFIT530611'); #Sub called with "&"
                }
                elsif($username!~ /root/ or (($getOS !~m/\s*SUSE\s*Linux\s*Enterprise\s*Server\s*1\d/x ) and #Regular expression without "/x"
                ($getOS !~m/\s*Linux\s*RedHat\s*6.*/x) and ($getOS !~m/\s*Debian\s*6.*/x)and #Regular expression without "/x"
                ($getOS !~m/\s*Linux\s*RedHat\s*7.*/x) and ($getOS !~m/\s*Debian\s*7.*/x) and ($gid >99)) #Regular expression without "/x"
                or  $permissions1!~/\d\d[4|5|1|0]/x ) #Regular expression without "/x"
                {
                    IssueWarning("$header", $line_number, $rest,"Must be owned by root have 'group' which is one of the OS accepted OSR groups and must not be world writable",$master_text, $filename, 'SFIT530611'); #Sub called with "&"
                }
                    last SWITCH;
            }
        }
    }
    }
    return;
}

sub check_dir #Sub called with "&"
{
    
    my @include = grep({/^\#includedir\s+[a-zA-Z\/\.]+/x  } @include_stmts); #Regular expression without "/x"
    #@include = uniq(@include);
    foreach my $line(@include)
    {
        my($inclstmt,$filecontents)= split(/\s+/x,$line,2); #Regular expression without "/x"
        # my @newarray =split(/\|/,$filecontents); 
        # my($data,$filename, $line_number, $master_text) ;
        # $data=$newarray[0];
        # $filename=$newarray[1];
        # $line_number=$newarray[2];
        # $master_text=$newarray[3];
        #incase u want to append the lineno and more details wid file so that 2 files having same data can gv correct o/p
        my($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
        
        if($filecontents !~ m/^\/.*/x) #Regular expression without "/x"
        {
            IssueWarning($inclstmt, $line_number, $filecontents,"Each directory used using #includedir must specify the full path of the included directory",$master_text, $filename, 'SFIT530602'); #Sub called with "&"
        }
        
    }

    
return;
    
}
sub check_file #Sub called with "&"
{
    my @include = grep({/^\#include\s+[a-zA-Z\/\.]+/x  } @include_stmts); #Regular expression without "/x"
    #@include = uniq(@include);
    foreach my $line (@include)
    {
         my($inclstmt,$filecontents)= split(/\s+/x,$line,2); #Regular expression without "/x"
        # my @newarray =split(/\|/,$filecontents);
        # my($data,$filename, $line_number, $master_text) ;
        # $data=$newarray[0];
        # $filename=$newarray[1];
        # $line_number=$newarray[2];
        # $master_text=$newarray[3];
        ##incase u want to append the lineno and more details wid file so that 2 files having same data can gv correct o/p
        my($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
        
        if($filecontents !~ m/^\/.*/x) #Regular expression without "/x"
        {
        
            IssueWarning($inclstmt, $line_number, $filecontents,"Each file used using #include must specify the full path of the included file",$master_text, $filename, 'SFIT530608'); #Sub called with "&"
        }
    }
        
return;
}

sub check_if_case_insensitive_user_group_used #Sub called with "&"
{    
    my ($array_ref_copy,$case_insensitive_group_copy,$case_insensitive_user_copy) = @_; #Reused variable name in lexical scope
    
    if($DEBUG)
    {
        print "\nIn check_if_case_insensitive_user_group_used\n";
        print "case_insensitive_group setting = $case_insensitive_group_copy\n"; 
        print "case_insensitive_group setting = $case_insensitive_group_copy\n"; 
        print "case_insensitive_user setting = $case_insensitive_user_copy\n"; 
    }
    
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference #Sub called with "&"
    my %user_alias_hash = ();
    my @sudoers_matches_user_aliases=grep({ /^User_Alias/x } @sudoers_file_copy); #Regular expression without "/x"
    
    # Generating Hash of User_Aliases with key as User_Alias's name and value as its users/groups 
    foreach my $user_alias_line (@sudoers_matches_user_aliases)
    {
        $user_alias_line =~ s/User_Alias\s*//xg; #Regular expression without "/x"
        my ($alias_name,$alias_contents) = split(/=/x, $user_alias_line, 2); #Regular expression without "/x"
        $user_alias_hash{$alias_name}=$alias_contents;
    }
    # Hash generation completed
    
    my $user_aliases_exist=0;
    # If User Aliases exists then get it expanded only till groups level
    if (%user_alias_hash)
    {        
        $user_aliases_exist=1;        
        if ($DEBUG)
        {
            print "\nPrinting user_alias_hash before:\n";
            foreach my $alias_name (keys %user_alias_hash)
            {             
                print "$alias_name => $user_alias_hash{$alias_name}\n";
            }
        }
        foreach my $alias_name (keys %user_alias_hash)
        {             
            my $user_alias_contents=$user_alias_hash{$alias_name};
            my @user_alias_contents_array=split(/,/x,$user_alias_contents);  #Regular expression without "/x"         
            foreach my $entity (@user_alias_contents_array)
            {
               if(exists $user_alias_hash{$entity})
               { 
                    my $contents=$user_alias_hash{$entity};
                    $user_alias_contents =~ s/$entity/$contents/xg; #Regular expression without "/x"
                    $user_alias_hash{$alias_name}=$user_alias_contents;
               }               
            }
        }
        if ($DEBUG)
        {
            print "\nPrinting user_alias_hash after:\n";
            foreach my $alias_name (keys %user_alias_hash)
            {             
                print "$alias_name => $user_alias_hash{$alias_name}\n";
            }
        }
    }
    my @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_copy); #Regular expression without "/x"
    # Listing users and groups used 
    my @existing_users=();
    my @existing_groups=();
    
    foreach my $line(@sudoers_matches)
    {
        my ($header,$rest) = split(/=/x, $line, 2); #Regular expression without "/x"
        my @run_as_components=();
        # Extracting RunAs fields started
        if ( $rest =~ /(\(.*?\))/x ) #Regular expression without "/x"
        {
            while ($rest =~ /(\(.*?\))/x) #Regular expression without "/x"
            {
                my $list=$1; 
                $list =~ s/\(|\)//xg; #Regular expression without "/x"
                #print "List = $list\n";
                my @runas_list = split(/\@/x,$list); #Regular expression without "/x"
                foreach my $runas_user (@runas_list)
                {
                    if (!grep({ /^\Q$runas_user\E$/x } @run_as_components)) #Regular expression without "/x"
                    {  
                        push @run_as_components,$runas_user;
                    }
                }
                $rest =~ s/(\(.*?\))//x; #Regular expression without "/x"
            }
        }
        # Extracting RunAs fields complete
        my $user_field = (split(/\s/x, $header))[0]; #Regular expression without "/x"
        my @user_groups_field_list;
        if(defined $user_field)
        {
            @user_groups_field_list= split(/\,/x,$user_field); #Regular expression without "/x"
        }
        # Add RunAs user list 
        push @user_groups_field_list,@run_as_components;
        my @user_groups_list = @user_groups_field_list;
        
        foreach my $entity (@user_groups_list)
        {
            if ($entity =~ /^%/x) #Regular expression without "/x"
            {
                if (!grep({ /^\Q$entity\E$/x } @existing_groups)) #Regular expression without "/x"
                {                    
                    push @existing_groups, $entity;
                }
            }
            elsif(exists $user_alias_hash{$entity})
            {
                my @user_alias_contents_array=split(/,/x,$user_alias_hash{$entity});  #Regular expression without "/x"        
                foreach my $entity (@user_alias_contents_array)
                {
                    if ($entity =~ /^%/x) #Regular expression without "/x"
                    {
                        if (!grep({ /^\Q$entity\E$/x } @existing_groups)) #Regular expression without "/x"
                        {                    
                            push @existing_groups, $entity;
                        }
                    }
                    else
                    {
                        if (!grep({ /^\Q$entity\E$/x } @existing_users)) #Regular expression without "/x"
                        {
                            push @existing_users, $entity;
                        }                
                    }
                }
            }
            else
            {
                if (!grep({ /^\Q$entity\E$/x } @existing_users)) #Regular expression without "/x"
                {
                    push @existing_users, $entity;
                }                
            }
        }
    }
    # Data population completed
    
    # Actual Sudoers line processing here
    foreach my $line(@sudoers_matches)
    {
        my ($header,$rest) = split(/=/x, $line, 2); #Regular expression without "/x"
        my @run_as_components=();
        # Extracting RunAs fields started
        if ( $rest =~ /(\(.*?\))/x ) #Regular expression without "/x"
        {
            while ($rest =~ /(\(.*?\))/x) #Regular expression without "/x"
            {
                my $list=$1; 
                $list =~ s/\(|\)//xg; #Regular expression without "/x"
                my @runas_list = split(/\@/x,$list); #Regular expression without "/x"
                foreach my $runas_user (@runas_list)
                {
                    #if (!grep({ /^\Q$runas_user\E$/ } @run_as_components))
                   # {  
                        push @run_as_components,$runas_user;
                   # }
                }
                $rest =~ s/(\(.*?\))//x; #Regular expression without "/x"
            }
        }
        my $user_field = (split(/\s/x, $header))[0];     #Regular expression without "/x"      
        my @user_groups_field_list;
        if(defined $user_field)
        {
            @user_groups_field_list= split(/\,/x,$user_field); #Regular expression without "/x"
        }
        push @user_groups_field_list,@run_as_components;
        my @user_groups_sudoline_list = @user_groups_field_list;   
        
        # Below block is to remove runas part before getline
        $line =~ s/\([^)]+\)+//xg; #Regular expression without "/x"
        my $lhs=substr $line,0,index($line,'=');
        $lhs =~ s/\s.*//x; #Regular expression without "/x"
        my $rhs=substr $line,index($line,'=')+1;
        $rhs=~s/^\s*//xg; #Regular expression without "/x"
        $rhs =~s/,\s+/,/xg; #Regular expression without "/x"
        $line="$lhs=$rhs";
        #
        
        my ($filen, $line_num, $m_text) = get_line_location_text($line); #Sub called with "&"
        foreach my $entity (@user_groups_sudoline_list)
        {
            if ($entity =~ /^%/x) #Regular expression without "/x"
            {
                if ((scalar (grep {/^\Q$entity\E$/xi} @existing_groups)) > 1) #Regular expression without "/x"
                {
                   if ( $case_insensitive_group_copy == 1 ) # warning if case_insensitive_group is enabled 
                   {
                        IssueNote($entity,$line_num,$entity,"Same group name are specified with different case(s)",$m_text,$filen,"SFIT451935");        #Sub called with "&"
                   }
                }    
            }
            elsif(exists $user_alias_hash{$entity})
            {
                my @user_alias_contents_array=split(/,/x,$user_alias_hash{$entity});     #Regular expression without "/x"     
                
                foreach my $entity (@user_alias_contents_array)
                {
                    if ($entity =~ /^%/x) #Regular expression without "/x"
                    {
                        if ((scalar (grep {/^\Q$entity\E$/xi} @existing_groups)) > 1) #Regular expression without "/x"
                        {
                           if ( $case_insensitive_group_copy == 1 ) # warning if case_insensitive_group is enabled 
                           {
                                IssueNote($entity,$line_num,$entity,"Same group name are specified with different case(s)",$m_text,$filen,"SFIT451935");        #Sub called with "&"
                           }
                        }
                    }
                    else
                    {
                        if ((scalar (grep {/^\Q$entity\E$/xi} @existing_users)) > 1) #Regular expression without "/x"
                        {
                            if ( $case_insensitive_user_copy == 1 ) # warning if case_insensitive_user is enabled 
                            {
                                IssueNote($entity,$line_num,$entity,"Same user name is specified with different case(s)",$m_text,$filen,"SFIT451935"); #Sub called with "&"
                            }
                        }                     
                    }
                }
            }
            else
            {   
                if ((scalar (grep {/^\Q$entity\E$/xi} @existing_users)) > 1) #Regular expression without "/x"
                {
                    if ( $case_insensitive_user_copy == 1 ) # warning if case_insensitive_user is enabled 
                    {
                        IssueNote($entity,$line_num,$entity,"Same user name is specified with different case(s)",$m_text,$filen,"SFIT451935"); #Sub called with "&"
                    }
                }
            }
        }
    }
    return;
}
 sub backtick_evaluation
 {
    my ($backtick_cmd) = @_;  #Always unpack @_ first
	#$line =~ s/(chmod\s+(\-?([^\d*\s*]\S*)\s+)|chmod\s+)(\**\s*[\d|\[|\]|\*|\-]*\s+)/$1/g;
    my $regex = '\-?([^\d*\s*]\S*)\s+';
    my $perms = '\d|\[(\d|\-|\*)*\]';
    $backtick_cmd =~ s/(chmod\s+($regex)?)(\**\s*(\**\s*($perms){3}($perms){0,1})\s*)/$1/xg; #Regular expression without "/x" #ProhibitComplexRegexes
    $backtick_cmd =~ s/(mkdir\s+($regex)?)(\**\s*(\**\s*($perms){3}($perms){0,1})\s*)/$1/xg; #Regular expression without "/x" #ProhibitComplexRegexes
    return $backtick_cmd;
    
 
 
 }
sub check_if_command_and_arguments_exists #Sub called with "&"
{   my ($array_ref_copy) = @_; #require argument unpacking #Reused variable name in lexical scope
    if($DEBUG)
    {
        print "\nIn check_if_command_and_arguments_exists\n";
    }
    my $header;
    my $line_number;
    my @cmdsarray;
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    @sudoers_file_copy = grep ({ defined() and length() } @sudoers_file_copy);
    my @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults|^\s*$/x } @sudoers_file_copy); #require block grep #Regular expression without "/x"
    my $rest;
    foreach my $line(@sudoers_matches)
    {
        my $getline_line=$line;
        # To delimit part till ; or | as per defect 462734
        #$line=(split(/\||\;/,$getline_line))[0];
        #below line is substituted for defect 451656
        #$line =~ s/((chmod|chown|chgrp|cat|diff|tar|gzip|gunzip|compress|uncompress|zcat|ls|rm|rmdir|mount|umount|cp|find|head|ln|mkdir|mv|tail|touch)\s+)(\*\s+)/$1/g;
        if(defined $line)
        {
        $line =~ s/((chown|chgrp)\s+)(\*\s+)/$1/xg; #Regular expression without "/x"
        $line =~ s/\-\-(\w|\-)+\=\s*[\"|\'].+?[\"|\']//xg;   #/bin/touch --date="1 February" /tea/file1.txt,/bin/ls #Regular expression without "/x"
        $line =~ s/(chown\s+\-+\S*\s+|chown\s+)(\-\-reference\=)/$1%/x;#/bin/chown --reference=file2 file1 #Regular expression without "/x"
        $line =~ s/(chmod\s+\-+\S*\s+|chmod\s+)(\-\-reference\=)/$1%/x;#/bin/chown --reference=file2 file1 #Regular expression without "/x"
        $line =~ s/(chmod\s+\-+\S*\s+|chmod\s+)(\-\-reference\s+)/$1%/x; #Regular expression without "/x"
        $line =~ s/(chgrp\s+\-+\S*\s+|chgrp\s+)(\-\-reference\=)/$1%/x; #Regular expression without "/x"
        #print "\n line after : $line";
        if($line =~ /\-\-((\w|\-)+)\=\S+/x) #Regular expression without "/x"
        {
            if($1 !~ /from/)
            {
                $line =~ s/\-\-(\w|\-)+\=\S+//xg; #Regular expression without "/x"
            }
            else
            {
                $line =~ s/(\-\-(\w|\-)+)\=(\S+)/$1_$3/xg; #Regular expression without "/x" 
            }
        }
        my $regex = '[ugoa]*([-+=]([rwxXst]*|[ugo]))+|[-+=][0-7]+.*?';
        my $perm = '\d|\[(\d|\-|\*)*\]';
        my $num = '\-?([^\d*\s*]\S*)\s+';
        $line =~ s/(chmod\s+(\-?\S*\s+)|chmod\s+)((\[.+?\]){1,4}\s+)/$1/xg; #Regular expression without "/x"
        $line =~ s/(chmod\s+(\-?\S*\s+)?)($regex)(\S+)/$1/xg; #Regular expression without "/x"  #ProhibitComplexRegexes
        $line =~ s/(mkdir\s+(\-+\S*\s+)?)($regex)(\S+)/$1/xg; #Regular expression without "/x" #ProhibitComplexRegexes
        
        #$line =~ s/(mkdir\s+(\-?\S*\s+)|mkdir\s+)((\d){1,4}\s+)/$1/g; #changed
        $line =~ s/(mkdir\s+(\-?([^\d*\s*]\w*)\s+)|mkdir\s+)((\d){3,4}\s+)/$1/xg; #Regular expression without "/x"
        #$line =~ s/(chmod\s+.*?)(\d+)(\S+)/$1/g;              
        #$line =~ s/(mkdir\s+(\-?\S*\s+)|mkdir\s+)((\*|\d*|\*\d*|\d*\*)(\[\d*\]|\d*)(\*|\d*|\*\d*|\d*\*)\s+)/$1/g; #added line for  Defect 564786
        $line =~ s/(mkdir\s+($num)?)(\**\s*(\**\s*($perm){3}($perm){0,1})\s+)/$1/xg; #added line for  Defect 564786 #Regular expression without "/x" #ProhibitComplexRegexes
        
        $line =~ s/(chmod\s+(\-?([^\d*\s*]\w*)\s+)|chmod\s+)((\d){3,4}\s+)/$1/xg; #subsituting chmod digits. #change #Regular expression without "/x"
        #$line =~ s/(chmod\s+(\-?\S*\s+)|chmod\s+)((\*|\d*|\*\d*|\d*\*)(\[\d*\]|\d*)(\*|\d*|\*\d*|\d*\*)\s+)/$1/g; #added line for  Defect 564786
        $line =~ s/(chmod\s+($num)?)(\**\s*(\**\s*($perm){3}($perm){0,1})\s+)/$1/xg;#added line for  Defect 564786 #Regular expression without "/x" #ProhibitComplexRegexes
        
        #below substitutions for mount commands to handle commas in parameter value : ex:mount -v -o opt1,opt2 -O opt3,opt4 /file
        #$line =~ s/(\bmount\s+(\-?\S*\s+)|\bmount\s+)(\-o\s+\S+\s+)/$1/g;
        $line =~ s/--all-targets//xg; #Regular expression without "/x"
        $line =~ s/--no-canonicalize//xg; #Regular expression without "/x"
        $line =~ s/--detach-loop//xg; #Regular expression without "/x"
        $line =~ s/--internal-only//xg; #Regular expression without "/x"
        $line =~ s/--no-mtab//xg; #Regular expression without "/x"
        $line =~ s/--read-only//xg; #Regular expression without "/x"
        $line =~ s/--make-rshared//xg; #Regular expression without "/x"
        $line =~ s/--move//xg; #Regular expression without "/x"
        $line =~ s/(\bmount\s+(.*?))(\-[a-z|A-Z]*o[a-z|A-Z]*\s+\S+\s+)/$1/xg; #Regular expression without "/x" #ProhibitComplexRegexes
        $line =~ s/(\bmount\s+(.*?))(\-[a-z|A-Z]*O[a-z|A-Z]*\s+\S+\s+)/$1/xg; #Regular expression without "/x" #ProhibitComplexRegexes
        $line =~ s/(\bmount\s+(.*?))(\-[a-z|A-Z]*t[a-z|A-Z]*\s+\S+\s+)/$1/xg; #Regular expression without "/x" #ProhibitComplexRegexes
        $line =~ s/(\bmount\s+(.*?))(\-\-options\s+\S+\s+)/$1/xg; #Regular expression without "/x" #ProhibitComplexRegexes
        $line =~ s/(\bmount\s+(.*?))(\-\-test\-opts\s+\S+\s+)/$1/xg; #Regular expression without "/x" #ProhibitComplexRegexes
        $line =~ s/(\bumount\s+(.*?))(\-\-test\-opts\s+\S+\s+)/$1/xg; #Regular expression without "/x" #ProhibitComplexRegexes
        $line =~ s/(\bumount\s+(.*?))(\-[a-z|A-Z]*O[a-z|A-Z]*\s+\S+\s+)/$1/xg; #Regular expression without "/x" #ProhibitComplexRegexes
        $line =~ s/(\bumount\s+(.*?))(\-[a-z|A-Z]*t[a-z|A-Z]*\s+\S+\s+)/$1/xg; #Regular expression without "/x" #ProhibitComplexRegexes
        #$line =~ s/\`(.*?)\`//g;
            ($header,$rest)=split(/=/x,$line,2);  #Regular expression without "/x"  #krizel       #ibm1 ALL = /bin/cat -n /a.txt b.txt c.txt,/bin/head -n b.txt
        }
        if(defined $rest)
        {
            @cmdsarray = split(/\,/x,$rest); #Regular expression without "/x"
        }
        foreach my $cmd(@cmdsarray)
        {
            # my @piped_command = split (/\||&&/,$cmd);  orig
            my @piped_command = split (/&&/x,$cmd);   #Regular expression without "/x"
            foreach my $pipe_command (@piped_command)
            {
                $pipe_command =~ s/(.*)\\/$1/xg; #krizel  #Regular expression without "/x"
                $pipe_command =~ s/(\')(.+?)(\')/$2/xg; #Regular expression without "/x"
                my ($filen, $line_num, $m_text) = get_line_location_text($getline_line); #Sub called with "&"
                if(!defined $m_text){$m_text="";}
                if(!defined $line_num){$line_num="";}
                $pipe_command =~ s/^\s*|\s*$//xg; #Regular expression without "/x"
                #$pipe_command=(split(/\||\;/,$pipe_command))[0]; #krizel
                $pipe_command=~s/(NOEXEC|EXEC|PASSWD|NOPASSWD|FOLLOW|NOFOLLOW)\s*:\s*//xg;  #Regular expression without "/x" #ProhibitComplexRegexes
                $pipe_command=~s/(LOG_INPUT|NOLOG_INPUT|LOG_OUTPUT|NOLOG_OUTPUT)\s*:\s*//xg; #ProhibitComplexRegexes
                $pipe_command=~s/(MAIL|NOMAIL|SETENV|NOSETENV)\s*:\s*//xg; #ProhibitComplexRegexes
                if ($pipe_command !~ m/^\s*\!/x)   #ignore commands starting with !  #Regular expression without "/x"
                {   
                    if($pipe_command =~ /.*\`\s*(.*?)\s*\`.*/x and $pipe_command =~ /^\s*\//x) #Regular expression without "/x" #command starts with / and has backticks
                    {
                        my $backtick_cmd=$pipe_command;
                        $backtick_cmd =~ s/.*\`\s*(.*?)\s*\`.*/$1/xg; #Regular expression without "/x"
                        $backtick_cmd =~ s/\|.*//xg; #Regular expression without "/x"
                        $backtick_cmd =~ s/\;.*//xg; #Regular expression without "/x"
                        $backtick_cmd=~ s/^\s*|\s*$//xg; #Regular expression without "/x"
                            $backtick_cmd=backtick_evaluation($backtick_cmd); #Sub called with "&"
                        my($first,$lastpart) = split(/[\s+]/x,$backtick_cmd,2);  #Regular expression without "/x"##ProhibitAmbiguousNames
                         if($first!~ /^\s*\//x) #Regular expression without "/x"
                         {
                            if($first !~ /\QALL\E/x and $first !~ /\Qsudoedit\E/x and $first !~ /^\*/x) #Regular expression without "/x"
                            {
                                IssueWarning("$header","$line_num","$first", "command does not start with /","$m_text","$filen",'SFIT438597'); #Sub called with "&"
                            }
                         }
                           
                        $first =~ s/^\s*|\s*$//xg; #Regular expression without "/x"
                        if(grep{ /^\Q$first\E$/x } @commands_to_check) #Regular expression without "/x"
                        { 
                            $lastpart =~ s/[\<|\>\|]//xg; #ProhibitAmbiguousNames #Regular expression without "/x"
                            $lastpart =~ s/2\s\&1//xg; #ProhibitAmbiguousNames #Regular expression without "/x"
                            $lastpart =~ s/^\s*|\s*$//xg; #ProhibitAmbiguousNames #Regular expression without "/x"
                            $lastpart =~ s/[\s]{2,}/ /xg; #ProhibitAmbiguousNames #Regular expression without "/x" 
                            check_arguments($lastpart,$header,$line_num,$first,$m_text,$filen,$getline_line,$first); #ProhibitAmbiguousNames #Sub called with "&"
                            
                        }
                    }
                    elsif($pipe_command =~ /^\`\s*(.*?)\s*\`/x) #has backticks only #Regular expression without "/x"
                    {
                        #print "\npipe_cmd in 3rd if ==$pipe_command";
                        
                        my $backtick_cmd=$pipe_command;
                        $backtick_cmd =~ s/.*\`\s*(.*?)\s*\`.*/$1/xg; #Regular expression without "/x"
                        $backtick_cmd =~ s/\|.*//xg; #Regular expression without "/x"
                        $backtick_cmd=~ s/^\s*|\s*$//xg; #Regular expression without "/x"
                        #print "\nbacktick_cmd==$backtick_cmd";
                        $backtick_cmd=backtick_evaluation($backtick_cmd); #Sub called with "&"
                        my($first,$lastpart) = split(/[\s+]/x,$backtick_cmd,2);  #Regular expression without "/x"#ProhibitAmbiguousNames
                        if($first!~ /^\s*\//x)  #Regular expression without "/x"
                        {
                            if($first !~ /\QALL\E/x and $first !~ /\Qsudoedit\E/x and $first !~ /^\*/x) #Regular expression without "/x"
                           {
                           IssueWarning("$header","$line_num","$first", "command does not start with /","$m_text","$filen",'SFIT438597'); #Sub called with "&"
                           }
                        }
                           
                        $first =~ s/^\s*|\s*$//xg; #Regular expression without "/x"
                        if(grep{ /^\Q$first\E$/x } @commands_to_check) #Regular expression without "/x"
                        { 
                            $lastpart =~ s/[\<|\>\|]//xg; #ProhibitAmbiguousNames #Regular expression without "/x"
                            $lastpart =~ s/2\s\&1//xg;#ProhibitAmbiguousNames #Regular expression without "/x"
                            $lastpart =~ s/^\s*|\s*$//xg; #ProhibitAmbiguousNames #Regular expression without "/x"
                            $lastpart =~ s/[\s]{2,}/ /xg; #ProhibitAmbiguousNames #Regular expression without "/x" 
                            check_arguments($lastpart,$header,$line_num,$first,$m_text,$filen,$getline_line,$first); #ProhibitAmbiguousNames #Sub called with "&"
                            
                        }
                    }
                    elsif($pipe_command !~ /^\s*\//x and $pipe_command =~ /.*\`\s*(.*?)\s*\`.*/x  ) #Regular expression without "/x" #command does not start with / and has backticks
                    {
                    
                        #print "\npipe_cmd in 2nd if ==$pipe_command";
                        my ($new_cmd,$rest_pipe_command)=split(/\s/x,$pipe_command); #Regular expression without "/x"#chown --from=guest user1 tmpfile
                        if($new_cmd !~ /\QALL\E/x and $new_cmd !~ /\Qsudoedit\E/x and $new_cmd !~ /^\*/x) #Regular expression without "/x"
                        {
                            IssueWarning("$header","$line_num","$new_cmd", "command does not start with /","$m_text","$filen",'SFIT438597'); #Sub called with "&"
                        }
                        if($pipe_command =~ /.*\`\s*(.*?)\s*\`.*/x ) #Regular expression without "/x"
                        {
                            my $backtick_cmd=$pipe_command;
                            $backtick_cmd =~ s/.*\`\s*(.*?)\s*\`.*/$1/xg; #Regular expression without "/x"
                            $backtick_cmd =~ s/\|.*//xg; #Regular expression without "/x"
                            $backtick_cmd=~ s/^\s*|\s*$//xg; #Regular expression without "/x"
                            #print "\nbacktick_cmd==$backtick_cmd";
                            $backtick_cmd=backtick_evaluation($backtick_cmd); #Sub called with "&"
                            my($first,$lastpart) = split(/[\s+]/x,$backtick_cmd,2); #ProhibitAmbiguousNames #Regular expression without "/x"
                            if($first!~ /^\s*\//x) #Regular expression without "/x"
                            {
                                if($first !~ /\QALL\E/x and $first !~ /\Qsudoedit\E/x and $first !~ /^\*/x) #Regular expression without "/x"
                                {
                                    IssueWarning("$header","$line_num","$first", "command does not start with /","$m_text","$filen",'SFIT438597'); #Sub called with "&"
                                }
                            }
                           
                            $first =~ s/^\s*|\s*$//xg; #Regular expression without "/x"
                            if(grep{ /^\Q$first\E$/x } @commands_to_check) #Regular expression without "/x"
                            { 
                                $lastpart =~ s/[\<|\>\|]//xg; #ProhibitAmbiguousNames #Regular expression without "/x"
                                $lastpart =~ s/2\s\&1//xg;#ProhibitAmbiguousNames #Regular expression without "/x"
                                $lastpart =~ s/^\s*|\s*$//xg;#ProhibitAmbiguousNames #Regular expression without "/x"
                                $lastpart =~ s/[\s]{2,}/ /xg;#ProhibitAmbiguousNames  #Regular expression without "/x" 
                                check_arguments($lastpart,$header,$line_num,$first,$m_text,$filen,$getline_line,$first);#ProhibitAmbiguousNames #Sub called with "&"
                                
                            }
                        }
                    }
                    
                    else #Cascading if-elsif chain
                    {   
                        if($pipe_command !~ /^\s*\//x and $pipe_command !~ /.*\`\s*(?:.*?)\s*\`.*/x ) #no backticks #ProhibitUnusedCapture #Regular expression without "/x"
                        {
                        my ($new_cmd,$rest_pipe_command)=split(/\s/x,$pipe_command); #Regular expression without "/x"#chown --from=guest user1 tmpfile
                        if($new_cmd !~ /\QALL\E/x and $new_cmd !~ /\Qsudoedit\E/x and $new_cmd !~ /^\*/x) #Regular expression without "/x"
                        {
                            IssueWarning("$header","$line_num","$new_cmd", "command does not start with /","$m_text","$filen",'SFIT438597'); #Sub called with "&"
                        }
                    }
                    }
                    $pipe_command =~ s/\`(.*?)\`//xg;  #Regular expression without "/x" #/usr/bin/ls /proc/`pidof\ anacron` file1.txt -> /usr/bin/ls /proc/ file1.txt
                    $pipe_command=~ s/\|.*//xg; #Regular expression without "/x"
                    $pipe_command=~ s/\;.*//xg; #change #Regular expression without "/x"
                    $pipe_command =~ s/^\s*|\s*$//xg; #Regular expression without "/x"
                    my $main_command;
                    my $parameters = "";
                    ($main_command,$parameters)=split(/[\s+]/x,$pipe_command,2); #Regular expression without "/x"
                    $main_command =~ s/^\s*|\s*$//xg; #Regular expression without "/x"
                    # Below if is for regular commands i.e. without backquotes
                    if(grep{ /^\Q$main_command\E$/x } @commands_to_check) #require block grep #Regular expression without "/x"
                    {
                        #my @arguments_list = split(/\s/,$parameters);
                        if(defined $parameters)
                        {
                        $parameters =~ s/[\<|\>\|]//xg;  #Regular expression without "/x"
                        $parameters =~ s/2\s\&1//xg; #Regular expression without "/x"
                        #$parameters =~ s/\s1\s{1}+//g;         #to substitute only 1> with nothing
                        #$parameters =~ s/\-\-(\w|\-)+\=\S+//g; #--remove-destination=abc
                        $parameters =~ s/^\s*|\s*$//xg; #Regular expression without "/x"
                        $parameters =~ s/[\s]{2,}/ /xg; #Regular expression without "/x" 
                        }
                        check_arguments($parameters,$header,$line_num,$cmd,$m_text,$filen,$getline_line,$main_command); #Sub called with "&"
                        
                    }
                }
            }
        }
    }
    return; #require final return 
}

sub check_arguments
{
    my($parameters,$header,$line_num,$cmd,$m_text,$filen,$getline_line,$main_command)=@_;
    SWITCH: 
        {
            if($main_command =~ /mkdir/) {check_arguments_for_mkdir($parameters,$header,$line_num,$cmd,$m_text,$filen,$getline_line,$main_command); last SWITCH; }  #Sub called with "&"
            if($main_command =~ /(cat|rmdir|rm|uncompress)/x) {check_arguments_for_simple_commands($parameters,$header,$line_num,$cmd,$m_text,$filen,$getline_line,$main_command); last SWITCH; } #Regular expression without "/x" #Sub called with "&"
            if($main_command =~ /cp/) {check_arguments_for_cp($parameters,$header,$line_num,$cmd,$m_text,$filen,$getline_line,$main_command); last SWITCH; } #Sub called with "&"
            if($main_command =~ /ls/) {check_arguments_for_ls($parameters,$header,$line_num,$cmd,$m_text,$filen,$getline_line,$main_command); last SWITCH; } #Sub called with "&"
            if($main_command =~ /(mv|ln)/x) { check_arguments_for_ln_mv($parameters,$header,$line_num,$cmd,$m_text,$filen,$getline_line,$main_command); last SWITCH; }    #Regular expression without "/x" #Sub called with "&"
            if($main_command =~ /diff/) {check_arguments_for_diff($parameters,$header,$line_num,$cmd,$m_text,$filen,$getline_line,$main_command); last SWITCH; } #Sub called with "&"
            if($main_command =~ /touch/){check_arguments_for_touch($parameters,$header,$line_num,$cmd,$m_text,$filen,$getline_line,$main_command); last SWITCH; } #Sub called with "&"
            if($main_command =~ /head/){check_arguments_for_head($parameters,$header,$line_num,$cmd,$m_text,$filen,$getline_line,$main_command); last SWITCH; } #Sub called with "&"
            if($main_command =~ /compress/){check_arguments_for_compress($parameters,$header,$line_num,$cmd,$m_text,$filen,$getline_line,$main_command); last SWITCH; } #Sub called with "&"
            if($main_command =~ /(gunzip|gzip|zcat)/x){check_arguments_for_gunzip_gzip_zcat($parameters,$header,$line_num,$cmd,$m_text,$filen,$getline_line,$main_command); last SWITCH; } #Regular expression without "/x" #Sub called with "&"
            if($main_command =~ /tar/){check_arguments_for_tar($parameters,$header,$line_num,$cmd,$m_text,$filen,$getline_line,$main_command); last SWITCH; } #Sub called with "&"
            if($main_command =~ /(chown|chgrp)/x){check_arguments_for_chown_chgrp($parameters,$header,$line_num,$cmd,$m_text,$filen,$getline_line,$main_command); last SWITCH; } #Regular expression without "/x" #Sub called with "&"
            if($main_command =~ /find/){check_arguments_for_find($parameters,$header,$line_num,$cmd,$m_text,$filen,$getline_line,$main_command); last SWITCH; } #Sub called with "&"
            if($main_command =~ /chmod/){check_arguments_for_chmod($parameters,$header,$line_num,$cmd,$m_text,$filen,$getline_line,$main_command); last SWITCH; } #Sub called with "&"
            if($main_command =~ /(mount|umount)/x){check_arguments_for_mount_umount($parameters,$header,$line_num,$cmd,$m_text,$filen,$getline_line,$main_command); last SWITCH; }#Regular expression without "/x" #Sub called with "&"
            if($main_command =~ /(tail)/x){check_arguments_for_tail($parameters,$header,$line_num,$cmd,$m_text,$filen,$getline_line,$main_command); last SWITCH; } #Regular expression without "/x" #Sub called with "&"
        }

    return #require final return;
}

sub check_arguments_for_cp()
{
    my ($parameters,$header,$line_num,$cmd,$m_text,$filen,$line,$main_command)=@_;
    if(defined $parameters)
    {
    $parameters =~ s/(\"|\')(.+?)(\"|\')/$2/xg; #Regular expression without "/x"
    $parameters =~ s/--remove-destination//xg;  #--remove-destination  #Regular expression without "/x"
    $parameters =~ s/--attributes-only//xg; #Regular expression without "/x"
    $parameters =~ s/--copy-contents//xg; #Regular expression without "/x"
    $parameters =~ s/--no-clobber//xg; #Regular expression without "/x"
    $parameters =~ s/--no-dereference//xg; #Regular expression without "/x"
    $parameters =~ s/--strip-trailing-slashes//xg; #Regular expression without "/x"
    $parameters =~ s/--symbolic-link//xg; #Regular expression without "/x"
    $parameters =~ s/--no-target-directory//xg; #Regular expression without "/x"
    $parameters =~ s/--one-file-system//xg; #Regular expression without "/x"
    
    # if(($parameters =~ /(\-[a-z|A-Z]*(S|t)[a-z|A-Z]*\s+\S+)/) or ($getOS =~ /AIX/ and $parameters =~ /(\-[a-z|A-Z]*(S|t|E)[a-z|A-Z]*\s+\S+)/))  
    # {
        # $parameters =~ s/\Q$1\E/g;  
    # }
    # if($getOS =~ /AIX/)
    # {
        # $parameters =~ s/\-[a-z|A-Z]*(S|t|E)[a-z|A-Z]*\s+\S+//g; 
    # }
    # else
    # {
        $parameters =~ s/\[.+\]\S*//xg;  #substituting values such as [-0-9]* or [-f]*. #Regular expression without "/x"
        $parameters =~ s/\-[a-z|A-Z]*(S|t)[a-z|A-Z]*\s+\S+//xg; #Regular expression without "/x"
    # }
    my @arguments_list = split(/\s/x,$parameters); #Regular expression without "/x"
    foreach my $argument(@arguments_list)
    {
        if( ($argument !~ /^\//x) and ($argument !~ /^\-/x) and ($argument !~ /^\s*$/x) and ($argument !~ /^\*/x)) #Regular expression without "/x"
        {
            IssueWarning("$header","$line_num","$main_command", "file argument $argument does not start with /","$m_text","$filen",'SFIT438597'); #Sub called with "&"
        }
    }
    }
    return; #require final return 
}

sub check_arguments_for_ls()
{
    my ($parameters,$header,$line_num,$cmd,$m_text,$filen,$line,$main_command)=@_;
    if(defined $parameters)
    {
    $parameters =~ s/(\"|\')(.+?)(\"|\')/$2/xg; #Regular expression without "/x"
    $parameters =~ s/--almost-all//xg; #Regular expression without "/x"
    $parameters =~ s/--ignore-backups//xg; #Regular expression without "/x"
    $parameters =~ s/--file-type//xg; #Regular expression without "/x"
    $parameters =~ s/--full-time//xg; #Regular expression without "/x"
    $parameters =~ s/--group-directories-first//xg; #Regular expression without "/x"
    $parameters =~ s/--no-group//xg; #Regular expression without "/x"
    $parameters =~ s/--human-readable//xg; #Regular expression without "/x"
    $parameters =~ s/--dereference-command-line//xg; #Regular expression without "/x"
    $parameters =~ s/--dereference-command-line-symlink-to-dir//xg; #Regular expression without "/x"
    $parameters =~ s/--numeric-uid-gid//xg; #Regular expression without "/x"
    $parameters =~ s/--hide-control-chars//xg; #Regular expression without "/x"
    $parameters =~ s/--show-control-chars//xg; #Regular expression without "/x"
    $parameters =~ s/--quote-name//xg; #Regular expression without "/x"
    # if($parameters =~ /(\-[a-z|A-Z]*(w|T)[a-z|A-Z]*\s+\S+)/) 
    # {
        # $parameters =~ s/\Q$1\E//g;  
    # }
    $parameters =~ s/\[.+\]\S*//xg;  #substituting values such as [-0-9]* or [-f]*. #Regular expression without "/x"
    $parameters =~ s/\-[a-z|A-Z]*(w|T)[a-z|A-Z]*\s+\S+//xg; #Regular expression without "/x"
    
    my @arguments_list = split(/\s/x,$parameters); #Regular expression without "/x"
    foreach my $argument(@arguments_list)
    {
        if(($argument !~ /^\//x) and ($argument !~ /^\-/x) and ($argument !~ /^\s*$/x) and ($argument !~ /^\*/x)) #Regular expression without "/x"
        {
            IssueWarning("$header","$line_num","$main_command", "file argument $argument does not start with /","$m_text","$filen",'SFIT438597'); #Sub called with "&"
        }
    }
    }
    return; #require final return
}

sub check_arguments_for_mount_umount()
{
    my ($parameters,$header,$line_num,$cmd,$m_text,$filen,$line,$main_command)=@_;
    if(!defined $m_text){$m_text="";}
    if(!defined $line_num){$line_num="";}
    if(defined $parameters)
    {
    $parameters =~ s/(\"|\')(.+?)(\"|\')/$2/xg; #Regular expression without "/x"
    # $parameters =~ s/--all-targets//g;
    # $parameters =~ s/--no-canonicalize//g;
    # $parameters =~ s/--detach-loop//g;
    # $parameters =~ s/--internal-only//g;
    # $parameters =~ s/--no-mtab//g;
    # $parameters =~ s/--read-only//g;
    # $parameters =~ s/--make-rshared//g;

    # if(($parameters =~ /(\-[a-z|A-Z]*t[a-z|A-Z]*\s+\S+)/) or ($getOS =~ /AIX/ and $parameters =~ /(\-[a-z|A-Z]*(t|n|v)[a-z|A-Z]*\s+\S+)/))
    # {
        # $parameters =~ s/\Q$1\E//g; 
    # }

    # if($getOS =~ /AIX/)
    # {
        # $parameters =~ s/\-[a-z|A-Z]*(n|v)[a-z|A-Z]*\s+\S+//g; 
    # }
    # else
    # {
        $parameters =~ s/\[.+\]\S*//xg;  #substituting values such as [-0-9]* or [-f]*. #Regular expression without "/x"
        $parameters =~ s/\-[a-z|A-Z]*U[a-z|A-Z]*\s+\S+//xg; #Regular expression without "/x"
    # }
    
    my @arguments_list = split(/\s/x,$parameters); #Regular expression without "/x"
    foreach my $argument(@arguments_list)
    {
        if((($argument !~ /^\//x) and ($argument !~ /^\-/x) and ($argument !~ /^\s*$/x) and ($argument !~ /^\*/x)) or (($argument !~ /^\//x) and ($argument !~ /^\-/x) and ($getOS =~ /AIX/x) and ($argument !~ /(?:all|allr)/x) and ($argument !~ /^\s*$/x) and ($argument !~ /^\*/x))) #ProhibitUnusedCapture #Regular expression without "/x"
        {
            IssueWarning("$header","$line_num","$main_command", "file argument $argument does not start with /","$m_text","$filen",'SFIT438597'); #Sub called with "&"
        }
    }
    }
    return; #require final return 
}

sub check_arguments_for_chmod()
{
    my ($parameters,$header,$line_num,$cmd,$m_text,$filen,$line,$main_command)=@_;
    if(defined $parameters)
    {
    $parameters =~ s/(\"|\')(.+?)(\"|\')/$2/xg; #Regular expression without "/x"
    $parameters =~ s/--no-preserve-root//xg; #Regular expression without "/x"
    $parameters =~ s/--preserve-root//xg; #Regular expression without "/x"
    $parameters =~ s/\%\S+//x; #Regular expression without "/x"
    $parameters =~ s/^\s*|\s*$//xg; #Regular expression without "/x"
    $parameters =~ s/\[.+\]\S*//xg;  #substituting values such as [-0-9]* or [-f]*. #Regular expression without "/x"
    my @arguments_list = split(/\s/x,$parameters); #Regular expression without "/x"
    foreach my $argument(@arguments_list)
    {
        if( ($argument !~ /^\//x) and ($argument !~ /^\-/x) and ($argument !~ /^\s*$/x) and ($argument !~ /^\*/x))  #Regular expression without "/x"
        {
            IssueWarning("$header","$line_num","$main_command", "file argument $argument does not start with /","$m_text","$filen",'SFIT438597'); #Sub called with "&"
        }
    }
    }
    return; #require final return 
}

sub check_arguments_for_chown_chgrp()
{
    my ($parameters,$header,$line_num,$cmd,$m_text,$filen,$line,$main_command)=@_;
    if(defined $parameters)
    {
    $parameters =~ s/(\"|\')(.+?)(\"|\')/$2/xg; #Regular expression without "/x"
    $parameters =~ s/--no-preserve-root//xg; #Regular expression without "/x"
    $parameters =~ s/--preserve-root//xg; #Regular expression without "/x"
    $parameters =~ s/--no-dereference//xg; #Regular expression without "/x"
    $parameters =~ s/\-\-from\_\S+\s+//x;  #Regular expression without "/x"
    $parameters =~ s/\-[a-z|A-Z]*R[a-z|A-Z]*\s+//x; #Regular expression without "/x"
    $parameters =~ s/\-\S+//xg;                  #removing parameters starting with - or --  #Regular expression without "/x"
    $parameters =~ s/^\s*|\s*$//xg; #Regular expression without "/x"
    #$parameters =~ s/\Qgroup\E//;
    $parameters =~ s/\[.+\]\S*//xg;  #substituting values such as [-0-9]* or [-f]*. #Regular expression without "/x"
    my @arguments_list = split(/\s/x,$parameters); #Regular expression without "/x"
    if($cmd !~ /.*(?:chown|chgrp)\s*\`.+\`\s.*/x) #ProhibitUnusedCapture#Regular expression without "/x"
    {   
        splice @arguments_list,0,1;
    }
    foreach my $argument(@arguments_list)
    {
        if(($argument !~ /^\//x) and ($argument !~ /^\-/x) and ($argument !~ /^\s*$/x) and ($argument !~ /\:/x) and ($argument !~ /^\*/x))  #Regular expression without "/x"
        {
            IssueWarning("$header","$line_num","$main_command", "file argument $argument does not start with /","$m_text","$filen",'SFIT438597'); #Sub called with "&"
        }
    }
    }
    return; #require final return 
}

sub check_arguments_for_find()
{
    my ($parameters,$header,$line_num,$cmd,$m_text,$filen,$line,$main_command)=@_;
    if(defined $parameters)
    {
    $parameters =~ s/(\"|\')(.+?)(\"|\')/$2/xg; #Regular expression without "/x"
    # if($parameters =~ /(\-[a-z|A-Z]*(H|L|P)[a-z|A-Z]*\s+)/)
    # {
        # $parameters =~ s/\Q$1\E//;
    # }
    $parameters =~ s/\[.+\]\S*//xg;  #substituting values such as [-0-9]* or [-f]*. #Regular expression without "/x"
    $parameters =~ s/\-[a-z|A-Z]*(H|L|P)[a-z|A-Z]*\s+//x; #Regular expression without "/x"
    $parameters =~ s/\-[a-z|A-Z]*D[a-z|A-Z]*\s+\S+//x; #Regular expression without "/x"
    $parameters =~ s/\-[a-z|A-Z]*Olevel[a-z|A-Z]*\s+\d+//x; #Regular expression without "/x"
    $parameters =~ s/\-O\d+\s+//x; #Regular expression without "/x"
    #$parameters =~ s/\-\S+//g;          --find_vsk
    # if ($parameters =~ /(\-[a-z|A-Z]*D[a-z|A-Z]*\s+\S+)/ )
    # {
        # $parameters =~ s/\Q$1\E//;
    # }
    # if($parameters =~ /(\-[a-z|A-Z]*Olevel[a-z|A-Z]*\s+\d+)/)
    # {
        # $parameters =~ s/\Q$1\E//;
    # }
    $parameters =~ s/^\s*|\s*$//x; #Regular expression without "/x"
    my @arguments_list = split(/\s/x,$parameters); #Regular expression without "/x"
    my $first_element=splice @arguments_list,0,1;
    if($first_element)
    {
        if(($first_element !~ /^\//x) and ($first_element !~ /^\*/x) and ($first_element !~ /^\-/x)) #--find_vsk #Regular expression without "/x"
        {
            IssueWarning("$header","$line_num","$main_command", "file argument $first_element does not start with /","$m_text","$filen",'SFIT438597'); #Sub called with "&"
        }
    }
    }
    return; #require final return 
}

sub check_arguments_for_mkdir()
{
    my ($parameters,$header,$line_num,$cmd,$m_text,$filen,$line,$main_command)=@_;
    if(defined $parameters)
    {
    $parameters =~ s/(\"|\')(.+?)(\"|\')/$2/xg; #Regular expression without "/x"
    # if($parameters =~ /(\-[a-z|A-Z]*m[a-z|A-Z]*\s+\S+)/)  #mkdir -vm 777 dira or mkdir -m 777 dira
    # {
        # $parameters =~ s/\Q$1\E//g;
    # }
    $parameters =~ s/\-[a-z|A-Z]*m[a-z|A-Z]*\s+\d+//xg; #Regular expression without "/x"
    $parameters =~ s/\[.+\]\S*//xg;  #substituting values such as [-0-9]* or [-f]*. #Regular expression without "/x"
    my @arguments_list = split(/\s/x,$parameters); #Regular expression without "/x"
    foreach my $argument(@arguments_list)
    {
        if( ($argument !~ /^\//x) and ($argument !~ /^\-/x) and ($argument !~ /^\s*$/x) and ($argument !~ /^\*/x)) #Regular expression without "/x"
        {
            IssueWarning("$header","$line_num","$main_command", "file argument $argument does not start with /","$m_text","$filen",'SFIT438597'); #Sub called with "&"
        }
    }
    return; #require final return 
    }
}

sub check_arguments_for_simple_commands()
{
    my ($parameters,$header,$line_num,$cmd,$m_text,$filen,$line,$main_command)=@_;
    if(!defined $m_text){$m_text="";}
    if(!defined $line_num){$line_num="";}
    if(defined $parameters)
    {
    $parameters =~ s/(\"|\')(.+?)(\"|\')/$2/xg;#Regular expression without "/x"
    $parameters =~ s/--show-all//xg; #Regular expression without "/x"
    $parameters =~ s/--number-nonblank//xg; #Regular expression without "/x"
    $parameters =~ s/--show-ends//xg; #Regular expression without "/x"
    $parameters =~ s/--squeeze-blank//xg; #Regular expression without "/x"
    $parameters =~ s/--show-tabs//xg; #Regular expression without "/x"
    $parameters =~ s/--show-nonprinting//xg; #Regular expression without "/x"
    $parameters =~ s/--one-file-system//xg; #Regular expression without "/x"
    $parameters =~ s/--no-preserve-root//xg; #Regular expression without "/x"
    $parameters =~ s/--preserve-root//xg; #Regular expression without "/x"
    $parameters =~ s/--ignore-fail-on-non-empty//xg; #Regular expression without "/x"
    $parameters =~ s/\[.+\]\S*//xg;  #substituting values such as [-0-9]* or [-f]*. #Regular expression without "/x"
    my @arguments_list = split(/\s/x,$parameters); #Regular expression without "/x"
    foreach my $argument(@arguments_list)
    {
        if( ($argument !~ /^\//x) and ($argument !~ /^\-/x) and ($argument !~ /^\s*$/x) and ($argument !~ /^\*/x)) #Regular expression without "/x"
        {
            IssueWarning("$header","$line_num","$main_command", "file argument $argument does not start with /","$m_text","$filen",'SFIT438597'); #Sub called with "&"
        }
    }
    }
    return; #require final return 
}

sub check_arguments_for_ln_mv()
{
    my ($parameters,$header,$line_num,$cmd,$m_text,$filen,$line,$main_command)=@_;
    if(defined $parameters)
    {
    $parameters =~ s/(\"|\')(.+?)(\"|\')/$2/xg; #Regular expression without "/x"
    $parameters =~ s/--no-dereference//xg; #Regular expression without "/x"
    $parameters =~ s/--no-target-directory//xg; #Regular expression without "/x"
    $parameters =~ s/--no-clobber//xg; #Regular expression without "/x"
    $parameters =~ s/--strip-trailing-slashes//xg; #Regular expression without "/x"
    # if(($parameters =~ /(\-[a-z|A-Z]*(S|n)[a-z|A-Z]*\s+\S+)/) or ($getOS =~ /AIX/ and $parameters =~ /(\-[a-z|A-Z]*(S|n|E)[a-z|A-Z]*\s+\S+)/))
    # {
        # $parameters =~ s/\Q$1\E//g;
    # }
    # if($getOS =~ /AIX/)
    # {
        # $parameters =~ s/\-[a-z|A-Z]*(S|n|E)[a-z|A-Z]*\s+\S+//g;
    # }
    # else
    # {
        $parameters =~ s/\[.+\]\S*//xg;  #substituting values such as [-0-9]* or [-f]*. #Regular expression without "/x"
        $parameters =~ s/\-[a-z|A-Z]*(S|n)[a-z|A-Z]*\s+\S+//xg; #Regular expression without "/x"
    # }
    my @arguments_list = split(/\s/x,$parameters); #Regular expression without "/x"
    foreach my $argument(@arguments_list)
    {
        if(($argument !~ /^\//x) and ($argument !~ /^\-/x) and ($argument !~ /^\s*$/x) and ($argument !~ /^\*/x)) #Regular expression without "/x"
        {
            IssueWarning("$header","$line_num","$main_command", "file argument $argument does not start with /","$m_text","$filen",'SFIT438597'); #Sub called with "&"
        }
    }
    }
    return; #require final return 
}

sub check_arguments_for_tail()
{
    my ($parameters,$header,$line_num,$cmd,$m_text,$filen,$line,$main_command)=@_;
    if(defined $parameters)
    {
    $parameters =~ s/(\"|\')(.+?)(\"|\')/$2/xg; #Regular expression without "/x"
    # if($parameters =~ /(\-[a-z|A-Z]*(c|n|s)[a-z|A-Z]*\s+\S+)/)
    # {
        # $parameters =~ s/\Q$1\E//g;
    # }
    $parameters =~ s/\[.+\]\S*//xg;  #substituting values such as [-0-9]* or [-f]*. #Regular expression without "/x"
    $parameters =~ s/\-[a-z|A-Z]*(c|n|s)[a-z|A-Z]*\s+\S+//xg; #Regular expression without "/x"
    my @arguments_list = split(/\s/x,$parameters); #Regular expression without "/x"
    foreach my $argument(@arguments_list)
    {
        if( ($argument !~ /^\//x) and ($argument !~ /^\-/x) and ($argument !~ /^\s*$/x) and ($argument !~ /^\*/x)) #Regular expression without "/x"s
        {
            IssueWarning("$header","$line_num","$main_command", "file argument $argument does not start with /","$m_text","$filen",'SFIT438597'); #Sub called with "&"
        }
    }
    }
    return; #require final return 
}

sub check_arguments_for_diff()
{
    my ($parameters,$header,$line_num,$cmd,$m_text,$filen,$line,$main_command)=@_;
    if(defined $parameters)
    {
    $parameters =~ s/(\"|\')(.+?)(\"|\')/$2/xg;#Regular expression without "/x"#Regular expression without "/x"
    $parameters =~ s/--report-identical-files//xg; #Regular expression without "/x"#Regular expression without "/x"
    $parameters =~ s/--side-by-side//xg; #Regular expression without "/x"#Regular expression without "/x"
    $parameters =~ s/--left-column//xg; #Regular expression without "/x"
    $parameters =~ s/--suppress-common-lines//xg; #Regular expression without "/x"
    $parameters =~ s/--show-c-function//xg; #Regular expression without "/x"
    $parameters =~ s/--expand-tabs//xg; #Regular expression without "/x"
    $parameters =~ s/--initial-tab//xg; #Regular expression without "/x"
    $parameters =~ s/--suppress-blank-empty//xg; #Regular expression without "/x"
    $parameters =~ s/--no-dereference//xg; #Regular expression without "/x"
    $parameters =~ s/--new-file//xg; #Regular expression without "/x"
    $parameters =~ s/--unidirectional-new-file//xg; #Regular expression without "/x"
    $parameters =~ s/--ignore-file-name-case//xg; #Regular expression without "/x"
    $parameters =~ s/--no-ignore-file-name-case//xg; #Regular expression without "/x"
    $parameters =~ s/--ignore-case//xg; #Regular expression without "/x"
    $parameters =~ s/--ignore-tab-expansion//xg; #Regular expression without "/x"
    $parameters =~ s/--ignore-trailing-space//xg; #Regular expression without "/x"
    $parameters =~ s/--ignore-space-change//xg; #Regular expression without "/x"
    $parameters =~ s/--ignore-all-space//xg; #Regular expression without "/x"
    $parameters =~ s/--ignore-blank-lines//xg; #Regular expression without "/x"
    $parameters =~ s/--strip-trailing-cr//xg; #Regular expression without "/x"
    # if(($parameters =~ /(\-[a-z|A-Z]*(S|X|C|U|W|F|x|I|D)[a-z|A-Z]*\s+\S+)/) or ( $getOS =~ /Solaris/ and $parameters =~ /(\-[a-z|A-Z]*(S|X|c|C|u|U|W|F|x|I|D)[a-z|A-Z]*\s+\S+)/))
    # {
        # print "\n ### $1";
        # $parameters =~ s/\Q$1\E//g;
    # }
    $parameters =~ s/\[.+\]\S*//xg;  #substituting values such as [-0-9]* or [-f]*. xg; #Regular expression without "/x"
    $parameters =~ s/\-[a-z|A-Z]*(S|X|C|U|W|F|x|I|D)[a-z|A-Z]*\s+\S+//xg; #Regular expression without "/x"
    my @arguments_list = split(/\s/x,$parameters); #Regular expression without "/x"
    foreach my $argument(@arguments_list)
    {
        if(($argument !~ /^\//x) and ($argument !~ /^\-/x) and ($argument !~ /^\s*$/x) and ($argument !~ /^\*/x))#Regular expression without "/x"
        {
            IssueWarning("$header","$line_num","$main_command", "file argument $argument does not start with /","$m_text","$filen",'SFIT438597'); #Sub called with "&"
        }
    }
    }
    return; #require final return 
    
}

sub check_arguments_for_touch()
{
    my ($parameters,$header,$line_num,$cmd,$m_text,$filen,$line,$main_command)=@_;
    if(defined $parameters)
    {
    $parameters =~ s/--no-create//xg; #Regular expression without "/x"
    $parameters =~ s/--no-dereference//xg; #Regular expression without "/x"
    # if($parameters =~ /(\-[a-z|A-Z]*r[a-zA-Z]*\s+\S+|\-[a-z|A-Z]*d[a-zA-Z]*\s+[\"|\'].*?[\"|\']|\-[a-z|A-Z]*d[a-zA-Z]*\s+.*?|\-[a-z|A-Z]*t[a-zA-Z]*\s+\S+)/)
    # {
        # $parameters =~ s/\Q$1\E//g;
    # }
    $parameters =~ s/\[.+\]\S*//xg;  #substituting values such as [-0-9]* or [-f]*. #Regular expression without "/x"
    #$parameters =~ s/\-[a-z|A-Z]*r[a-zA-Z]*\s+\S+|\-[a-z|A-Z]*d[a-zA-Z]*\s+[\"|\'].*?[\"|\']|\-[a-z|A-Z]*d[a-zA-Z]*\s+.*?|\-[a-z|A-Z]*t[a-zA-Z]*\s+\S+//xg; #Regular expression without "/x"
    $parameters =~ s/\-[a-z|A-Z]*r[a-zA-Z]*\s+\S+//xg; #ProhibitComplexRegexes
    $parameters =~ s/\-[a-z|A-Z]*d[a-zA-Z]*\s+[\"|\'].*?[\"|\']//xg; #ProhibitComplexRegexes
    $parameters =~ s/\-[a-z|A-Z]*d[a-zA-Z]*\s+.*?//xg; #ProhibitComplexRegexes
    $parameters =~ s/\-[a-z|A-Z]*t[a-zA-Z]*\s+\S+//xg; #ProhibitComplexRegexes
    my @arguments_list = split(/\s/x,$parameters);#Regular expression without "/x"
    foreach my $argument(@arguments_list)
    {
        if(($argument !~ /^\//x) and ($argument !~ /^\-/x) and ($argument !~ /^\s*$/x) and ($argument !~ /^\*/x)) #Regular expression without "/x"
        {
            IssueWarning("$header","$line_num","$main_command", "file argument $argument does not start with /","$m_text","$filen",'SFIT438597'); #Sub called with "&"
        }
    }
    }
    return; #require final return 
}

sub check_arguments_for_head()
{
    my ($parameters,$header,$line_num,$cmd,$m_text,$filen,$line,$main_command)=@_;
    if(defined $parameters)
    {
    $parameters =~ s/(\"|\')(.+?)(\"|\')/$2/xg; #Regular expression without "/x"
    # if($parameters =~ /(\-[a-z|A-Z]*(c|n)[a-z|A-Z]*\s+\S+)/)
    # {
        # $parameters =~ s/\Q$1\E//g;
    # }
    $parameters =~ s/\[.+\]\S*//xg;  #substituting values such as [-0-9]* or [-f]*. #Regular expression without "/x"
    $parameters =~ s/\-[a-z|A-Z]*(c|n)[a-z|A-Z]*\s+\S+//xg; #Regular expression without "/x"

    my @arguments_list = split(/\s/x,$parameters); #Regular expression without "/x"
    foreach my $argument(@arguments_list)
    {
        if(($argument !~ /^\//x) and ($argument !~ /^\-/x) and ($argument !~ /^\s*$/x) and ($argument !~ /^\*/x)) #Regular expression without "/x"
        {
            IssueWarning("$header","$line_num","$main_command", "file argument $argument does not start with /","$m_text","$filen",'SFIT438597'); #Sub called with "&"
        }
    }
    }
    return; #require final return 
}

sub check_arguments_for_compress()
{
    my ($parameters,$header,$line_num,$cmd,$m_text,$filen,$line,$main_command)=@_;
    if(defined $parameters)
    {
    $parameters =~ s/(\"|\')(.+?)(\"|\')/$2/xg; #Regular expression without "/x"
    # if($parameters =~ /(\-[a-z|A-Z|]*b[a-z|A-Z]*\s+\S+)/)
    # {
        # $parameters =~ s/\Q$1\E//g;
    # }
    $parameters =~ s/\[.+\]\S*//xg;  #substituting values such as [-0-9]* or [-f]*. #Regular expression without "/x"
    $parameters =~ s/\-[a-z|A-Z|]*b[a-z|A-Z]*\s+\S+//xg; #Regular expression without "/x"
    my @arguments_list = split(/\s/x,$parameters); #Regular expression without "/x"
    foreach my $argument(@arguments_list)
    {
        if(($argument !~ /^\//x) and ($argument !~ /^\-/x) and ($argument !~ /^\s*$/x) and ($argument !~ /^\*/x)) #Regular expression without "/x"
        {
            IssueWarning("$header","$line_num","$main_command", "file argument $argument does not start with /","$m_text","$filen",'SFIT438597'); #Sub called with "&"
        }
    }
    }
    return; #require final return 
}

sub check_arguments_for_gunzip_gzip_zcat()
{
    my ($parameters,$header,$line_num,$cmd,$m_text,$filen,$line,$main_command)=@_;
    if(defined $parameters)
    {
    $parameters =~ s/(\"|\')(.+?)(\"|\')/$2/xg; #Regular expression without "/x"
    $parameters =~ s/--to-stdout//xg; #Regular expression without "/x"
    $parameters =~ s/--no-name//xg; #Regular expression without "/x"
    # if($parameters =~ /(\-[a-z|A-Z]*S[a-z|A-Z]*\s+\S+)/)
    # {
        # $parameters =~ s/\Q$1\E//g;
    # }
    # if($parameters =~ /(\-\-suffix\s+\S+)/)
    # {
         # $parameters =~ s/\Q$1\E//;
    # }
    $parameters =~ s/\[.+\]\S*//xg;  #substituting values such as [-0-9]* or [-f]*. xg; #Regular expression without "/x"
    $parameters =~ s/\-[a-z|A-Z]*S[a-z|A-Z]*\s+\S+//xg;#Regular expression without "/x"
    $parameters =~ s/\-\-suffix\s+\S+//xg;#Regular expression without "/x"
    my @arguments_list = split(/\s/x,$parameters); #Regular expression without "/x"
    foreach my $argument(@arguments_list)
    {
        if(($argument !~ /^\//x) and ($argument !~ /^\-/x) and ($argument !~ /^\s*$/x) and ($argument !~ /^\*/x)) #Regular expression without "/x"
        {
            IssueWarning("$header","$line_num","$main_command", "file argument $argument does not start with /","$m_text","$filen",'SFIT438597'); #Sub called with "&"
        }
    }
    }
    return; #require final return 
}

sub check_arguments_for_tar()
{
    my ($parameters,$header,$line_num,$cmd,$m_text,$filen,$line,$main_command)=@_;
    if(defined $parameters)
    {
    $parameters =~ s/(\"|\')(.+?)(\"|\')/$2/xg; #Regular expression without "/x"
    $parameters =~ s/--test-label//xg; #Regular expression without "/x"
    $parameters =~ s/--preserve-permissions//xg; #Regular expression without "/x"
    # if ($parameters =~ /(\-\-wildcards\s+[\"|\'].+?[\"|\'])/)
    # {
        # $parameters =~ s/\Q$1\E//g;
    # }
    # if(($parameters =~ /(\-[a-z|A-Z]*(C|F|g|L|b|H|I|K|N|T|X)[a-z|A-Z]*\s+\S+)/) or ($getOS =~ /AIX/ and $parameters =~ /(\-[a-z|A-Z]*(C|F|g|L|b|H|I|K|N|T|X|S)[a-z|A-Z]*\s+\S+)/))
    # {
        # $parameters =~ s/\Q$1\E//g;
    # }
    my($first,$secondpart)=split(/\s/x,$parameters); #ProhibitAmbiguousNames #Regular expression without "/x"
    if ($first =~ /^[^\-][c|x|t|v|z|j|p|W|f]+/x)  #Regular expression without "/x"
    {
         $parameters =~ s/$first//xg;  #Regular expression without "/x"
    }
    $parameters =~ s/\-\-wildcards\s+\S+//xg;  #Regular expression without "/x"
    # if($getOS =~ /AIX/)
    # {
        # $parameters =~ s/\-[a-z|A-Z]*(C|F|g|L|b|H|I|K|N|T|X|S)[a-z|A-Z]*\s+\S+//g;
    # }
    # else
    # {
        $parameters =~ s/\[.+\]\S*//xg;  #substituting values such as [-0-9]* or [-f]*.  #Regular expression without "/x"
        $parameters =~ s/\-[a-z|A-Z]*(C|F|g|L|b|H|I|K|N|T|X)[a-z|A-Z]*\s+\S+//xg;  #Regular expression without "/x"
    # }
    my @arguments_list = split(/\s+/x,$parameters); #Regular expression without "/x"
    foreach my $argument(@arguments_list)
    {
        if(($argument !~ /^\//x) and ($argument !~ /^\-/x) and ($argument !~ /^\s*$/x) and ($argument !~ /^\*/x))  #Regular expression without "/x"
        {
            IssueWarning("$header","$line_num","$main_command", "file argument $argument does not start with /","$m_text","$filen",'SFIT438597'); #Sub called with "&"
        }
    }
    }
    return; #require final return 
}

sub check_if_middleware_user_alias_contains_standard_system_admin_users #Sub called with "&"
{   my ($array_ref1,$array_ref2,$array_ref3) = @_; #require argument unpacking
    if($DEBUG)
    {
        print "\nIn check_if_middleware_user_alias_contains_standard_system_admin_users\n";
    }
    # my @files_included_array = @$array_ref1;
    my @files_included_array=();
    my @sudoers_file_user_alias_not_expanded = @{$array_ref2}; #Double-sigil dereference
    my @sudoers_file_expanded_copy = @{$array_ref3}; #Reused variable name in lexical scope #Double-sigil dereference
    
    # Removing directory entries from files_included_array
    foreach my $file (@{$array_ref1}) #Double-sigil dereference
    {
        if (! -d $file)
        {
            push @files_included_array,$file;
        }
    }
    # for (my $i = 0 ; $i <= $#files_included_array ; $i++)
    # {
        # if ( -d $files_included_array[$i] )
        # {
            # splice @files_included_array,$files_included_array[$i],1; 
        # }
    # }
    # Checking for presence of standard Alias template 010_STD_ALIAS_GLB
    my @included_basenames = map { basename($_) } @files_included_array; #require block map
    if (grep({ /^010_STD_SA_GLB/x } @included_basenames)) #require block grep  #Regular expression without "/x"
    {
        # Non-Expanded for getting middleware users 
        my @filename_non_expanded_sudoline_array=();
        foreach my $sudoline (@sudoers_file_user_alias_not_expanded)
        {
            my ($filen, $line_numb, $m_text) = get_line_location_text("$sudoline"); #Sub called with "&"
            my $val = $filen.'>'.$sudoline;
            push(@filename_non_expanded_sudoline_array,$val);  # Creating Array having file-name > line content 
        }
        # Expanded for getting SA users
        my @filename_expanded_sudoline_array=();
        foreach my $sudoline (@sudoers_file_expanded_copy)
        {
            my ($filen, $line_numb, $m_text) = get_line_location_text("$sudoline"); #Sub called with "&"
            my $val = $filen.'>'.$sudoline;
            push(@filename_expanded_sudoline_array,$val);  # Creating Array having file-name > line content 
        }
        
        if($DEBUG)
        {
            print "\nListing Included files:\n";
            foreach my $line (@files_included_array) { print "$line\n"; } print "\n";
            print "\nListing Non Expanded Sudoers Array Entries :\n";
            foreach my $line (@filename_non_expanded_sudoline_array) { print "$line\n"; } print "\n";
            print "\nListing Expanded Sudoers Array Entries :\n";
            foreach my $line (@filename_expanded_sudoline_array) { print "$line\n"; } print "\n";
        }
       
        my @STD_SA_GLB_template_lines = grep({ /010_STD_SA_GLB.*\>User_Alias\s+.+\s*=\s*.+/x } @filename_expanded_sudoline_array); #require block grep  #Regular expression without "/x"
        # Extract system admin users defined in User_Alias of 010_STD_SA_GLB
        if ( @STD_SA_GLB_template_lines )
        {
            # Now populating @system_admin_users array with system admin users.
            my @system_admin_users=();
            my @uniq_system_admin_users=();
            foreach my $std_alias_entry (@STD_SA_GLB_template_lines)
            {
                my ($realfilename,$orig_line) = split(/>/x, $std_alias_entry, 2); #Regular expression without "/x"
                my ($user_alias,$system_admin_users_list) = split(/=/x, $orig_line, 2); #Regular expression without "/x"
                push(@system_admin_users,split(/,/x,$system_admin_users_list)); #Regular expression without "/x"
            }
            
            if (@system_admin_users)
            {
                @uniq_system_admin_users=(map { basename($_) } @system_admin_users); #require block map
                
                foreach my $file (@files_included_array) 
                { 
                    my $file_basename = basename($file);
                    # Processing Middleware templates with .txt at the end. 
                    if ( $file_basename =~ /\.txt$/x)  #Regular expression without "/x"
                    {
                        my $templateNameToCheck_rev = reverse $file_basename;
                        my ($extn, $rev_temp_name) = split(/\_/x, $templateNameToCheck_rev, 2); #Regular expression without "/x"
                        $file_basename = reverse $rev_temp_name;
                    }
                    # Skipping 010_STD_SA_GLB standard admin group template to avoid being reported
                    next if ( $file_basename =~ /^010_STD_SA_GLB$/x );  #Regular expression without "/x"
                    
                    # Checking if template belongs to standard middleware templates 
                    if(exists $Sudo_Template_Versions{$file_basename})
                    {
                    
                        my @template_BAU_ADM_lines = grep({ /\Q$file\E\>User_Alias\s+.+_[BAU|ADM].*/x } @filename_non_expanded_sudoline_array); #require block grep  #Regular expression without "/x"
                        my @Middleware_Alias_Names_Having_System_Users=();
                        if (@template_BAU_ADM_lines)
                        {
                            foreach my $line (@template_BAU_ADM_lines) 
                            {                                 
                                my ($realfilename,$orig_line) = split(/>/x, $line, 2); #Regular expression without "/x"
                                my ($user_alias_field,$middleware_admin_users_list) = split(/=/x, $orig_line, 2); #Regular expression without "/x"
                                my ($user_alias_str,$user_alias_name) = split(/\s/x, $user_alias_field, 2);    #Regular expression without "/x"   
                                $user_alias_name = trim($user_alias_name);     #Sub called with "&"
                                my @uniq_middleware_admin_users = uniq(map { basename($_) }split(/,/x,$middleware_admin_users_list)); #Regular expression without "/x"#require block map
                                
                                if (@uniq_middleware_admin_users)
                                {
                                    foreach my $middleware_user (@uniq_middleware_admin_users)
                                    {
                                        if ($middleware_user =~ /^%.+$/xg)  #Regular expression without "/x"#Regular expression without "/x"
                                        {
                                            my $group_to_check_for_SA_users=$middleware_user;
                                            if ($middleware_user =~ /^%_PLUS_.+$/xg)  #Regular expression without "/x"#Regular expression without "/x"
                                            {
                                                # $middleware_user could be an Netgroup\n";
                                                $group_to_check_for_SA_users =~ s/^%_PLUS_//xg;  #Regular expression without "/x"
                                            }
                                            else 
                                            {
                                                # $middleware_user could be an Group\n";
                                                $group_to_check_for_SA_users =~ s/^%//xg;  #Regular expression without "/x"
                                            }
                                            if(exists $groups{$group_to_check_for_SA_users})
                                            {
                                                my @candidate_SA_users=split(/,/x,$groups{$group_to_check_for_SA_users});#Regular expression without "/x"
                                                foreach my $user (@candidate_SA_users)
                                                {
                                                    if (grep({ /^\Q$user\E$/x }@uniq_system_admin_users) && (!grep({ /\Q$user_alias_name\E/x } @Middleware_Alias_Names_Having_System_Users) )) #require block grep  #Regular expression without "/x"
                                                    { 
                                                        my ($filen, $line_num, $m_text) = get_line_location_text($orig_line); #Sub called with "&"
                                                        IssueWarning("User_Alias","$line_num","$user_alias_name", "Middleware admin user alias contains users from system admin group","$m_text","$filen",'SFIT399272'); #Sub called with "&"
                                                        push(@Middleware_Alias_Names_Having_System_Users,$user_alias_name);
                                                        last;
                                                    }
                                                }
                                            }
                                        }
                                        elsif (exists $users{$middleware_user}) 
                                        {
                                            # $middleware_user is an user\n";
                                            if (grep({ /^\Q$middleware_user\E$/x } @uniq_system_admin_users) && (!grep({ /\Q$user_alias_name\E/x} @Middleware_Alias_Names_Having_System_Users) )) #require block grep  #Regular expression without "/x"
                                            {
                                                my ($filen, $line_num, $m_text) = get_line_location_text($orig_line); #Sub called with "&"
                                                IssueWarning("User_Alias","$line_num","$user_alias_name", "Middleware admin user alias contains users from system admin group","$m_text","$filen",'SFIT399272'); #Sub called with "&"
                                                push(@Middleware_Alias_Names_Having_System_Users,$user_alias_name);
                                                next;
                                            }
                                        }
                                        else 
                                        {
                                            # $middleware_user could be an User_Alias\n";
                                            next if ( $middleware_user =~ /^\<\:.+\>$/x );  #Regular expression without "/x"
                                            if ( grep({ /^\Q$middleware_user\E$/x } @Middleware_Alias_Names_Having_System_Users) && (!grep({ /^\Q$user_alias_name\E$/x } @Middleware_Alias_Names_Having_System_Users) )) #require block grep  #Regular expression without "/x"
                                            {
                                                my ($filen, $line_num, $m_text) = get_line_location_text($orig_line); #Sub called with "&"
                                                IssueWarning("User_Alias","$line_num","$user_alias_name", "Middleware admin user alias contains users from system admin group","$m_text","$filen",'SFIT399272'); #Sub called with "&"
                                                push(@Middleware_Alias_Names_Having_System_Users,$user_alias_name);
                                                next;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    else 
                    {
                        if ($DEBUG)
                        {
                            print "$file_basename does not belong to standard middleware templates.SFIT399272 will not be evaluated!\n";
                        }
                    }
                } 
            }
        }
    }
    else 
    {
        if ($DEBUG)
        {
            print "Standard Alias template 010_STD_ALIAS_GLB NOT FOUND! SFIT399272 will not be evaluated!\n";
        }
    }
    return; #require final return 
}

sub check_if_middleware_user_alias_contains_standard_system_admin_users_insensitive #Sub called with "&"
{   
    my ($array_ref1,$array_ref2,$array_ref3) = @_; #require argument unpacking
    if($DEBUG)
    {
        print "\nIn check_if_middleware_user_alias_contains_standard_system_admin_users\n";
    }
    # my @files_included_array = @$array_ref1;
    my @files_included_array=();
    my @sudoers_file_user_alias_not_expanded = @{$array_ref2}; #Double-sigil dereference
    my @sudoers_file_expanded_copy = @{$array_ref3}; #Reused variable name in lexical scope #Double-sigil dereference
    my ($grp_flag,$usr_flag) ="";
    if ( $case_insensitive_group == 1 ) 
    {
        $grp_flag="i";
    }
    if ( $case_insensitive_user == 1 ) 
    {
        $usr_flag="i";
    }
    # Removing directory entries from files_included_array
    foreach my $file (@{$array_ref1}) #Double-sigil dereference
    {
        if (! -d $file)
        {
            push @files_included_array,$file;
        }
    }
    # for (my $i = 0 ; $i <= $#files_included_array ; $i++)
    # {
        # if ( -d $files_included_array[$i] )
        # {
            # splice @files_included_array,$files_included_array[$i],1; 
        # }
    # }
    # Checking for presence of standard Alias template 010_STD_ALIAS_GLB
    my @included_basenames = map { basename($_) } @files_included_array; #require block map
    if (grep({ /^010_STD_SA_GLB/x } @included_basenames)) #require block grep  #Regular expression without "/x"
    {
        # Non-Expanded for getting middleware users 
        my @filename_non_expanded_sudoline_array=();
        foreach my $sudoline (@sudoers_file_user_alias_not_expanded)
        {
            my ($filen, $line_numb, $m_text) = get_line_location_text("$sudoline"); #Sub called with "&"
            my $val = $filen.'>'.$sudoline;
            push(@filename_non_expanded_sudoline_array,$val);  # Creating Array having file-name > line content 
        }
        # Expanded for getting SA users
        my @filename_expanded_sudoline_array=();
        foreach my $sudoline (@sudoers_file_expanded_copy)
        {
            my ($filen, $line_numb, $m_text) = get_line_location_text("$sudoline"); #Sub called with "&"
            my $val = $filen.'>'.$sudoline;
            push(@filename_expanded_sudoline_array,$val);  # Creating Array having file-name > line content 
        }
        
        if($DEBUG)
        {
            print "\nListing Included files:\n";
            foreach my $line (@files_included_array) { print "$line\n"; } print "\n";
            print "\nListing Non Expanded Sudoers Array Entries :\n";
            foreach my $line (@filename_non_expanded_sudoline_array) { print "$line\n"; } print "\n";
            print "\nListing Expanded Sudoers Array Entries :\n";
            foreach my $line (@filename_expanded_sudoline_array) { print "$line\n"; } print "\n";
        }
       
        my @STD_SA_GLB_template_lines = grep({ /010_STD_SA_GLB.*\>User_Alias\s+.+\s*=\s*.+/x } @filename_expanded_sudoline_array); #require block grep #Regular expression without "/x"
        # Extract system admin users defined in User_Alias of 010_STD_SA_GLB
        if ( @STD_SA_GLB_template_lines )
        {
            # Now populating @system_admin_users array with system admin users.
            my @system_admin_users=();
            my @uniq_system_admin_users=();
            foreach my $std_alias_entry (@STD_SA_GLB_template_lines)
            {
                my ($realfilename,$orig_line) = split(/>/x, $std_alias_entry, 2); #Regular expression without "/x"
                my ($user_alias,$system_admin_users_list) = split(/=/x, $orig_line, 2); #Regular expression without "/x"
                # Split by comma for $system_admin_users_list
                # 1. If group is missing check if insensitive match exists, if yes expand its members
                # 2. If user has insensitive match exists get all such users 
                # 3. Above 2 needs to be identified as system_admin and added to @system_admin_users
                my @system_admin_users_tmp=();
                push(@system_admin_users_tmp,split(/,/x,$system_admin_users_list)); #Regular expression without "/x"
                foreach my $usr (@system_admin_users_tmp)
                {
                    if ( $usr =~ /^%/x ) #Regular expression without "/x"
                    {
                        $usr =~ s/%//xg; #Regular expression without "/x"
                        if (grep ({/(?$grp_flag)^\Q$usr\E/x} keys %groups))  #Regular expression without "/x"
                        {
                            my @insensitve_groups = grep({/(?$grp_flag)^$usr$/x} keys %groups);  #Regular expression without "/x"
                            foreach my $grp (@insensitve_groups)
                            {
                                if(exists $groups{$grp})
                                {
                                    my @group_members= split(/\s*,\s*/x,$groups{$grp}); #Regular expression without "/x"
                                    push @system_admin_users,@group_members;
                                }                        
                            }
                        }
                    }
                    else 
                    {
                        push(@system_admin_users,$usr);
                    }
                }
            }
            
            if (@system_admin_users)
            {
                @uniq_system_admin_users=(map { basename($_) } @system_admin_users); #require block map
                
                foreach my $file (@files_included_array) 
                { 
                    my $file_basename = basename($file);
                    # Processing Middleware templates with .txt at the end. 
                    if ( $file_basename =~ /\.txt$/x)  #Regular expression without "/x"
                    {
                        my $templateNameToCheck_rev = reverse $file_basename;
                        my ($extn, $rev_temp_name) = split(/\_/x, $templateNameToCheck_rev, 2);#Regular expression without "/x"
                        $file_basename = reverse $rev_temp_name;
                    }
                    # Skipping 010_STD_SA_GLB standard admin group template to avoid being reported
                    next if ( $file_basename =~ /^010_STD_SA_GLB$/x );  #Regular expression without "/x"
                    
                    # Checking if template belongs to standard middleware templates 
                    if(exists $Sudo_Template_Versions{$file_basename})
                    {
                    
                        my @template_BAU_ADM_lines = grep({ /\Q$file\E\>User_Alias\s+.+_[BAU|ADM].*/x } @filename_non_expanded_sudoline_array); #require block grep  #Regular expression without "/x"
                        my @Middleware_Alias_Names_Having_System_Users=();
                        if (@template_BAU_ADM_lines)
                        {
                            foreach my $line (@template_BAU_ADM_lines) 
                            {                                 
                                my ($realfilename,$orig_line) = split(/>/x, $line, 2); #Regular expression without "/x"
                                my ($user_alias_field,$middleware_admin_users_list) = split(/=/x, $orig_line, 2); #Regular expression without "/x"
                                my ($user_alias_str,$user_alias_name) = split(/\s/x, $user_alias_field, 2);   #Regular expression without "/x"    
                                $user_alias_name = trim($user_alias_name);     #Sub called with "&"
                                my @uniq_middleware_admin_users = uniq(map { basename($_) }split(/,/x,$middleware_admin_users_list)); #Regular expression without "/x"#require block map
                                
                                if (@uniq_middleware_admin_users)
                                {
                                    foreach my $middleware_user (@uniq_middleware_admin_users)
                                    {
                                        if ($middleware_user =~ /^%.+$/x)  #Regular expression without "/x"
                                        {
                                            my $group_to_check_for_SA_users=$middleware_user;
                                            if ($middleware_user =~ /^%_PLUS_.+$/x)  #Regular expression without "/x"
                                            {
                                                # $middleware_user could be an Netgroup\n";
                                                $group_to_check_for_SA_users =~ s/^%_PLUS_//xg;  #Regular expression without "/x"
                                            }
                                            else 
                                            {
                                                # $middleware_user could be an Group\n";
                                                $group_to_check_for_SA_users =~ s/^%//xg;  #Regular expression without "/x"
                                            }
                                           # if(exists $groups{$group_to_check_for_SA_users})
                                            if (grep({/(?$grp_flag)^$group_to_check_for_SA_users$/x} keys %groups))  #Regular expression without "/x"
                                            {
                                                #my @candidate_SA_users=split(/,/,$groups{$group_to_check_for_SA_users});
                                                my @candidate_SA_users=();
                                                my @insensitve_groups = grep({/(?$grp_flag)^$group_to_check_for_SA_users$/x} keys %groups);  #Regular expression without "/x"
                                                foreach my $grp (@insensitve_groups)
                                                {
                                                    if(exists $groups{$grp})
                                                    {
                                                        my @group_members= split(/\s*,\s*/x,$groups{$grp});#Regular expression without "/x"
                                                        push @candidate_SA_users,@group_members;
                                                    }                        
                                                }
                                                foreach my $user (@candidate_SA_users)
                                                {
                                                    if (grep({ /(?$usr_flag)^\Q$user\E$/x }@uniq_system_admin_users) && (!grep({ /\Q$user_alias_name\E/x } @Middleware_Alias_Names_Having_System_Users) )) #require block grep   #Regular expression without "/x"                                                   
                                                    {  
                                                        my ($filen, $line_num, $m_text) = get_line_location_text($orig_line); #Sub called with "&"
                                                        IssueWarning("User_Alias","$line_num","$user_alias_name", "Middleware admin user alias contains users from system admin group","$m_text","$filen",'SFIT399272'); #Sub called with "&"
                                                        push(@Middleware_Alias_Names_Having_System_Users,$user_alias_name);
                                                        last;
                                                    }
                                                }
                                            }
                                        }
                                        #elsif (exists $users{$middleware_user}) 
                                        elsif (grep({/(?$usr_flag)^$middleware_user$/x} keys %users))  #Regular expression without "/x"
                                        {
                                            # $middleware_user is an user\n";
                                            if (grep({ /(?$usr_flag)^\Q$middleware_user\E$/x } @uniq_system_admin_users) && (!grep({ /\Q$user_alias_name\E/x} @Middleware_Alias_Names_Having_System_Users) )) #require block grep  #Regular expression without "/x"
                                            {
                                                my ($filen, $line_num, $m_text) = get_line_location_text($orig_line); #Sub called with "&"
                                                IssueWarning("User_Alias","$line_num","$user_alias_name", "Middleware admin user alias contains users from system admin group","$m_text","$filen",'SFIT399272'); #Sub called with "&"
                                                push(@Middleware_Alias_Names_Having_System_Users,$user_alias_name);
                                                next;
                                            }
                                        }
                                        else 
                                        {
                                            # $middleware_user could be an User_Alias\n";
                                            next if ( $middleware_user =~ /^\<\:.+\>$/x );  #Regular expression without "/x"
                                            if ( grep({ /(?$usr_flag)^\Q$middleware_user\E$/x } @Middleware_Alias_Names_Having_System_Users) && (!grep({ /^\Q$user_alias_name\E$/x } @Middleware_Alias_Names_Having_System_Users) )) #require block grep  #Regular expression without "/x"
                                            {
                                                my ($filen, $line_num, $m_text) = get_line_location_text($orig_line); #Sub called with "&"
                                                IssueWarning("User_Alias","$line_num","$user_alias_name", "Middleware admin user alias contains users from system admin group","$m_text","$filen",'SFIT399272'); #Sub called with "&"
                                                push(@Middleware_Alias_Names_Having_System_Users,$user_alias_name);
                                                next;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    else 
                    {
                        if ($DEBUG)
                        {
                            print "$file_basename does not belong to standard middleware templates.SFIT399272 will not be evaluated!\n";
                        }
                    }
                } 
            }
        }
    }
    else 
    {
        if ($DEBUG)
        {
            print "Standard Alias template 010_STD_ALIAS_GLB NOT FOUND! SFIT399272 will not be evaluated!\n";
        }
    }
    return; #require final return 
}
sub check_command_and_parent_dir_exists
{   
    my ($array_ref_copy) = @_; #require argument unpacking #Reused variable name in lexical scope
    # SFIT331840
    # Check if the commands / scripts specified in the Sudo configuration actually exist on the server
    # Issue warning for non-existing command, issue if parent directory does not exist or has world writeable permissions.  
    if($DEBUG)
    {
        print "\nIn check_command_and_parent_dir_exists\n";
    }
    my @sudoers_file_tmp = @{$array_ref_copy}; #Double-sigil dereference
    my @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_tmp);  #Regular expression without "/x" #require block grep
    
    foreach my $sudoersline (@sudoers_matches) 
    {
        if ($DEBUG)
        {
            print "Main Line =$sudoersline\n";
        }   
        my ($header, $commands) = split(/=/x,$sudoersline,2);     #Regular expression without "/x"
        my @cmdaliasarray = split(/\,/x, $commands);      #Regular expression without "/x"
        my ($filename, $line_number, $master_text) = get_line_location_text($sudoersline);      #Sub called with "&"
        foreach my $command (@cmdaliasarray)
        {   
            my $orig_command=$command;
            if ($DEBUG)
            {
                print "orig command = $orig_command\n";
            }   
            $command=~ s/^\s+|\s+$//xg; # Removing leading and trailing spaces from elements of @cmdaliasarray  #Regular expression without "/x"
            $command=~s/(NOEXEC|EXEC|PASSWD|NOPASSWD|FOLLOW|NOFOLLOW)\s*:\s*//xg;  #Regular expression without "/x" #ProhibitComplexRegexes
            $command=~s/(LOG_INPUT|NOLOG_INPUT)\s*:\s*//xg; #ProhibitComplexRegexes
            $command=~s/(LOG_OUTPUT|NOLOG_OUTPUT|MAIL|NOMAIL|SETENV|NOSETENV)\s*:\s*//xg;  #Regular expression without "/x" #ProhibitComplexRegexes
            $command=~s/(sudoedit|visudo)\s*//xg;  #Regular expression without "/x"
            next if($command =~ m/^\s*\!\s*/xg);      #Regular expression without "/x"     
            $command = (split(/\s/x, $command))[0]; #Removing Arguments from command#Regular expression without "/x"
                        
            if (! -e $command)
            {   
                if ($DEBUG)
                {
                    print "Command = $command\n";
                }
                # Skipping below entries Defect 359320
                next if($command !~ m/^\//xg);  #Regular expression without "/x"
                
                # Getting Parent Directory
                
                my $individualCmdDir=dirname($command);
                if ($DEBUG)
                {
                    print "individualCmdDir = $individualCmdDir\n";
                }   
                # OSR Check Below Added Defect 359320 
                if (!grep({ /^\Q$individualCmdDir\E$/x } @osr)) #require block grep  #Regular expression without "/x"
                {
                    IssueWarning($header, $line_number, $orig_command, "Command $command does not exist", $master_text, $filename, 'SFIT331840');   #Sub called with "&"
                    
                    if ( -d $individualCmdDir )             
                    {
                        my $individualCmdDirPerm = sprintf("%03o", (stat $individualCmdDir)[2] & oct("7777") );
                        if ( ( (oct($individualCmdDirPerm) & oct("7")) == oct("7") ) or ((oct($individualCmdDirPerm) & oct("1007")) == oct("1007") ) )
                        {                           
                            IssueWarning($header, $line_number, $orig_command, "Command $command specified in directory $individualCmdDir have world writable or world writable with sticky bit permissions", $master_text, $filename, 'SFIT331840');  #Sub called with "&"                             
                        }                   
                    }
                    else
                    {                   
                        IssueWarning($header, $line_number, $orig_command, "Directory $individualCmdDir does not exist", $master_text, $filename, 'SFIT331840') #Sub called with "&"
                    }           
                }   
            }   
        }           
    }
 return; #require final return  
}

sub check_permission_of_NON_OSR_directories
{
    my ($array_ref1)=@_; #require argument unpacking
    if($DEBUG)
    {
        print "\n check_permission_of_NON_OSR_directories";
    }
    my @dir;                        #strict_use
    my $individualCmdDir;           #strict_use
    my $individualCmdDirPerm;       #strict_use
    my @temp_sudoers_file_expanded = @{$array_ref1}; #Double-sigil dereference
    my @temp_sudoers = grep({ !/Cmnd_Alias|Runas_Alias|Host_Alias|Defaults/x } @temp_sudoers_file_expanded);  #Regular expression without "/x"#require block grep
        
    foreach my $line (@temp_sudoers)
    {
        my ($header, $commands) = split(/=/x,$line,2); #Regular expression without "/x"
        my @cmdsarray;
        if(defined $commands){ @cmdsarray = split(/\,/x,$commands);} #Regular expression without "/x"
        foreach my $cmd(@cmdsarray)
        {           
            if(defined $cmd)
            {
            $cmd =~ s/^\s+|\s+$//xg;  #Regular expression without "/x"
            $cmd = (split(/\s/x, $cmd))[0]; #Removing Arguments from command #Regular expression without "/x"
                if(defined $cmd)
                {
            $cmd=~s/(NOEXEC|EXEC|PASSWD|NOPASSWD|FOLLOW|NOFOLLOW)\s*:\s*//xg;  #Regular expression without "/x" #ProhibitComplexRegexes
            $cmd=~s/(LOG_INPUT|NOLOG_INPUT|LOG_OUTPUT|NOLOG_OUTPUT)\s*:\s*//xg; #ProhibitComplexRegexes
            $cmd=~s/(MAIL|NOMAIL|SETENV|NOSETENV)\s*:\s*//xg; #ProhibitComplexRegexes
            $cmd=~s/(sudoedit|visudo)\s*//xg;  #Regular expression without "/x"
                }
            }
            next if((defined $cmd) && ($cmd =~ m/^\s*\!\s*/x));  #Regular expression without "/x"
            next if((defined $cmd) && ($cmd !~ m/^\//xg));  #Regular expression without "/x"       
            @dir   = File::Spec->splitdir($cmd); 
            while(@dir)
            {
                my $newdir = File::Spec->catdir(@dir);
                $individualCmdDir = abs_path(dirname($newdir));
                if ( (defined $individualCmdDir) && (-d $individualCmdDir) )                
                {                   
                    $individualCmdDirPerm = sprintf("%03o", (stat $individualCmdDir)[2] & oct("7777") );
                    if((!grep({ /^\Q$individualCmdDir\E$/x } @osr)) && (((oct($individualCmdDirPerm) & oct("1007")) == oct("1007") ) || ( (oct($individualCmdDirPerm) & oct("7")) == oct("7") )))  #prohibit mixed boolean operators #require block grep  #Regular expression without "/x"
                    {
                         my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                         IssueWarning($header, $line_number, $cmd,"$cmd Command located in Non-OSR directory $individualCmdDir having world writable permissions ",
                                    $master_text, $filename, 'SFIT331841'); #Sub called with "&"
                        last if((grep({ /$individualCmdDir/x } @osr) )); #require block grep    #Regular expression without "/x"      
                    }
                }
                pop @dir;
            }   
        }
    }
    return; #require final return 
}

sub check_user_alias_in_included_files
{
    my ($array_ref1,$array_ref2) = @_;#require argument unpacking
    if($DEBUG)
    {
        print "\nIn check_user_alias_in_included_files\n";
    }
    my @files_included_array = @{$array_ref1}; #Double-sigil dereference
    my @sudoers_without_expansion = @{$array_ref2}; #Double-sigil dereference
    my @filename_sudoline_array=();
    foreach my $sudoline (@sudoers_without_expansion)
    {
        my ($filen, $line_numb, $m_text) = get_line_location_text("$sudoline");             #Sub called with "&"
        my $val = $filen.'>'.$sudoline;
        push(@filename_sudoline_array,$val);  # Creating Array having file-name > line content 
    }   
    if($DEBUG)
    {
        print "\nListing Included files:\n";
        foreach my $line (@files_included_array) { print "$line\n"; } print "\n";
    }
    foreach my $inc_file(@files_included_array)
    {       
        my $filename = $inc_file;              
        $filename =~ s!^.*/([^/]*)$!$1!x;  #Regular expression without "/x"
        if($DEBUG)
        {
            print "Included File FullPath=$inc_file\n";
            print "Included File Basename=$filename\n"; 
        }
        # Check if file name starts with 4[0-9][0-9]    
        if ($filename =~ m/^4\d{0,9}\d{0,9}.*/x )  #Regular expression without "/x"
        {   
            my @inc_file_lines_with_filename=();
            my @inc_file_lines =(); 
            
            # Extracting contents of $filename into array   
            @inc_file_lines_with_filename = grep({/^$inc_file\>/x } @filename_sudoline_array);   #require block grep  #Regular expression without "/x"        
            foreach my $line (@inc_file_lines_with_filename)    
            {
                my ($realfilename,$orig_line) = split(/>/x, $line, 2); #Regular expression without "/x"
                push(@inc_file_lines,$orig_line);               # @inc_file_lines contains sudoers lines from given $filename
            }
            my @user_alias_lines=();
            @user_alias_lines = grep({ !/Cmnd_Alias|Runas_Alias|Host_Alias|Defaults|\s*\#include|^\s*#|^\s*$/x } @inc_file_lines); #Regular expression without "/x"       #require block grep         
            
            # Getting list of Cmnd_Aliases from the array   
            my @inc_file_cmnd_alias_lines = grep({ /^\s*Cmnd_Alias/x } @sudoers_without_expansion);  #require block grep   #Regular expression without "/x"                    
            my @all_cmndalias_inc_file =() ;            
            foreach my $inc_cmnd_alias_line (@inc_file_cmnd_alias_lines)
            {                   
                my ($header, $commands) = split(/=/x, $inc_cmnd_alias_line,2); #Regular expression without "/x"
                my ($cmndalias_str, $cmndalias) =split(/Cmnd_Alias\s*/x, $header,2); #Regular expression without "/x"             
                push(@all_cmndalias_inc_file, $cmndalias);              
            }
            # Removing leading and trailing spaces from elements of @aliascmdsarray
            #for (my $i = 0; $i < scalar(@all_cmndalias_inc_file); $i++) 
            for (0..scalar(@all_cmndalias_inc_file)-1)
            {
                if ($DEBUG)
                {
                    print "Command_Alias Element = $all_cmndalias_inc_file[$_]\n";
                }   
                $all_cmndalias_inc_file[$_]=~ s/^\s+|\s+$//xg;  #Regular expression without "/x"
            }       
                        
            foreach my $sudoersline (@user_alias_lines)
            {                   
                my ($useralias_str, $commands) = split(/=/x, $sudoersline,2); #Regular expression without "/x"
                my ($useralias, $host) = split(/\s+/x, $useralias_str,2); #Regular expression without "/x"
                if ($DEBUG)
                {
                    print "\n\n\tProcessingUserAliasline = $sudoersline\n";                 
                }
                my @cmdaliasarray=();       
                my @individual_user_alias_lines = grep({ /^$useralias/x } @user_alias_lines);  #Regular expression without "/x"    #require block grep         
                foreach my $line (@individual_user_alias_lines) 
                { 
                    my ($useralias_name, $commands_copy) = split(/=/x, $line,2);  #Regular expression without "/x"#Reused variable name in lexical scope
                    my @separate_cmds = split(/\,/x, $commands_copy);     #Regular expression without "/x"       
                    push (@cmdaliasarray,@separate_cmds);                # Merging commands per User Alias Defect 370719
                }
                if ($DEBUG)
                {
                    print "Commands used by $useralias_str alias = ", join(',', @cmdaliasarray),"\n";
                }   
                #my ($useralias_str, $commands) = split(/=/, $sudoersline,2);
                
                #for (my $i = 0; $i < scalar(@cmdaliasarray); $i++)
                 for (0..scalar(@cmdaliasarray)-1)
                {                   
                    $cmdaliasarray[$_]=~ s/^\s+|\s+$//xg;    # Removing Leading and Trailing Spaces  #Regular expression without "/x"
                    $cmdaliasarray[$_]=~s/NOEXEC\s*:\s*|EXEC\s*:\s*|PASSWD\s*:\s*|NOPASSWD\s*:\s*//xg; #Regular expression without "/x"
                    $cmdaliasarray[$_]=~s/\s*#\s*.*//xg;     # Removing # content 355952 #Regular expression without "/x"        
                    if ($DEBUG)
                    {
                        print "\tProcessing Command: $cmdaliasarray[$_]\n";
                    }
                }       
                
                # Changes for defect 293942 
                if ($useralias =~ m/^IBM.+/x && exists $User_Alias_hash{$useralias}) #Regular expression without "/x"  # Here User alias also gets checked. In case of extended mode user alias has validated users. 
                {
                    if ($DEBUG)
                    {
                        print "\n\nUseralias $useralias Starts with IBM and is valid alias\n";
                    }
                    my $cmdaliasfound=0;                    
                    foreach my $cmdalias (@cmdaliasarray)
                    {   
                        if ( grep { /$cmdalias/x } @all_cmndalias_inc_file )   #Regular expression without "/x"  #require block grep         
                        {
                            if ($DEBUG)
                            {
                                print "\t\tCommand Alias $cmdalias matchesarrayelement\n";
                            }                       
                            $cmdaliasfound++;   
                        }                       
                    }                       
                    
                    if ( $cmdaliasfound == 0 ) # Issue warning if at least one command alias is not used. 
                    {                       
                        my ($filen, $line_num, $m_text) = get_line_location_text($sudoersline);    #Sub called with "&"                     
                        IssueWarning($useralias, $line_num,"$sudoersline", "User_alias containing IBM should contain at least one Cmnd_alias","$m_text","$filen", 'SFIT73863');                         #Sub called with "&"
                    }
                }       
            }       
        }
    }
    if($DEBUG)
    {
        print "\nEnd of check_user_alias_in_included_files\n";
    }
return; #require final return   
} 

sub validate_negated_command_aliases
{
    my ($array_ref_copy) = @_; #require argument unpacking #Reused variable name in lexical scope
    my $header;                         #strict_use
    my $rest;                           #strict_use
    my $cmdalias;                       #strict_use
    my $aliasdefine;                    #strict_use
    my $aliasname;                      #strict_use
    my $aliascmdstring;                 #strict_use
    my $filename;                       #strict_use
    my $line_number;                    #strict_use
    my $master_text;                    #strict_use
    if($DEBUG)
    {
        print "\nIn validate_negated_command_aliases\n";
    }
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    @sudoers_file_copy = grep ({ defined() and length() } @sudoers_file_copy);
    my @sudoers_matches = grep({ /^\s*Cmnd_Alias/x } @sudoers_file_copy);  #Regular expression without "/x" # Filtering command aliases from sudoers array #require block grep
        
    my %Neg_Groups_Hash=();
    $Neg_Groups_Hash{IBM_CAT_NEG}=\@IBM_CAT_NEG_Array;
    $Neg_Groups_Hash{IBM_CHGRP_NEG}=\@IBM_CHGRP_NEG_Array;
    $Neg_Groups_Hash{IBM_CHMOD_NEG}=\@IBM_CHMOD_NEG_Array;
    $Neg_Groups_Hash{IBM_CHOWN_NEG}=\@IBM_CHOWN_NEG_Array;
    $Neg_Groups_Hash{IBM_COMPRESS_NEG}=\@IBM_COMPRESS_NEG_Array;
    $Neg_Groups_Hash{IBM_CP_NEG}=\@IBM_CP_NEG_Array;
    $Neg_Groups_Hash{IBM_DIFF_NEG}=\@IBM_DIFF_NEG_Array;
    $Neg_Groups_Hash{IBM_FIND_NEG}=\@IBM_FIND_NEG_Array;
    $Neg_Groups_Hash{IBM_GUNZIP_NEG}=\@IBM_GUNZIP_NEG_Array;
    $Neg_Groups_Hash{IBM_GZIP_NEG}=\@IBM_GZIP_NEG_Array;
    $Neg_Groups_Hash{IBM_HEAD_NEG}=\@IBM_HEAD_NEG_Array;
    $Neg_Groups_Hash{IBM_LN_NEG}=\@IBM_LN_NEG_Array;
    $Neg_Groups_Hash{IBM_LS_NEG}=\@IBM_LS_NEG_Array;
    $Neg_Groups_Hash{IBM_MKDIR_NEG}=\@IBM_MKDIR_NEG_Array;
    $Neg_Groups_Hash{IBM_MOUNT_NEG}=\@IBM_MOUNT_NEG_Array;
    $Neg_Groups_Hash{IBM_MV_NEG}=\@IBM_MV_NEG_Array;
    $Neg_Groups_Hash{IBM_RM_NEG}=\@IBM_RM_NEG_Array;
    $Neg_Groups_Hash{IBM_RMDIR_NEG}=\@IBM_RMDIR_NEG_Array;
    $Neg_Groups_Hash{IBM_TAIL_NEG}=\@IBM_TAIL_NEG_Array;
    $Neg_Groups_Hash{IBM_TAR_NEG}=\@IBM_TAR_NEG_Array;
    $Neg_Groups_Hash{IBM_TOUCH_NEG}=\@IBM_TOUCH_NEG_Array;
    $Neg_Groups_Hash{IBM_UMOUNT_NEG}=\@IBM_UMOUNT_NEG_Array;
    $Neg_Groups_Hash{IBM_UNCOMPRESS_NEG}=\@IBM_UNCOMPRESS_NEG_Array;
    $Neg_Groups_Hash{IBM_ZCAT_NEG}=\@IBM_ZCAT_NEG_Array;
    $Neg_Groups_Hash{IBM_ALL_NEG}=\@IBM_ALL_NEG_Array;
    
    foreach my $negation_group (@CMD_NEG_GROUP_LIST)  ## Loop Over STANDARD negation aliases ex. IBM_CAT_NEG, IBM_ALL_NEG
    {   
        my @sudoers_standard_negation_matches = grep({ /\Q$negation_group\E\s*\=/x } @sudoers_matches); #Regular expression without "/x"  #Creating standard negation array from sudoers #require block grep 
        my $negation_group_count = scalar(@sudoers_standard_negation_matches);
        
        if ( $negation_group_count >= 1)  
        {           
            foreach my $sudoersline (@sudoers_standard_negation_matches)
            {
                ($header, $rest) = split(/=/x, $sudoersline,2); #Regular expression without "/x"      
                ($cmdalias, $aliasdefine) = split(/Cmnd_Alias\s+/x,$sudoersline,2);       #Regular expression without "/x"
                ($aliasname, $aliascmdstring) = split(/=/x,$aliasdefine,2);    #Regular expression without "/x"   
                my @aliascmdsarray = split(/\,/x, $aliascmdstring);  # Creating array of alias commands #Regular expression without "/x"
                # Removing leading and trailing spaces from elements of @aliascmdsarray
               # for (my $i = 0; $i < scalar(@aliascmdsarray); $i++) 
                for (0..scalar(@aliascmdsarray)-1)
                {
                    $aliascmdsarray[$_]=~ s/^\s+|\s+$//xg; #Regular expression without "/x"
                }
            
                # Check for missing negation formats ex. if IBM_CAT_NEG command alias has 4 formats and suppose 2 formats are missing in sudoers file.
                my @negation_array=@{$Neg_Groups_Hash{$negation_group}};
                foreach my $negated_array_element (@negation_array)  
                {
                    my $negated_array_element_bkp = $negated_array_element;
                    $negated_array_element =~s/(\![\/A-Za-z0-9]+)\s+/$1\\s\+/x;#Regular expression without "/x"
                    #Escaping characters below
                    $negated_array_element =~s/\*/\\*/xg; #Regular expression without "/x" 
                    $negated_array_element =~s/\//\\\//xg; #Regular expression without "/x"
                    $negated_array_element =~s/\./\\./xg; #Regular expression without "/x" 
                    $negated_array_element =~s/\!/\\!/xg;#Regular expression without "/x"  
                    $negated_array_element =~s/\s/\\s/xg;#Regular expression without "/x"
                        
                    if (!grep { /^$negated_array_element$/x }@aliascmdsarray)  #require block grep #Regular expression without "/x"                  
                    {
                        ($filename, $line_number, $master_text) = get_line_location_text($sudoersline); #Sub called with "&"
                        IssueWarning($aliasname, $line_number, $negated_array_element_bkp, "Missing Negation Command Definition", $master_text, $filename, 'SFIT124468'); #Sub called with "&"
                    }
                }
                # Validate commands defined in command alias against standard negation alias definitions 
                foreach my $individual_cmd (@aliascmdsarray)  # loop over commands from command alias 
                {   
                    my @negation_array_copy=@{$Neg_Groups_Hash{$negation_group}}; #Reused variable name in lexical scope                        
                    my ($maincmd, $syntax) = split(/\s+/x, $individual_cmd, 2);  #Regular expression without "/x"  # Split by multiple spaces 
                    my $whiteSpace_removed_individual_cmd=$maincmd." ".$syntax;  # join by single space 
                    if (!grep { /^\Q$whiteSpace_removed_individual_cmd\E$/x } @negation_array_copy) #Regular expression without "/x" #require block grep # choose respective alias array based on alias name                     
                    {                   
                        ($filename, $line_number, $master_text) = get_line_location_text($sudoersline); #Sub called with "&"
                        IssueWarning($aliasname, $line_number, $individual_cmd, "Validation check failed for negation command", $master_text, $filename, 'SFIT124468');      #Sub called with "&"                   
                    }                   
                }                       
            }
        }
        # Standard negation alias ex. If IBM_CAT_NEG is missing in sudoers file then issue warning 
        else
        {
            IssueWarning("", "", $negation_group, "Missing Standard Negation Alias", "", $filename, 'SFIT124468');          #Sub called with "&"
        }
    }
    # If all the standard negation aliases are defined then check if IBM_ALL_NEG command alias exists in sudoers
    my @sudoers_IBM_ALL_NEG_matches =(grep { /Cmnd_Alias\s+IBM_ALL_NEG\s*=/x } @sudoers_matches); #Regular expression without "/x" #require block grep
    if ( scalar(@sudoers_IBM_ALL_NEG_matches) >= 1)  # IBM_ALL_NEG found.. Now will verify the definition.  
    {
        foreach my $sudoersline (@sudoers_IBM_ALL_NEG_matches)
        {
            my ($header_copy, $rest_copy) = split(/=/x, $sudoersline,2);   #Regular expression without "/x"#Reused variable name in lexical scope 
            my ($cmdalias_copy, $aliasdefine_copy) = split(/Cmnd_Alias\s+/x,$sudoersline,2);  #Regular expression without "/x" #Reused variable name in lexical scope 
            my ($aliasname_copy, $aliascmdstring_copy) = split(/=/x,$aliasdefine_copy,2);  #Regular expression without "/x"   #Reused variable name in lexical scope  
            my @aliascmdsarray = split(/\,/x, $aliascmdstring_copy); #Reused variable name in lexical scope
            
            # Removing leading and trailing spaces from elements of @aliascmdsarray
            #for (my $i = 0; $i < scalar(@aliascmdsarray); $i++) 
            for (0..scalar(@aliascmdsarray)-1)
            {
                $aliascmdsarray[$_]=~ s/^\s+|\s+$//xg; #Regular expression without "/x"
            }   
                        
            foreach my $IBM_ALL_NEG_array_element (@IBM_ALL_NEG_Array_ALL_Commands)  
            {   
                my $IBM_ALL_NEG_array_element_bkp = $IBM_ALL_NEG_array_element;
                $IBM_ALL_NEG_array_element =~s/(\![\/A-Za-z0-9]+)\s+/$1\\s\+/x;#Regular expression without "/x"
                #Escaping chacters below
                $IBM_ALL_NEG_array_element =~s/\*/\\*/xg;  #Regular expression without "/x"
                $IBM_ALL_NEG_array_element =~s/\//\\\//xg;#Regular expression without "/x" 
                $IBM_ALL_NEG_array_element =~s/\./\\./xg;#Regular expression without "/x"  
                $IBM_ALL_NEG_array_element =~s/\!/\\!/xg;#Regular expression without "/x"  
                $IBM_ALL_NEG_array_element =~s/\s/\\s/xg;#Regular expression without "/x"

                if (!grep { /^$IBM_ALL_NEG_array_element$/x }@aliascmdsarray)    #Regular expression without "/x"     #require block grep            
                {
                    ($filename, $line_number, $master_text) = get_line_location_text($sudoersline); #Sub called with "&"
                    #print "Reached 2\n";
                    IssueWarning($aliasname, $line_number, $IBM_ALL_NEG_array_element_bkp, "Missing Negation Command Definition", $master_text, $filename, 'SFIT124468'); #Sub called with "&"
                }
            }
        }
    }
    else # IBM_ALL_NEG command alias not found in sudoers file 
    {
        IssueWarning("", "", "IBM_ALL_NEG", "Missing Standard Negation Alias", "", $filename, 'SFIT124468'); #Sub called with "&"
    }

    return; #require final return 
}
 
sub check_world_writable_directory_having_command_suffixing_wildcard
{   
    my ($array_ref1)=@_; #require argument unpacking 
    if($DEBUG)
    {
        print "\nIn check_world_writable_directory_having_command_suffixing_wildcard\n";
    }
    my @temp_sudoers;           #strict_use
    my $header;                 #strict_use
    my $rest;                   #strict_use
    my @cmds;                   #strict_use
    
    
    my @temp_sudoers_file_expanded = @{$array_ref1}; #Double-sigil dereference
    @temp_sudoers_file_expanded = grep ({ defined() and length() } @temp_sudoers_file_expanded);
    @temp_sudoers = grep({ !/Cmnd_Alias|Runas_Alias|Host_Alias|Defaults/x } @temp_sudoers_file_expanded);#Regular expression without "/x"  #require block grep
    
    foreach my $sudoersline (@temp_sudoers)
    {
        ($header, $rest) = split(/=/x, $sudoersline,2); #Regular expression without "/x"
        if(defined $rest)
        {
        @cmds=split(/\s*,\s*/x,$rest); #Regular expression without "/x"
        }
        foreach my $cmd (@cmds)  # =/bin/vi*, EXEC:/bin/chown,/bin/chmod* , NOEXEC:/bin/fdisk 
        {
            my ( $individualCmdName , $CmdArg, $individualCmdDir, $individualCmdDirPerm, $individualCmdStr, $strBeforeindividualCmdStr ,$indx ,$slashCount) = undef;
            # Removing NOEXEC,EXEC,PASSWD,NOPASSWD,ALL
            $cmd=~s/NOEXEC\s*:\s*|EXEC\s*:\s*//xg; #Regular expression without "/x" #ProhibitComplexRegexes
            $cmd=~s/PAS{2}WD\s*:\s*|NOPAS{2}WD\s*:\s*|AL{2}\s*//xg; #ProhibitComplexRegexes                    
            
            my($individualCmd, $CmdArgs)=split(/\s/x, $cmd,2); #Regular expression without "/x"
            if(!defined $individualCmd){$individualCmd="";}
            if(!defined $individualCmdDir){$individualCmdDir="";}
            if(!defined $individualCmdDirPerm){$individualCmdDirPerm="";}
            if ( ($individualCmd !~ m/^\s*\!/x) ) # Negation: !/bin/vi#Regular expression without "/x"
            {
                $slashCount=()=$individualCmd=~/\//xg; #Regular expression without "/x"
                if ($slashCount > 1)  ## getting counts of / 
                {
                    $indx=rindex($individualCmd,"/");
                    $strBeforeindividualCmdStr=substr($individualCmd,0,$indx);  # string before last /
                    $individualCmdStr=substr($individualCmd,$indx+1);   # string after last / 
                }
                else
                {
                    $strBeforeindividualCmdStr="";
                    $individualCmdStr=$individualCmd;
                }
                next if ($slashCount == 0); ## If it's 0, this is not a valid command.
                
                $individualCmdName=$individualCmd;
                # To follow symbolic links (which usually have 777 perms).
                $individualCmdDir = abs_path(dirname($individualCmdName));
                if(!defined $individualCmdDir){$individualCmdDir="";}
                if(defined ((stat $individualCmdDir)[2]))
                #if(defined $individualCmdDir) 
                {
                $individualCmdDirPerm = sprintf("%03o", (stat $individualCmdDir)[2] & oct("7777") ); # Defect 337906
                }

                # Look for directory permissions masks that are world writable without a sticky bit set:
                # Using oct() for readability.
                if ( ( (oct($individualCmdDirPerm) & oct("1007")) != oct("1007") ) and ( (oct($individualCmdDirPerm) & oct("7")) == oct("7") ) )
                {
                    my($filename, $line_number, $master_text) = get_line_location_text($sudoersline); #Sub called with "&"
                    IssueWarning($header, $line_number, $individualCmd, "command specified in a world writable directory", $master_text, $filename, 'SFIT231521'); #Sub called with "&"
                }
                elsif ( ((oct($individualCmdDirPerm) & oct("1007")) == oct("1007") ) and ( ( $individualCmdStr =~ m/[\*\?\+]/x && $strBeforeindividualCmdStr !~ m/[\*\?\+]/x ) ))#Regular expression without "/x"
                {
                    # World writable permissions *with* sticky bit set, only checks for wildcards.
                    # 1777 condition added as solution for Defect 234618
                    # 1777 Is for directory having t bit /sticky bit e.g. permissions ending with t = rwxrwxrwt especially for /tmp or /var/tmp
                    my($filename, $line_number, $master_text) = get_line_location_text($sudoersline); #Sub called with "&"
                    IssueWarning($header, $line_number, $individualCmd, "command specified with a wild card in a world writable directory", $master_text, $filename, 'SFIT231521'); #Sub called with "&"
                }
                elsif (  (defined $individualCmdDir) && ($individualCmdDir =~ /\/tmp/x) )#Regular expression without "/x"
                {
                    # Do not allow commands on non-persistent temporary directories such as /tmp and /var/tmp.
                    my($filename, $line_number, $master_text) = get_line_location_text($sudoersline); #Sub called with "&"
                    IssueWarning($header, $line_number, $individualCmd, "command specified in a non-persistent world writable directory", $master_text, $filename, 'SFIT231521'); #Sub called with "&"
                }
                else #Cascading if-elsif chain
                {
                    if($DEBUG)
                    {
                    print "Command $individualCmd doesn't reside in a WW or temporary directory.";
                }
            }
            }
            else
            {
                if(($DEBUG) && (defined $individualCmd))
                {
                    print "Command $individualCmd is negated";
                }                   
            }
        }
    }
    return; #require final return 
}

######Changes for Enhancement 73866
sub check_non_printable_chars
{   
   my ($array_ref_copy) = @_; #require argument unpacking #Reused variable name in lexical scope
   my $FILE = $ORIG_SUDOER ;
   my @sudoers_file_copy = @{$array_ref_copy};#Reused variable name in lexical scope #Double-sigil dereference
   my $header;
   my $rest;
   @sudoers_file_copy = grep ({ defined() and length() } @sudoers_file_copy);
   my @data = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_copy);  #Regular expression without "/x" #require block grep
   my $BAD_CHAR_MSG = "";
   my $EM_DASH_MSG = "";
   my ($filename, $line_number, $master_text) = "";
   if ($DEBUG)
   {
       print "\nin check_non_printable_chars\n";
   }
   foreach my $line(@data)
   {
          #####changs for 167297
        my $temp_line = $line;
        $temp_line =~ s/\*/\\\*/xg; #Regular expression without "/x"
        ###Changes for the defect 189707###
        $temp_line=(split(/=/x,$temp_line,2))[1]; #Regular expression without "/x"
        $temp_line =~ s/\|//xg; #Regular expression without "/x"
        $temp_line =~ s/\`//xg; #Regular expression without "/x"
        
        if ( $temp_line !~ /\#/x ) #Regular expression without "/x"
        {
            if ($temp_line =~ /[\x00-\x1F]/x and $temp_line !~ /\x09/x) #Regular expression without "/x"  #x09 added to skip reporting tabs. # http://defindit.com/ascii.html  
            #https://theasciicode.com.ar/ascii-control-characters/horizontal-tab-ascii-code-9.html
            {
               ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
               $line =~ s/\s*$//xig; #Regular expression without "/x"
               ##changes for 166257 and 167159
               my $entry = $line;
               $entry =~ s/^(.*?)\=(.*?)$/$1/xg; #Regular expression without "/x"
          
               IssueWarning("$entry",$line_number,"","entry contains an invalid ASCII character. This may break sudo commands",$master_text,$filename,'SFIT73866'); #Sub called with "&"
            }
            
            if ($temp_line =~ /[\x92-\x94]/x)#Regular expression without "/x"  
            {
                ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                $line =~ s/\s*$//xig; #Regular expression without "/x"
                ##changes for 166257 and 167159
                my $entry = $line;
                $entry =~ s/^(.*?)\=(.*?)$/$1/xg; #Regular expression without "/x"
          
                IssueWarning("$entry",$line_number,"","entry contains an invalid hyphen/dash/minus character. This will break su commands",$master_text,$filename,'SFIT73866'); #Sub called with "&"
            }
        }
   }
   return;##require final return
}

sub check_tar_extract_destination_directory
{
    my ($array_ref_copy) = @_; #Reused variable name in lexical scope   #require argument unpacking  
    my @sudoers_matches=();             #strict_use
    my $header;                         #strict_use
    my $rest;                           #strict_use
    my @tar_cmds=();                    #strict_use
    my @temp=();                        #strict_use
    my $filename;                       #strict_use
    my $line_number;                    #strict_use
    my $master_text;                    #strict_use
    my $tar_file_name;                  #strict_use
    
    if($DEBUG)
    {
        print "\nIn check_tar_extract_destination_directory\n";
    }
    
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    my ($first_word,$target_dir);
    my @cmds;
    @sudoers_file_copy = grep ({ defined() and length() } @sudoers_file_copy);
    @sudoers_matches = grep({ !/Cmnd_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_copy); #Regular expression without "/x"  #require block grep     
    @sudoers_matches = grep({ /\/tar/x } @sudoers_matches); #Regular expression without "/x"   #require block grep
    
    
    
    ##########################

    foreach my $line (@sudoers_matches)
    {
        ($header, $rest) = split(/=/x, $line,2);  #Regular expression without "/x"
        
        @cmds=split(/\s*,\s*/x,$rest); #Regular expression without "/x"
        @tar_cmds = grep({ /\/tar/x } @cmds);  #Regular expression without "/x"#require block grep
        
        foreach my $tar_cmd (@tar_cmds)
        {
           next if( $tar_cmd =~ m/^$/xg);#Regular expression without "/x"           
           next if ($tar_cmd =~ m/\!/xg);#Regular expression without "/x"
           
           ##Changes for defect 193156
           next if ($tar_cmd =~ m/\-c/xg);#Regular expression without "/x"   
           @temp=(split(/\s+/x,$tar_cmd));    #Regular expression without "/x"
           $tar_file_name = $temp[2]; 
           $target_dir = $temp[-1]; 
        
           
           
          ##Changes for defect 194478
           my $option = $temp[1]; 
        
          
           if( $tar_cmd =~ m/\-C|\-\-directory/xg) #Regular expression without "/x"
           {    
               ##Changes for defect 194478         
               next if ($option =~ m/\-([r|u|t]+)|([z][t|r|c|u][f])/xg); #Regular expression without "/x"
               
               
               ##Changes for defect 193156
                next if ($target_dir =~ m/\*/xg); #Regular expression without "/x"
                if(($target_dir !~ m/\//xg) or ($target_dir =~ m/\.tar/xg)) #Regular expression without "/x"
                { 
                    ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                    IssueWarning($header, $line_number, $tar_cmd, "Tar extract command must be specified with destination directory or list of files to be extracted", $master_text, $filename, 'SFIT180707');  #Sub called with "&"                                                       
                }               
           }
           
            #changes for defect 180707
            elsif((defined $option) && ($option =~ m/^\*/xg)) #Regular expression without "/x"
            {
                
                 ##Changes for defect 194478
                next if ($option =~ m/\-([r|u|t]+)|([z][t|r|c|u][f])/xg); #Regular expression without "/x"
                next if($tar_cmd =~ /\/tar\s*\-\-(get|extract)\s*(\-f)\s*([a-z]+\.tar)\s*([a-z]+)/xg); #Regular expression without "/x" #ProhibitComplexRegexes
                
                if(($target_dir !~ m/\/\*/xg) ) #Regular expression without "/x"
                {
                        
                        ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                        IssueWarning($header, $line_number, $tar_cmd, "Tar extract command must be specified with destination directory or list of files to be extracted", $master_text, $filename, 'SFIT180707');    #Sub called with "&"                                  
                }   
                    
            }
           else
           {            
                
                
                ##Changes for defect 194478                 
                next if ((defined $option) && ($option =~ m/\-([r|u|t]+)|([z][t|r|c|u][f])/xg)); #Regular expression without "/x"
                next if($tar_cmd =~ /\/tar\s*\-\-(get|extract)\s*(\-f)\s*([a-z]+\.tar)\s*([a-z]+)/xg); #Regular expression without "/x" #ProhibitComplexRegexes
                ##Changes for defect 193156  
               if(($target_dir !~ m/\//xg) or ($target_dir =~ m/\.tar/xg) or ( (defined $tar_file_name) && ($tar_file_name !~ m/\.tar/xg)))#Regular expression without "/x"                      
              {
                    ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                    IssueWarning($header, $line_number, $tar_cmd, "Tar extract command must be specified with destination directory or list of files to be extracted", $master_text, $filename, 'SFIT180707');     #Sub called with "&"                                 
              } 
              
           }                           
        }
    }
    return; ####require final return
}

sub checkIBM_aliases
{
    my ($ref1)=@_;
    my @sudoers_file_copy=@{$ref1}; #Reused variable name in lexical scope
    my @sudoers_matches;
    my $header;
    my $rest;
    my $IS_IBM_ID;
    @sudoers_file_copy = grep ({ defined() and length() } @sudoers_file_copy);  #Reused variable name in lexical scope
    
    if ($DEBUG)
    {
        print "\nin checkIBM_aliases\n";
    }
    
    @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_copy);  #Regular expression without "/x" #require block grep
    foreach my $line (@sudoers_matches)
    {
        if(defined $line)
        {
        ($header, $rest) = split(/=/x, $line, 2); #Regular expression without "/x"
        }
        $header =~ s/\s+ALL\s*$//xg; #Regular expression without "/x"
        $header =~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"
        $header =~ s/\|/,/xg; #Regular expression without "/x"
        if(defined $rest)
        {
        $rest =~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"
        }
        
        #task 169526 -> In template mode treat all the ids as ibm id.
        if($template_check == 1)
        {
            if($DEBUG)
            {
                print "In template mode, assuming all the ids as ibm id\n";
            }
        
            $IS_IBM_ID = 1;
        }
        else 
        {
            $IS_IBM_ID = check_ibm_entry_no_SU($header); #Sub called with "&"
        }
        

        if((defined $IS_IBM_ID) && ($IS_IBM_ID == 1))
        {
            foreach my $header_val(split(/\s*,\s*/x,$header)) #Regular expression without "/x"
            {
                $header_val =~ s/\s+.*$//xg; #Regular expression without "/x"
                if(grep({ /User_Alias\s*$header_val\s*=/x } @User_Alias) and $header_val !~ /^IBM_/x) #Regular expression without "/x" #require block grep
                {
                    #raise violation for user alias
                    ($header,$rest)=split(/=/x,$line); #Regular expression without "/x"
                    $header =~ s/\s+ALL\s*$//xg; #Regular expression without "/x"
                    my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                    IssueAttention("$header", $line_number, "$header_val", "IBM entries must use IBM_ user alias names.", $master_text, $filename, 'SFIT60271'); #Sub called with "&"
                }
            }
            
            if(defined $rest)
            {
            foreach my $rest_val(split(/\s*,\s*/x,$rest)) #Regular expression without "/x"
            {
                #$rest_val =~ s/\s+.*$//xg; #Regular expression without "/x"
                $rest_val =~ s/\([\w,\s]+\)//xg; #Regular expression without "/x"
                $rest_val =~ s/!//xg; #Regular expression without "/x"
                $rest_val =~ s/NOPASSWD\s*\://xg; #Regular expression without "/x"
                $rest_val =~ s/PASSWD\s*\://xg; #Regular expression without "/x"
                $rest_val =~ s/NOEXEC\s*\://xg; #Regular expression without "/x"
                $rest_val =~ s/EXEC\s*\://xg; #Regular expression without "/x"
                $rest_val =~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"
                
                if($DEBUG)
                {
                    print "Checking the condition for alias $rest_val\n";
                }
                if(grep({ /Cmnd_Alias\s*\Q$rest_val\E\s*=/x } @Cmnd_Alias) and $rest_val !~ /^IBM_/x and $rest_val !~ /^SUDOSUDO/x) #Regular expression without "/x" #require block grep
                {
                    my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                    IssueAttention("$header", $line_number, "$rest_val", "IBM entries must use IBM_ command alias names.", $master_text, $filename, 'SFIT60271'); #Sub called with "&"
                }
            }
        }
    }
    }
    
    if ($DEBUG)
    {
        print "\nexiting... checkIBM_aliases\n";
    }
    return; ####require final return
    
}

sub check_ADM_level_previleges
{
    my ($ref1)=@_;
    #my @sudoers_file_expanded=@{$ref1};
    my @sudoers_file_copy=@{$ref1};     #Reused variable name in lexical scope
    my @match;
    my $is_active_entry;
    my $target_gid;
    my $more_folks;
    my $header;
    my $rest;
    my $expanded_line;
    my $alias_data;
    my $data_replace;
    my @User_Alias_ADM = grep({ /^\s*User_Alias\s+IBM.*_ADM.*/x } @sudoers_file_expanded);  #require block grep #Regular expression without "/x"
    my @Cmnd_Alias_ADM = grep({ /^\s*Cmnd_Alias\s+IBM.*_ADM.*/x } @sudoers_file_expanded);  #Regular expression without "/x"
    my @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_copy);  #require block grep #Regular expression without "/x"
    
    if ($DEBUG)
    {
        print "In check_ADM_level_previleges\n";
        print "\@User_Alias=",join(", ", @User_Alias),"\n";
        print "\@User_Alias_ADM=",join(", ", @User_Alias_ADM),"\n";
        print "\@Cmnd_Alias=",join(", ", @Cmnd_Alias),"\n";
        print "\@Cmnd_Alias_ADM=",join(", ", @Cmnd_Alias_ADM),"\n";
        print "\@sudoers_file=",join(", ", @sudoers_file_copy),"\n";        
        print "\$\#User_Alias_ADM= $#User_Alias_ADM\n";
        print "\$\#Cmnd_Alias_ADM= $#Cmnd_Alias_ADM\n";
    }   
    if($#User_Alias_ADM >= 0)
    {
        foreach my $line(@User_Alias_ADM)
        {
            if ($DEBUG)
            {
                print "\nProcessing User_Alias_ADM line: $line";
            }
            $is_active_entry=0;
            if ( $case_insensitive_user  == 1 && $case_insensitive_group == 1  )  # both group or usercase-insenstivity is enabled. 
            {
                 $expanded_line=expand_useralias_groups_insensitive($line,0); #Sub called with "&"
            }
            elsif( $case_insensitive_group  == 1 ) #group enabled
            {
                 $expanded_line=expand_useralias_groups_insensitive($line,0); #Sub called with "&"
            }
            else #user enabled or both user and group disabled
            {
                $expanded_line=expand_useralias_groups($line,0); #Sub called with "&"
            
            }
            #$expanded_line=expand_useralias_groups($line,0); #Sub called with "&"
            ($header,$rest)=split(/=/x,$expanded_line); #Regular expression without "/x"
            $alias_data=$header;
            if(defined $header)
            {
            $header =~ s/^\s*User_Alias\s*//xg; #Regular expression without "/x"
            $header =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
            }
            if($case_insensitive_user==1)
            { 
                if(defined $rest)
                {
                foreach my $user_group(split(/\s*,\s*/x,$rest)) #Regular expression without "/x"
                {
                    if ($DEBUG)
                    {
                        print "\nprocessing user group:$user_group";
                    }
                    $user_group =~ s/(^\s*)|(\s*$)|(\\)//xg; #Regular expression without "/x"
                    if ($DEBUG)
                    {
                        print "\nUpdated user group:$user_group";
                    }
                    if($user_group =~ /^%/x)#Regular expression without "/x"
                    {
                        $user_group =~ s/%//xg; #Regular expression without "/x"
                        my @insensitive_groups = grep({/^\Q$user_group\E$/xi} keys %gids);  #Regular expression without "/x"
                        foreach my $grp (@insensitive_groups)
                        {
                            $target_gid = $gids{$grp};
                            $more_folks = $user_groups{$target_gid};
                            if ($DEBUG)
                            {
                                print "\nGroup members:".$groups{$grp};
                                print "\nUser-group members:".$more_folks;
                            }
                            if($groups{$grp} =~ /\w/x or $more_folks =~ /\w/x)  #Regular expression without "/x"
                            {
                                $is_active_entry=1;
                                last;
                            }
                            if($is_active_entry==1)
                            {
                                last;
                            }
                        }
                    }
                    #elsif($users{$user_group})
                    elsif(grep{/^$user_group$/xi} keys %users) #change  #Regular expression without "/x"
                    {
                        $is_active_entry=1;
                        last;
                    }
                }
            }
            }
            else
            { 
                if(defined $rest)
                {
                foreach my $user_group(split(/\s*,\s*/x,$rest)) #Regular expression without "/x"
                {
                    if ($DEBUG)
                    {
                        print "\nprocessing user group:$user_group";
                    }
                    $user_group =~ s/(^\s*)|(\s*$)|(\\)//xg; #Regular expression without "/x"
                    if ($DEBUG)
                    {
                        print "\nUpdated user group:$user_group";
                    }
                    if($user_group =~ /^%/x)#Regular expression without "/x"
                    {
                        $user_group =~ s/%//xg; #Regular expression without "/x"
                        $target_gid = $gids{$user_group};
                        $more_folks = $user_groups{$target_gid};
                        if($groups{$user_group} =~ /\w/x or $more_folks =~ /\w/x)  #Regular expression without "/x"
                        {
                            $is_active_entry=1;
                            last;
                        }
                    }
                    elsif($users{$user_group})
                    #if(grep{/$user_group/} keys %users) #change
                    {
                        $is_active_entry=1;
                        last;
                    }
                }
            }
            }
               
            if ($DEBUG)
            {
                print "\nis_active_entry:$is_active_entry";
            }
            if($is_active_entry==1)
            {   
                @match=grep({ /^\s*$header[\s=,]+/x } @sudoers_matches);  #require block grep  #Regular expression without "/x"
                foreach my $sudoers_line(@match) #perlcritic
                {
                    ($header,$rest)=split(/=/x,$sudoers_line); #Regular expression without "/x"
                    $header =~ s/\s+ALL\s*$//xg; #Regular expression without "/x"
                    my ($filename, $line_number, $master_text) = get_line_location_text($sudoers_line); #Sub called with "&"
                    IssueViolation("Active_ADM_Privs", $line_number, "$alias_data", "Currently assigns ADM level privileges to active user(s). Verify authorized change or recovery is underway.", $master_text, $filename, 'SFIT77556'); #Sub called with "&"
                }
            }
        }
    }
    if($#Cmnd_Alias_ADM >= 0)
    {
        foreach my $line(@Cmnd_Alias_ADM)
        {
            ($header,$rest)=split(/=/x,$line); #Regular expression without "/x"
            $header =~ s/^\s*Cmnd_Alias\s*//xg; #Regular expression without "/x"
            $header =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
            @match=grep({ /(=$header,)|(=$header\s*$)|(=.*[,:]$header,.*)|(=.*[,:]$header\s*$)/x } @sudoers_matches);   #Regular expression without "/x" #require block grep
            $alias_data=$header;
            foreach my $cmnd_line(@match)
            {
                $is_active_entry=0;
                ($header,$rest)=split(/=/x,$cmnd_line); #Regular expression without "/x"
                $header =~ s/\s+ALL\s*$//xg; #Regular expression without "/x"
                $header =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
                $alias_data=$header;
                if ($DEBUG)
                {
                    print "Alias Data=$alias_data\n";
                }
                foreach my $user_group(split(/\s*,\s*/x,$alias_data)) #Regular expression without "/x"
                {
                    $user_group =~ s/(^\s*)|(\s*$)|(\\)//xg; #Regular expression without "/x"
                    if(grep({ /^\s*User_Alias\s+$user_group\s*=/x } @User_Alias_ADM))  #require block grep  #Regular expression without "/x"
                    {   
                        $data_replace=(grep({ /^\s*User_Alias\s+$user_group\s*=/x } @User_Alias_ADM))[0];  #require block grep  #Regular expression without "/x"
                        if ( $case_insensitive_user  == 1 && $case_insensitive_group == 1  )  # both group or usercase-insenstivity is enabled. 
                        {
                             $data_replace=expand_useralias_groups_insensitive($data_replace,0); #Sub called with "&"
                        }
                        elsif( $case_insensitive_group  == 1 ) #group enabled
                        {
                            $data_replace=expand_useralias_groups_insensitive($data_replace,0); #Sub called with "&"
                            
                        }
                        else #user enabled or both user and group disabled
                        {
                            $data_replace=expand_useralias_groups($data_replace,0); #Sub called with "&"
                        
                        }
                        $data_replace=(split(/=/x,$data_replace))[1]; #Regular expression without "/x"
                        $header =~ s/([,\s])$user_group\s*$/$1$data_replace/xg;  #Regular expression without "/x"
                        $header =~ s/^\s*$user_group([,\s])/$data_replace$1/xg;  #Regular expression without "/x"
                        $header =~ s/([,\s])$user_group([,\s])/$1$data_replace$2/xg;  #Regular expression without "/x"
                        if(defined $data_replace)
                        {
                        $header =~ s/^\s*$user_group\s*$/$data_replace/xg;  #Regular expression without "/x"
                    }
                }
                }
                if ($DEBUG)
                {
                    print "Header = $header\n";
                }
                if($case_insensitive_user==1)
                {
                    foreach my $user_group(split(/\s*,\s*/x,$header)) #Regular expression without "/x"
                    { print "\nusr group =$user_group";
                        if ($DEBUG)
                        {
                            print "\nprocessing user group:$user_group";
                        }
                        $user_group =~ s/(^\s*)|(\s*$)|(\\)//xg; #Regular expression without "/x"
                        if ($DEBUG)
                        {
                            print "\nUpdated user group:$user_group";
                            if(defined $users{$user_group}){print "\nValue of user_group from users hash = $users{$user_group}";}
                        }
                        if($user_group =~ /^%/x)  #Regular expression without "/x"
                        {
                            $user_group =~ s/%//xg; #Regular expression without "/x"
                            my @insensitive_groups = grep({/^\Q$user_group\E$/xi} keys %gids);  #Regular expression without "/x"
                            foreach my $grp (@insensitive_groups)
                            {
                                $target_gid = $gids{$grp};
                                $more_folks = $user_groups{$target_gid};
                                if ($DEBUG)
                                {
                                    print "\nGroup members:".$groups{$grp};
                                    print "\nUser-group members:".$more_folks;
                                }
                                if($groups{$grp} =~ /\w/x or $more_folks =~ /\w/x)  #Regular expression without "/x"
                                {
                                    $is_active_entry=1;
                                    last;
                                }
                                if($is_active_entry==1)
                                {
                                    last;
                                }
                            }
                        }
                        elsif(grep{/^$user_group$/xi} keys %users)   #Regular expression without "/x"
                        #elsif($users{$user_group})
                        {
                            $is_active_entry=1;
                            last;
                        }
                    }
                }
                else
                {
                    foreach my $user_group(split(/\s*,\s*/x,$header)) #Regular expression without "/x"
                    {
                        if ($DEBUG)
                        {
                            print "\nprocessing user group:$user_group";
                        }
                        $user_group =~ s/(^\s*)|(\s*$)|(\\)//xg; #Regular expression without "/x"
                        if ($DEBUG)
                        {
                            print "\nUpdated user group:$user_group";
                            if(defined $users{$user_group}){print "\nValue of user_group from users hash = $users{$user_group}";}
                        }
                        if($user_group =~ /^%/x)  #Regular expression without "/x"
                        {
                            $user_group =~ s/%//xg; #Regular expression without "/x"
                            $target_gid = $gids{$user_group};
                            $more_folks = $user_groups{$target_gid};
                            if ($DEBUG)
                            {
                                print "\nGroup members:".$groups{$user_group};
                                print "\nUser-group members:".$more_folks;
                            }
                            if($groups{$user_group} =~ /\w/x or $more_folks =~ /\w/x)  #Regular expression without "/x"
                            {
                                $is_active_entry=1;
                                last;
                            }
                        }
                        elsif($users{$user_group})
                        {
                            $is_active_entry=1;
                            last;
                        }
                    }
                }
                if ($DEBUG)
                {   
                    print "\nis_active_entry:$is_active_entry";
                }
                $alias_data=(split(/=/x,$line))[0]; #Regular expression without "/x"
                if($is_active_entry==1)
                {
                    ($header,$rest)=split(/=/x,$cmnd_line); #Regular expression without "/x"
                    $header =~ s/\s+ALL\s*$//xg; #Regular expression without "/x"
                    my ($filename, $line_number, $master_text) = get_line_location_text($cmnd_line); #Sub called with "&"
                    IssueViolation("Active_ADM_Privs", $line_number, "$alias_data", "Currently assigns ADM level privileges to active user(s). Verify authorized change or recovery is underway.", $master_text, $filename, 'SFIT77556'); #Sub called with "&"
                }
            }

        }
    }
    return; ####require final return
}

#Defect 130314
#In extended mode SFIT should ignore entries which isn't enabled on the actual hosts
# If entries in a Sudoers file are assigned to a host which is not the current host they should be ignored in extended mode.
# Example:
# User_Alias IBM_TEST_BAU = %testgrp
# Host_Alias TEST_HOSTS = not_this_host
# Cmnd_Alias IBM_TEST_BAU_CMDS = \
        # /bin/su - root
# IBM_TEST_BAU TEST_HOSTS = IBM_TEST_BAU_CMDS, IBM_ALL_NEG
# -----------------------------------------------------------------------------------
sub process_hostwise_entries
{   
    #my ($array_ref) = @_; #require argument unpacking  #Reused variable name in lexical scope
    if ($DEBUG)
    {
        print "\nin process_hostwise_entries\n";
    }
    my $line;
    my $match;
    my $found;
    my @sudoers_matches;
    my $header;
    my $rest;
    my @new_sudoers_file;
    my $filename;
    my $line_number;
    my $master_text;
    my $firstword;                  #strict_use
    my $secondword;                 #strict_use
    my $hostalias_defination;       #strict_use
    my @splitted_hosts;
    my @splitted_hosts_copy;
    foreach my $line (@sudoers_file)
    {
        ($header, $rest) = split(/=/x, $line, 2); #Regular expression without "/x"
        $header =~ s/^\s+|\s+$//xg; #Regular expression without "/x"
        ($firstword,$secondword)=split(/\s+/x,$header,2); #Regular expression without "/x"
        if(defined $secondword)
        {
        if("|Cmnd_Alias|User_Alias|Runas_Alias|Defaults|Host_Alias|" =~ /\|$firstword\|/x or $Host_Aliases{$secondword})#Regular expression without "/x"
        {
            push(@new_sudoers_file,$line);
            next;
        }
        $secondword =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
            @splitted_hosts=split(/\s*,\s*/x,$secondword); #Regular expression without "/x"
        }
        foreach my $inner_host(@splitted_hosts)
        {
            $inner_host =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
            if(grep({ /^\s*Host_Alias\s*$inner_host\s*=/x } @sudoers_file))  #Regular expression without "/x" #require block grep
            {   
                $hostalias_defination=(grep({ /^\s*Host_Alias\s*$inner_host\s*=/x }@sudoers_file))[0]; #Regular expression without "/x"  #require block grep
                $hostalias_defination=(split(/=/x,$hostalias_defination,2))[1]; #Regular expression without "/x"
                $secondword =~ s/^\s*$inner_host\s*$/$hostalias_defination/xg; #Regular expression without "/x"
                $secondword =~ s/,\s*$inner_host\s*$/,$hostalias_defination/xg; #Regular expression without "/x"
                $secondword =~ s/^\s*$inner_host\s*,/$hostalias_defination,/xg; #Regular expression without "/x"
                $secondword =~ s/,\s*$inner_host\s*,/,$hostalias_defination,/xg; #Regular expression without "/x"
            }
        }
         if(defined $secondword)
         {
        $secondword =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
        @splitted_hosts=split(/\s*,\s*/x,$secondword); #Regular expression without "/x"
         }
        foreach my $inner_host(@splitted_hosts)
        {
            $inner_host =~ s/\?/./xg; #Regular expression without "/x"
            $inner_host =~ s/\*/.*/xg; #Regular expression without "/x"
            if($inner_host =~ /^\s*$ShortHostName\s*$/x or $ShortHostName =~ /\s*$inner_host\s*/x) #Regular expression without "/x"
            {
                push(@new_sudoers_file,$line);
                last;
            }
        }
    }
    @sudoers_file=@new_sudoers_file;
    ####################sudoers array with runas user
    @new_sudoers_file=();
    foreach my $line (@sudoers_file_with_runas)
    {
        ($header, $rest) = split(/=/x, $line, 2); #Regular expression without "/x"
        $header =~ s/^\s+|\s+$//xg; #Regular expression without "/x"
        ($firstword,$secondword)=split(/\s+/x,$header,2); #Regular expression without "/x"
        
        if(defined $secondword)
        {
        if("|Cmnd_Alias|User_Alias|Runas_Alias|Defaults|Host_Alias|" =~ /\|$firstword\|/x or $Host_Aliases{$secondword}) #Regular expression without "/x"
        {
            push(@new_sudoers_file,$line);
        
            next;
        }
        $secondword =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
        @splitted_hosts_copy=split(/\s*,\s*/x,$secondword); #Reused variable name in lexical scope #Regular expression without "/x"
        }
        foreach my $inner_host(@splitted_hosts_copy)
        {
            $inner_host =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
            if(grep({ /^\s*Host_Alias\s*$inner_host\s*=/x } @sudoers_file)) #Regular expression without "/x" #require block grep
            {
                $hostalias_defination=(grep({ /^\s*Host_Alias\s*$inner_host\s*=/x } @sudoers_file))[0]; #Regular expression without "/x" #require block grep
                $hostalias_defination=(split(/=/x,$hostalias_defination,2))[1]; #Regular expression without "/x"
                $secondword =~ s/^\s*$inner_host\s*$/$hostalias_defination/xg; #Regular expression without "/x"
                $secondword =~ s/,\s*$inner_host\s*$/,$hostalias_defination/xg; #Regular expression without "/x"
                $secondword =~ s/^\s*$inner_host\s*,/$hostalias_defination,/xg; #Regular expression without "/x"
                $secondword =~ s/,\s*$inner_host\s*,/,$hostalias_defination,/xg; #Regular expression without "/x"
            }
        }
        my @splitted_hosts1;
         if(defined $secondword)
        {
        $secondword =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
             @splitted_hosts1=split(/\s*,\s*/x,$secondword); #Regular expression without "/x"
        }
        foreach my $inner_host(@splitted_hosts1)
        {
            $inner_host =~ s/\?/./xg; #Regular expression without "/x"
            $inner_host =~ s/\*/.*/xg; #Regular expression without "/x"
        
            if($inner_host =~ /^\s*$ShortHostName\s*$/x or $ShortHostName =~ /\s*$inner_host\s*/x)  #Regular expression without "/x" #Regular expression without "/x"
            {
                push(@new_sudoers_file,$line);        
                last;
            }
        }
    }
    @sudoers_file_with_runas=@new_sudoers_file;
    ##################################################
    
    if($DEBUG)
    {
        print "********************************************************************************\n";
        print "Sudoers array for current host :\n";
        print join("\n", @sudoers_file), "\n";
        print "********************************************************************************\n";
        print "********************************************************************************\n";
        print "Sudoers array with runas users for current host :\n";
        print join("\n", @sudoers_file), "\n";
        print "********************************************************************************\n";
        }

    return; ##  ##require final return
    
}


sub execution_priv_with_sudoedit
{
    my ($array_ref_copy) = @_;   #require argument unpacking   #Reused variable name in lexical scope        #Get reference of sudoers array and continue using it
    if ($DEBUG)
    {
        print "\nin execution_priv_with_sudoedit\n";
    }
    my $line;
    my $match;
    my $match_command;
    my $found;
    my @sudoers_matches=();
    my @sudoers_file_useralias;
    #my @sudoers_processed_lines; #is declared but not used
    my %old_lineTonew_line;
    my %map_sudoersLines=();
    my $header;
    my $csv_header;
    my $rest;
    my $temp_rest;
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    my $line_number;
    my $filename="";
    my $master_text="";
    my $flagMatch=1;
    my $regex_match;
    #my $raise_violation; #is declared but not used
    my $message_command;
    
    my $sudoedit_arguement;
    my $i;
    my @splitted_rest;
    my @allkeys;
    my @line_array;
    my @line_number_toLine;
    my $found_exactmatch=0;
    my $basic_path;
    my $new_rest;
    my $cmd;                #strict_use
    my $fake;               #strict_use
    my $reverse_current_val;#strict_use
    #for(my $k=0;$k<=$#sudoers_file_copy;$k++) #Reused variable name in lexical scope
    for(0..$#sudoers_file_copy)
    {
        ($header, $cmd) = split(/=/x, $sudoers_file_copy[$_], 2); #scalar value better written  #Regular expression without "/x"
        $header =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
        $header =~ s/\s*,\s*/,/xg; #Regular expression without "/x"
        $header =~ s/\s+.*//xg; #Regular expression without "/x"
        $rest="";
        if($header =~ /Cmnd_Alias|User_Alias|Runas_Alias|Defaults|Host_Alias/x) #Regular expression without "/x"
        {
            next;
        }
        $cmd=~s/NOEXEC\s*:\s*|EXEC\s*:\s*|PASSWD\s*:\s*|NOPASSWD\s*:\s*//xg; #Regular expression without "/x"
        my @cmds=split(/\s*,\s*/x,$cmd); #Regular expression without "/x"
        #for(my $j=0;$j<=$#cmds;$j++) #Reused variable name in lexical scope
        for(0..$#cmds)
        {
            $cmds[$_]=~s/^\s*//x; #Regular expression without "/x"
            $cmds[$_]=~s/\([A-Za-z0-9@\%_\+]+\)//xg; #Regular expression without "/x"
        }
         $rest=join(",", @cmds);
    
        if($rest ne ''){
        my $expand_line="$header=$rest";
        
    
        update_line_location($sudoers_file_expanded[$i], $expand_line); #Sub called with "&"
        push(@sudoers_file_useralias,$expand_line);
        $old_lineTonew_line{$expand_line}=$i;
        }
    }
    
    my @keys_array=@sudoers_file_useralias;
    #for(my $y=0;$y<=$#sudoers_file_useralias;$y++) #Reused variable name in lexical scope
    for(0..$#sudoers_file_useralias)
    {        
        ($header, $rest) = split(/=/x, $sudoers_file_useralias[$_], 2); #Regular expression without "/x"
        $header =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
        $header =~ s/\s*,\s*/,/xg; #Regular expression without "/x"
        $header =~ s/\s+.*//xg; #Regular expression without "/x"
        foreach my $usr_val(split(/,/x,$header)) #Regular expression without "/x"
        {   
            my $w = '[\w%,]+';
            my $chars = '(,[\w%,]+=)|(\s*=)';
            my @temp=grep({ /($w,\Q$usr_val\E,$w=)|(^\Q$usr_val\E($chars))|(^$w,\Q$usr_val\E\s*=)/x } @sudoers_file_useralias); #require block grep #Regular expression without "/x" #ProhibitComplexRegexes
            #
            @allkeys=grep({ /^(\s*(.*,\Q$usr_val\E(,)?.*)|(\Q$usr_val\E(,)?.*))\s*=/x } @keys_array);  #require block grep #Regular expression without "/x" #ProhibitComplexRegexes
            my $new_header="";
            foreach my $new_line (@allkeys) #perlcritic
            {
                my $hdr="";
                if(defined $old_lineTonew_line{$new_line})
                {
                    $hdr=(split(/=/x,$sudoers_file_copy[$old_lineTonew_line{$new_line}],2))[0]; #Regular expression without "/x"
                }
                $new_header.=$hdr."|";
            }
            if($usr_val =~ /[\w]+/x and $new_header =~ /[\w]+/x and ((defined $map_sudoersLines{$usr_val}) && ($map_sudoersLines{$usr_val} !~ /\w/x))) #Regular expression without "/x"
            {
                $map_sudoersLines{$usr_val}=$new_header;                
            }  
            if(!grep({ /($w,\Q$usr_val\E,$w=)|(^\Q$usr_val\E($chars))|(^$w,\Q$usr_val\E\s*=)/x} @sudoers_matches))  #require block grep #Regular expression without "/x" #ProhibitComplexRegexes
            {                
                if($#temp>0)
                {                    
                    $line=$temp[0];
                    $csv_header=(split(/=/x,$line,2))[0]; #Regular expression without "/x"
                    $new_rest="";
                    #for(my $j=0;$j<=$#temp;$j++)
                    for(0..$#temp)
                    {                        
                        ($fake, $rest) = split(/=/x, $temp[$_], 2); #Regular expression without "/x"
                        $new_rest=$new_rest.$rest.",";                        
                    }
                    $new_rest =~ s/,$//xg;     #Regular expression without "/x"                
                    push(@sudoers_matches, "$csv_header=$new_rest");
                    update_line_location($line, "$csv_header=$new_rest");      #Sub called with "&"               
                }
            }
        }
    }
    
    foreach my $line(@sudoers_file_useralias)
    {
        $line =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"   
        if(!grep({ /^\s*\Q$line\E\s*$/x } @sudoers_matches)) #require block grep #Regular expression without "/x"
        {            
            push(@sudoers_matches,$line);
        }
    }
    if($DEBUG)
    {
        print "\n**********Sudoers array after merging lines for common users for SFIT67619************\n";
        #for(my $z=1;$z<=$#sudoers_matches+1;$z++) #Reused variable name in lexical scope
       for(1..$#sudoers_matches+1)
        {
            print "$_ : ".$sudoers_matches[$_-1]."\n";
        }
        print "******************\n";
    }
    my $array_ref1 = Filter_negations(\@sudoers_matches,1); #Sub called with "&"
    @sudoers_matches = @{$array_ref1};  #Double-sigil dereference
    @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_matches);  #Regular expression without "/x"  #require block grep  
    foreach my $line (@sudoers_matches)
    {        
        ($header, $rest) = split(/=/x, $line, 2); #Regular expression without "/x"
        $header =~ s/(^\s*)|(\s*$)//xg;    #Regular expression without "/x"     
        @splitted_rest=split(/\s*,\s*/x,$rest); #Regular expression without "/x"
        @splitted_rest=reverse(@splitted_rest);
        my @processed_path=();
        
        my $current_line="";
        @line_array=();
        my @allheaders=();
        my @get_sudoers_line=();
        foreach(split(/\s*,\s*/x,$header)) #Regular expression without "/x"
        {
            if($map_sudoersLines{$_})
            {                
                @allheaders=split(/\|/x,$map_sudoersLines{$_}); #Regular expression without "/x"
                foreach my $hdr (@allheaders)
                {   
                    @get_sudoers_line=grep({ /^\s*$hdr\s*=/x } @sudoers_file_copy);  #Regular expression without "/x"#require block grep
                    my $for_line=$get_sudoers_line[0];
                    $for_line=~s/\([A-Za-z0-9@\_%]+\)//xg;#Regular expression without "/x"
                    my ($h1,$r1)=split(/=/x,$for_line,2); #Regular expression without "/x"
                    $h1=~s/\s+[A-Za-z0-9_%]+//x; #Regular expression without "/x"
                    $h1=~s/\s+$//x; #Regular expression without "/x"
                    $r1=~s/\s*,\s*/,/xg; #Regular expression without "/x"
                    $r1=~s/^\s+|\s+$//x; #Regular expression without "/x"
                    $for_line="$h1=$r1";
                    
                    ($filename, $line_number, $master_text) = get_line_location_text($for_line); #Sub called with "&"
                    if($line_number > 0)
                    {
                        push(@line_array,$line_number);
                        $line_number_toLine[$line_number]=$for_line;
                    }
                }
            }
        }
        if($#line_array>=0)
        {
            @line_array=sort {$a <=> $b} @line_array;
            $current_line=$line_number_toLine[$line_array[0]];            
        }
        $filename="";
        $line_number="";
        $master_text="";
        if($current_line =~ /\w/x) #Regular expression without "/x"
        {
            ($filename, $line_number, $master_text) = get_line_location_text($current_line); #Sub called with "&"
            $header = (split(/=/x,$current_line,2))[0];     #Regular expression without "/x"       
        }
       # foreach(@splitted_rest)
        foreach  my $splitr (@splitted_rest)
        {
            if($splitr !~ /sudoedit\s+(?:[^,]+)/x) #ProhibitUnusedCapture #Regular expression without "/x"
            {
                push(@processed_path,$splitr);                
            }
            elsif($splitr =~ /^[a-zA-Z0-9\/]*sudoedit\s+([^,]+)/x) #Regular expression without "/x"
            {            
                $found=$1;
                $found =~ s/\*/[^\\s,]+/xg; #Regular expression without "/x"
                $found =~ s/\./\\./xg; #Regular expression without "/x"
                $found =~ s/\//\\\//xg; #Regular expression without "/x"
                if(grep({ /^\s*!\s*[a-zA-Z0-9\/]*sudoedit/x } @processed_path))  #require block grep #Regular expression without "/x"
                {
                    my @post_sudoedit=grep({ /^\s*!\s*[a-zA-Z0-9\/]*sudoedit/x } @processed_path); #require block grep #Regular expression without "/x"
                    my $j;
                    #for($i=0;$i<=$#post_sudoedit;$i++)
                    for(0..$#post_sudoedit)
                    {
                        if($post_sudoedit[$_] =~ /^\s*!\s*[a-zA-Z0-9\/]*sudoedit\s+([^,]+)/x) #Regular expression without "/x"
                        {
                            $found=$1;
                            $found =~ s/\*/[^\\s,]+/xg; #Regular expression without "/x"
                            $found =~ s/\./\\./xg; #Regular expression without "/x"
                            $found =~ s/\//\\\//xg; #Regular expression without "/x"
                            if($splitr =~ /sudoedit\s*($found)\s*$/x) #Regular expression without "/x"
                            {
                                last;
                            }
                        }
                        $j=$_;
                    }
                    #unless($i <= $#post_sudoedit)
                    $j = $j+1;
                    if($j > $#post_sudoedit) #ProhibitUnlessBlocks
                    {
                        push(@processed_path,$splitr);                        
                    }
                }
                else
                {
                    $found_exactmatch=0;
                   # foreach(my $i_count=0;$i_count<=$#processed_path;$i_count++) #Reused variable name in lexical scope
                    for(0..$#processed_path)
                    {                       
                       if($processed_path[$_] =~ /^\s*!\s*($found)\s*$/x) #Regular expression without "/x"
                       {
                            if(($found !~ /\*/x and $processed_path[$_] !~ /\*/x) or ($found =~ /\*/x and $processed_path[$_] =~ /\*/x)) #Regular expression without "/x"
                            {
                                $found_exactmatch=1;
                            }
                           splice(@processed_path,$_,1);                           
                       }
                    }
                    if($found_exactmatch==0)
                    {
                        push(@processed_path,$splitr);                        
                    }                    
                }
            }
            elsif($splitr =~ /^\s*!\s*[a-zA-Z0-9\/]*sudoedit\s+([^,]+)/x) #Regular expression without "/x"
            {
                $found=$1;
                $found =~ s/\*/[^\\s,]+/xg; #Regular expression without "/x"
                $found =~ s/\./\\./xg; #Regular expression without "/x"
                $found =~ s/\//\\\//xg; #Regular expression without "/x"
                if(grep({ /^[a-zA-Z0-9\/]*sudoedit\s*($found)\s*$/x } @processed_path))  #Regular expression without "/x"#require block grep
                {   
                    my @post_sudoedit=grep({ /^[a-zA-Z0-9\/]*sudoedit/x } @processed_path);  #Regular expression without "/x"#require block grep
                    my $j;
                   # for($i=0;$i<=$#post_sudoedit;$i++)
                    for(0..$#post_sudoedit)
                    {
                        if($post_sudoedit[$_] =~ /^\s*[a-zA-Z0-9\/]*sudoedit\s+([^,]+)/x) #Regular expression without "/x"
                        {
                            $found=$1;
                            $found =~ s/\*/[^\\s,]+/xg; #Regular expression without "/x"
                            $found =~ s/\./\\./xg; #Regular expression without "/x"
                            $found =~ s/\//\\\//xg; #Regular expression without "/x"
                            if($splitr =~ /sudoedit\s*($found)\s*$/x) #Regular expression without "/x"
                            {
                                last;
                            }
                        }
                      $j=$_;
                    }
                    #unless($i <= $#post_sudoedit)
                    $j=$j+1;
                    if($j > $#post_sudoedit)  ##ProhibitUnlessBlocks
                    {
                        push(@processed_path,$splitr);                        
                    }
                }
                else
                {
                    $found_exactmatch=0;
                    #for(my $ic=0;$ic<=$#processed_path;$ic++) #Reused variable name in lexical scope
                    for(0..$#processed_path)
                    {                        
                        if($processed_path[$_] =~ /^\s*($found)\s*$/x) #Regular expression without "/x"
                        {
                            if(($found !~ /\*/x and $processed_path[$_] !~ /\*/x) or ($found =~ /\*/x and $processed_path[$_] =~ /\*/x)) #Regular expression without "/x"
                            {
                                $found_exactmatch=1;
                            }
                            splice(@processed_path,$_,1);                            
                        }
                    }
                    if($found_exactmatch==0)
                    {
                        push(@processed_path,$splitr);                        
                    }
                }
            }
        }
        @processed_path=reverse(@processed_path);
        $rest=join(",",@processed_path);
        
        while($rest =~ /,[a-zA-Z0-9\/]*sudoedit\s+([^,\n]+)/x or $rest =~ /^\s*[a-zA-Z0-9\/]*sudoedit\s+([^,\n]+)/x) #Regular expression without "/x"
        {            
            $flagMatch=1;
            $found = $1;
            $sudoedit_arguement=$found;
            $message_command=$found;
            $basic_path=$found;
            $basic_path =~ s/\*\s*$//xg; #Regular expression without "/x"
            $basic_path =~ s/\?\s*$//xg; #Regular expression without "/x"
            if($rest =~ /,[a-zA-Z0-9\/]*sudoedit\s+([^,\n]+)/x) #Regular expression without "/x"
            {
                $rest =~ s/,[a-zA-Z0-9\/]*sudoedit\s+([^,\n]+)//x; #Regular expression without "/x"
            }
            else
            {
                $rest =~ s/^\s*[a-zA-Z0-9\/]*sudoedit\s+([^,\n]+)//x; #Regular expression without "/x"
            }
            $rest =~ s/^\s*,\s*//xg; #Regular expression without "/x"
            if($found =~ /\*[^,\s]+\*/x){next;} #Regular expression without "/x"
            $found =~ s/\*/[^\\s,]+/xg; #Regular expression without "/x"
            $found =~ s/\./\\./xg; #Regular expression without "/x"
            $found =~ s/\//\\\//xg; #Regular expression without "/x"
            $match_command=$found;            
            if($found !~ /\+\s*$/x) #Regular expression without "/x"
            {
                $match_command="$found([^\\s,]+)";
            }
            
            $temp_rest=$rest;
            foreach my $current_val(split(/\s*,\s*/x,$rest)) #Regular expression without "/x"
            {
                if (grep({ /^\s*\!\s*sudoedit\s+\Q$current_val\E/x } @processed_path))  #Regular expression without "/x"#require block grep
                {   
                    next;
                }
                $reverse_current_val=$current_val;
                $reverse_current_val =~ s/\*/([^\\s,]+)/xg; #Regular expression without "/x"
                $reverse_current_val =~ s/\./\\./xg; #Regular expression without "/x"
                $reverse_current_val =~ s/\//\\\//xg; #Regular expression without "/x"
                $reverse_current_val =~ s/\?/\\?/xg;   #Regular expression without "/x"           
                $reverse_current_val =~ s/\s/\\s/xg;               
                $reverse_current_val =~ s/\#/\\#/xg;
                if($current_val =~ /(,\s*$found)|(^$found)/x or $current_val =~ /(,\s*$match_command)|(^$match_command)/x) #Regular expression without "/x"
                {                    
                    if($current_val !~ /(?:,\s*$found)|(?:^$found)/x)#(,\s*$match_command)|(^$match_command) #ProhibitUnusedCapture #Regular expression without "/x"
                    {                        
                        if($current_val =~ /^\s*($match_command)\s+/x or $current_val =~ /^\s*($match_command)\s*$/x) #Regular expression without "/x"
                        {
                            $regex_match=$2;
                            $message_command=$current_val;
                            if($regex_match =~ /\//x){next;}    #Regular expression without "/x"                         
                            #unless($regex_match !~ /\*/)
                            if($regex_match =~ /\*/x) #ProhibitUnlessBlocks #Regular expression without "/x"
                            {                                
                                if($message_command =~ /\*/x) #Regular expression without "/x"
                                {
                                    $message_command=$sudoedit_arguement;
                                }
                                if((-f  "$message_command" or -d  "$message_command") and ( -f "$basic_path" or -d "$basic_path" ) and $EXTENDED_CHECK_USER == 1)
                                {                                   
                                    IssueError($header, $line_number, "$message_command", "sudoedit access to same file also granted privileged execution rights", $master_text, $filename, 'SFIT67619'); #Sub called with "&"
                                }
                                else
                                {                                    
                                    IssueWarning($header, $line_number, "$message_command", "sudoedit access to same file also granted privileged execution rights", $master_text, $filename, 'SFIT67619'); #Sub called with "&"
                                }                                
                            }                            
                        }
                    }
                    elsif($current_val =~ /(,\s*$found)|(^$found)/x) #Regular expression without "/x"
                    {                        
                        if($current_val =~ /^\s*($found)\s+/x or $current_val =~ /^\s*($found)\s*$/x) #Regular expression without "/x"
                        {
                            $message_command=$current_val;                            
                            if($current_val =~ /$basic_path.*\/.*/x){next;}     #Regular expression without "/x"                        
                            
                            if($message_command =~ /\*/x) #Regular expression without "/x"
                            {
                                $message_command=$sudoedit_arguement;
                            }
                            if((-f  "$message_command" or -d  "$message_command") and ( -f "$basic_path" or -d "$basic_path" ) and ((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER == 1)))
                            {
                                IssueError($header, $line_number, "$message_command", "sudoedit access to same file also granted privileged execution rights", $master_text, $filename, 'SFIT67619'); #Sub called with "&"
                            }
                            else
                            {
                                IssueWarning($header, $line_number, "$message_command", "sudoedit access to same file also granted privileged execution rights", $master_text, $filename, 'SFIT67619'); #Sub called with "&"
                            }
                        
                        }
                    }
                    
                }
                elsif(($sudoedit_arguement =~ /^\s*($reverse_current_val)\s+/x) or ($sudoedit_arguement =~ /^\s*($reverse_current_val)\s*$/x))  #Regular expression without "/x"
                {
                    my $regex_postmatch=$2;
                    $regex_match=$2; ##Capture variable used outside conditional
                    if($regex_postmatch =~ /\//x) #Regular expression without "/x"
                    {
                        next;
                    }
                    $message_command=$current_val;
                    if($regex_match =~ /\//x){next;} #Regular expression without "/x"
                    if($message_command =~ /\*/x) #Regular expression without "/x"
                    {
                        $message_command=$sudoedit_arguement;
                    }
                    if((-f  "$message_command" or -d  "$message_command") and ( -f "$basic_path" or -d "$basic_path" ) and ((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER == 1)))
                    {
                        IssueError($header, $line_number, "$message_command", "sudoedit access to same file also granted privileged execution rights", $master_text, $filename, 'SFIT67619'); #Sub called with "&"
                    }
                    else
                    {
                        IssueWarning($header, $line_number, "$message_command", "sudoedit access to same file also granted privileged execution rights", $master_text, $filename, 'SFIT67619'); #Sub called with "&"
                    }
                }
            }
        }
    }
    return; ####require final return
}

###############
#Enhancement 77555
#Issue ERROR if user-aliases named IBM_.*BAU.*  and IBM_.*ADM.* have any userid names,  %group_names or User_alias 
#that are assigned to both BAU and ADM type aliases
#This is in all modes
#This means that an individual or group has BAU and AMD level privileges at the same time, which is not allowed.
#Issue a message ERROR  using the line # of the entry when the IBM_ADM user-alias is used.  Fields would be "Excessive_Privilege" "line #" "name-of-userid,group or user-alias in common" "Currently assigned to both BAU and ADM user aliases"
#Issue message if any user-aliases with IBM_.*BAU.*  and IBM_.*ADM.* contain any userid names %group_names or User_alias names that are assigned to both BAU and ADM type aliases
###############
sub verifyExcessive_Privilege_IBM_BAU
{
    my ($array_ref_copy) = @_;   #Reused variable name in lexical scope          #Get reference of sudoers array and continue using it
    my @sudoers_file_copy = @{$array_ref_copy};#Reused variable name in lexical scope #Double-sigil dereference
    my $i;
    my $rest;
    my $line;
    my @all_user_alias;

    if($DEBUG){print "\nIn verifyExcessive_Privilege_IBM_BAU";}
    @all_user_alias = grep({ /^\s*User_Alias\s+.*=/x } @sudoers_file_copy); #require block grep #Regular expression without "/x"
    foreach(@all_user_alias){$_ =~ s/!//xg;} #Regular expression without "/x"
    process_violation_IBM_BAU(\@all_user_alias,1);
    foreach my $violation_string (keys %violation_hash)
    {
         my @msg_parameters=split(/\|/x,$violation_string); #Regular expression without "/x"
         my $entry=$msg_parameters[2];
         $array_ref=$violation_hash{$violation_string};
         my @BAU_lines=@{$array_ref}; #Double-sigil dereference

        foreach (@all_user_alias)
        {
            my $original_line=$_;
            if(grep({ /^\s*$original_line\s*/x } @BAU_lines)) #require block grep #Regular expression without "/x"
            {
                $_ =~ s/=\s*$entry\s*,/=/xg; #Regular expression without "/x"
                $_ =~ s/=\s*$entry\s*$/=/xg; #Regular expression without "/x"
                $_ =~ s/,\s*$entry\s*$//xg;#Regular expression without "/x"
                $_ =~ s/,\s*$entry\s*,/,/xg; #Regular expression without "/x"
            }
            update_line_location($original_line,$_);
        }

        IssueError($msg_parameters[0], $msg_parameters[1], $msg_parameters[2], $msg_parameters[3], $msg_parameters[4], $msg_parameters[5],$msg_parameters[6]); #Sub called with "&"
        delete $violation_hash{$violation_string};
    }

    if(((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER=~ /^\d+$/x && $EXTENDED_CHECK_USER == 1))) #Regular expression without "/x"
    {
        foreach(@all_user_alias)
        {
            my $original_line=$_;
            $rest = (split(/=/x, $_, 2))[1]; #Regular expression without "/x"
            foreach my $cmd (split(/\s*,\s*/x,$rest)) #Regular expression without "/x"
            {
                my $entry=$cmd;
                $entry =~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"
                if($entry =~ /%/x)#Regular expression without "/x"
                {
                    $entry =~ s/%//xg; #Regular expression without "/x"
                    if($groups{$entry})
                    {
                        my $rest1=$groups{$entry};
                        $_ =~ s/(=\s*)%$entry\s*,/$1$rest1,/xg;#Regular expression without "/x"
                        $_ =~ s/(=\s*)%$entry\s*$/$1$rest1/xg;#Regular expression without "/x"
                        $_ =~ s/(,\s*)%$entry\s*$/,$rest1/xg;#Regular expression without "/x"
                        $_ =~ s/(,\s*)%$entry\s*,/,$rest1,/xg;#Regular expression without "/x"
                    }
                }
            }
            update_line_location($original_line,$_);
        }
        process_violation_IBM_BAU(\@all_user_alias,0);
    }

    foreach(keys %violation_hash)
    {
        my @msg_parameters=split(/\|/x,$_); #Regular expression without "/x"
        IssueError($msg_parameters[0], $msg_parameters[1], $msg_parameters[2], $msg_parameters[3], $msg_parameters[4], $msg_parameters[5],$msg_parameters[6]); #Sub called with "&"
    }
    return; ##require final return
}
#violation processing is separated to execute twice(once with groups, then with expanded groups)
sub process_violation_IBM_BAU
{
    my ($array_ref_copy,$flag) = @_;   #Reused variable name in lexical scope          #Get reference of all_user_alias array and continue using it
    my @all_user_alias = @{$array_ref_copy}; #Double-sigil dereference
    my @ADM_userAlias;
    my @BAU_userAlias;
    my @all_user_alias_original;
    my @ADM_userAlias_original;
    my @BAU_userAlias_original;
    my $user_alias_filtration;
    my $user_alias_filtration1;
    
    @ADM_userAlias = grep({ /^\s*User_Alias\s+((IBM_.*_ADM_.*=)|(IBM_.*_ADM\s*=))/x } @all_user_alias);  #Regular expression without "/x"#require block grep
    @BAU_userAlias = grep({ /^\s*User_Alias\s+((IBM_.*_BAU_.*=)|(IBM_.*_BAU\s*=))/x} @all_user_alias);  #Regular expression without "/x"#require block grep
    if($flag==1)
    {
        verify_IBM_BAU(\@ADM_userAlias,\@BAU_userAlias,\@all_user_alias,1); #Sub called with "&"
    }
    else
    {
        verify_IBM_BAU(\@ADM_userAlias,\@BAU_userAlias,\@all_user_alias,0); #Sub called with "&"
    }
    @ADM_userAlias = grep({ /^\s*User_Alias\s+((IBM_.*_ADM_.*=)|(IBM_.*_ADM\s*=))/x } @all_user_alias);  #Regular expression without "/x"#require block grep
    @BAU_userAlias = grep({ /^\s*User_Alias\s+((IBM_.*_BAU_.*=)|(IBM_.*_BAU\s*=))/x } @all_user_alias);  #Regular expression without "/x"#require block grep
    @all_user_alias_original=@all_user_alias;
    @ADM_userAlias_original=@ADM_userAlias;
    @BAU_userAlias_original=@BAU_userAlias;
    $user_alias_filtration=1;
    while($user_alias_filtration==1)
    {
        @all_user_alias=@all_user_alias_original;
        @BAU_userAlias=@BAU_userAlias_original;
        expand_userAlias_oneLevel_IBM_BAU(\@ADM_userAlias,\@all_user_alias); #Sub called with "&"
        verify_IBM_BAU(\@ADM_userAlias,\@BAU_userAlias,\@all_user_alias,0); #Sub called with "&"
        #######################
        $user_alias_filtration1=1;
        while($user_alias_filtration1==1)
        {
            expand_userAlias_oneLevel_IBM_BAU(\@BAU_userAlias,\@all_user_alias); #Sub called with "&"
            verify_IBM_BAU(\@ADM_userAlias,\@BAU_userAlias,\@all_user_alias,0); #Sub called with "&"
            $user_alias_filtration1=check_exist_userAlias_IBM_BAU(\@BAU_userAlias,\@all_user_alias);
        }
        #######################
        $user_alias_filtration=check_exist_userAlias_IBM_BAU(\@ADM_userAlias,\@all_user_alias);
    }
        return; ##require final return
}
#Expands user alias passed to one level of inner aliases
sub expand_userAlias_oneLevel_IBM_BAU
{
    my ($ref1,$ref2)=@_;
    my @all_user_alias=@{$ref2};
    my @all_user_alias_temp=();
    my $rest;               #strict_use
    my $original_line;      #strict_use
    if($DEBUG)
    {
        print "\nIn expand_userAlias_oneLevel_IBM_BAU";
    }
    foreach my $line (@{$ref1})
    {
        $original_line=$line;
        $rest = (split(/=/x, $line, 2))[1]; #Regular expression without "/x"
        foreach (split(/\s*,\s*/x,$rest)) #Regular expression without "/x"
        {
            my $entry=$_;
            $entry =~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"
            if(grep({ /^\s*User_Alias\s+$entry\s*=/x } @all_user_alias)) #require block grep  #Regular expression without "/x"
            {
                my @alias_def=grep({ /^\s*User_Alias\s+$entry\s*=/x } @all_user_alias);  #Regular expression without "/x"#require block grep #search in main array for presence of alias definition
                my $rest1=(split(/=/x,$alias_def[0],2))[1]; #Regular expression without "/x"
                $line =~ s/(=\s*)$entry\s*,/$1$rest1,/xg; #Regular expression without "/x"
                $line =~ s/(=\s*)$entry\s*$/$1$rest1/xg; #Regular expression without "/x"
                $line =~ s/(,\s*)$entry\s*$/,$rest1/xg; #Regular expression without "/x"
                $line =~ s/(,\s*)$entry\s*,/,$rest1,/xg; #Regular expression without "/x"
            }
        }
        update_line_location($original_line,$line);
    }
    return;##require final return
}
#check if all user aliases are expanded or not
sub check_exist_userAlias_IBM_BAU
{
    my ($ref3,$ref4)=@_;
    my @check_array=@{$ref3};
    my @all_user_alias=@{$ref4};
    my $rest;
    if($DEBUG)
    {
        print "\nIn check_exist_userAlias_IBM_BAU";
    }
    foreach (@check_array)#check if any other user alias exists, set flag $user_alias_filtration
    {
        $rest = (split(/=/x, $_, 2))[1]; #Regular expression without "/x"
        foreach (split(/,/x,$rest)) #Regular expression without "/x"
        {
            my $entry=$_;
            $entry =~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"
            if(grep({ /^\s*User_Alias\s+$entry\s*=/x } @all_user_alias))  #Regular expression without "/x"#require block grep
            {
                return 1;#return 1 if all aliases are not expanded
            }
        }
    }
    return 0;# 0 if all aliases are expanded
}
#check if user/group/User_Alias exist in both ADM or BAU type alias, remove if found and create violation message
sub verify_IBM_BAU
{
    my ($ref1,$ref2,$ref3,$violation_flag1)=@_;
    my @ADM_userAlias=@{$ref1};
    my @BAU_userAlias=@{$ref2};
    my $header;
    my $rest;
    my $filename;
    my $line_number;
    my $master_text;
    if($DEBUG)
    {
        print "\nIn verify_IBM_BAU";
    }
    foreach my $line (@ADM_userAlias)
    {
        ($header, $rest) = split(/=/x, $line, 2); #Regular expression without "/x"
        foreach (split(/,/x,$rest)) #Regular expression without "/x"
        {
            my $entry=$_;
            if($case_insensitive_user==1 && $case_insensitive_group==1)
            { 
                if(grep({ /(([=,]\s*)$entry\s*,)|(([=,]\s*)$entry\s*$)/xi } @BAU_userAlias) and $violation_flag1==1  ) #require block grep #Regular expression without "/x" #ProhibitComplexRegexes
                {  
                    my @BAU_lines=grep({ /(([=,]\s*)$entry\s*,)|(([=,]\s*)$entry\s*$)/xi} @BAU_userAlias);  #require block grep  #Regular expression without "/x" #ProhibitComplexRegexes
                    ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                    #store violation message to hash to avoid duplicates
                    $violation_hash{"Excessive_Privilege|$line_number|$entry|Currently assigned to both BAU and ADM user aliases|$master_text|$filename|SFIT77555"}=\@BAU_lines;
                    ##############
                    $line =~ s/(=\s*)$entry\s*,/$1/xg; #Regular expression without "/x"
                    $line =~ s/(=\s*)$entry\s*$/$1/xg; #Regular expression without "/x"
                    $line =~ s/(,\s*)$entry\s*$//xg; #Regular expression without "/x"
                    $line =~ s/(,\s*)$entry\s*,/,/xg; #Regular expression without "/x"
                    
                    foreach my $useralias_line (@{$ref3})#remove entity that is present in both type of aliases
                    {
                        my $original_line=$useralias_line;
                        if($useralias_line =~ /(([=,]\s*)$entry\s*,)|(([=,]\s*)$entry\s*$)/x )  #Regular expression without "/x" #ProhibitComplexRegexes
                        {   
                            $useralias_line =~ s/(=\s*)$entry\s*,/$1/xig; #Regular expression without "/x"
                            $useralias_line =~ s/(=\s*)$entry\s*$/$1/xig; #Regular expression without "/x"
                            $useralias_line =~ s/(,\s*)$entry\s*$//xig; #Regular expression without "/x"
                            $useralias_line =~ s/(,\s*)$entry\s*,/,/xig; #Regular expression without "/x"
                            
                            update_line_location($original_line,$useralias_line);
                            
                        }
                    }
                }
            }
            elsif($case_insensitive_user==1)
            {
                if(grep({ /(([=,]\s*)$entry\s*,)|(([=,]\s*)$entry\s*$)/xi } @BAU_userAlias) and $violation_flag1==1 and $entry=~m/^\s*[^%].*/x) #Regular expression without "/x"#require block grep #ProhibitComplexRegexes
                {  
                    my @BAU_lines=grep({ /(([=,]\s*)$entry\s*,)|(([=,]\s*)$entry\s*$)/xi} @BAU_userAlias);  #require block grep #Regular expression without "/x" #ProhibitComplexRegexes
                    ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                    #store violation message to hash to avoid duplicates
                    $violation_hash{"Excessive_Privilege|$line_number|$entry|Currently assigned to both BAU and ADM user aliases|$master_text|$filename|SFIT77555"}=\@BAU_lines;
                    ##############
                    $line =~ s/(=\s*)$entry\s*,/$1/xg; #Regular expression without "/x"
                    $line =~ s/(=\s*)$entry\s*$/$1/xg; #Regular expression without "/x"
                    $line =~ s/(,\s*)$entry\s*$//xg; #Regular expression without "/x"
                    $line =~ s/(,\s*)$entry\s*,/,/xg; #Regular expression without "/x"
                    
                    foreach my $useralias_line (@{$ref3})#remove entity that is present in both type of aliases
                    {
                        my $original_line=$useralias_line;
                        if($useralias_line =~ /(([=,]\s*)$entry\s*,)|(([=,]\s*)$entry\s*$)/x )  #Regular expression without "/x" #ProhibitComplexRegexes
                        {   
                            $useralias_line =~ s/(=\s*)$entry\s*,/$1/xig; #Regular expression without "/x"
                            $useralias_line =~ s/(=\s*)$entry\s*$/$1/xig; #Regular expression without "/x"
                            $useralias_line =~ s/(,\s*)$entry\s*$//xig; #Regular expression without "/x"
                            $useralias_line =~ s/(,\s*)$entry\s*,/,/xig; #Regular expression without "/x"
                            
                            update_line_location($original_line,$useralias_line);
                            
                        }
                    
                    }
                }
                elsif(grep({ /(([=,]\s*)$entry\s*,?)|(([=,]\s*)$entry\s*$)/x } @BAU_userAlias) and $violation_flag1==1) #Regular expression without "/x" #ProhibitComplexRegexes
                {
                    #my @BAU_lines=grep({ /((=\s*)$entry\s*,)|((=\s*)$entry\s*$)|((,\s*)$entry\s*$)|((,\s*)$entry\s*,)/x} @BAU_userAlias);
                    my @BAU_lines=grep({ /(([=,]\s*)$entry\s*,?)|(([=,]\s*)$entry\s*$)/x} @BAU_userAlias);  #require block grep #Regular expression without "/x" #ProhibitComplexRegexes
                    ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                    #store violation message to hash to avoid duplicates
                    $violation_hash{"Excessive_Privilege|$line_number|$entry|Currently assigned to both BAU and ADM user aliases|$master_text|$filename|SFIT77555"}=\@BAU_lines;
                    ##############
                    $line =~ s/(=\s*)$entry\s*,/$1/xg; #Regular expression without "/x"
                    $line =~ s/(=\s*)$entry\s*$/$1/xg; #Regular expression without "/x"
                    $line =~ s/(,\s*)$entry\s*$//xg; #Regular expression without "/x"
                    $line =~ s/(,\s*)$entry\s*,/,/xg; #Regular expression without "/x"

                    foreach my $useralias_line (@{$ref3})#remove entity that is present in both type of aliases
                    {
                        my $original_line=$useralias_line;
                        if($useralias_line =~ /(([=,]\s*)$entry\s*,?)|(([=,]\s*)$entry\s*$)/x) #Regular expression without "/x" #ProhibitComplexRegexes
                        {
                            $useralias_line =~ s/(=\s*)$entry\s*,/$1/xg; #Regular expression without "/x"
                            $useralias_line =~ s/(=\s*)$entry\s*$/$1/xg; #Regular expression without "/x"
                            $useralias_line =~ s/(,\s*)$entry\s*$//xg; #Regular expression without "/x"
                            $useralias_line =~ s/(,\s*)$entry\s*,/,/xg; #Regular expression without "/x"
                            update_line_location($original_line,$useralias_line);
                        }
                    }
                }
            }
            elsif($case_insensitive_group==1)
            {
                if(grep({ /(([=,]\s*)$entry\s*,?)|(([=,]\s*)$entry\s*$)/xi } @BAU_userAlias) and $violation_flag1==1 and $entry=~m/^\s*\%/x )  #Regular expression without "/x"#require block grep #ProhibitComplexRegexes
                { 
                    my @BAU_lines=grep({ /(([=,]\s*)$entry\s*,?)|(([=,]\s*)$entry\s*$)/xi} @BAU_userAlias);  #require block grep #Regular expression without "/x" #ProhibitComplexRegexes
                    ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                    #store violation message to hash to avoid duplicates
                    $violation_hash{"Excessive_Privilege|$line_number|$entry|Currently assigned to both BAU and ADM user aliases|$master_text|$filename|SFIT77555"}=\@BAU_lines;
                    ##############
                    $line =~ s/(=\s*)$entry\s*,/$1/xg; #Regular expression without "/x"
                    $line =~ s/(=\s*)$entry\s*$/$1/xg; #Regular expression without "/x"
                    $line =~ s/(,\s*)$entry\s*$//xg; #Regular expression without "/x"
                    $line =~ s/(,\s*)$entry\s*,/,/xg; #Regular expression without "/x"
                    
                    foreach my $useralias_line (@{$ref3})#remove entity that is present in both type of aliases
                    {
                        my $original_line=$useralias_line;
                        if($useralias_line =~ /(([=,]\s*)$entry\s*,?)|(([=,]\s*)$entry\s*$)/x )#Regular expression without "/x"  #ProhibitComplexRegexes
                        {   
                            $useralias_line =~ s/(=\s*)$entry\s*,/$1/xig; #Regular expression without "/x"
                            $useralias_line =~ s/(=\s*)$entry\s*$/$1/xig; #Regular expression without "/x"
                            $useralias_line =~ s/(,\s*)$entry\s*$//xig; #Regular expression without "/x"
                            $useralias_line =~ s/(,\s*)$entry\s*,/,/xig; #Regular expression without "/x"
                            
                            update_line_location($original_line,$useralias_line);
                            
                        }
                    }
                }
                elsif(grep({ /(([=,]\s*)$entry\s*,?)|(([=,]\s*)$entry\s*$)/x } @BAU_userAlias) and $violation_flag1==1)#Regular expression without "/x"  #ProhibitComplexRegexes
                {
                    my @BAU_lines=grep({ /(([=,]\s*)$entry\s*,?)|(([=,]\s*)$entry\s*$)/x} @BAU_userAlias); #Regular expression without "/x"  #require block grep #ProhibitComplexRegexes
                    ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                    #store violation message to hash to avoid duplicates
                    $violation_hash{"Excessive_Privilege|$line_number|$entry|Currently assigned to both BAU and ADM user aliases|$master_text|$filename|SFIT77555"}=\@BAU_lines;
                    ##############
                    $line =~ s/(=\s*)$entry\s*,/$1/xg; #Regular expression without "/x"
                    $line =~ s/(=\s*)$entry\s*$/$1/xg; #Regular expression without "/x"
                    $line =~ s/(,\s*)$entry\s*$//xg; #Regular expression without "/x"
                    $line =~ s/(,\s*)$entry\s*,/,/xg; #Regular expression without "/x"

                    foreach my $useralias_line (@{$ref3})#remove entity that is present in both type of aliases
                    {
                        my $original_line=$useralias_line;
                        if($useralias_line =~ /(([=,]\s*)$entry\s*,?)|(([=,]\s*)$entry\s*$)/x) #Regular expression without "/x" #ProhibitComplexRegexes
                        {
                            $useralias_line =~ s/(=\s*)$entry\s*,/$1/xg; #Regular expression without "/x"
                            $useralias_line =~ s/(=\s*)$entry\s*$/$1/xg; #Regular expression without "/x"
                            $useralias_line =~ s/(,\s*)$entry\s*$//xg; #Regular expression without "/x"
                            $useralias_line =~ s/(,\s*)$entry\s*,/,/xg; #Regular expression without "/x"
                            update_line_location($original_line,$useralias_line);
                        }
                    }
                }
            }
            else #Cascading if-elsif chain
            { 
                if($case_insensitive_user==0 && $case_insensitive_group==0)
                {
                    if(grep({ /(([=,]\s*)$entry\s*,)|(([=,]\s*)$entry\s*$)/x } @BAU_userAlias) && $violation_flag1==1) #Regular expression without "/x" #require block grep
                    {
                        my @BAU_lines=grep({ /(([=,]\s*)$entry\s*,)|(([=,]\s*)$entry\s*$)/x} @BAU_userAlias);  #require block grep#Regular expression without "/x" 
                    ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                    #store violation message to hash to avoid duplicates
                    $violation_hash{"Excessive_Privilege|$line_number|$entry|Currently assigned to both BAU and ADM user aliases|$master_text|$filename|SFIT77555"}=\@BAU_lines;
                    ##############
                    $line =~ s/(=\s*)$entry\s*,/$1/xg; #Regular expression without "/x"
                    $line =~ s/(=\s*)$entry\s*$/$1/xg; #Regular expression without "/x"
                    $line =~ s/(,\s*)$entry\s*$//xg; #Regular expression without "/x"
                    $line =~ s/(,\s*)$entry\s*,/,/xg; #Regular expression without "/x"

                    foreach my $useralias_line (@{$ref3})#remove entity that is present in both type of aliases
                    {
                        my $original_line=$useralias_line;
                        if($useralias_line =~ /(([=,]\s*)$entry\s*,?)|(([=,]\s*)$entry\s*$)/x)#Regular expression without "/x"  #ProhibitComplexRegexes
                        {
                            $useralias_line =~ s/(=\s*)$entry\s*,/$1/xg; #Regular expression without "/x"
                            $useralias_line =~ s/(=\s*)$entry\s*$/$1/xg; #Regular expression without "/x"
                            $useralias_line =~ s/(,\s*)$entry\s*$//xg; #Regular expression without "/x"
                            $useralias_line =~ s/(,\s*)$entry\s*,/,/xg; #Regular expression without "/x"
                            update_line_location($original_line,$useralias_line);
                        }
                    }
                }
            }
        }
    }
    }
        return; ##require final return
}

################################
#Task 60261
#Test for presence of standard header and footer
#Issue an ATTENION message "Missing standard template Begin statement" or "Missing standard template End statement"
#if these messages are not in the sudoers file  note that there are 2 places where the text in each message may vary. Only the bold portions should be used to test this.

# Begin Global sudoers standard template --variable portion-- Master --variable portion--
# End Global sudoers standard template --variable portion-- Master  --variable portion--
#######################

sub check_standard_header_footer
{
    my $file_name;
    my @comment_include_file;
    if(!grep({ /^\s*\#\s+Begin.*[Ss]tandard\s+[Tt]emplate.*Ver.*Begin/x } @comment_array)) #Regular expression without "/x" #require block grep
    {
        IssueAttention("Template_comment", "", "Begin_comment", "Begin template comment missing or non std", "master", "$input_sudoers_file", 'SFIT60261'); #Sub called with "&"
    }
    if(!grep({ /^\s*\#\s+End.*[Ss]tandard\s+[Tt]emplate.*Ver.*End/x } @comment_array))  #Regular expression without "/x"#require block grep
    {
        IssueAttention("Template_comment", "", "End_comment", "End template comment missing or non std", "master", "$input_sudoers_file", 'SFIT60261'); #Sub called with "&"
    }
    foreach my $file (@files_included) #perlcritic
    {
        if(-f $file)
        {
            @comment_include_file=();            
            my $file_handle = IO::File->new("$file", "<") or print "error:couldn't open file: $file";   #prohibit indirect syntax
            while(<$file_handle>)
            {
                if($_ =~ /^\s*\#/x)#Regular expression without "/x"
                {
                    chomp $_;
                    push(@comment_include_file,$_);
                }
            }            
            $file_handle->close();
            $file_name=(split(/\/+/x,$file))[-1]; #Regular expression without "/x"
            my $regex_comment = '[Ss]tandard\s+template.*Ver.*Master';
            if($file_name =~ /^1/x)#Regular expression without "/x"
            {
                if($template_check != 1)
                {
                    if(!grep({ /^\s*\#\s+Begin.*[Gg]lobal.*$regex_comment.*Begin/x } @comment_include_file)) #Regular expression without "/x"#require block grep #ProhibitComplexRegexes
                    {
                        IssueAttention("Global_header", "", "Global_header", "Begin global template comment missing  or non std", "Included", "$file", 'SFIT60261') #Sub called with "&"
                    }
                    if(!grep({ /^\s*\#\s+End.*[Gg]lobal.*$regex_comment.*End/x } @comment_include_file)) #Regular expression without "/x"#require block grep #ProhibitComplexRegexes
                    {
                        IssueAttention("Global_footer", "", "Global_footer", "End global template comment Missing or non std", "Included", "$file", 'SFIT60261') #Sub called with "&"
                    }
                }
                elsif($template_check == 1)
                {
                    if(!grep({ /^\s*\#\s+Begin.*Ver.*Begin/x } @comment_include_file))#Regular expression without "/x" #require block grep
                    {
                        IssueAttention("Template_comment", "", "Begin_comment", "Begin template comment missing  or non std", "Included", "$file", 'SFIT60261') #Sub called with "&"
                    }
                    if(!grep({ /^\s*\#\s+End.*Ver.*End/x } @comment_include_file)) #Regular expression without "/x"#require block grep
                    {
                        IssueAttention("Template_comment", "", "End_comment", "End template comment Missing or non std", "Included", "$file", 'SFIT60261') #Sub called with "&"
                    }               
                }
            }
            elsif($file_name =~ /^(2|3|4)/x)#Regular expression without "/x"
            {  
                if(!grep({ /^\s*\#\s+Begin.*Ver.*Begin/x } @comment_include_file)) #require block grep#Regular expression without "/x"
                {
                    IssueAttention("Template_comment", "", "Begin_comment", "Begin template comment missing  or non std", "Included", "$file", 'SFIT60261') #Sub called with "&"
                }
                if(!grep({ /^\s*\#\s+End.*Ver.*End/x } @comment_include_file)) #require block grep#Regular expression without "/x"
                {
                    IssueAttention("Template_comment", "", "End_comment", "End template comment Missing or non std", "Included", "$file", 'SFIT60261') #Sub called with "&"
                }
            }
            @comment_include_file=grep({ /^\s*\#\s*Begin.*Begin\s*\#/x } @comment_include_file); #Regular expression without "/x"#require block grep
            foreach(@comment_include_file)
            {
                push(@metadata_comments,"INCLUDE_FILE:,$file,METADATA,\"$_\"");
            }
        }
    }
    @comment_include_file=grep({ /^\s*\#\s*Begin.*Begin\s*\#/x } @orig_comment_array); #require block grep#Regular expression without "/x"
    foreach(@comment_include_file)
    {
        push(@metadata_comments,"SUDOERS FILE:,$ORIG_SUDOER,METADATA,\"$_\"");
    }
        return; ##require final return
}

sub check_atleast_one_include
{
    my $array_length=@files_included;
    if($array_length<1)
    {
        IssueViolation("#include", "", "#include", "In default mode there must be at least one active #include statement in the sudoers file", "master", "", 'SFIT64587'); #Sub called with "&"
    }
        return; ##require final return
}

#############################
#checking that IBM team entries are in "included" files, not in the main /etc/sudoers
#In extended mode only
#this involves checking that IBM team entries are in "included" files, not in the main /etc/sudoers
#For each IBM team entry, if it is in the main sudoers file
#issue an attention message "IBM entry not migrated to  included file"
#*** the SA team entry and the root ALL= entry are excluded from this rule.
##############################
sub check_IBM_entryFile #Sub called with "&"
{   
    my ($array_ref_copy) = @_;   #require argument unpacking #Reused variable name in lexical scope             #Get reference of sudoers array and continue using it
    if ($DEBUG)
    {
        print "\nin check_IBM_entryFile\n";
    }

    my $line;
    my $editor;
    my @all_matches;
    my $match;
    my $IBM_ID_EXISTS=0;
    my $found;
    my $issue_command;
    my @sudoers_matches;
    my $header;
    my $rest;
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    my $filename;
    my $line_number;
    my $master_text;
    @sudoers_file = grep ({ defined() and length() } @sudoers_file_copy);
    @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_copy);  #Regular expression without "/x"#require block grep
    @sudoers_matches = grep({ !/(?:[\s,=!]+IBM_NONE_SA)/x } @sudoers_matches); #Regular expression without "/x" #require block grep #ProhibitUnusedCapture
    foreach my $line (@sudoers_matches)
    {
        
        
        if(defined $line){($header, $rest) = split(/=/x, $line, 2);} #Regular expression without "/x"
        $IBM_ID_EXISTS =0;
        if(defined $header)
        {
        foreach(split(/\s*,\s*/x,$header)) #Regular expression without "/x"
        {
            $match=$_;
            $match =~ s/^\s+|\s+$//xg; #Regular expression without "/x"
            $match =~ s/\s.*//xg; #Regular expression without "/x"
            #Defect 122492: if ALL user found, ignoring
            if($match =~ /^ALL$/x){next;} #Regular expression without "/x"           
            $IBM_ID_EXISTS = check_ibm_entry_no_SU($match,\@sudoers_file_copy); #Sub called with "&"
                if((defined $IBM_ID_EXISTS) && ($IBM_ID_EXISTS == 1))
            {
                $issue_command=$header;
                last;
            }
        }
        }
        
        if((defined $IBM_ID_EXISTS) && ($IBM_ID_EXISTS == 1))
        {
            ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
            if($master_text =~ /master/)
            {
                IssueAttention($header, $line_number, "\"$issue_command\"", "IBM entry not migrated to included file", $master_text, $filename, 'SFIT60267'); #Sub called with "&"
            }
        }
    }
        return; ##require final return
}
sub process_user_assignment
{
    my ($array_ref_copy,$violation_flag) = @_; #Reused variable name in lexical scope  # #require argument unpacking           #Get reference of sudoers array and continue using it
    if($DEBUG)
    {
        print "\nIn process_user_assignment\n";
    }
    my $key='';
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    my $first_word;
    my @temp_array;
    my @sudoers_matches;        #strict_use
    my $header;     #strict_use
    my $rest;       #strict_use
    my $new_header; #strict_use
    @sudoers_file_copy = grep ({ defined() and length() } @sudoers_file_copy);
    my @User_Alias_array=grep({ /^\s*User_Alias\s+.*=/x } @sudoers_file_copy); #Regular expression without "/x"#require block grep
    @sudoers_matches = grep({ !/Cmnd_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_copy); #Regular expression without "/x"  #require block grep
    ##########################
    foreach my $line (@sudoers_matches)
    {
        ($header, $rest) = split(/=/x, $line, 2); #pankaj #Regular expression without "/x"
        if(defined $header)
        {
        $header =~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"
        $first_word=(split(/\s+/x,$header))[0]; #Regular expression without "/x"
        }
        if($DEBUG)
        {
            print "\nLine == $line\n";
            print "Header in in if : $header\n";
            print "first_word : $first_word\n";
        }
        my $alias_defined=0;
        if((defined $header) && ($header =~ /User_Alias/))
        {   
            if($DEBUG)
            {
                print "Header in in if : $header\n";
            }
            $key= $header;
            $key =~ s/User_Alias//xg; #Regular expression without "/x"
            $key =~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"
            $alias_defined=1;
            if($violation_flag == 1)
            {
                foreach my $usr (split(/\s*,\s*/x,$rest)) #Regular expression without "/x"
                {
                    if($usr !~ /^%/x && !grep({ /^\s*User_Alias\s+$usr\s*=/x} @User_Alias_array) && $usr !~ /^\s*ALL\s*$/x) #Regular expression without "/x"##prohibit mixed boolean operators #require block grep
                    {
                        my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                        if($header =~ /\s+/x){$new_header=(split(/\s+/x,$header,2))[1];}else{$new_header=$header;} #Regular expression without "/x"
                        IssueAttention($new_header, $line_number, $usr,"Userid are assigned directly to sudo privileges - best practice are to use groups",$master_text, $filename, 'SFIT163691'); #Sub called with "&"
                    }
                }
            }
        }
        else
        {           
            $key= $first_word;
            if(defined $key )
            {
            $key =~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"
            }
            $rest="";
            if ($DEBUG)
            {
                print "Header in else : $header\n";
                print "key : $key\n";
            }
            if(defined $header)
            {
            foreach my $header_val(split(/\s*,\s*/x,$header)) #Regular expression without "/x"
            {
                $header_val=~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"
                $header_val =~ s/\s+.*$//xg; #Regular expression without "/x"
                if(grep({ /User_Alias\s+$header_val\s*=/x } @User_Alias_array)) #Regular expression without "/x"#require block grep
                {
                    @temp_array=grep({ /User_Alias\s+$header_val\s*=/x } @User_Alias_array); #Regular expression without "/x"#require block grep
                    $temp_array[0]=(split(/=/x,$temp_array[0],2))[1]; #Regular expression without "/x"
                    $rest=$rest.$temp_array[0].",";
                }
                else
                {                   
                    $rest=$rest.$header_val.",";                    
                    if($violation_flag == 1)
                    {                       
                        if($header_val !~ /^%/x and $header_val !~ /^\s*ALL\s*$/x)#Regular expression without "/x"
                        {
                            my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                            if($header =~ /\s+/x){$new_header=(split(/\s+/x,$header,2))[1]}else{$new_header=$header} #Regular expression without "/x"#Regular expression without "/x"
                            IssueAttention($header, $line_number, $header_val,"Userid are assigned directly to sudo privileges - best practice are to use groups",$master_text, $filename, 'SFIT163691'); #Sub called with "&"
                        }
                    }
                }
            }
            }
            $rest =~ s/,$//xg;   #Regular expression without "/x"     
            if ($DEBUG)
            {
                print "Rest at the end : $rest\n";      
            }   
        }
        my @user_list=();
        foreach (split(/,/x,$rest)) #Regular expression without "/x"
        {
            my $entry=$_;
            if($entry =~ /^%/x)#Regular expression without "/x"
            {
                $entry =~ s/%_PLUS_//xg; #Regular expression without "/x"
                $entry =~ s/%//xg; #Regular expression without "/x"
                if (! exists $groups{$entry}) 
                {
                    if ($DEBUG)
                    {
                        print "\$groups\{$entry\} does not exist\n";
                    }   
                    $USER_ASSIGN{$entry}=-1;
                }
                else
                {
                    if ( $groups{$entry} eq "" )
                    {
                        push (@empty_groups,$entry)
                    }
                    @user_list=(@user_list,split(/\s*,\s*/x,$groups{$entry})); #Regular expression without "/x"
                    if(!defined $USER_ASSIGN{$entry}){$USER_ASSIGN{$entry}=0;}
                }   
            }
            else
            {
                push(@user_list,$entry);
            }
        }   
        
        my @ibmid=keys %IBMIDLIST;

        my $nonibm_id=0;
        my $ibm_id=0;
        foreach my $usr(@user_list)
        {
            if (! exists $users{$usr}) 
            {               
                $USER_ASSIGN{$usr}=-1;              
            }
            elsif($ibmid_count < 1)
            {
                $USER_ASSIGN{$usr}=1;
            }
            else
            {  
                if(grep({ /^\s*\Q$usr\E\s*$/x} @ibmid) or $usr =~ /<\s*:/x) #require block grep#Regular expression without "/x"
                {
                    $USER_ASSIGN{$usr}=1;
                    $ibm_id=1;
                }
                else
                {
                        $USER_ASSIGN{$usr}=0;
                }
            }
            
        }
        if($ibmid_count=~ /^\d+$/x && $ibmid_count < 1)#Regular expression without "/x"
        {
            $USER_ASSIGN{$key}=1;
        }
        else
        {
            if ($ibm_id==1 )
            {
            $USER_ASSIGN{$key}=1;
            }
            else
            {                
                if ($DEBUG)
                {
                    print "\nSecond 0 case \$USER_ASSIGN\{$key\} == 0\n";                   
                }
                if ((defined $key ) && (defined $line) && ($line =~ /^\s*User_Alias\s+$key\s*=/x))#Regular expression without "/x"
                {
                    my ($user_alias_header, $alias_contents) = split(/=/x, $line, 2); #Regular expression without "/x"
                    my  @alias_contents_array = split(/,/x,$alias_contents); #Regular expression without "/x"
                    my $missing_alias_element=0;
                    my $empty_group_count=0;
                    my $user_exist_count=0;
                    if ($DEBUG)
                    {
                        print "Line==$line\n";
                        print "Line matches User_Alias\n";
                        print "alias_contents == $alias_contents\n";    
                    }
                    foreach my $alias_element(@alias_contents_array)
                    {
                        $alias_element =~ s/%_PLUS_//gx;#Regular expression without "/x"
                        $alias_element =~ s/%//xg;#Regular expression without "/x"
                        if ($DEBUG)
                        {
                            print "alias_element == $alias_element\n";
                            if ( (defined  $USER_ASSIGN{$alias_element} ) ){print "\$USER_ASSIGN\{$alias_element\} == $USER_ASSIGN{$alias_element}\n";}     
                        }   
                        if ( (defined  $USER_ASSIGN{$alias_element} ) && ($USER_ASSIGN{$alias_element} == -1 ))
                        {
                            $missing_alias_element++;                           
                        }
                        elsif ((grep({ /^$alias_element$/x } @empty_groups)) && ($USER_ASSIGN{$alias_element} == 0) )#Regular expression without "/x" #prohibit mixed boolean operators #require block grep
                        {
                            $empty_group_count++;
                        }
                        elsif (! grep({ /^$alias_element$/x } @empty_groups) && $USER_ASSIGN{$alias_element} == 0) #Regular expression without "/x"#prohibit mixed boolean operators #require block grep
                        {
                            $user_exist_count++;
                        }                       
                    }
                    if ( $missing_alias_element >= 1 )  
                    {
                        $USER_ASSIGN{$key}=-1;
                    }
                    elsif ( $empty_group_count >= 1 and $user_exist_count == 0 and $missing_alias_element == 0 )
                    {
                        $USER_ASSIGN{$key}=1;  # Setting it for reporting NOTE since its empty groups 
                    }   
                    else
                    {
                        $USER_ASSIGN{$key}=0;
                    }                   
                }   
                #######################
                if(defined $line){($header, $rest) = split(/=/x, $line, 2);} #pankaj #Regular expression without "/x"
                if(defined $header){$header =~ s/(^\s+)|(\s+$)//xg;}#Regular expression without "/x"
                if(defined $rest)
                {
                foreach (split(/,/x,$rest)) #Regular expression without "/x"
                {
                    my $entry=$_;
                    my $user_id="";
                    $entry =~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"
                    if (($entry =~ /^(\s*[^!]+\s*)su\s+-\s+(.*)$/x))#Regular expression without "/x"
                    {
                        $user_id = $2;
                        $user_id =~ s/\*/.\*/xg; #Regular expression without "/x"
                        $user_id =~ s/\?/.\?/xg; #Regular expression without "/x"
                        $user_id = trim($user_id); #Sub called with "&"
                        if (grep({ /^\s*$user_id\s*$/x } @ibmid)) #require block grep#Regular expression without "/x"
                        {
                            $USER_ASSIGN_SKIP{$key}=1; #Defect 78186:For SFIT60267, the target user id in su command need not be checked for IBM entry
                            last;
                        }
                    }
                }
                }
                #####################
            }
        }
    }
    ###############
    if($DEBUG)
    {
        foreach(keys %USER_ASSIGN)
        {
            print "\nUSER_ASSIGN Hash:$_ => ".$USER_ASSIGN{$_};
        }
        foreach(keys %USER_ASSIGN_SKIP)
        {
            print "\nUSER_ASSIGN_SKIP Hash:$_ => ".$USER_ASSIGN_SKIP{$_};
        }
    }
        return; ##require final return
}


sub check_ibm_id
{
    my ($id_to_check) = @_;
    my $key;
    my $val;
    if(defined $id_to_check)
    {
    chomp($id_to_check);
    $id_to_check =~ s/\*/.*/xg; #Regular expression without "/x"
    $id_to_check =~ s/\?/.?/xg; #Regular expression without "/x"
    }
    foreach(keys %USER_ASSIGN)
    {
        $key=$_;
        $val=$USER_ASSIGN{$key};
        if((defined $id_to_check) && ($key =~ /^\s*$id_to_check\s*$/x))#Regular expression without "/x"
        {
            if($val eq "1")
            {
                return 1;#last; #prohibit unreachable code
            }
            if($val eq "0")
            {
                return 0; #last; #prohibit unreachable code
            }
        }
    }
    return -1;
}

#For SFIT60267, the target user id in su command need not be checked for IBM entry
#Defect 78186

sub check_ibm_entry_no_SU
{
    my ($id_to_check,$array_ref_copy) = @_; #Reused variable name in lexical scope
   
    if (defined $array_ref_copy)
    {
     my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    }
    my $key;
    my $val;
    my $exists=0;
    
    if($DEBUG)
    {
        print "\nIn check_ibm_entry_no_SU\n";
    }
    
    chomp($id_to_check);
    $id_to_check =~ s/\*/.*/xg; #Regular expression without "/x"
    $id_to_check =~ s/\?/.?/xg; #Regular expression without "/x"
    
    return $USER_ASSIGN{$id_to_check};
     
    
}

sub check_cust_id
{
    my ($id_to_check,$array_ref_copy) = @_; #Reused variable name in lexical scope
    my @sudoers_file_copy         = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    my $key;
    my $val;
    
    if($DEBUG)
    {
        print "\nIn check_cust_id\n";
    }
    
    chomp($id_to_check);
    $id_to_check =~ s/\*/.*/xg;#Regular expression without "/x"
    $id_to_check =~ s/\?/.?/xg;#Regular expression without "/x"

    foreach(keys %USER_ASSIGN)
    {       
        $key=$_;
        $val=$USER_ASSIGN{$key};        
        if($key =~ /$id_to_check/x) #Regular expression without "/x"
        {
            if($val eq "1")
            {
                return 0;#if is IBM id/entry then return 0 #last; #prohibit unreachable code
            }
        }
    }
    if($id_to_check =~ /%/x) #Regular expression without "/x"
    {   
        $id_to_check =~ s/%_PLUS_//xg;#Regular expression without "/x"
        $id_to_check =~ s/%//xg;#Regular expression without "/x"

        if(exists $groups{$id_to_check})
        {
            return 1;#if group exists(customer entry), return 1
        }
    }
    elsif($users{$id_to_check})
    {
        return 1;#if user exists(customer entry), return 1
    }
    elsif(grep({ /\s*User_Alias\s+$id_to_check\s*=/x } @sudoers_file_copy))#require block grep #Regular expression without "/x"
    {
        my @matched=grep({ /\s*User_Alias\s+$id_to_check\s*=/x } @sudoers_file_copy);#require block grep #Regular expression without "/x"
        @matched=split(/=/x,$matched[0],2); #Regular expression without "/x"
        @matched=split(/,/x,$matched[1]); #Regular expression without "/x"
        foreach(@matched)
        {
            my $usr=$_;
            $usr =~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"
            if($users{$usr} or $groups{$id_to_check})
            {
                return 1;#if group exists(customer entry), return 1
            }
        }
    }
    return -1;#user/group does not exists, return -1
}

sub process_sudoers_entry
{
    my ($array_ref_copy) = @_;    #require argument unpacking #Reused variable name in lexical scope  #Get reference of sudoers array and continue using it
    my $header;                     #strict_use
    my $rest;                       #strict_use
    if($DEBUG)
    {
        print "\nIn process_sudoers_entry\n";
    }
    my $second_word="deadbeef";       #Added to carry Entry name into message. DB 10Dec 2014
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    my $first_word;
    my @sudoers_matches = grep({ !/Cmnd_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_copy);#Regular expression without "/x"#require block grep

    foreach my $line (@sudoers_matches)
    {
        ($header, $rest) = split(/=/x, $line, 2); #Regular expression without "/x"

        $header =~ s/(^\s+)|(\s+$)//xg;#Regular expression without "/x"
        $first_word=(split(/\s+/x,$header))[0]; #Regular expression without "/x"
        my $alias_defined=0;
        
        if($header =~ /User_Alias/)
        {
            $alias_defined=1;
            $second_word=(split(/\s+/x,$header))[1];  #Regular expression without "/x"#Removed leading my to carry Entry name into message. DB 10Dec 2014
        }
        elsif(grep({ /User_Alias\s*$first_word\s*=/x } @sudoers_matches))#Regular expression without "/x"#require block grep
        {
            my @matching_lines=grep({ /User_Alias\s*$first_word\s*=/x } @sudoers_matches); #Regular expression without "/x"#require block grep
            $rest=(split(/=/x, $matching_lines[0], 2))[1]; #Regular expression without "/x"
            $second_word=$header;
        }
        else
        {
            $second_word=(split(/\s+/x,$header))[0];  #Regular expression without "/x"#Removed leading my to carry Entry name into message. DB 10Dec 2014
            $rest=(split(/\s+/x,$header))[0];
        }

        if($DEBUG){
            print "Before: $rest \n";
        }   
        
        $rest =~ s/[\,]+/\,/xg; #removing blank users from the list. #Regular expression without "/x"
        $rest =~ s/^\s*\,//xg;  #removing first , if any.#Regular expression without "/x"

        if($DEBUG){
            print "After: $rest \n";
        }       
        
        my @user_list=();

        foreach (split(/,/x,$rest)) #Regular expression without "/x"
        {
            my $entry=$_;
            if($entry =~ /^%/x) #Regular expression without "/x"
            {               
                $entry =~ s/%_PLUS_//xg;#Regular expression without "/x"
                $entry =~ s/%//xg;#Regular expression without "/x"
                $entry =~ s/\s*ALL\s*//xg;#Regular expression without "/x"
                $entry =~ s/^\s*|\s*$//xg;#Regular expression without "/x"

                if(defined $groups{$entry})
                {
                    @user_list=(@user_list,split(/\s*,\s*/x,$groups{$entry}));  #Regular expression without "/x"
                }                   
            }
            else
            {             
              $entry =~ s/%//xg; #Regular expression without "/x"
              $entry =~ s/\s*ALL\s*//xg; #Regular expression without "/x"
              $entry =~ s/^\s*|\s*$//xg; #Regular expression without "/x"
              push(@user_list,$entry);
            }
        }

        my @ibmid=keys %IBMIDLIST;
        my $nonibm_id=0;
        my $ibm_id=0;
        
        if($DEBUG){
            foreach my $test_id (@user_list){
                print "User_List = $test_id\n";
            }
        }
        
        foreach my $usr(@user_list)
        {
            if($usr !~ /[A-Za-z0-9_-]+/x)#Regular expression without "/x"
            {
                $ibm_id=1;
            }
            else
            {
                #if( bq id $usr 2>/dev/null bq) #backquote
                if ( (exists $groups{$usr}) or (exists $users{$usr}) )
                {
                    if(!grep({ /^\s*$usr\s*$/x } @ibmid))#require block grep #Regular expression without "/x"
                    { 
                        $nonibm_id=1;
                    }
                    else
                    {
                        $ibm_id=1;
                    }    
                }
            }
        }
        if($nonibm_id==1 and $ibm_id==1)
        {
            my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
            if($alias_defined==1)
            {
                IssueWarning($header, $line_number, $second_word,"Entry assigns privileges to both IBM and non-IBM userids in the same entry",$master_text, $filename, 'SFIT10347'); #Sub called with "&"
            }
            else
            {
                IssueError($header, $line_number, $second_word,"Entry assigns privileges to both IBM and non-IBM userids in the same entry",$master_text, $filename, 'SFIT10347');  #Sub called with "&"   
            }
        }
    }
    return;##require final return
}


sub check_files
{
    my $dir_name = "/etc";
    my %dir_hash;

    my $user;
    my $group;
    my $other;
    my $special;
    
    my $other_filter_copy = 0x0007; #Reused variable name in lexical scope
    my $group_filter_copy = 0x0038; #Reused variable name in lexical scope
    my $user_filter_copy  = 0x01C0; #Reused variable name in lexical scope
    my $spec_filter  = 0x0E00;

    if($DEBUG)
    {
        print "\nIn check_files $configfile\n";
    }
    #added for Enhancement 420076 
    my ($etc_dev, $etc_ino, $etc_mode, $etc_nlink, $etc_uid, $etc_gid, $etc_rdev, $etc_size, $etc_atime, $etc_mtime, $etc_ctime, $etc_blksize, $etc_blocks) = stat "/etc/sudoers";
    my $etc_user    = ($etc_mode & $user_filter_copy) >> 6;
    my $etc_group   = ($etc_mode & $group_filter_copy) >> 3;
    my $etc_other   =  $etc_mode & $other_filter_copy;
    
    if (($etc_uid != 0) or ($etc_gid != 0) or ($etc_group > 5) or ($etc_other > 0))
    {
        IssueWarning("", "", "/etc/sudoers", "/etc/sudoers must be owned by UID 0 and GID 0 and permissions must be 750 or more stricT",
                "", "/etc/sudoers", 'SFIT18206'); #Sub called with "&"
    }
    
    #putting /etc directory in hash for ownership check.
    $dir_hash{$dir_name} = "";
    
    #checking file permissions.
    foreach(@files_refered)
    {
        my ($dev, $ino, $mode, $nlink, $uid, $gid, $rdev, $size, $atime, $mtime, $ctime, $blksize, $blocks) = stat $_;
        if ( $gid != 0 )
        {
            IssueWarning("", "", "$_", "Gid  must be 0 for included files and directories","", $_, 'SFIT18206'); # Warning added due to defect 420041 #Sub called with "&"
        }
        if( -f $_)
        {
            $dir_name = dirname($_);
            $user    = ($mode & $user_filter_copy) >> 6;
            $group   = ($mode & $group_filter_copy) >> 3;
            $other   =  $mode & $other_filter_copy;
                        
            if($_ =~ /\.env/x) #Regular expression without "/x"
            {
                if ( ($user > 6) or ($group > 4) or ($other > 0) )          
                {
                    IssueWarning("", "", "$_", "Include file permissions incorrect- Sudo requires included files to be 0640 or more strict",
                "", $_, 'SFIT18206'); #Sub called with "&"
                }
            }
            
            else
            {
                if ( ($user > 4) or ($group > 4) or ($other > 0) )          
                {
                    IssueWarning("", "", "$_", "Include file permissions incorrect- Sudo requires included files to be 0440 or more strict",
                "", $_, 'SFIT18206'); #Sub called with "&"
                }
            }
            
            my ($pass, $userid_name);
            ($userid_name,$pass,$uid,$gid) = getpwuid($uid);
            
            if(($uid ne "0") and ($userid_name !~ /^bin$/x))#Regular expression without "/x"
            {
                IssueWarning("", "", "$_","Include file owner incorrect- Sudo requires owner to be root or bin not $userid_name",
                "", $_, 'SFIT18206'); #Sub called with "&"
            }
        
            $dir_hash{$dir_name} = "";
        }
    }
    
    #checking directory permissions.
    foreach my $dir_name(keys %dir_hash) #perlcritic
    {
        if($DEBUG)
        {
            print "\nChecking directory ... $dir_name\n";
        }
    
        my ($dev, $ino, $mode, $nlink, $uid, $gid, $rdev, $size, $atime, $mtime, $ctime, $blksize, $blocks) = stat $dir_name;
                
        $special = ($mode & $spec_filter) >> 9;
        $group   = ($mode & $group_filter) >> 3;
        $other   = $mode & $other_filter;

        #no permission check for /etc directory 
        if(!grep({ /^[\s\t]*\/etc[\/]*\s*$/x } $dir_name))#require block grep#Regular expression without "/x"
        {
            # Removed setgid bit check $special != 2 as per Task 399290
            if ( ($group > 5) or ($other > 0) )
            {
                IssueWarning("", "", "$dir_name", "Include directory permissions incorrect- Sudo requires included directories to be 750 or more strict", "", $dir_name, 'SFIT18206'); #Sub called with "&"
            }
        }
        
        if(grep({ /^[\s\t]*\/etc[\/]*\s*$/x } $dir_name))#require block grep#Regular expression without "/x"
        {
            my $usrname = getpwuid $uid;
            
            if($DEBUG){
                print "user name for /etc directory is = $usrname\n";
            }
        
            if(($uid ne "0") and ($usrname !~/bin/))
            {
                IssueWarning("", "", "$dir_name","Include directory owner incorrect- Sudo requires owner to be either root or bin", "", $dir_name, 'SFIT18206'); #Sub called with "&"
            }           
        }
        else
        {
            if(($uid ne "0"))
            {
                IssueWarning("", "", "$dir_name","Include directory owner incorrect- Sudo requires owner to be root", "", $dir_name, 'SFIT18206'); #Sub called with "&"
            }
        }
    }
    return;##require final return
}


sub check_unix_format #Sub called with "&"
{
    my $line_number=1;
    my $process_file;
    my $error=0;
    if ($DEBUG)
    {
        print "\nin check_unix_format\n";
    }
    foreach(keys %all_sudoers_files)
    {
        $process_file=$_;
        $line_number=1;      
        my $FP =  IO::File->new("$process_file", "<");#prohibit indirect syntax
        while(<$FP>)  
        {
            if ($_ =~ /\r/x) #Regular expression without "/x" 
            {
                IssueError("", "$line_number", "", "Input contains ASCII Control-M characters- CRLF is not compatible with Unix text mode used in sudoers.", #Sub called with "&"
                              $all_sudoers_files{$process_file}, $process_file, 'SFIT14163');
                $error=1;
                last;
            }
            $line_number=$line_number+1;
        }
        $FP->close();
        if($error==1){last;}
    }
    return;##require final return
}

sub check_global_settings #Sub called with "&"
{
    my ($array_ref_copy) = @_;             #Get reference of sudoers array and continue using it #Reused variable name in lexical scope
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    my $file_val;
    my $check_profile_val;
    my @matching_lines=grep({ /^\s*Defaults\s+env_file=(.*)/x } @sudoers_file_copy);  #Regular expression without "/x"#require block grep
    if ($DEBUG)
    {
        print "\nin check_global_settings\n";
    }
    if(@matching_lines)
    {
        if($matching_lines[0] =~ /^\s*Defaults\s+env_file=(.*)/x) #Regular expression without "/x"
        {
        $file_val=$1;
        }
        if($file_val =~ /"(.*)"/x){$file_val=$1;}#Regular expression without "/x"
        if($file_val =~ /'(.*)'/x){$file_val=$1;}#Regular expression without "/x"
        chomp($file_val);
        $file_val =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"

        if(-f "$file_val")
        {
            push(@files_refered,$file_val);
            $security_settings{"env_file_".$matching_lines[0]}=$file_val;
            my $env_fh =  IO::File->new("$file_val", "<"); #prohibit indirect syntax
            while (my $line = <$env_fh>)
            {
                if ($line =~ /SMIT_SHELL=n/x) { $check_profile_val=$line; }#Regular expression without "/x"
            }
            #$check_profile_val=bq egrep "SMIT_SHELL=n" $file_val bq; #backquote
            $env_fh->close();
            my @split_array;
            if(defined $check_profile_val)
            { 
                @split_array = split(/\n/x,$check_profile_val);  #Regular expression without "/x"
            }
            if(grep({ /^\s*['"]?SMIT_SHELL=n['"]?/x } @split_array)){return 1;} #require block grep#Regular expression without "/x"
            if(grep({ /^\s*['\"]?export SMIT_SHELL=n['\"]?/x } @split_array)){return 1;} #require block grep#Regular expression without "/x"
        }
        elsif($file_val ne "")
        {
            my ($filename, $line_number, $master_text) = get_line_location_text($matching_lines[0]); #Sub called with "&"
            IssueWarning("", $line_number, "Defaults env_file","Global environment control file name $file_val is referenced but does not exist.",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
        }
        else
        {
            my ($filename, $line_number, $master_text) = get_line_location_text($matching_lines[0]); #Sub called with "&"
             IssueWarning("", $line_number, "Defaults env_file","Global environment control file name is empty",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
        }
    }
    return 0;
}
###############################
#In extended mode, there is one additional check...
#Each of the userid's authorized to run smitty/smit by the entry will need to have these 2 lines in their userid/.profile entries.
#export SMIT_SHELL=n readonly SMIT_SHELL
###############################
sub check_user_profile
{
    my ($array_ref_copy) = @_;  #Reused variable name in lexical scope   #require argument unpacking           #Get reference of sudoers array and continue using it
    if ($DEBUG)
    {
        print "\nin check_user_profile\n";
    }
    my $line;
    my @sudoers_matches;
    my $header;
    my $rest;
    my $header1;
    my $rest1;
    my @splitted_line;
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    my @sudoers_matches_temp;
    my $output_val;
    my $user_home;
    my $check_profile_val;
    my $check_profile_val1;
    my $filtered_value;
    my $filtered_value1;
    my @group_users=();
    my @processed_users=();
    my @processed_groups=();
    my %alias_hash=();
    my %alias_hash1=();
    my @alias_users=(); 
    my @alias_groups=();
    my $global_setting=check_global_settings(\@sudoers_file_copy); #Reused variable name in lexical scope #Sub called with "&"
    my $file_type="";
    my $line_count=1;
    my @lineidToLine = ();
    my $usr_string;             #strict_use
    if($global_setting==1)
    {
        if($DEBUG)
        {
            print "\n***************************************************************";
            print "\nGlobal settings of sudo environment control file are present";
            print "\n***************************************************************\n";
        }
        return;
    }
    #####Changes for the defect 137050
    my @User_Alias_smitty = grep({ /^\s*User_Alias\s+.*/x } @User_Alias); #require block grep #Regular expression without "/x"
    foreach my $line1(grep({ /^\s*User_Alias\s+.*/x } @sudoers_file_without_useralias_expansion)) #Regular expression without "/x"
    {
        if ($line1 =~ /%/x) #Regular expression without "/x"
        {
            ($header1,$rest1)=split(/=/x,$line1); #Regular expression without "/x"
            $header1 =~ s/^\s*User_Alias\s*//xg; #Regular expression without "/x"
            $header1 =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
            my @group_elements_arr = split(/,/x,$rest1); #Regular expression without "/x"
            foreach my $grp_name (@group_elements_arr)
            {
                if($grp_name=~ /^%/x && (!exists $groups{$grp_name})) #Regular expression without "/x"
                {
                    $alias_hash1{$header1} = $rest1;
                
                }
            }
            
        }
    
    }
    foreach my $line(grep({ /^\s*User_Alias\s+.*/x } @sudoers_file_copy))#require block grep #Regular expression without "/x"
    {
            my $expanded_line=expand_useralias_groups($line,0); #Sub called with "&"
            ($header,$rest)=split(/=/x,$expanded_line); #Regular expression without "/x"
            if(defined $header)
            {
            $header =~ s/^\s*User_Alias\s*//xg; #Regular expression without "/x"
            $header =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
            $alias_hash{$header} = $rest;
    }
    }
    @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_copy); #Regular expression without "/x" #require block grep
    ##########################
    @sudoers_matches_temp = ();
    foreach my $original_line (@sudoers_matches)
    {
        $lineidToLine[$line_count]=$original_line;
        $line = $original_line;
        $line =~ s/(![^,]*)|.*=//xg;#Regular expression without "/x"
        $line =~ s/,+/,/xg;#Regular expression without "/x"
        $line =~ s/^\s*,|,\s*$|^\s*//xg;#Regular expression without "/x"
        foreach (split(/,/x, $line)) #Regular expression without "/x"
        {
            push(@sudoers_matches_temp, $_ . "|" . $line_count);
        }
        $line_count+=1;
    }
    
    @sudoers_matches = @sudoers_matches_temp;
    ##########################
    foreach my $line (@sudoers_matches)
    {
        @splitted_line = split(/\|/x, $line); #Regular expression without "/x"
        $splitted_line[0] =~ s/(\s+$)|(^\s+)//xg; #Regular expression without "/x"
        @group_users=();
        #if ($splitted_line[0] =~ /^(([\S]+\/smit\s+)|([\S]+\/smit$)|([\S]+\/smitty\s+)|([\S]+\/smitty$))/x) #Regular expression without "/x"
        if ($splitted_line[0] =~ /^(([\S]+\/(smit|smitty)\s+)|([\S]+\/(smit|smitty)$))/x) #Regular expression without "/x" #ProhibitComplexRegexes
        {
            if ($getOS !~ /AIX/ and $splitted_line[0] !~ /^(?:[\S]+\/smit)/x)  #Regular expression without "/x"#ProhibitUnusedCapture
            {
                next;
            }
            ($header, $rest) = split(/=/x, $lineidToLine[$splitted_line[1]], 2); #pankaj #Regular expression without "/x"
            $header =~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"
            my @header_elements = split(/,/x, $header); #Regular expression without "/x"
            foreach my $header(@header_elements)
            {
                if($header =~ /^%/x) #Regular expression without "/x"
                {
                    $filtered_value=$header;
                    $filtered_value =~ s/%//xg; #Regular expression without "/x"
                    if(defined $groups{$filtered_value})
                    {
                    @group_users= split(/\s*,\s*/x,$groups{$filtered_value}); #Regular expression without "/x"
                    }
                    if(!$groups{$filtered_value} && !grep({ /^$filtered_value$/x } @processed_groups))  #Regular expression without "/x"#prohibit mixed boolean operators #require block grep
                    {
                        push(@processed_groups,$filtered_value);
                        my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]); #Sub called with "&"
                        $filtered_value1=$filtered_value;
                        $filtered_value1 =~ s/,/ /xg; #Regular expression without "/x"
                        IssueWarning($header, $line_number, $header,"A non-existent group(s) used in the file",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
                        next;
                    }
                }
                #####Changes for the defect 137050
                
                elsif(($alias_hash{$header} || ( (defined $header1) && ($alias_hash1{$header1}))) && $header =~ /^\s*[A-Z]+[A-Z0-9_]+\s*$/x )#Regular expression without "/x"
                {   
                    if(defined $alias_hash{$header})
                    {
                   @alias_users = split(/\s*,\s*/x,$alias_hash{$header}); #Regular expression without "/x"
                    }
                   foreach my $user(@alias_users)
                   {
                        $user =~ s/^%//xg;#Regular expression without "/x"
                        if(!($users{$user}))
                        {
                            $usr_string="user is used";
                            if($header =~ /^\s*[A-Z]+[A-Z0-9_]+\s*$/x){$usr_string="user alias is used";}#Regular expression without "/x"
                            my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]); #Sub called with "&"
                            IssueWarning($header, $line_number, $header,"A non-existent $usr_string in the file",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
                            next;
                        }
                    }
                    my $group_found=0;
                    if(defined $alias_hash1{$header})
                    {
                    @alias_groups = split(/\s*,\s*/x,$alias_hash1{$header}); #Regular expression without "/x"
                    }
                    foreach my $grp_name (@alias_groups)
                    {
                        $group_found=0;
                        if($grp_name=~/^%/x) #Regular expression without "/x"
                        {
                            $grp_name =~ s/%//x; #Regular expression without "/x"
                            if(grep{/^$grp_name$/x} keys %groups ) #Regular expression without "/x"
                            {
                                $group_found=1;
                            }
                            
                            if($group_found==0)
                            {
                                 my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]); #Sub called with "&"
                                 IssueWarning($header, $line_number, $header,"A non-existent group(s) used in the file",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
                            }   
                        }
                                                        
                    }

                }    
                elsif($users{$header})
                {
                    push(@group_users,$header);
                }
                else #Cascading if-elsif chain
                {
                    if(!$users{$header} && !grep({ /^$header$/x } @processed_users) && $getOS =~ /AIX/)  #Regular expression without "/x"  ##prohibit mixed boolean operators  #require block grep 
                    {
                    push(@processed_users,$header);
                    $usr_string="user is used";
                    if($header =~ /^\s*[A-Z]+[A-Z0-9_]+\s*$/x){$usr_string="user alias is used";} #Regular expression without "/x"
                    my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]); #Sub called with "&"
                    IssueWarning($header, $line_number, $header,"A non-existent $usr_string in the file",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
                    next;
                }
                }
                foreach(@group_users)
                {
                    $filtered_value=$_;
                    chomp($filtered_value);
                    $filtered_value =~ s/(\s+$)|(^\s+)//xg; #Regular expression without "/x"
                    if(grep({ /^$filtered_value$/x } @processed_users))  #Regular expression without "/x"#require block grep
                    {
                        next;
                    }
                    $user_home  = $USER_DIR{$filtered_value};
                    $user_home =~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"
                    if ($user_home ne "")
                    {
                        push(@processed_users,$filtered_value);
                        if(-f "$user_home/.profile")
                        {
                            $check_profile_val  = `cat $user_home/.profile 2>/dev/null | grep 'export SMIT_SHELL=n'`;
                            $check_profile_val1 = `cat $user_home/.profile 2>/dev/null | grep 'readonly SMIT_SHELL'`;
                            $file_type="$user_home/.profile";
                        }
                        elsif(-f "$user_home/.bash_profile")
                        {
                            $check_profile_val  = `cat $user_home/.bash_profile  2>/dev/null | grep 'export SMIT_SHELL=n'`;
                            $check_profile_val1 = `cat $user_home/.bash_profile  2>/dev/null | grep 'readonly SMIT_SHELL'`;
                            $file_type="$user_home/.bash_profile";
                        }
                        else
                        {
                            my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]); #Sub called with "&"
                            IssueWarning($header, $line_number, $header,"$user_home/.profile and $user_home/.bash_profile file not found",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
                            next;
                        }
                        chomp($check_profile_val);
                        chomp($check_profile_val1);
                        $check_profile_val =~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"
                        $check_profile_val1 =~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"
                        if($check_profile_val =~ /export SMIT_SHELL=n(.*)/x) #Regular expression without "/x"
                        {
                            if($1 ne "")
                            {
                                $check_profile_val="";
                            }
                        }
                        if($check_profile_val1 =~ /readonly SMIT_SHELL(.*)/x) #Regular expression without "/x"
                        {
                            if($1 ne "")
                            {
                                $check_profile_val1="";
                            }
                        }
                        if (!$check_profile_val || !$check_profile_val1) #prohibit mixed boolean operators 
                        {
                            my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]); #Sub called with "&"
                            IssueWarning($header, $line_number, $header,"Command /smit* used but required settings in $file_type file are absent",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
                            next;
                        }
                        elsif($check_profile_val and $check_profile_val1)
                        {
                            my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]); #Sub called with "&"
                            IssueWarning($header, $line_number, $header,"Use of SMIT_SHELL in the users environment is deprecated. Replace with global std env_file approach",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
                            next;
                        }
                    }
                    elsif(!$users{$filtered_value} && !grep({ /^$filtered_value$/x } @processed_users)) #Regular expression without "/x" #prohibit mixed boolean operators #require block grep
                    {
                        push(@processed_users,$filtered_value);
                        $usr_string="user is used";
                        if($header =~ /^\s*[A-Z]+[A-Z0-9_]+\s*$/x){$usr_string="user alias is used";}#Regular expression without "/x"
                        my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]); #Sub called with "&"
                        IssueWarning($header, $line_number, $header,"A non-existent $usr_string in the file",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
                        next;
                        
                        #in extended mode, just report that a non-existent group is used in the file once, as a warning level message. 
                        #in extended mode, just report that a non-existent user is used in the file once, as a warning level message.  
                        #get user and group details from hashes
                    }
                }
            }
        }
    }
    return;##require final return
}

sub check_user_profile_insensitive
{
    my ($array_ref_copy) = @_;    ##Reused variable name in lexical scope#require argument unpacking           #Get reference of sudoers array and continue using it
    if ($DEBUG)
    {
        print "\nin check_user_profile\n";
    }
    my $line;
    my @sudoers_matches;
    my $header="";
    my $rest;
    my $header1;
    my $rest1;
    my @splitted_line;
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    my @sudoers_matches_temp;
    my $output_val;
    my $user_home;
    my $check_profile_val;
    my $check_profile_val1;
    my $filtered_value;
    my $filtered_value1;
    my @group_users=();
    my @processed_users=();
    my @processed_groups=();
    my %alias_hash=();
    my %alias_hash1=();
    my @alias_users=(); 
    my @alias_groups=();
    my $global_setting=check_global_settings(\@sudoers_file_copy); #Sub called with "&"
    my $file_type="";
    my $line_count=1;
    my @lineidToLine = ();
    my $usr_string;             #strict_use
    my @group_has_memb =();
    if($global_setting==1)
    {
        if($DEBUG)
        {
            print "\n***************************************************************";
            print "\nGlobal settings of sudo environment control file are present";
            print "\n***************************************************************\n";
        }
        return;
    }
    #####Changes for the defect 137050
    my @User_Alias_smitty = grep({ /^\s*User_Alias\s+.*/x } @User_Alias); #require block grep #Regular expression without "/x"
    foreach my $line1(grep({ /^\s*User_Alias\s+.*/x } @sudoers_file_without_useralias_expansion)) #Regular expression without "/x"
    {
        if ($line1 =~ /%/x)#Regular expression without "/x"
        {
            ($header1,$rest1)=split(/=/x,$line1); #Regular expression without "/x"
            $header1 =~ s/^\s*User_Alias\s*//xg; #Regular expression without "/x"
            $header1 =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
            my @group_elements_arr = split(/,/x,$rest1); #Regular expression without "/x"
            foreach my $grp_name (@group_elements_arr)
            {
                if($grp_name=~ /^%/x && (!exists $groups{$grp_name})) #Regular expression without "/x"
                {
                    $alias_hash1{$header1} = $rest1;
                }
            }
        }
            
    }
    
    foreach my $line(grep({ /^\s*User_Alias\s+.*/x } @sudoers_file_copy))#require block grep#Regular expression without "/x"
    {
            my $expanded_line=expand_useralias_groups_insensitive($line,0); #Sub called with "&"
            ($header,$rest)=split(/=/x,$expanded_line); #Regular expression without "/x"
            if(defined $header)
            {
            $header =~ s/^\s*User_Alias\s*//xg; #Regular expression without "/x"
            $header =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
            $alias_hash{$header} = $rest;
    }
    }
    @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_copy);  #Regular expression without "/x"#require block grep
    ##########################
    @sudoers_matches_temp = ();
    foreach my $original_line (@sudoers_matches)
    {
        $lineidToLine[$line_count]=$original_line;
        $line = $original_line;
        $line =~ s/(![^,]*)|.*=//xg;#Regular expression without "/x"
        $line =~ s/,+/,/xg;#Regular expression without "/x"
        $line =~ s/^\s*,|,\s*$|^\s*//xg;#Regular expression without "/x"
        foreach (split(/,/x, $line)) #Regular expression without "/x"
        {
            push(@sudoers_matches_temp, $_ . "|" . $line_count);
        }
        $line_count+=1;
    }
    
    @sudoers_matches = @sudoers_matches_temp;
    ##########################
    foreach my $line (@sudoers_matches)
    {
        @splitted_line = split(/\|/x, $line); #Regular expression without "/x"
        $splitted_line[0] =~ s/(\s+$)|(^\s+)//xg; #Regular expression without "/x"
        @group_users=();
        if ($splitted_line[0] =~ /^(([\S]+\/(smit|smitty)\s+)|([\S]+\/(smit|smitty)$))/x)#Regular expression without "/x" #ProhibitComplexRegexes
        {
            if ($getOS !~ /AIX/x and $splitted_line[0] !~ /^(?:[\S]+\/smit)/x) #ProhibitUnusedCapture#Regular expression without "/x"
            {
                next;
            }
            ($header, $rest) = split(/=/x, $lineidToLine[$splitted_line[1]], 2); #pankaj #Regular expression without "/x"
            $header =~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"
            my @header_elements = split(/,/x, $header); #Regular expression without "/x"
            foreach my $header(@header_elements)
            {
                my @insensitve_users = grep({/^$header$/ix} keys %users); #Regular expression without "/x"
                my $insensitve_users_count = scalar @insensitve_users;
                if($header =~ /^%/x)#Regular expression without "/x"
                {    
                    $filtered_value=$header;
                    $filtered_value =~ s/%//xg; #Regular expression without "/x"
                    #@group_users= split(/\s*,\s*/,$groups{$filtered_value});
                    if ( $case_insensitive_group == 1 ) #insensitivity
                    {
                        my @insensitve_groups = grep({/^$filtered_value$/xi} keys %groups); #Regular expression without "/x"
                        foreach my $grp (@insensitve_groups)
                        {
                            if(exists $groups{$grp})
                            {
                                my @group_members= split(/\s*,\s*/x,$groups{$grp}); #Regular expression without "/x"
                                if ($case_insensitive_user == 1 )
                                {
                                    foreach my $user(@group_members)
                                    {
                                        my @insensitve_users_copy = grep({/^$user$/xi} keys %users);  #Regular expression without "/x"#Reused variable name in lexical scope
                                        push @group_users,@insensitve_users_copy;
                                    }
                                    push @group_users,@group_members;
                                    
                                }
                                else
                                {
                                
                                    push @group_users,@group_members;
                                    
                                }
                                push @group_has_memb,@group_users;
                            }                        
                        }
                        #my $group_has_members= scalar @group_users;
                        my $group_has_members= scalar @group_has_memb;
                        if( $group_has_members == 0 && !grep({ /^$filtered_value$/xi } @processed_groups))  #Regular expression without "/x"#prohibit mixed boolean operators #require block grep
                        { 
                            push(@processed_groups,$filtered_value);
                            my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]); #Sub called with "&"
                            $filtered_value1=$filtered_value;
                            $filtered_value1 =~ s/,/ /xg; #Regular expression without "/x"
                            IssueWarning($header, $line_number, $header,"A non-existent group(s) used in the file",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
                            next;
                        }
                    }
                    else 
                    {
                        my @group_users1= split(/\s*,\s*/x,$groups{$filtered_value}); #Regular expression without "/x"
                        if ($case_insensitive_user == 1 )
                        {
                            foreach my $user(@group_users1)
                            {
                                my @insensitve_users_copy = grep({/^$user$/xi} keys %users);  #Regular expression without "/x"#Reused variable name in lexical scope
                                push @group_users,@insensitve_users_copy;
                            }
                            push @group_users,@group_users1;
                            
                        }
                        else
                        {
                            push @group_users,@group_users1;
                
                        }
                        if(!$groups{$filtered_value} && !grep({ /^$filtered_value$/x } @processed_groups)) #Regular expression without "/x" #prohibit mixed boolean operators #require block grep
                        {
                            push(@processed_groups,$filtered_value);
                            my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]); #Sub called with "&"
                            $filtered_value1=$filtered_value;
                            $filtered_value1 =~ s/,/ /xg; #Regular expression without "/x"
                            IssueWarning($header, $line_number, $header,"A non-existent group(s) used in the file",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
                            next;
                        }
                    }
                }
                #####Changes for the defect 137050
                elsif(($alias_hash{$header} || ((defined $header1) && ($alias_hash1{$header1}))) && $header =~ /^\s*[A-Z]+[A-Z0-9_]+\s*$/x ) #Regular expression without "/x"
                {
                   if(defined $alias_hash{$header})
                   {
                   @alias_users = split(/\s*,\s*/x,$alias_hash{$header}); #Regular expression without "/x"
                   }
                   if ( $case_insensitive_user == 1 ) #insensitivity
                   {
                       foreach my $user(@alias_users)
                       {
                            if ( !grep({/^$user$/ix} keys %users ))  #Regular expression without "/x"
                            {                   
                                my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]); #Sub called with "&"
                                if($header =~ /^\s*[A-Z]+[A-Z0-9_]+\s*$/x)#Regular expression without "/x"
                                {
                                    $usr_string="user alias is used";
                                    IssueWarning($header, $line_number, $header,"A non-existent $usr_string in the file",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
                                    next;
                                }
                                else 
                                {
                                    $usr_string="user is used";
                                    IssueWarning($header, $line_number, $header,"A non-existent $usr_string in the file",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
                                    next;
                                }              
                            }
                        }
                         if ( $case_insensitive_group == 1 )
                         {
                            my $group_found=0;
                            if(defined $alias_hash1{$header})
                            {
                            @alias_groups = split(/\s*,\s*/x,$alias_hash1{$header}); #Regular expression without "/x"
                            }
                            foreach my $grp_name (@alias_groups)
                            {
                                if($grp_name=~/^%/x)#Regular expression without "/x"
                                {
                                    $grp_name =~ s/%//x; #Regular expression without "/x"
                                    if(grep{/^$grp_name$/xi} keys %groups ) #Regular expression without "/x"
                                    {
                                        $group_found=1;
                                    }
                                    if($group_found==0)
                                    {
                                         my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]); #Sub called with "&"
                                         IssueWarning($header, $line_number, $header,"A non-existent group(s) used in the file",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
                                    }
                                
                                }   
                            }
                         }
                        else
                        {
                            my $group_found=0;
                            @alias_groups = split(/\s*,\s*/x,$alias_hash1{$header}); #Regular expression without "/x"
                            foreach my $grp_name (@alias_groups)
                            {
                                $group_found=0;
                                if($grp_name=~/^%/x)#Regular expression without "/x"
                                {
                                    $grp_name =~ s/%//x; #Regular expression without "/x"
                                    if(grep{/^$grp_name$/x} keys %groups ) #Regular expression without "/x"
                                    {
                                        $group_found=1;
                                    }
                                    
                                    if($group_found==0)
                                    { 
                                         my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]); #Sub called with "&"
                                         IssueWarning($header, $line_number, $header,"A non-existent group(s) used in the file",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
                                    }   
                                }
                                                                
                            }
                        
                        
                        
                        }
                   }
                   else   #for case_insensitive_user=0
                   {
                       foreach my $user(@alias_users)
                       {
                            if(!($users{$user}))
                            {                   
                                my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]); #Sub called with "&"
                                if($header =~ /^\s*[A-Z]+[A-Z0-9_]+\s*$/x)#Regular expression without "/x"
                                {
                                    $usr_string="user alias is used";
                                    IssueWarning($header, $line_number, $header,"A non-existent $usr_string in the file",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
                                    next;
                                }
                                else 
                                {
                                    $usr_string="user is used";
                                    IssueWarning($header, $line_number, $header,"A non-existent $usr_string in the file",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
                                    next;
                                }              
                            }
                        }
                        
                        if ( $case_insensitive_group == 1 )
                        {
                            my $group_found=0;
                            @alias_groups = split(/\s*,\s*/x,$alias_hash1{$header}); #Regular expression without "/x"
                            foreach my $grp_name (@alias_groups)
                            {
                                if($grp_name=~/^%/x)#Regular expression without "/x"
                                {
                                    $grp_name =~ s/%//x; #Regular expression without "/x"
                                    if(grep{/^$grp_name$/ix} keys %groups ) #Regular expression without "/x"
                                    {
                                        $group_found=1;
                                    }
                                    if($group_found==0)
                                    {
                                         my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]); #Sub called with "&"
                                         IssueWarning($header, $line_number, $header,"A non-existent group(s) used in the file",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
                                    }
                                
                                }   
                            }
                        }
                        else
                        {
                            my $group_found=0;
                            @alias_groups = split(/\s*,\s*/x,$alias_hash1{$header}); #Regular expression without "/x"
                            foreach my $grp_name (@alias_groups)
                            {
                                $group_found=0;
                                if($grp_name=~/^%/x) #Regular expression without "/x"
                                {
                                    $grp_name =~ s/%//x; #Regular expression without "/x"
                                    if(grep{/^$grp_name$/x} keys %groups ) #Regular expression without "/x"
                                    {
                                        $group_found=1;
                                    }
                                    
                                    if($group_found==0)
                                    { 
                                         my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]); #Sub called with "&"
                                         IssueWarning($header, $line_number, $header,"A non-existent group(s) used in the file",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
                                    }   
                                }                               
                            }
                        
                        }
                    }
                }    
                elsif($users{$header})
                {
                    push(@group_users,$header);                  
                    
                }
                else #Cascading if-elsif chain
                {
                    if(!$users{$header} && $case_insensitive_user == 1 && $insensitve_users_count >= 1 )
                    {
                    if (@insensitve_users)
                    {   
                        foreach my $usr (@insensitve_users)
                        {
                            push(@group_users,$usr);
                        }                    
                    }
                }
                elsif(!$users{$header} && !grep({ /^$header$/x } @processed_users) && $getOS =~ /AIX/ && $case_insensitive_user == 0)  #Regular expression without "/x"  ##prohibit mixed boolean operators  #require block grep 
                {
                    push(@processed_users,$header);
                    $usr_string="user is used";
                    if($header =~ /^\s*[A-Z]+[A-Z0-9_]+\s*$/x){$usr_string="user alias is used";}#Regular expression without "/x"
                    my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]); #Sub called with "&"
                    IssueWarning($header, $line_number, $header,"A non-existent $usr_string in the file",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
                    next;
                }
                elsif($insensitve_users_count == 0 && !grep({ /^$header$/ix } @processed_users) && $getOS =~ /AIX/ && $case_insensitive_user == 1)   #Regular expression without "/x"##prohibit mixed boolean operators  #require block grep 
                {
                    push(@processed_users,$header);
                     $usr_string="user is used";
                    if($header =~ /^\s*[A-Z]+[A-Z0-9_]+\s*$/x){$usr_string="user alias is used";} #Regular expression without "/x"
                    my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]); #Sub called with "&"
                    IssueWarning($header, $line_number, $header,"A non-existent $usr_string in the file",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
                    next;
                }
                }
                foreach(@group_users)
                {
                    $filtered_value=$_;
                    chomp($filtered_value);
                    $filtered_value =~ s/(\s+$)|(^\s+)//xg; #Regular expression without "/x"
                    my @insensitve_users_filtered_value = grep({/^$filtered_value$/xi} keys %users); #Regular expression without "/x"
                    my $insensitve_users_filtered_value_count = scalar @insensitve_users_filtered_value;
                    if ( $case_insensitive_user == 1 )
                    {
                        if(grep({ /^$filtered_value$/xi } @processed_users)) #require block grep #Regular expression without "/x"
                        {
                            next;
                        }
                    }
                    else 
                    {
                        if(grep({ /^$filtered_value$/x } @processed_users)) #require block grep #Regular expression without "/x"
                        {
                            next;
                        }
                    }
                    $user_home  = $USER_DIR{$filtered_value};
                    if(defined $user_home)
                    {
                        $user_home =~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"
                    }
                    if ((defined $user_home) && ($user_home ne "" ))
                    {
                        push(@processed_users,$filtered_value);
                        if(-f "$user_home/.profile")
                        {
                            $check_profile_val  = `cat $user_home/.profile 2>/dev/null | grep 'export SMIT_SHELL=n'`;
                            $check_profile_val1 = `cat $user_home/.profile 2>/dev/null | grep 'readonly SMIT_SHELL'`;
                            $file_type="$user_home/.profile";
                        }
                        elsif(-f "$user_home/.bash_profile")
                        {
                            $check_profile_val  = `cat $user_home/.bash_profile  2>/dev/null | grep 'export SMIT_SHELL=n'`;
                            $check_profile_val1 = `cat $user_home/.bash_profile  2>/dev/null | grep 'readonly SMIT_SHELL'`;
                            $file_type="$user_home/.bash_profile";
                        }
                        else
                        {
                            my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]); #Sub called with "&"
                            IssueWarning($header, $line_number, $header,"$user_home/.profile and $user_home/.bash_profile file not found",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
                            next;
                        }
                        chomp($check_profile_val);
                        chomp($check_profile_val1);
                        $check_profile_val =~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"
                        $check_profile_val1 =~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"
                        if($check_profile_val =~ /export\sSMIT_SHELL=n(.*)/x)#Regular expression without "/x"
                        {
                            if($1 ne "")
                            {
                                $check_profile_val="";
                            }
                        }
                        if($check_profile_val1 =~ /readonly\sSMIT_SHELL(.*)/x)#Regular expression without "/x"
                        {
                            if($1 ne "")
                            {
                                $check_profile_val1="";
                            }
                        }
                        if (!$check_profile_val || !$check_profile_val1) #prohibit mixed boolean operators 
                        {
                            my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]); #Sub called with "&"
                            IssueWarning($header, $line_number, $header,"Command /smit* used but required settings in $file_type file are absent",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
                            next;
                        }
                        elsif($check_profile_val and $check_profile_val1)
                        {
                            my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]); #Sub called with "&"
                            IssueWarning($header, $line_number, $header,"Use of SMIT_SHELL in the users environment is deprecated. Replace with global std env_file approach",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
                            next;
                        }
                    }
                    elsif(!$users{$filtered_value} && !grep({ /^$filtered_value$/x } @processed_users) && $case_insensitive_user == 0)  #Regular expression without "/x"#prohibit mixed boolean operators #require block grep
                    {
                        push(@processed_users,$filtered_value);
                        $usr_string="user is used";
                        if($header =~ /^\s*[A-Z]+[A-Z0-9_]+\s*$/x){$usr_string="user alias is used";}#Regular expression without "/x"
                        my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]); #Sub called with "&"
                        IssueWarning($header, $line_number, $header,"A non-existent $usr_string in the file",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
                        next;
                        
                        #in extended mode, just report that a non-existent group is used in the file once, as a warning level message. 
                        #in extended mode, just report that a non-existent user is used in the file once, as a warning level message.  
                        #get user and group details from hashes
                    }
                    elsif($insensitve_users_filtered_value_count == 0 && !grep({ /^$filtered_value$/xi } @processed_users) && $case_insensitive_user == 1) #Regular expression without "/x" #prohibit mixed boolean operators #require block grep
                    {
                        push(@processed_users,$filtered_value);
                        $usr_string="user is used";
                        if($header =~ /^\s*[A-Z]+[A-Z0-9_]+\s*$/x){$usr_string="user alias is used";} #Regular expression without "/x"
                        my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]); #Sub called with "&"
                        IssueWarning($header, $line_number, $header,"A non-existent $usr_string in the file",$master_text, $filename, 'SFIT15983'); #Sub called with "&"
                        next;
                        
                        #in extended mode, just report that a non-existent group is used in the file once, as a warning level message. 
                        #in extended mode, just report that a non-existent user is used in the file once, as a warning level message.  
                        #get user and group details from hashes
                    }
                }
            }
        }
    }
    return;##require final return
}

##############################
#If  sudo entries include   the commands "smitty"  via /smitty or "SMIT" via /smit,
#This entry must be present in the input being checked
#Defaults:ALL env_keep = SMIT_SHELL
##############################
sub check_env_keep
{
    my ($array_ref_copy) = @_;    #require argument unpacking #Reused variable name in lexical scope           #Get reference of sudoers array and continue using it
    if ($DEBUG)
    {
        print "\nin check_env_keep\n";
    }
    my $line;
    my @sudoers_matches;
    my $header;
    my $rest;
    my @splitted_line;
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    my @sudoers_matches_temp;
    my %display_status=();
    my $line_count=1;
    my @lineidToLine = ();
    @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias/x } @sudoers_file_copy);  #Regular expression without "/x"#require block grep
    ##########################
    @sudoers_matches_temp = ();
    foreach my $original_line (@sudoers_matches)
    {
        $lineidToLine[$line_count]=$original_line;
        $line = $original_line;
        $line =~ s/(![^,]*)|.*=//xg;#Regular expression without "/x"
        $line =~ s/,+/,/xg;#Regular expression without "/x"
        $line =~ s/^\s*,|,\s*$|^\s*//xg;#Regular expression without "/x"
        foreach (split(/,/x, $line)) #Regular expression without "/x"
        {
            push(@sudoers_matches_temp, $_ . "|" . $line_count);
        }
        $line_count+=1;
    }
    @sudoers_matches = @sudoers_matches_temp;
    if(grep({ /^\s*Defaults\s+env_file\s*=\s*\/etc\/sudo\.env$/x } @sudoers_file_copy) and $EXTENDED_CHECK_USER == 0) #require block grep #Regular expression without "/x"
    {
        return 0;
    }
    elsif(grep({ /^\s*Defaults\s+env_file\s*=\s*\/etc\/sudo\.env$/x } @sudoers_file_copy) and $EXTENDED_CHECK_USER == 1 and -f "/etc/sudo.env")  #require block grep #Regular expression without "/x"
    {
        my $sudoers_env_handle; 
        $sudoers_env_handle =  IO::File->new('/etc/sudo.env', "<") or print("/etc/sudo.env can't read");#prohibit indirect syntax
        my @sudoers_env_arr;
        while(<$sudoers_env_handle>)
        {
            $line=$_;
            $line =~ s/\n//xg; #Regular expression without "/x"
            push(@sudoers_env_arr,$line);
        }
        $sudoers_env_handle->close();
        if (grep({ /^\s*SMIT_SHELL\s*=\s*n$/x } @sudoers_env_arr) and grep({ /^\s*SMIT_SEMI_COLON\s*=\s*n$/x } @sudoers_env_arr) and grep({ /^\s*SMIT_QUOTE\s*=\s*n$/x } @sudoers_env_arr))  #Regular expression without "/x" #require block grep
        {
            return 0;
        }
    }
    if(grep({ /Defaults[\s:ALL]*.*env_keep\s*\+*=.*SMIT_SHELL(\s+|,|$)/x } @sudoers_file_copy))  #Regular expression without "/x" #require block grep
    {
        return;
    }

    foreach my $line (@sudoers_matches)
    {
        @splitted_line = split(/\|/x, $line); #Regular expression without "/x"
        $splitted_line[0] =~ s/(\s+$)|(^\s+)//xg; #Regular expression without "/x"
        if ($splitted_line[0] =~ /^(([\S]+\/(smit|smitty)\s+)|([\S]+\/(smit|smitty)$))/x) #Regular expression without "/x" #ProhibitComplexRegexes
        {
            ($header, $rest) = split(/=/x, $lineidToLine[$splitted_line[1]], 2); #pankaj #Regular expression without "/x"
            my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]); #Sub called with "&"
            if(!$display_status{"$filename"} || $display_status{"$filename"} ne "1") #prohibit mixed boolean operators
            {
                IssueViolation($header, $line_number, $splitted_line[0], "Ensure Defaults env_file=/etc/sudo.env is set in sudo base file",$master_text, $filename, 'SFIT10934'); #Sub called with "&"
                $display_status{"$filename"}="1";
            }
        }
    }
    return;##require final return
}
#########################
#sudoedit is a pre-defined command alias in sudo, so it is always a valid Cmnd_Alias and does not require a full path in front of it like =/usr/sudoedit.
#=/bin/su, sudoedit /file
#is valid, because sudoedit is pre-defined internally to have the right path.
#########################
sub check_sudoedit
{   
    my ($array_ref_copy) = @_;  #Reused variable name in lexical scope #require argument unpacking  #Get reference of sudoers array and continue using it
    if ($DEBUG)
    {
        print "\nin check_sudoedit\n";
    }
    my $line;
    my @sudoers_matches;
    my $header;
    my $rest;
    my @splitted_line;
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    my @sudoers_matches_temp;
    my $line_count=1;
    my @lineidToLine = ();
    @sudoers_file_copy = grep ({ defined() and length() } @sudoers_file_copy);
    @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_copy); #Regular expression without "/x" #require block grep
    ##########################
    @sudoers_matches_temp = ();
    foreach my $original_line (@sudoers_matches)
    {
        $lineidToLine[$line_count]=$original_line;
        $line = $original_line;
        $line =~ s/(![^,]*)|.*=//xg; #Regular expression without "/x"
        $line =~ s/,+/,/xg; #Regular expression without "/x"
        $line =~ s/^\s*,|,\s*$|^\s*//xg; #Regular expression without "/x"
        foreach (split(/,/x, $line)) #Regular expression without "/x"
        {
            push(@sudoers_matches_temp, $_ . "|" . $line_count);
        }
        $line_count+=1;
    }
    @sudoers_matches = @sudoers_matches_temp;
    ##########################
    foreach my $line (@sudoers_matches)
    {
        @splitted_line = split(/\|/x, $line); #Regular expression without "/x"
        $splitted_line[0] =~ s/(\s+$)|(^\s+)//xg; #Regular expression without "/x"
        if ($splitted_line[0] =~ /^[\w\/]+sudoedit(\s|$)/x) #Regular expression without "/x"
        {
            ($header, $rest) = split(/=/x, $lineidToLine[$splitted_line[1]], 2); #pankaj #Regular expression without "/x"
            my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]); #Sub called with "&"
            IssueViolation($header, $line_number, $splitted_line[0],
                            "Sudo keyword sudoedit should not be used with a /path/sudoedit specified. Path should not be specified to keyword",
                            $master_text, $filename, 'SFIT17033'); #Sub called with "&"
        }
    }
    return;##require final return
}

# ------------------------------------------------------------------------------ #
# add CSV column header line to permanent CSV File.                              #
# sort the temp CSV file into the permanent CSV file removing duplicate messages #
# recalc msgs counts to account for duplicate removals                           #
# ------------------------------------------------------------------------------ #
#bq echo "HOST,RUNDATE,MESSAGE SEVERITY,ENTRY,LINE NUMBER,VALUE,DESCRIPTION,FILE TYPE,FILE,SOURCE" > "$CSV" bq; #backquote
my $CSVfh_header =  IO::File->new("$CSV", ">") or die "Could not open file '$CSV' $!"; ##prohibit indirect syntax
print $CSVfh_header "HOST,RUNDATE,MESSAGE SEVERITY,ENTRY,LINE NUMBER,VALUE,DESCRIPTION,FILE TYPE,FILE,SOURCE\n";
$CSVfh_header->close();

#### Changes for the Enhancement 67468

if(-f $CSVTMP)
{   
    my $CSVfh = IO::File->new("$CSV", ">>") or die "Could not open file '$CSV' $!";#prohibit indirect syntax
    my $CSVTMPfh = IO::File->new("$CSVTMP", "<") or die "Could not open file '$CSVTMP' $!"; #prohibit indirect syntax
    while (my $line = <$CSVTMPfh>) 
    {
      chomp $line;
      print $CSVfh "$line\n";
    }
    $CSVTMPfh->close(); 
    $CSVfh->close();
    
}
#$ERRORS  = trim(bq cat "$CSV" | grep ",ERROR," | wc -l bq); #backquote #Sub called with "&"
#$WARN    = trim(bq cat "$CSV" | grep ",WARNING," | wc -l bq); #backquote #Sub called with "&"
#$NUMPASS = trim(bq cat "$CSV" | grep ",PASS," | wc -l bq); #backquote #Sub called with "&"
###########
my $CSVfh_lines = IO::File->new("$CSV", "<") or die "Could not open file '$CSV' $!";#prohibit indirect syntax
my @CSVfh_lines_arr=();
while (my $line = <$CSVfh_lines>)
{    
    push(@CSVfh_lines_arr,$line);
}
$CSVfh_lines->close();
$ERRORS = scalar (grep ({ /,ERROR,/x } @CSVfh_lines_arr)); #require block grep #Regular expression without "/x"
$WARN = scalar (grep ({ /,WARNING,/x } @CSVfh_lines_arr)); #require block grep #Regular expression without "/x"
$NUMPASS = scalar (grep ({ /,PASS,/x } @CSVfh_lines_arr)); #require block grep #Regular expression without "/x"
###########
$RC      = $ERRORS;
CloseOutCSV(); #Sub called with "&"

####Changes for the enhancement SFIT147509 
###Changes for Defect 156750
suppress_false_warnings(); #Sub called with "&"

print $ERR "Number of Total Errors = $RC\n\n";

# ------------------ #
# Close up all Files #
# ------------------ #
$ERR->close();

if (!$no_log)
{
    update(); #Sub called with "&"
    prtlog("$pn Ended, RC=$RC");     #Sub called with "&"
    $log_file_handle->close();
}

my $erfh =  IO::File->new("$errfile", "<") or die "Could not open file '$errfile' $!"; #prohibit indirect syntax
while (my $line = <$erfh>) 
{
  chomp $line;
  print "$line\n";
}
$erfh->close();

if (!$no_log)
{

    my $rptfh = IO::File->new("$final_rptfile", ">>") or die "Could not open file '$final_rptfile' $!"; #prohibit indirect syntax
    my $erfh_copy =  IO::File->new("$errfile", "<") or die "Could not open file '$errfile' $!"; #prohibit indirect syntax #Reused variable name in lexical scope
    while (my $line = <$erfh_copy>) 
    {
      chomp $line;
      print $rptfh "$line\n";
    }
    $erfh_copy->close();    
    $rptfh->close();
}

# Clean up temp files
unlink $errfile;
unlink $rptfile;

Delete_Temp_Files(); #Sub called with "&"

print "\nCSV OUTPUT FILE FILTERED : $CSV\n\n";

print "\nCSV OUTPUT FILE = $CSV_SAVE\n\n";

###changes for Enhancement 5813
wcp_id(); #Sub called with "&"

if (!grep({ /^SFIT140660/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x" 
{   
   #####Changes for the defect 147728
   if( ((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER == 1)) or $ORIG_SUDOER eq "/etc/sudoers")
   {
      clean_var_log_sfitout_directory(); #Sub called with "&"
   }
}

$finalexit = $exitErr + $exitWarn + $exitCust + $exitAttn + $exitNote;
exit $finalexit;

#####Enhancement 147509 - Add filter functionality to suppress false warnings
sub suppress_false_warnings
{
   my $dir = $OUTDIR;
   my @filter_file_data;
   my $command; 
   my $filter_files_count;
   my (@data,@output) = ();
   my $IN;                      #strict_use  
   my $filename = $CSV;   
   chomp($filename);
   my @csv_violation_lines=();
   
   my $CSV_handle = IO::File->new("$filename", "<"); #prohibit indirect syntax
   my @csv = <$CSV_handle>;
   
   foreach my $csvline (@csv)
   {
        #creating csv_violation_lines array to capture only violation lines(without metadata or header)
        #HOST,RUNDATE,MESSAGE SEVERITY,ENTRY,LINE NUMBER,VALUE,DESCRIPTION,FILE TYPE,FILE,SOURCE
        if ($csvline =~ /^\S+\,\d{14}(\,.*){2}\,(\d+|\s*)(\,.*){4}\,SFIT[\d]+\s*$/x) #Regular expression without "/x" #ProhibitComplexRegexes
        {
            push(@csv_violation_lines,$csvline);
        }
        
    }
   $filter_files_count = @filter_files;
   if($DEBUG)
   {
       print "dir = $dir\n";
       print "filename = $CSV\n";   
       print "filter_files_count = $filter_files_count\n";
       print "\@filter_file array: ", (join ", ", @filter_files), "\n"; 
       print "\$filter_output_file = $filter_output_file\n";
   }  
    my $FILTER =  IO::File->new("$filter_output_file", ">"); #prohibit indirect syntax
   
   foreach my $file(@filter_files)
   { 
    $IN =  IO::File->new("$file", "<"); #prohibit indirect syntax
      
      while ( my $line = <$IN> ) 
      {
         if ($line !~ /^\s*$/x) #Regular expression without "/x"
         {
           $line  =~ s/\r//xg; #Regular expression without "/x"
            if($line !~ /^\s*\#.*/x)   #Regular expression without "/x"               #REMOVING LINES STARTING WITH '#'
            {
                push (@filter_file_data, $line); 
            }
         }
      }
      $IN->close();
   }

   $count_of_filter_rules = scalar @filter_file_data;
   if($DEBUG)
   {
        print "\@filter_file_data: ", (join ", ", @filter_file_data), "\n"; 
        print "\$count_of_filter_rules = $count_of_filter_rules\n";   
    }  
   foreach my $regex(@filter_file_data)
   {
      my $regex_backup = $regex;
      $regex =~ s/\s//xg; #Regular expression without "/x"
      $regex =~ s/'//xig; #Regular expression without "/x"
      $regex =~ s/\n//xig; #Regular expression without "/x"
      $regex =~ s/\|//xig; #Regular expression without "/x"
      $regex =~ s/\r//xg;                    #to handle ^M characters #Regular expression without "/x"
      if($DEBUG)
      { 
          print "Filter rule  $regex  applied.\n"; 
      }
      $regex =~ s/\#/\\#/xg;
      $regex =~ s/\s/\\s/xg;
      @output = grep({ /$regex/x } @csv_violation_lines); #require block grep #Regular expression without "/x"
      
      if (@output)
      {
          foreach my $line (@output)
          {
            if (!grep({ /^\Q$line\E$/x } @data)) #Regular expression without "/x"
            {
                push(@data,$line);
            }
          }
      }
    }
    
   my @warning_data_removed_before_filtering = grep({ /^.+\,[0-9]{14}\,WARNING\,.+\,SFIT\d+$/x } @csv_violation_lines);#require block grep #Regular expression without "/x"
   my @error_data_removed_before_filtering = grep({ /^.+\,[0-9]{14}\,ERROR\,.+\,SFIT\d+$/x } @csv_violation_lines); #require block grep #Regular expression without "/x"
   my @warning_data_removed_after_filtering = grep({ /^.+\,[0-9]{14}\,WARNING\,.+\,SFIT\d+$/x } @data); #require block grep #Regular expression without "/x"
   my @error_data_removed_after_filtering = grep({ /^.+\,[0-9]{14}\,ERROR\,.+\,SFIT\d+$/x } @data);#require block grep #Regular expression without "/x"
   
   # As per https://stackoverflow.com/questions/4891898/how-to-subtract-an-array-from-an-array
   # Subtracting before - after array instead of scalar subtraction to fix the remaining number of warnings and errors issue 558093 and 561063
    
   my %warn_after = map {$_ => 1} @warning_data_removed_after_filtering;
   my @diff_warn = grep ({not $warn_after{$_}} @warning_data_removed_before_filtering);
   
   my %err_after = map {$_ => 1} @error_data_removed_after_filtering;
   my @diff_error = grep ({not $err_after{$_}} @error_data_removed_before_filtering);
   
   $count_of_filter_removals = scalar @data;  
   #$count_of_warning_removals= $WARN - scalar @warning_data_removed_after_filtering; #267 - 269
   #$count_of_error_removals= $ERRORS - scalar @error_data_removed_after_filtering; 
   $count_of_warning_removals = scalar @diff_warn;
   $count_of_error_removals = scalar @diff_error; 
   my $csv_violation_lines_count = scalar @csv_violation_lines;
   if($DEBUG)
   { 
        print "\$count_of_filter_removals = $count_of_filter_removals\n";   
        print "\$warning_data_lines_count = $count_of_warning_removals\n";
        print "\$error_data_lines_count = $count_of_error_removals\n";
        #DEBUGS added below due to Defect 418986
        print "\n count of lines in csv array =",scalar @csv,"\n"; 
        print "\n count of violation lines in csv array is =",$csv_violation_lines_count,"\n";
        print "\n count of lines in  data array=",scalar @data,"\n"; 
        print "\n count of total warnings is = $WARN\n";
        print "\n count of total errors is = $ERRORS\n";
        print "\n count of warnings removed before filtering =",scalar @warning_data_removed_before_filtering,"\n"; 
        print "\n count of errors removed before filtering =",scalar @error_data_removed_before_filtering,"\n"; 
        print "\n count of warnings removed after filtering =",scalar @warning_data_removed_after_filtering,"\n";
        print "\n count of errors removed after filtering =",scalar @error_data_removed_after_filtering,"\n"; 
        print "\n csv array is = @csv"; 
        print "\n violation lines in csv array are = @csv_violation_lines\n"; 
        print "\n all data array = @data\n"; 
        print "\n warnings removed before filtering array =  @warning_data_removed_before_filtering\n"; 
        print "\n errors removed before filtering array =  @error_data_removed_before_filtering\n"; 
        print "\n warnings removed after filtering array = @warning_data_removed_after_filtering\n"; 
        print "\n errors removed after filtering array =  @error_data_removed_after_filtering\n";
        print "\n diff_error =@diff_error\n";
        print "\n diff_warn =@diff_warn\n";     
    }
   
   foreach my $line(@csv)
   {            
        # using \Q\E for exact matching check thus no need for below escaping statements. Defect 370730
        if(!grep({ /\Q$line\E/x } @data)) #require block grep #Regular expression without "/x" #unless block used 
        {
         #####changes for defect 176476
         $line =~ s/\#\#count_of_filter_rules\#\#/$count_of_filter_rules/x if ($line =~ /\#\#count_of_filter_rules\#\#/x); #Regular expression without "/x"
         $line =~ s/\#\#count_of_filter_removals\#\#/$count_of_filter_removals/x if ($line =~ /\#\#count_of_filter_removals\#\#/x); #Regular expression without "/x"
         $line =~ s/\#\#count_of_warning_removals\#\#/$count_of_warning_removals/x if ($line =~ /\#\#count_of_warning_removals\#\#/x); #Regular expression without "/x"
         $line =~ s/\#\#count_of_error_removals\#\#/$count_of_error_removals/x if ($line =~ /\#\#count_of_error_removals\#\#/x); #Regular expression without "/x"
         print $FILTER $line;
      }
   }    
   $CSV_handle->close();   
    
   # Defect 323238     
    my $FILE =  IO::File->new("$CSV", "<")|| die "File not found";  #prohibit indirect syntax
    my @lines = <$FILE>;
    $FILE->close();

    my @newlines;
    foreach(@lines) 
    {      
       $_ =~ s/\#\#count_of_filter_rules\#\#/$count_of_filter_rules/xg; #Regular expression without "/x"
       $_ =~ s/\#\#count_of_filter_removals\#\#/$count_of_filter_removals/xg; #Regular expression without "/x"
       $_ =~ s/\#\#count_of_warning_removals\#\#/$count_of_warning_removals/xg; #Regular expression without "/x"
       $_ =~ s/\#\#count_of_error_removals\#\#/$count_of_error_removals/xg; #Regular expression without "/x"
       push(@newlines,$_);
    }

    my $FILE1 = IO::File->new("$CSV", ">")|| die "File not found";  #prohibit indirect syntax
    print $FILE1 @newlines; 
    $FILE1->close();
    # 
    
    if($DEBUG)
   {
      print "\n Diagnostic info on filtering to suppress_false_warnings\n";
      print "Diff of filtered file vs unfiltered\n";
   }

   print "FILTERING RESULTS: applied $count_of_filter_rules rules and removed $count_of_filter_removals records\n\n" if($DEBUG);
   #Save a copy of unfiltered output
   copy("$CSV","$CSV_SAVE") or die "Copy failed: $!"; 

   print "UNFILTERED CSV OUTPUT FILE = $CSV_SAVE\n" if($DEBUG); 
   # Replace it with filtered output
   move("$filter_output_file","$CSV") or die "Move failed: $!";
   
    print "\nCSV OUTPUT FILE FILTERED : $CSV\n\n" if($DEBUG);
    return;##require final return
}
#exit $RC;

#-------------------------------------------------------------------------
# Subroutines
#-------------------------------------------------------------------------
#our($opt_h,$opt_V,$opt_v,$opt_n,$opt_r,$opt_R,$opt_d,$opt_f,$opt_a,$opt_U,$opt_E,$opt_e,$opt_g,$opt_i,$opt_m,$opt_o,$opt_q,$opt_c,$opt_A,$opt_t,$opt_s,$opt_x);                #strict_use

sub HandleOpts
{
    #if ($opt_h)
    if(defined $opt{h}) #Package variable declared or used
    {
        help(); #Sub called with "&"
        show_use(); #Sub called with "&"
        exit 0;
    }

    #if ($opt_V)
    if(defined $opt{V}) #Package variable declared or used
    {
        show_version(); #Sub called with "&"
        exit 0;
    }

    if(defined $opt{v}) #Package variable declared or used
    {
        $verbose = "yes";
    }

    if(defined $opt{n}) #Package variable declared or used
    {
        $no_log = 1;
    }

    if(defined $opt{r}) #Package variable declared or used
    {
        $record_number = $opt{r}; #Package variable declared or used
        chomp($record_number);
        if($record_number =~ /^\-[a-zA-Z]$/x) #Regular expression without "/x"
        {
            #no value is entered with -r option(taking next option as input value for -r)
            help(); #Sub called with "&"
            show_use(); #Sub called with "&"
            exit 0;            
        }
    }

    if(defined $opt{R}) #Package variable declared or used
    {
        $tempdir_path = $opt{R};
        chomp($tempdir_path);
        if($tempdir_path !~ /^s:[\w\d\-\.\/]+:[\w\d\-\.\/]+:g$/x) #Regular expression without "/x"
        {
            help(); #Sub called with "&"
            show_use(); #Sub called with "&"
            exit 0;
        }
    }

    if(defined $opt{d}) #Package variable declared or used
    {
        $DEBUG = 1;
    }

    if(defined $opt{f}) #Package variable declared or used
    {
        $configfile = $opt{f};
        $location_sudoers_file = dirname($opt{f});
    }
    else
    {
        $configfile = "/etc/sudoers";
        $location_sudoers_file = dirname($configfile);
        if ($DEBUG)
        {
            print "Using default config file $configfile\n";
        }
    }

    $all_sudoers_files{$configfile}="master";
    if(!(-f $configfile))
    {
        print "USAGE ERROR : Script input sudoers file is invalid\n\n";
        show_use(); #Sub called with "&"
        exit 1;
    }

    if(!(-r $configfile))
    {
        print "USAGE ERROR : Script input unable to read sudoers file because of no read permission \n\n";
        show_use(); #Sub called with "&"
        exit 1;
    }

    if(defined $opt{a}) #Package variable declared or used
    {
        push(@DISABLED_MESSAGES, "SFIT10933");
    }

    if(defined $opt{c}) #Package variable declared or used
    {
        $NO_DOWNGRADE = 1;
    }
    if(defined $opt{U}) #Package variable declared or used
    {
        $check_opt_Usr = 1;
    }
    
    if(defined $opt{E}) #Package variable declared or used
    {
        $IGNORE_CUSTOMER_ENTRY=1;
        $opt{e}=1;
        if($DEBUG) {
            print "\nEnabling extended mode\n";
        }    
    }
    if(defined $opt{l}) #Package variable declared or used
    {
        @DISABLED_MESSAGES = ( 
                                "SFIT10347" ,"SFIT10933" ,"SFIT10934" ,"SFIT10936" ,"SFIT11043" ,"SFIT14163" ,"SFIT15983",
                                "SFIT18206" ,"SFIT19488" ,"SFIT2508"  ,"SFIT2509"  ,"SFIT2510"  ,"SFIT2511"  ,"SFIT2516",
                                "SFIT2517"  ,"SFIT2518"  ,"SFIT2519"  ,"SFIT2520"  ,"SFIT2521"  ,"SFIT2522"  ,"SFIT2523",
                                "SFIT2525"  ,"SFIT2526"  ,"SFIT2527"  ,"SFIT4360"  ,"SFIT4364"  ,"SFIT4636"  ,"SFIT4637",
                                "SFIT4639"  ,"SFIT4640"  ,"SFIT4641"  ,"SFIT4754"  ,"SFIT4755"  ,"SFIT4756"  ,"SFIT4757",
                                "SFIT4759"  ,"SFIT4760"  ,"SFIT4761"  ,"SFIT4762"  ,"SFIT4763"  ,"SFIT4764"  ,"SFIT4765",
                                "SFIT4767"  ,"SFIT4768"  ,"SFIT4994"  ,"SFIT58079" ,"SFIT5996"  ,"SFIT60259" ,"SFIT60261",
                                "SFIT17033" ,"SFIT2524"  ,"SFIT4638"  ,"SFIT4758"  ,"SFIT4766"  ,"SFIT60266" ,"SFIT67619",
                                "SFIT60267" ,"SFIT60269" ,"SFIT62413" ,"SFIT64587" ,"SFIT77558" ,"SFIT77559" ,"SFIT77873",
                                "SFIT80470" ,"SFIT65507" ,"SFIT73868" ,"SFIT77555" ,"SFIT140660","SFIT77556" ,"SFIT60271",
                                "SFIT67468", "SFIT147509", "SFIT60264", "SFIT73866","SFIT163691", "SFIT180707", "SFIT76500",
                                "SFIT60263", "SFIT60432", "SFIT231521", "SFIT124468" ,"SFIT73863","SFIT67243","SFIT42903", 
                                "SFIT331841", "SFIT331843", "SFIT399272","SFIT438957","SFIT73861","SFIT451935","SFIT530602",
                                "SFIT530608","SFIT530611","SFIT530614","SFIT540074","SFIT569847", "SFIT613611"
                                
                            );
        undef($opt{x}); #Package variable declared or used
        $opt{e}=1; #Package variable declared or used

        if($DEBUG) {
            print "\nCommand line option 'x' is disabled";        
            print "\nEnabling extended mode\n";
        }
    }
    if(defined $opt{e}) #Package variable declared or used
    {
        $EXTENDED_CHECK_USER = 1;
        $MASTERFILE          = 0;
        if ($IS_ROOT == 0)
        {
           die "Effective user ID (".$>.") must be root (0) to run this program";
           #exit; #prohibit unreachable code
        }
    }
    if (defined $opt{g}) #Package variable declared or used
    {
        $GECOS_TYPE = uc($opt{g}); #Package variable declared or used
        if ($VALID_GECOS !~ /\s$GECOS_TYPE\s/x) #Regular expression without "/x"
        {
            print "USAGE ERROR : INVALID GECOS TYPE '$GECOS_TYPE' provided. Use one of the following or use the -i flag instead\n";
            print "              - URT, ORIG (Original IBM Gecos layout- lower case ibm only;) will be processed by GECOS customer type\n";
            print "              - for all other GECOS specifications, use the -i flag specifying an ibm identifier string instead\n\n";
            show_use(); #Sub called with "&"
            exit 1;
        }
    }

    if ( defined  $opt{i}) #Package variable declared or used
    {
       ####Changes for Enhancement 76184
       my $opt_value = $opt{i};
       if(-f $opt_value)
       {
          $flat_file = $opt{i};
       }
       else
       {
         $IBM_STR = $opt{i};
         print "\nGECOS to be considered as IBM ID = $IBM_STR \n" if($DEBUG);
       }
    }

    if (defined $opt{m}) #Package variable declared or used
    {
        $MERGEMODE = 1;
    }
    if (defined $opt{A}) #Package variable declared or used
    {
        $AS_HOST = $opt{A};
    }
    if (defined $opt{o}) #Package variable declared or used
    {
        if (!$opt{o})
        {
            print "USAGE ERROR : Script output directory name must be provided when option 'o' is used\n\n";
            show_use(); #Sub called with "&"
            exit 1;
        }
        else
        {
            $OUTDIR = $opt{o};
        }
    }
    elsif(defined $opt{f}) #Package variable declared or used
    {
        my $dir = dirname($opt{f});
        if(-d $dir)
        {
            $OUTDIR=$dir."/sfitout";
        }

    }

    ######Changes for the task Task 105651#######
    if((defined $opt{e}) or ($configfile eq "/etc/sudoers")) #Package variable declared or used
    {
        $OUTDIR = "/var/log/sfitout";
        if(!(-d $OUTDIR))
        {
           mkpath($OUTDIR);
        }

        if($DEBUG)
        {
             print "\nChanging the permissions of Out directory $OUTDIR to 700\n" if ($DEBUG);          
        }

        chmod oct("700"),$OUTDIR; 
        my $root_uid  = getpwnam("root"); chown $root_uid,-1,$OUTDIR; 
    } 
    ######Changes for the task Task 105651#######
    if(!($opt{e}) && !($opt{o}) && !($configfile eq "/etc/sudoers")) #prohibit mixed boolean operators #Package variable declared or used
    {
       my $current_dir = "./sfitout";
       $OUTDIR = $current_dir;
       if(!(-d $OUTDIR)) { mkpath ($OUTDIR);}
    }
     if(!(-x $OUTDIR) || !(-w $OUTDIR)){   #prohibit mixed boolean operators
        print "\nNo permission to write to directory $OUTDIR\n";
        exit 1;
    }

    if (defined $opt{x}) #Package variable declared or used
    {
        @DISABLED_MESSAGES = split(/\s+/x, $opt{x}); #Regular expression without "/x"
    }
    if (defined $opt{q}) #Package variable declared or used
    {
        foreach (split(/\s*,\s*/x, $opt{q})) #Regular expression without "/x"
        {
            my $parameter=$_;
            $parameter =~ s/^\s*|\s*$//xg; #Regular expression without "/x"
            if($parameter =~ /\-/x) #Regular expression without "/x"
            {
                if($parameter =~ /[^0-9\-]/x){next;} #Regular expression without "/x"
                my ($start,$end)=split(/\-/x, $parameter); #Regular expression without "/x"
               # for(my $i=$start;$i<=$end;$i++)
                for($start..$end)
                {
                    push(@suppress_msg,$_);
                }
            }
            else
            {
                push(@suppress_msg,$parameter);
            }
        }
    }
    if (defined $opt{t}) #Package variable declared or used
    {
        $template_check = 1;
        # Adding SFIT530608 to run only in template mode as per 564783
        my @sfit = (
                    "SFIT2515", "SFIT4636", "SFIT4638", "SFIT4639", "SFIT4640", "SFIT4754", "SFIT4756", "SFIT4757",
                    "SFIT4758", "SFIT4759", "SFIT4760", "SFIT4761", "SFIT4360", "SFIT4768", "SFIT2516", "SFIT4364",
                    "SFIT2527", "SFIT2510", "SFIT64587", "SFIT124468", "SFIT530608" 
                   );
        foreach (@sfit)
        {
            push(@DISABLED_MESSAGES, $_);
        }
    }
    
    ###Changes for task 136402
    if(defined $opt{s}) #Package variable declared or used
    {
       $STD_STR = $opt{s};     
    }
    
    $input_sudoers_file = $configfile;
    return;##require final return
}
sub check_for_suppression
{
    my($parameter)=@_;
    if(grep({ /^$parameter$/x } @suppress_msg)) #require block grep #Regular expression without "/x"
    {
        return 1;
    }
    return 0;
}

sub main::VERSION_MESSAGE
{     
    show_version();
    help();
    show_use();
    exit 0;
    
}

sub help
{
    print "\n";
    print "\n";
    print "                  $pn\n";
    print "\n";
    print "      This program reads the /etc/sudoers  file or\n";
    print "      a specified config file using the  -f option\n";
    print "      and prepares a report of users and commands,\n";
    print "      for use in a  periodic revalidation process.\n";
    print "      It will also issue warning messages  for any\n";
    print "      syntax that it cannot parse,  as well as for\n";
    print "      syntax that is not recommended.   When using\n";
    print "      the -v option it supplies additional message\n";
    print "      which  identifies  the  individual  commands\n";
    print "      within a Cmnd_Alias.  This may be helpful in\n";
    print "      determining   a   user's   exact   accesses.\n";
    print "\n";
    print "      It performs full crosschecking even on systems\n";
    print "      running nis or other group/user lookup methods.\n";
    print "\n";
    
    return;##require final return

}

sub show_use
{
    print "usage: $pn -h\n";
    print "  or   $pn -V\n";
    print "  or   $pn {defaults to /etc/sudoers}\n";
    print "  or   $pn -c (Do not downgrade the severity of customer issues)\n";
    print "  or   $pn -v (Gives source message for each entry)\n";
    print "  or   $pn -c -f <pathname of sudoers file to be inspected>\n";
    print "\n";
    print "       -h                                 Displays help and usage message\n";
    print "       -V                                 Displays program's version number\n";
    print "       -v                                 Verbose Option. Displays NOTE and SUCCESS messages\n";
    print "                                          in addition to ERROR and WARNING messages.\n";
    print "       -A                                 As-host parameter in default mode to specify the hostname\n";
    print "                                           to be used as frame of reference\n";
    print "       -a                                 Suppress messages from SFIT10933 in all modes\n";
    print "       -c                                 Do not downgrade the severity of customer issues\n";
    print "       -d                                 Displays debugging messages\n";
    print "       -m                                 Merge Mode. Removes run summary lines from CSV file so it can be combined\n";
    print "                                          with other CSVs\n";
    print "       -e                                 Extended user/group processing, user and groups validity checks performed\n";
    print "       -E                                 Do extended scan without checking the Customer entries, when GECOS tags are reliable\n";
    print "       -n                                 Suppress output log creation (CSV still generated)\n";
    print "       -g <GECOS TYPE>                    GECOS type URT (default), ORIG (IBM Original gecos layout.  All other GECOS\n";
    print "                                          types will process all userids in password file\n";
    print "       -i <ibm identification string>     Override IBM Employee identification method. NOTE: This overrides GECOS\n";
    print "                                          specification when determining which ids are owned by IBM employees.\n";   
    print "       -i <File>                          Override IBM Employee identification method.\n";   
    print "                                          File containing list of valid users will be considered as IBM ID.\n";
    print "                                          File needs to be formatted as one user ID per line.\n";
    print "                                          NOTE: This overrides GECOS specification,\n";
    print "                                          when determining which ids are owned by IBM employees.\n";
    print "       -l                                 Disable ALL SFIT's except SFIT2515\n";
    print "       -o <output directory name>         Override Output Directory name. Default is '<current_directory>/sfitout' in\n";
    print "                                          default and template mode. In extended mode the output directory is\n";
    print "                                          '/var/log/sfitout'\n";
    print "       -q <lines/groups to suppress>      Suppresses violation messages in output for given line mumbers/user or groups\n";
    print "       -r <problem/record number>         Displays <record number> as METADATA in CSV report for audit purpose\n";
    print "       -R <s:include_path:replace_path:g> Option to replace include directories with temporary directories\n";
    print "       -U                                 Verify whether userid are assigned directly to sudo privileges\n";
    print "       -f <sudoers file>                  Specify pathname of sudoers file to be inspected. Default is /etc/sudoers\n";
    print "       -t                                 Template checking mode, applies reduced set of tests suitable for partial\n";
    print "                                          files/templates.\n";
    print "       -x 'SFITnnnn SFITnnnn ...'         Disable messages\n";
    print "       -s 'search_string'                 Looks for the search string in the usernames from /etc/passwd file,if found\n";
    print "                                          mark that username as IBM user\n"; 
    print "\n";
    return;##require final return
}    # end show_use

sub show_version
{
    print "$pn: Version $version\n";
    return;##require final return
}    # end show_version

sub wcp_id
{
    show_version(); #Sub called with "&"
    return;##require final return
}

sub prtlog
{
    print $log_file_handle " $timestamp: @_ \n";
    return;##require final return
}

# Line location traceability subroutines
sub get_line_location
{
    my $line  = @_; ##require argument unpacking
    my $entry = $line_location{$line};
    return ($entry->{filename}, $entry->{line_number}, $entry->{master_file}); #perl -w ##require final return
}

sub get_line_location_text
{ 
    my ($line) =  @_; ##require argument unpacking  
    # get a reference to the hash for this line
    my $entry;
    if(defined $line){$entry = $line_location{$line};}
    my $master_text;
    my ($f_name,$l_no,$m_text);
    if ($entry->{master_file})
    {
        $master_text = "master";
    }
    else
    {
        $master_text = "included";
    }
    if(!$entry->{filename} && !$entry->{line_number})  #prohibit mixed boolean operators
    {
        ($f_name,$l_no,$m_text)="";  #("", "", ""); #perl -w
    }
    else
    { 
         $f_name=$entry->{filename};
         $l_no= $entry->{line_number};
         $m_text=$master_text;
        
    }
    return ($f_name,$l_no,$m_text); ##require final return
    
}

sub update_line_location
{
    my ($old_line, $new_line) = @_; 

    if(defined $old_line){$old_line =~ s/\r//xig;} #Regular expression without "/x"
    if(defined $new_line){$new_line =~ s/\r//xig;} #Regular expression without "/x"

    # get the hash reference for the old line
    my $entry;
    if(defined $old_line)
    {
        $entry = $line_location{$old_line};
    }
    if ($DEBUG)
    {
        if ($entry)
        {
            print "update_line_location: " . $entry->{line_number} . ", " . $entry->{filename} . ", " . $entry->{master_file} . "\n";
        }
        else
        {
            if(defined $old_line){print "update_line_location: not found $old_line\n";}
        }
    }
    if(defined $new_line)
    {
    $line_location{$new_line} = $entry;
    }
     return ;##require final return
    
}

sub add_line_location
{
    # get the parameters
    my ($line, $filename, $line_number, $master_file) = @_;
   
    $line =~ s/\r//xig; #Regular expression without "/x"
    
   #################Changes for Defect 81984 - Message points to incorrect include file###
    if(exists $line_location{$line} )
    {
       $line =~ s/^(.*?)$/$1 /xig; #Regular expression without "/x"
    }

    if ($DEBUG)
    {
        print "add_line_location: $line_number, $filename, $master_file\n";
    }

    # create a reference to an anonymous hash
    my $entry = {
                 filename    => "$filename",
                 line_number => "$line_number",
                 master_file => "$master_file"
                };

    # store it, keyed by the line content
    $line_location{$line} = $entry;
    return ;##require final return
}


sub template_storemessage
{
    my ($msg_source) = @_; ####require argument unpacking
    if (grep({ /^$msg_source$/x } @DISABLED_MESSAGES)) #require block grep #Regular expression without "/x"
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

#If the command Path ends with a /* it should issue a warning. We want to see it end in /
#This is not applicable for "targets" of commands like "which file to copy", but only for the commands themselves.
#SFIT5996
sub use_directory_as_a_command
{
    my ($array_ref_copy) = @_;  #require argument unpacking #Reused variable name in lexical scope             #Get reference of sudoers array and continue using it
    if ($DEBUG)
    {
        print "\nin use_directory_as_a_command\n";
    }
    my $line;
    my @sudoers_matches;
    my $header;
    my $rest;
    my @splitted_line;
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    my @sudoers_matches_temp;
    my $line_count=1;
    my @lineidToLine = ();
    @sudoers_file_copy = grep ({ defined() and length() } @sudoers_file_copy);
    @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_copy); #Regular expression without "/x"#require block grep
    ##########################
    @sudoers_matches_temp = ();
    foreach my $original_line (@sudoers_matches)
    {
        $lineidToLine[$line_count]=$original_line;
        $line = $original_line;
        $line =~ s/(![^,]*)|.*=//xg; #Regular expression without "/x"
        $line =~ s/,+/,/xg; #Regular expression without "/x"
        $line =~ s/^\s*,|,\s*$|^\s*//xg; #Regular expression without "/x"
        foreach (split(/,/x, $line)) #Regular expression without "/x"
        {
            push(@sudoers_matches_temp, $_ . "|" . $line_count);
        }
        $line_count+=1;
    }
    @sudoers_matches = @sudoers_matches_temp;
    ##########################
    foreach my $line (@sudoers_matches)
    {
        @splitted_line = split(/\|/x, $line); #Regular expression without "/x"
        $splitted_line[0] =~ s/(\s+$)|(^\s+)//xg; #Regular expression without "/x"
        if ($splitted_line[0] =~ /^(([\S]+\/\*\s+)|([\S]+\/\*\s*$))/x) #Regular expression without "/x"
        {
            ($header, $rest) = split(/=/x, $lineidToLine[$splitted_line[1]], 2); #pankaj #Regular expression without "/x"
            my ($filename, $line_number, $master_text) = get_line_location_text($lineidToLine[$splitted_line[1]]);
            IssueViolation($header, $line_number, $splitted_line[0], "Command path specified ends with a '/*' but it should end with a /",
                            $master_text, $filename, 'SFIT5996'); #Sub called with "&"
        }
    }
    return ;##require final return
}
###################################################################################################
# load_sudoers_file into_array : loads the sudoer tmp file (which contains all includes) into the #
#    @sudoers_file array.                                        #
#        - Blank and comment lines are NOT loaded into the array                         #
#        - continuation characters, leading  and trailing white space are removed          #
###################################################################################################
sub load_sudoers_file_into_array
{
    my $flag_line_syntax_error = 0;
    my $var1                   = 0;
    my $rest_temp              = "";
    my $line_withplaceholder;
    my $description;
    my $nline;          #strict_use
    my $header;         #strict_use
    my $rest="";            #strict_use
    my $original;       #strict_use 
    if ($DEBUG) { print "\nIn LOAD_SUDOERS_FILE_INTO_ARRAY\n"; }
    ###Changes for defect 251788 
    my $cfgfile_handle = IO::File->new("$configfile.bak", "<") or die "$pn: $configfile.bak: $!";   #prohibit indirect syntax
    
    if (!$no_log)
    {
        prtlog("Validating config file  $configfile.bak"); #Sub called with "&"
    }

    while (my $line = <$cfgfile_handle>)
    {
        chomp($line);

        # remember the original content of the line
        my $original_copy = $line; #Reused variable name in lexical scope
        FIXLINE:
        my ($header_data,$line_data)=split(/=/x,$line,2); #Regular expression without "/x"
        $header_data =~ s/\+/%_PLUS_/xg;#Regular expression without "/x"
        ##Changes for defect 208780
        if($header_data =~ /User_Alias/)
        {
            if(defined $line_data){$line_data =~ s/\+/%_PLUS_/xg;}#Regular expression without "/x"
        }
        if ($line =~ m/=/x) #Regular expression without "/x" 
        {
            $line="$header_data=$line_data";
        }
        else 
        {
            $line="$header_data";            
        }       
        #$line="$header_data=$line_data";
      #FIXLINE:        
        if ($line =~ /^\s*(\#.*)/x) { push(@comment_array, $1); next; }  #Regular expression without "/x"    # drop comments, check for any preceeding whitespace
        if ($line =~ /.*(\#.*)/x) #Regular expression without "/x" 
        {
            push(@comment_array, $1);
            $line =~ s/(.*)\#.*/$1/x; #Regular expression without "/x" 
        }
        if ($line !~ /\w/x) { ; next; }   #Regular expression without "/x"                                  # drop blank lines
                                                                         #$line=~s/:/: /g;            # ensure there is a space after a ':'
        $line =~ s/EXEC\:/EXEC\: /xg;   #Regular expression without "/x"                                    # ensure there is a space after a EXEC/NOEXC: command
        $line =~ s/PASSWD\:/PASSWD\: /xg; #Regular expression without "/x"                                  # ensure there is a space after a PASSWD/NOPASSWD: command
        $line =~ s/\!\s+/\!/xg;   #Regular expression without "/x"                                         # remove white space between negation operator and command
        $line =~ s/\/\//\//xg; #Regular expression without "/x"                                            # remove duplicate path slash '/' characters
        $line =~ s/(\*)+/\*/xg;  #Regular expression without "/x"                                          # remove multiple  '*' characters Needs ticket vs 2.8

        if ($line =~ /\\\s*$/x)  #Regular expression without "/x"
        {                                                                # handle continuation chars and trailing white space
            $nline = <$cfgfile_handle>;
            $nline =~ s/^\s+//x;   #Regular expression without "/x"                                        # remove any leading spaces
            $line =~ s/\\\s*$/ /xg; #Regular expression without "/x" 
            $line .= $nline;
            if (!eof($cfgfile_handle))
            {
                chomp($line);
                goto FIXLINE;
            }
        }

        $line =~ s/\s+=\s+/=/xg;   #Regular expression without "/x"                                         # remove spaces before and after '='
        $line =~ s/\Q\?\E/./xg;   #Regular expression without "/x"                                              # replace ? with . to work in regular expressions
        $line = trim($line); #Sub called with "&"
        
        #######
        if ($line =~ /,\s*$/x) #Regular expression without "/x" 
        {
            ($header, $rest) = split(/=/x, $line, 2); #Regular expression without "/x"
            my ($filename, $line_number, $master_text) = get_line_location_text($original_copy); #Sub called with "&"
            IssueWarning($header, $line_number, "", "Line ending with comma",$master_text, $filename, 'SFIT4637'); #Sub called with "&"
            if(!eof($cfgfile_handle))
            {
                $nline = <$cfgfile_handle>;
                $nline =~ s/^\s+//x; #Regular expression without "/x"
                if($nline =~ /^[\s\t]*\//x) #Regular expression without "/x" 
                {
                    $line .= $nline;
                    if (!eof($cfgfile_handle))
                    {
                        chomp($line);
                        goto FIXLINE;
                    }
                }
                else
                {
                    if($nline){seek($cfgfile_handle, -length($nline), 1); }
                }
            }
        }
        #######
        if ($DEBUG) { print "\tloading line=$line|\n"; }

        #Defect 4489

        if($line =~ /\(<:\s*([\w]+)\s*>\)/x) #Regular expression without "/x" 
        {
            $line =~ s/\(<:\s*([\w]+)\s*>\)/(<:$1>)/xg; #Regular expression without "/x" 
        }
        ($header, $rest) = split(/=/x, $line, 2); #Regular expression without "/x"
        $flag_line_syntax_error = 0;
        $rest_temp="";
        #if(defined $rest)
        {
            if ((defined $rest) && ($rest =~ /\(|\)|\[|\]|<|>/x)) #Regular expression without "/x" 
            {
            $rest_temp = $rest;
            foreach (split(/\s+/x, $rest_temp)) #Regular expression without "/x"
            {
                $var1 = 0;
                while ($var1 < 5)
                {
                    if ($rest_temp =~ /\(|\)|\[|\]|<|>/x) #Regular expression without "/x" 
                    {
                        $rest_temp =~ s/(\([^\(\)\[\]<>]+\))//xg; #Regular expression without "/x"
                        $rest_temp =~ s/(\[[^\(\)\[\]<>]+\])//xg; #Regular expression without "/x"
                        $rest_temp =~ s/(<[^\(\)\[\]<>]+>)//xg; #Regular expression without "/x"
                        $rest_temp =~ s/(\[\])//xg; #Regular expression without "/x"
                        $rest_temp =~ s/(\(\))//xg; #Regular expression without "/x"
                        $rest_temp =~ s/(<>)//xg; #Regular expression without "/x"
                    }
                    $var1 += 1;
                }
            }
        }
        }
        if ($rest_temp =~ /\(|\)/x) #Regular expression without "/x" 
        {
            if ($DEBUG)
            {
                print "Opening and closing round brackets are not matching; LINE '$header' \n";
            }
            my ($filename, $line_number, $master_text) = get_line_location_text($original_copy); #Sub called with "&"
            if($header =~ /^\s*Cmnd_Alias/x) #Regular expression without "/x" 
            {
                $description="Cmnd_Alias not processed by SFIT- Opening and closing round brackets are not matching";
            }
            else
            {
                $description="Entry not processed by SFIT- Opening and closing round brackets are not matching";
            }
            IssueError($header, $line_number, "( or )", $description,$master_text, $filename, 'SFIT4637'); #Sub called with "&"

        }
        if ($rest_temp =~ /\[|\]/x) #Regular expression without "/x" 
        {
            if ($DEBUG)
            {
                print "Opening and closing square brackets are not matching; LINE '$header' \n";
            }
            my ($filename, $line_number, $master_text) = get_line_location_text($original_copy); #Sub called with "&"
            if($header =~ /^\s*Cmnd_Alias/x) #Regular expression without "/x" 
            {
                $description="Cmnd_Alias not processed by SFIT- Opening and closing square brackets are not matching";
            }
            else
            {
                $description="Entry not processed by SFIT- Opening and closing square brackets are not matching";
            }
            IssueError($header, $line_number, "[ or ]", $description,$master_text, $filename, 'SFIT4637'); #Sub called with "&"

        }
        # Changes for Enhancement 424186
        #if ($rest_temp =~ /<|>/ or $rest =~ /<:\s*[\w\/]+[\s,]+/ or $rest =~ /<:\s*[\w\/]+$/ or $rest =~ /<[^\s,>]+[\s,]+/ or $rest =~ /<[^\s,>]+$/ or $rest =~ /([\s,=]+[\w\/]+)>/)
        #if(defined $rest)
        {
            if ((defined $rest) && ($rest =~ /<:\s*[\w\/]+[\s,]+/x or $rest =~ /<:\s*[\w\/]+$/x or $rest =~ /<[^\s,>]+[\s,]+/x or $rest =~ /<[^\s,>]+$/x or $rest =~ /([\s,=]+[\w\/]+)>/x )) #Regular expression without "/x" 
            {
            if ($DEBUG)
            {
                print "Opening and closing angular brackets are not matching; LINE '$header' \n";
            }
            my ($filename, $line_number, $master_text) = get_line_location_text($original_copy); #Sub called with "&"
            if($header =~ /^\s*Cmnd_Alias/x) #Regular expression without "/x" 
            {
                $description="Cmnd_Alias not processed by SFIT- Opening and closing angular brackets are not matching";
            }
            else
            {
                $description="Entry not processed by SFIT- Opening and closing angular brackets are not matching";
            }
            IssueError($header, $line_number, "< or >", $description,$master_text, $filename, 'SFIT4637'); #Sub called with "&"
            ($header, $rest)=split(/=/x,$line,2); #Regular expression without "/x"
             while($rest =~ /<:\s*[\w\/\.\*\?\+\!]*[\s,]+/x or $rest =~ /<:\s*[\w\/\.\*\?\+\!]*$/x)  #Regular expression without "/x" 
            #while loop changed for defect 558113 ->related to SFIT438597.
            {
                $rest =~ s/<:(\s*[\w\/\.\*\?\+\!]+)([\s,]+)/<:$1>$2/x; #Regular expression without "/x" 
                $rest =~ s/<:(\s*[\w\/\.\*\?\+\!]+)$/<:$1>/x; #Regular expression without "/x" 
                
            }
            while($rest =~ /<[^\s,>]+[\s,]+/x or $rest =~ /<[^\s,>]+$/x) #Regular expression without "/x" 
            {
                $rest =~ s/<([^\s,>]+[\s,]+)/ $1/x; #Regular expression without "/x" 
                $rest =~ s/<([^\s,>]+)$/ $1/x; #Regular expression without "/x" 
            }
            while($rest =~ /([\s,=]+[\w\/]+)>/x) #Regular expression without "/x" 
            {
                $rest =~ s/([\s,=]+[\w\/]+)>/$1 /x; #Regular expression without "/x" 
            }
            while($rest =~ /(\s+<\s+)/x or $rest =~ /(\s+>\s+)/x) #Regular expression without "/x" 
            {
                $rest =~ s/(\s+<\s+)|(\s+>\s+)/ /x; #Regular expression without "/x" 
            }
            $line=$header."=".$rest;
        }
        }
        if($line =~ /^\s*root\s*ALL\s*=\s*\(ALL\)\s*ALL\s*$/x) #Regular expression without "/x" 
        {
            if($DEBUG) { print "Ignoring the line = $line\n";}
            next;
        }
        if ($flag_line_syntax_error == 0)
        {
            $line_withplaceholder=$line;
            # Changes for Enhancement 424186
            #$line =~ s/<:([\/\w]+)>/$1/g;
            $line =~ s/<:(.*?)>/$1/xg; #Regular expression without "/x" 
            if ( "$line_withplaceholder" ne "$line" )
            {
                if ($DEBUG)
                {
                    print "Placeholder Line Before = $line_withplaceholder\n";
                    print "Placeholder Line After = $line\n";
                }
            }
            #############################
            ($header, $rest)=split(/=/x,$line,2); #Regular expression without "/x"
            $header =~ s/\s*,\s*/,/xg; #Regular expression without "/x"
            if($header =~ /^\s*User_Alias/x) #Regular expression without "/x"
            {
                $rest =~ s/\s*,\s*/,/xg; #Regular expression without "/x"
            }
            if(defined $rest)
            {
            $line=$header."=".$rest;
            }
            $line =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
            #############################
            # Enhancement 331838 changes below
            if ($DEBUG)
            {
                print "B=$line\n";  
            }           
            $line = verify_command_in_shell($line); #Sub called with "&"
            if ($DEBUG)
            {
                print "A=$line\n";      
            }                       
            $line =~ s/\\,/ /xg;   # For Defect 348543 #Regular expression without "/x"
            $line =~ s/(EXEC|NOEXEC|PASSWD|NOPASSWD)\:\s+/$1\: /xg; #Regular expression without "/x"
            if($line =~ /\(((.*?,\s*\+.+?|\s*\+.+?))\)/x) #Regular expression without "/x"
            {
                    while($line =~ /\(((.*?,\s*\+.+?|\s*\+.+?))\)/x) #Regular expression without "/x"
                    {
                      my $contents=$1;
                      my $new_contents=$contents;
                      $new_contents =~ s/\+/%_PLUS_/xg; #Regular expression without "/x"
                      $line =~ s/\Q$contents\E/$new_contents/xg; #Regular expression without "/x"
                    }
            }           
            push @sudoers_file, $line;
            # update the file name by line content hash
            # update the line number by line content hash
            update_line_location($original_copy, $line); #Sub called with "&"
            if ($line_withplaceholder =~ /(<\s*:)/x) #Regular expression without "/x"
            {
                my ($filename, $line_number, $master_text) = get_line_location_text($line);         #Sub called with "&"    
                IssueViolation($header, $line_number, "$1", "Line contains unreplaced placeholder '<:'", $master_text, $filename, 'SFIT62413'); #Sub called with "&"
            }
        }

        #Defect 4489

        if ($line =~ /!logfile/xi) #Regular expression without "/x"
        {
            #IssueError("SFIT4637;'!logfile' parameter in use.  Sudo logging cannot be disabled; LINE '$line'\n");
            my ($filename, $line_number, $master_text) = get_line_location_text($original_copy); #Sub called with "&"
            IssueViolation($header, $line_number, "!logfile", "'!logfile' parameter in use.  Sudo logging cannot be disabled",
                            $master_text, $filename, 'SFIT4637'); #Sub called with "&"

            $RC = $RC + 10;
        }

    }    # end of while    
    $cfgfile_handle->close();
    ###############create copy of array with runas user and then remove it
    @sudoers_file_with_runas=@sudoers_file;
   # for(my $i=0;$i<=$#sudoers_file;$i++)
    for(0..$#sudoers_file)
    {
        if($sudoers_file[$_] =~ /\(([^\)]*)\)/x) #Regular expression without "/x"
        {
            $original=$sudoers_file[$_];
            $sudoers_file[$_] =~ s/\(([^\)]*)\)//xg; #Commenting the removal of run as users.
            update_line_location($original, $sudoers_file[$_]); #Sub called with "&"
        }
    }
    #####################
    if ($DEBUG)
    {
        print "\n********************************************************************************\n";
        print "********************************************************************************\n";
        print "The list of sudoer statements loaded are : \n";
        print join("\n", @sudoers_file), "\n";
        
        print "The list of sudoer statements loaded are : \n";
        print join("\n", @sudoers_file_dot), "\n";
        
        print "********************************************************************************\n";
        print "********************************************************************************\n";
    }
    return ;##require final return
}    # end of sub
sub uniq {
    my @seen_array=@_; #require argument unpacking
    my %seen;
    @seen_array=grep { !$seen{$_}++ } @seen_array;#require block grep
    return @seen_array;##require final return 
}
sub verify_command_in_shell
{
    my ($line) = @_; ## #require argument unpacking
    $line =~ s/\/[a-zA-Z0-9\/\_\-\.]*\/\b($shells_regex_list)\b\s+\-c\s*\,{0,1}//xg; #Regular expression without "/x"
    $line =~ s/\s*\,\s*$//xg; #Regular expression without "/x"
    return $line;
}
sub det_last_mod_date
{
    # ---------------------------------------------------------------
    # Stat the config file, then use localtime and pretty it up to
    # to provide last modified date....
    # ---------------------------------------------------------------
    my $mod_times;      #strict_use 
    my $mod_month;      #strict_use
    $mod_times = (stat $configfile)[9];

    if ($mod_times >= 0 && $mod_times < 214_748_3648) #RequireNumberSeparators
    {
        my ($sec, $min, $hours, $mday, $mon, $year) = localtime($mod_times);
        $mod_month     = qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)[$mon];    #strict_use #ProhibitQuotedWordLists
        $year          = $year + 1900;
        my $last_mod_date = "$mod_month $mday, $year";
    }
    else { print "Enter integer value between 0 and 2147483647\n"; }
    return ;##require final return
}

####################################################################################
# Scan through the file for certain characters and structures we don't like to see #
####################################################################################
sub alert_on_forbidden_syntax
{
    my $header;

    if ($DEBUG) { print "\nin ALERT_ON_FORBIDDEN_SYNTAX\n"; }

    foreach my $line (@sudoers_file)
    {
        $header = (split(/=/x, $line, 2))[0]; #pankaj #Regular expression without "/x"
        $header = trim($header); #Sub called with "&"

        if ($DEBUG)
        {
            print "\tline=$line\n";
            print "\theader=$header\n\n";
        }

        if ($line =~ /\s\+[^\w=]/x)  #Regular expression without "/x"
        {
            my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
            IssueError($header, $line_number, "", "Syntax cannot be parsed", $master_text, $filename, 'SFIT4636');
            $RC = $RC + 10;
        }    # no netgroups, please

        if ($line =~ /\w\(\w\)\w\(\w\)w/x)   #Regular expression without "/x"
        {
            my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
            IssueWarning($header, $line_number, "() ()", "() () Syntax is not recommended", $master_text, $filename, 'SFIT4636'); #Sub called with "&"
            $RC = $RC + 10;
        }    # Double parens mean switch over then back. NG

        if ($line =~ /,$/x)  #Regular expression without "/x"
        {
            my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
            IssueWarning($header, $line_number, "", "Line ends with comma-- missing a continuation?", $master_text, $filename, 'SFIT4636'); #Sub called with "&"

            $RC = $RC + 10;
        }
    };  
return ;##require final return
    # end of loop

}    # end of alert on syntax sub

################################################################################################################
# load_group_file loads the information from /etc/group into 2 arrays :                                        #
#    hash %groups, where the key is the name of the group and contents are the userids belonging to that group #
#    hash %gids, where the key is the name of the group and contents are the group id number                   #
################################################################################################################
sub load_group_file
{
    #--------------------------------------------------------------------------------------------------------------------
    # Added AIX OS check if block below, since getgrent function was failing to report LDAP groups.For Enhancement 219840
    #--------------------------------------------------------------------------------------------------------------------
    if ($getOS =~ /AIX/)
    {
        if ($DEBUG)
        {
            print "\nOperating System is AIX\n";
        }
        my $name;
        my $gid;
        my $members;
        my $output = qx(lsgroup ALL);

        foreach my $line (split /\n+/x, $output)  #Regular expression without "/x"
        {   
            $name="";
            $gid="";
            $members="";

            if($line =~ m/(^.+?)\s/x)  #Regular expression without "/x" 
            {
                $name=$1;
            }
            if($line =~ m/id=(\d+?)\s/x)  #Regular expression without "/x"
            {
                $gid=$1;
            }
            if($line =~ m/users=(.*?)\s/x)  #Regular expression without "/x"
            {
                $members=$1;
            }   
            $members =~ tr/ /,/;
            $groups{$name} = $members;
            $gids{$name}   = $gid;
        }       
    }
    elsif ($getOS =~ /SUSE/)
    {
        if ($DEBUG)
        {
            print "\nOperating System is SUSE\n";
        }
        my $output = qx(getent group);

        foreach my $line (split /\n+/x, $output)  #Regular expression without "/x"
        {   
            my ($name, $passwd, $gid, $members)="";
            ($name, $passwd, $gid, $members) = split(/:/x, $line, 4); #Regular expression without "/x"
            if ($DEBUG)
            {
                print "$name\t$passwd\t$gid\t$members\n";
            }
            $groups{$name} = $members;
            $gids{$name}   = $gid;
        }       
    }
    else
    {
        #----------------------------------------------------
        # NEW: Method builds hash using getgrent C lib call
        #----------------------------------------------------
        my ($name, $passwd, $gid, $members);
        setgrent or die "$pn: error reading group list: $!";
        while (($name, $passwd, $gid, $members) = getgrent)
        {
            $members =~ tr/ /,/;
            $groups{$name} = $members;
            $gids{$name}   = $gid;
        }
        endgrent;
    }
        if ($DEBUG)
        {
            print "\nLOAD_GROUP_FILE\n";
            print "\tGROUPS:\n";
            foreach (sort keys %groups)
            {
                print "\t\tgroups{$_}=$groups{$_}\n";
            }
            print "\tGIDS:\n";
            foreach (sort keys %gids)
            {
                print "\t\tgids{$_}=$gids{$_}\n";
            }
        }
        return ;##require final return
}    # End of sub

#################################################################################
# load_passwd_file : loads information from the /etc/passwd file into 3 arrays: #
#        hash %users with userid values                                  #
#        hash %user_gecos with gecos information                         #
#        hash %user_groups to contain users primary group                #
#        hash %IBMIDLIST contains userids that are also IBM ids          #
#        hash %USER_DIR contains userid's home directories               #
#        hash %USER_SHELL contains userid's startup shell                #
#################################################################################
sub load_passwd_file
{
    #------------------------------------------------------------------------------------------------------------------------
    # Added AIX OS checks inside this subroutine , since getpwent function was failing to report LDAP users.For Defect 230757
    #------------------------------------------------------------------------------------------------------------------------
    
    # ------------------------------------------------------ #
    # set ALL userid as an allowed user in the $users array, #
    #  even if it isn't in the password file                 #
    # ------------------------------------------------------ #
    $users{ALL}           = "ALL";                          # default for ALL id
    $user_gecos_hash{ALL} = "ALL: (refers to all users)";
    
    if ($getOS =~ /AIX/)
    {
        if ($DEBUG)
        {
            print "\nOperating System is AIX, Inside load_passwd_file function\n";
        }
        my $name;
        my $uid; 
        my $gid;
        my $gcos;
        my $dir;
        my $shell;
        my $pgrp;

        my $output = qx(lsuser ALL);
        foreach my $line (split /\n+/x, $output)  #Regular expression without "/x"
        {   
            $name="";
            $uid=""; 
            $gid="";
            $gcos="";
            $dir="";
            $shell="";
            $pgrp="";
            
            if($line =~ m/(^.+?)(\s|$)/x) {  $name=$1; }  #Regular expression without "/x"
            if($line =~ m/id=(\d+?)(\s|$)/x) { $uid=$1; }  #Regular expression without "/x"
            if($line =~ m/pgrp=(.+?)(\s|$)/x) { $pgrp=$1; $gid=$gids{$pgrp}; } #Regular expression without "/x"
            if($line =~ m/gecos=(.*?)\slogin=(.*?)(\s|$)/x) { $gcos=$1; }  #Regular expression without "/x"           
            if($line =~ m/home=(.*?)(\s|$)/x) { $dir=$1; }    #Regular expression without "/x"
            if($line =~ m/shell=(.*?)(\s|$)/x) { $shell=$1; }     #Regular expression without "/x"
            
            if ($DEBUG)
            {
                print "$name\t$uid\t$pgrp\t$gid\t$gcos\t$dir\t$shell\n";
            }           
            
            $users{$name} = $name;
            $users_uid{$uid}=$name;
            $USER_DIR{$name}   = $dir;
            if ($gcos)
            {
                $user_gecos_hash{$name} = $gcos;
                DetermineIBMId($name, "$gcos");                # add id to IBMIDLIST if it is an IBM id #Sub called with "&"
                $USER_DIR{$name}   = $dir;
                $USER_SHELL{$name} = $shell;
                $GECOS_RELIABLE=1;
            }
            else
            {
                $user_gecos_hash{$name} = "$name: (No user info found)";
            }

            if (exists($user_groups{$gid}))
            {
                $user_groups{$gid} = $user_groups{$gid} . "," . $name;
            }
            else
            {
                $user_groups{$gid} = $name;
            }
            ####changes for 136402

            if(defined $opt{s}) #Package variable declared or used
            {
                check_ibm_ids($name,$STD_STR); #Sub called with "&"
            }               
        }       
    }
    elsif ($getOS =~ /SUSE/)
    {
        if ($DEBUG)
        {
            print "\nOperating System is SUSE, Inside load_passwd_file function\n";
        }
        
        my $output = qx(getent passwd);
        foreach my $line (split /\n+/x, $output)  #Regular expression without "/x"
        {   
            my ($name, $passwd, $uid, $gid, $gcos, $dir, $shell)="";
            ($name, $passwd, $uid, $gid, $gcos, $dir, $shell) = split(/:/x, $line, 7); #Regular expression without "/x"
            if ($DEBUG)
            {
                print "$name\t$uid\t$gid\t$gcos\t$dir\t$shell\n";
            }           
            
            $users{$name} = $name;
            $users_uid{$uid}=$name;
            $USER_DIR{$name}   = $dir;
            if ($gcos)
            {
                $user_gecos_hash{$name} = $gcos;
                DetermineIBMId($name, "$gcos");                # add id to IBMIDLIST if it is an IBM id #Sub called with "&"
                $USER_DIR{$name}   = $dir;
                $USER_SHELL{$name} = $shell;
                $GECOS_RELIABLE=1;
            }
            else
            {
                $user_gecos_hash{$name} = "$name: (No user info found)";
            }

            if (exists($user_groups{$gid}))
            {
                $user_groups{$gid} = $user_groups{$gid} . "," . $name;
            }
            else
            {
                $user_groups{$gid} = $name;
            }
            ##changes for 136402
            if(defined $opt{s}) #Package variable declared or used
            {
                check_ibm_ids($name,$STD_STR); #Sub called with "&"
            }               
        }
    }
    else
    {   
        #----------------------------------------------------
        # NEW: Method builds hash using getpwent C lib call
        #----------------------------------------------------
        my ($name, $passwd, $uid, $gid, $quota, $comment, $gcos, $dir, $shell);
        setpwent or die "$pn: error reading user list: $!";
        while (($name, $passwd, $uid, $gid, $quota, $comment, $gcos, $dir, $shell) = getpwent)
        {
            $users{$name} = $name;
            $users_uid{$uid}=$name;
            $USER_DIR{$name}   = $dir;
            if ($gcos)
            {
                $user_gecos_hash{$name} = $gcos;
                DetermineIBMId($name, "$gcos");                # add id to IBMIDLIST if it is an IBM id #Sub called with "&"
                $USER_DIR{$name}   = $dir;
                $USER_SHELL{$name} = $shell;
                $GECOS_RELIABLE=1;
            }
            else
            {
                $user_gecos_hash{$name} = "$name: (No user info found)";
            }

            if (exists($user_groups{$gid}))
            {
                $user_groups{$gid} = $user_groups{$gid} . "," . $name;
            }
            else
            {
                $user_groups{$gid} = $name;
            }
            ####changes for 136402

            if(defined $opt{s}) #Package variable declared or used
            {
                check_ibm_ids($name,$STD_STR); #Sub called with "&"
            }
        }
        endpwent;
    }
    ###############################
    $ibmid_count = keys %IBMIDLIST;

    if(($ibmid_count < 1) and ($EXTENDED_CHECK_USER == 1))
    {
        if ($getOS =~ /AIX/)
        {
            if ($DEBUG)
            {
                print "\nOperating System is AIX\n";
            }
            my $name;
            my $output = qx(lsuser ALL);
            foreach my $line (split /\n+/x, $output)  #Regular expression without "/x"
            {   
                $name="";

                if($line =~ m/(^.+?)(\s|$)/x)   #Regular expression without "/x"
                {   
                    $name=$1; 
                }       
                $IBMIDLIST{$name}=$name;                
            }       
        }
        elsif ($getOS =~ /SUSE/) #New
        {
            if ($DEBUG)
            {
                print "\nOperating System is SUSE\n";
            }
            my $output = qx(getent passwd);
            foreach my $line (split /\n+/x, $output)  #Regular expression without "/x"
            {
                my ($name, $passwd, $uid, $gid, $gcos, $dir, $shell)="";
                ($name, $passwd, $uid, $gid, $gcos, $dir, $shell) = split(/:/x, $line, 7); #Regular expression without "/x"
                $IBMIDLIST{$name}=$name;
            }
        }
        else
        {
            my ($name, $passwd, $uid, $gid, $quota, $comment, $gcos, $dir, $shell);
            setpwent or die "$pn: error reading user list: $!";
            while (($name, $passwd, $uid, $gid, $quota, $comment, $gcos, $dir, $shell) = getpwent)
            {
                $IBMIDLIST{$name}=$name;
            }
            endpwent;
        }
 
        if($DEBUG)
        {
            print "\nEnabled :Do not downgrade the severity of customer issues (-c command line flag)\n";
        }
        $NO_DOWNGRADE=1;

        IssueError("IBM_USERIDS", "1", "GECOS_LABELS", "No IBM labelled userids detected on system. All ids treated as IBM owned", "master", $configfile, 'SFIT77873'); #Sub called with "&"
    }

    ####Changes for Enhancement 76184
    Convert_file_to_IBMids(); #Sub called with "&"
    if ($DEBUG)
    {
        print "\nLOAD_PASSWD_FILE\n";
        print "\tUSERS:\n";
        foreach (sort keys %users)
        {
            print "\t\tusers{$_}=$users{$_}\n";
        }
        
        print "\tUSERS_GROUPS:\n";
        foreach (sort keys %users)
        {
            if((defined $_) && (defined $user_groups{$_})){print "\t\tusers{$_}=$user_groups{$_}\n";}
        }
                
        print "\tUSER_GECOS_HASH:\n";
        foreach (sort keys %user_gecos_hash)
        {
            print "\t\tuser_gecos_hash{$_}=$user_gecos_hash{$_}\n";
        }
        print "\tIBMIDLIST:\n";
        foreach (sort keys %IBMIDLIST)
        {
            print "\t\tIBMIDLIST{$_}=$IBMIDLIST{$_}\n";
        }

        print "\tUSER_DIR:\n";
        foreach (sort keys %USER_DIR)
        {
            print "\t\tUSER_DIR{$_}=$USER_DIR{$_}\n";
        }

        print "\tUSER_SHELL:\n";
        foreach (sort keys %USER_SHELL)
        {
            print "\t\tUSER_SHELL{$_}=$USER_SHELL{$_}\n";
        }
    }
    return ;##require final return
}
###Changes for task 136402
sub check_ibm_ids()
{
    my ($name,$std_str)=@_; ###require argument unpacking
    
    if($name =~ m/$std_str/igx)  #Regular expression without "/x"
    {
       $IBMIDLIST{$name} = $name;
    }
    
    return;
}
sub parse_sudoers_file
{

    # -------------------------------------------------------------------
    # create an array for each of 3 types of aliases in the sudoers file.
    # -------------------------------------------------------------------
    #my $group_line       = "";
    my $group_alias_name = "";
    #my $entries          = "";
    my $commands         = "";
   
    #my $result           = -1;
    my $lineTypes        = "User_Alias Cmnd_Alias Runas_Alias Defaults";
    my $firstword;          #strict_use
    my $rest;           #strict_use
    my @Command_Array=();   #strict_use
    my $Groups;         #strict_use
    my $group_name;     #strict_use
    my $user;
    #my $group_mbrs;        #strict_use             #prajakta,defined globally above as used in more than one sub
    my $target_gid;     #strict_use
    my $null;           #strict_use
    
   
    if ($DEBUG) { print "\nIN PARSE_SUDOERS_FILE\n"; }

    # ---------------------------------------------------------------
    # Check sudoers file for and group aliases begining with % sign
    # ---------------------------------------------------------------
    foreach my $group_line (@sudoers_file)
    {
        if ($group_line =~ /^\%/x)  #Regular expression without "/x"
        {
            #----------------------------
            # place %group in Group_Alias
            #----------------------------
            push(@Groups, $group_line);
        }
    }

    $Groups = @Groups;
    #if ($Groups gt 0)
    if ($Groups > 0) #ProhibitMismatchedOperators
    {
        foreach my $group_line (@Groups)
        {
            my $line = $group_line;
            $group_line =~ s/%_PLUS_/%/xg;  # Added this line to consider netgroups like regular groups  #Regular expression without "/x"
            ($group_alias_name_4756,$entries_4756)    = split(" ", $group_line,       2);
            ($null,             $group_name) = split(/%/x, $group_alias_name_4756, 2);  #Regular expression without "/x"
            $group_header = (split(/=/x, $group_line, 2))[0];  #Regular expression without "/x"#pankaj
            if ($DEBUG)
            {
                print "\n\tgroup_line=$group_line\n";
                print "\t\tgroup_alias_name=$group_alias_name_4756\n";
                if(defined $entries_4756 ){print "\t\tentries=$entries_4756\n";}
                print "\t\tgroup_name=$group_name\n";
                print "\t\tgroup_header=$group_header\n";
            }

            # ------------------------------------------------- #
            # If $group_name a real defined group on the server #
            #    and it has actual members defined, add it   #
            #    to the Group Alias array                    #
            # ------------------------------------------------- #
            
            my @processed_entry=();
            my @grparray1=split(/,/x,$group_name); #Regular expression without "/x"
            foreach(@grparray1)
            {
                $group_name=$_;
                $group_name=~s/%//xg;  #Regular expression without "/x"
                if (exists $groups{$group_name})
                {
                    $group_mbrs_4756 = $groups{$group_name};
                    if ($group_mbrs_4756)
                    {
                        if ( $case_insensitive_user  == 1   ) 
                        {
                            load_Group_Alias_Array_insensitive($group_name,$group_line); #Sub called with "&"
                        }
                        else 
                        {
                            load_Group_Alias_Array($group_name,$group_line); #Sub called with "&"
                        }
                        #&load_Group_Alias_Array($group_name,$group_line);
                    }

                    $target_gid = $gids{$group_name};
                    if ($target_gid)
                    {
                        $group_mbrs_4756 = $user_groups{$target_gid};
                        if ( $case_insensitive_user  == 1   ) 
                        {
                            load_Group_Alias_Array_insensitive($target_gid,$group_line); #Sub called with "&"
                        }
                        else 
                        {
                            load_Group_Alias_Array($target_gid,$group_line); #Sub called with "&"
                        }
                       #&load_Group_Alias_Array($target_gid,$group_line);
                    }
                }
                elsif (($group_name =~ /^p\//x) || ($group_name =~ /^c\//x))  #Regular expression without "/x"
                {
                    if ($DEBUG) { print "Group $group_name is a GSA group!\n"; }
                    $group_mbrs_4756 = $group_name;
                    load_Group_Alias_Array($group_name,$group_line); #Sub called with "&"
                    load_Group_Alias_Array("GSA",$group_line); #Sub called with "&"
                }
                elsif (!$MASTERFILE)
                {
                    $group_name =~ s/%_PLUS_/\+/xg; #Regular expression without "/x"
                    $group_name =~ s/_PLUS_/\+/xg; #Regular expression without "/x"
                    
                    if ($DEBUG) { 
                        print "ERROR: Group $group_name does not exist!\n";
                        print "the group os $group_name\n";
                    }
                    ###Changes for defect 140629
                    my @grp_arr = grep({ /^%/x } split(",", $group_line));#require block grep  #Regular expression without "/x"
                    foreach my $entry (@grp_arr)
                    {
                        $entry =~ s/^%//xig; #Regular expression without "/x"
                        $entry =~ s/^(.*?)\s+ALL(.*?)$/$1/xig; #Regular expression without "/x"
                        if(!grep({ /^$entry$/x } @processed_entry)) #Regular expression without "/x"
                        {
                            push(@processed_entry,$entry);
                            if(!exists $groups{$entry})
                            {                       
                                my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                                my @netgroups_from_sudoers_file = grep({ /%_PLUS_/x } @sudoers_file); #Regular expression without "/x"#require block grep
                                
                                if (grep { /%_PLUS_$entry/x } @netgroups_from_sudoers_file)  #Regular expression without "/x" #require block grep # Added this condition to differentiate log messages for netgroups and regular groups 
                                {
                                    # Code block below till IssueNote is for handling individual header in the message.
                                    # ex. for a mixed header ex. +netgroup1,%group1,user1 it will have appropriate symbol + or %
                                    my @grp_header_array = split(",",$group_header);
                                    foreach my $individual_header (@grp_header_array)
                                    {                       
                                        if ($individual_header =~ m/^%/x) #Regular expression without "/x"
                                        {
                                            $individual_header =~ s/%//xg; #Regular expression without "/x"
                                            $individual_header =~ s/\#/\\#/xg;
                                            $individual_header =~ s/\s/\\s/xg;
                                            if (grep { /\%_PLUS_$individual_header/x } @netgroups_from_sudoers_file)#require block grep #Regular expression without "/x"
                                            {
                                                $group_header =~ s/\%$individual_header/\+$individual_header/xg; #Regular expression without "/x"
                                                $group_header=~ s/\\s/ /xg;
                                                $group_header=~s/\\\#/#/xg;
                                            }
                                        }
                                    } 
                                    IssueNote($group_header, $line_number, "$entry", "Netgroup $entry does not exist!", $master_text, $filename, 'SFIT4754');   #Sub called with "&"
                                }
                                else # Show note for regular group not the netgroup 
                                {                           
                                    IssueNote($group_header, $line_number, "$entry", "Group $entry does not exist!", $master_text, $filename, 'SFIT4754'); #Sub called with "&"
                                }
                                
                            }
                        }
                        
                    }
                    
                               

                    $RC = $RC + 10;
                }
            }
        }
        if ($DEBUG)
        {
            print "\tGroup_Alias=\n";
            print join("\n", @Group_Alias), "\n";
        }
    }
    return ;##require final return
}    # end of sub

sub parse_sudoers_file_insensitive
{

    # -------------------------------------------------------------------
    # create an array for each of 3 types of aliases in the sudoers file.
    # -------------------------------------------------------------------
    #my $group_line       = "";
    my $group_alias_name = "";
    #my $entries          = "";
    my $commands         = "";
   
    #my $result           = -1;
    my $lineTypes        = "User_Alias Cmnd_Alias Runas_Alias Defaults";
    my $firstword;          #strict_use
    my $rest;           #strict_use
    my @Command_Array=();   #strict_use
    my $Groups;         #strict_use
    my $group_name;     #strict_use
    my $user;
    #my $group_mbrs;        #strict_use             #prajakta,defined globally above as used in more than one sub
    my $target_gid;     #strict_use
    my $null;           #strict_use
    my @grparray1=();
   
    if ($DEBUG) { print "\nIN PARSE_SUDOERS_FILE\n"; }

    # ---------------------------------------------------------------
    # Check sudoers file for and group aliases begining with % sign
    # ---------------------------------------------------------------
     
    foreach my $group_line (@sudoers_file)
    {
        if ($group_line =~ /^\%/x) #Regular expression without "/x"
        {
            #----------------------------
            # place %group in Group_Alias
            #----------------------------
            push(@Groups, $group_line);
        }
    }

    $Groups = @Groups;
    #if ($Groups gt 0)
    if ($Groups > 0) #ProhibitMismatchedOperators
    {
        foreach my $group_line (@Groups)
        {
            my $line = $group_line;
            $group_line =~ s/%_PLUS_/%/xg;  #Regular expression without "/x" # Added this line to consider netgroups like regular groups
            ($group_alias_name_4756,$entries_4756)    = split(" ", $group_line,       2);
            ($null,             $group_name) = split(/%/x, $group_alias_name_4756, 2); #Regular expression without "/x"
            $group_header = (split(/=/x, $group_line, 2))[0]; #pankaj #Regular expression without "/x"
            if ($DEBUG)
            {
                print "\n\tgroup_line=$group_line\n";
                print "\t\tgroup_alias_name=$group_alias_name_4756\n";
                if(defined $entries_4756){ print "\t\tentries=$entries_4756\n";}
                print "\t\tgroup_name=$group_name\n";
                print "\t\tgroup_header=$group_header\n";
            }

            # ------------------------------------------------- #
            # If $group_name a real defined group on the server #
            #    and it has actual members defined, add it   #
            #    to the Group Alias array                    #
            # ------------------------------------------------- #
            my @processed_entry=();
            @grparray1=split(/,/x,$group_name); #Regular expression without "/x"
            foreach(@grparray1)
            {
                $group_name=$_;
                $group_name=~s/%//xg;#Regular expression without "/x"
                my @insensitive_groups0 = grep{/^\Q$group_name\E$/xi} keys %groups;  #Regular expression without "/x"#Reused variable name in lexical scope
                my $groups_found=0;
                foreach my $grp (@insensitive_groups0)
                {
                    if (exists $groups{$grp})
                    {
                        $groups_found=1;
                        last;
                    }
                }
                
                #if (exists $groups{$group_name})
                if($groups_found==1)
                {
                    my @insensitive_groups = grep{/^\Q$group_name\E$/xi} keys %groups; #Regular expression without "/x"
                    foreach my $grp (@insensitive_groups)
                    {
                        $group_mbrs_4756 = $groups{$grp};
                        if ($group_mbrs_4756)
                        {   
                            if ( $case_insensitive_user  == 1  ) 
                            {
                                load_Group_Alias_Array_insensitive($grp,$group_line); #Sub called with "&"
                            }
                            else 
                            {
                                load_Group_Alias_Array($grp,$group_line); #Sub called with "&"
                            }
                            
                        }
                    }
                    my @insensitive_groups1 = grep{/^\Q$group_name\E$/xi} keys %gids; #Regular expression without "/x"
                    foreach my $grp (@insensitive_groups1)
                    {
                        $target_gid = $gids{$grp};
                        if ($target_gid)
                        {
                            $group_mbrs_4756 = $user_groups{$target_gid};
                            if ( $case_insensitive_user  == 1   ) 
                            {
                                load_Group_Alias_Array_insensitive($target_gid,$group_line); #Sub called with "&"
                            }
                            else 
                            {
                                load_Group_Alias_Array($target_gid,$group_line); #Sub called with "&"
                            }
                            
                        }
                    }
                    
                }
                elsif (($group_name =~ /^p\//x) || ($group_name =~ /^c\//x)) #Regular expression without "/x"
                {
                    if ($DEBUG) { print "Group $group_name is a GSA group!\n"; }
                    $group_mbrs_4756 = $group_name;
                    load_Group_Alias_Array($group_name,$group_line); #Sub called with "&"
                    load_Group_Alias_Array("GSA",$group_line); #Sub called with "&"
                }
                elsif (!$MASTERFILE)
                {
                    $group_name =~ s/%_PLUS_/\+/xg; #Regular expression without "/x"
                    $group_name =~ s/_PLUS_/\+/xg; #Regular expression without "/x"
                    
                    if ($DEBUG) { 
                        print "ERROR: Group $group_name does not exist!\n";
                        print "the group os $group_name\n";
                    }
                    ###Changes for defect 140629
                    my @grp_arr = grep({ /^%/x } split(",", $group_line));#require block grep #Regular expression without "/x"
                    foreach my $entry (@grp_arr)
                    {   
                        $entry =~ s/^%//xig; #Regular expression without "/x"
                        $entry =~ s/^(.*?)\s+ALL(.*?)$/$1/xig; #Regular expression without "/x"
                        if(!grep({ /^$entry$/xi } @processed_entry)) #Regular expression without "/x"
                        {
                            push(@processed_entry,$entry);
                            if(!grep{/$entry/xi} keys %groups) #change #Regular expression without "/x"
                            {
                                my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                                my @netgroups_from_sudoers_file = grep({ /%_PLUS_/x } @sudoers_file); #require block grep #Regular expression without "/x"
                                if (grep { /%_PLUS_$entry/ix} @netgroups_from_sudoers_file)  #Regular expression without "/x"#require block grep # Added this condition to differentiate log messages for netgroups and regular groups 
                                {
                                    # Code block below till IssueNote is for handling individual header in the message.
                                    # ex. for a mixed header ex. +netgroup1,%group1,user1 it will have appropriate symbol + or %
                                    my @grp_header_array = split(",",$group_header);
                                    foreach my $individual_header (@grp_header_array)
                                    {                       
                                        if ($individual_header =~ m/^%/x) #Regular expression without "/x"
                                        {
                                            $individual_header =~ s/%//xg; #Regular expression without "/x"
                                            $individual_header =~ s/\#/\\#/xg;
                                            $individual_header =~ s/\s/\\s/xg;
                                            if (grep { /%_PLUS_$individual_header/ix } @netgroups_from_sudoers_file)#require block grep #Regular expression without "/x"
                                            {
                                                $group_header =~ s/%$individual_header/+$individual_header/xg; #Regular expression without "/x"
                                                $group_header=~ s/\\s/ /xg;
                                                $group_header=~s/\\\#/#/xg;
                                            }
                                        }
                                    } 
                                    IssueNote($group_header, $line_number, "$entry", "Netgroup $entry does not exist!", $master_text, $filename, 'SFIT4754');   #Sub called with "&"
                                }
                                else # Show note for regular group not the netgroup 
                                {                           
                                    IssueNote($group_header, $line_number, "$entry", "Group $entry does not exist!", $master_text, $filename, 'SFIT4754'); #Sub called with "&"
                                }
                            
                            }
                        }
                    }
                    
                           

                    $RC = $RC + 10;
                }
            }
        }
        if ($DEBUG)
        {
            print "\tGroup_Alias=\n";
            print join("\n", @Group_Alias), "\n";
        }
    }
    return ;##require final return
} 
##################################################################################
# LoadOtherAliases :  loads Defaults, User_Alias, Cmnd_Alias, Runas_Alas lines   #
#            - Defaults    : no exceptions, just load all of them     #
#            - Runas_Alias : no exceptions, just load all of them     #
#            - User_Alias  : check for imbedded User_Alias references #
#                        remove invalid references (depts that    #
#                        don't exist, User_Alias refs     #
#                        that no longer exist)            #
#                    delete empty Aliases from @sudoers_file  #
#            - Cmnd_Alias  : check for imbedded Cmnd_Alias references #
#                    delete empty Aliases from @sudoers_file  #
#                        (if alias only points to other   #
#                        aliases that no longer exist)    #
#                    delete cmnd_aliases that are not active  #
#                        or used.                         #
##################################################################################
sub LoadOtherAliases
{
    my $sudoers_line;
    my $lineTypes = " User_Alias Cmnd_Alias Runas_Alias Defaults ";
    my $firstWord;
    my $secondWord;
    my $UpdatedLine;
   # my @remove_lines = ();
    my $lineCounter;
    my $DONE;
    my $header;
    my $linehdr;
    my $line2;
    my $TESTSTR;    
    my $ALINE;

    
    my @USED=();        #strict_use
    my @ALIASLINE;              #strict_use
    my $name;           #strict_use
    my $Cmnd_Alias_str; 
    my $tmpLine;        #strict_use

    if ($DEBUG) { print "\nIN LOADOTHERALIASES\n"; }
    $lineCounter = -1;
    foreach my $line (@sudoers_file)
    {
        $sudoers_line = $line;
        $lineCounter  = $lineCounter + 1;
        my $HAS_COMMAND  = 0;

        $DONE = 0;
        while (!$DONE)
        {
            $DONE = 1;

            undef $UpdatedLine;
            undef $TESTSTR;
            ($firstWord, $secondWord) = split(/\s+/x, $line);  #Regular expression without "/x"   #Cmnd_Alias IBM_VPSX_BAU_CMDS = \
            $firstWord =~ s/://x; #Regular expression without "/x"
            $linehdr = (split(/=/x, $line, 2))[0]; #pankaj  #Regular expression without "/x"      #Cmnd_Alias IBM_VPSX_BAU_CMDS
            $secondWord = (split(/\s+/x, $linehdr))[1];   #Regular expression without "/x"        #IBM_VPSX_BAU_CMDS
            $linehdr =~ s/\s+/ /xg; #Regular expression without "/x"

            if ($DEBUG)
            {
                print "--------------------------------------------------------------\n";
                print "\tLINE=$line\n";
                print "\tfirstWord=$firstWord\n";
                print "\tlinehdr=$linehdr\n";
                if(defined $secondWord){print "\tsecondWord=$secondWord\n";}
            }

            if ($lineTypes =~ /\s$firstWord\s/x) #Regular expression without "/x"
            {

                if ($DEBUG) { print "\tline contains a linetype\n"; }

                # ---------------------------------------------------------------- #
                # User_Alias :                                                     #
                # User_Alias cannot specify a host, therefore valid on all hosts   #
                # User_Alias can include another User_Alias - does expand do this? #
                # ---------------------------------------------------------------- #
                if ($firstWord =~ /Defaults/)
                {
                    push(@Defaults,$line);
                }
                if (($firstWord =~ /Defaults/) || ($firstWord =~ /Runas_Alias/))
                {
                    $SEVERITY_LIST{$linehdr} = "DEVIATION";
                }
                elsif ($firstWord =~ /User_Alias/)
                {
                    undef $UpdatedLine;
                    if ( $case_insensitive_user  == 1 && $case_insensitive_group == 1  )  # both group or usercase-insenstivity is enabled. 
                    {
                         $UpdatedLine =expand_useralias_groups_insensitive($line,0); #Sub called with "&"
                    }
                    elsif( $case_insensitive_group  == 1 ) #group enabled
                    {
                         $UpdatedLine =expand_useralias_groups_insensitive($line,0); #Sub called with "&"
                         #$UpdatedLine =expand_useralias_groups($line,0); #Sub called with "&"
                    }
                    else #user enabled or both user and group disabled
                    {
                        $UpdatedLine =expand_useralias_groups($line,0); #Sub called with "&"
                    
                    }
                    #$UpdatedLine = expand_useralias_groups($line,0); #Sub called with "&"
                    $UpdatedLine =~ s/=,/=/xg; #Regular expression without "/x"
                    $UpdatedLine =~ s/,\s*,/,/xg; #Regular expression without "/x"
                    $UpdatedLine =~ s/\s*,\s*$//xg; #Regular expression without "/x"
                    my $matched_user=0;
                    if ( $case_insensitive_user  == 1 && $case_insensitive_group == 1)
                    { 
                        if ($UpdatedLine)
                        {
                            $line = $UpdatedLine;
                            push(@User_Alias,$line);
                            if ($DEBUG) { print "...updated line=$UpdatedLine\n"; }
                            my($temp, $orig_line) = split(/=/x, $UpdatedLine,2); #Regular expression without "/x"
                            my @cmd= (split(/,/x, $orig_line)); #Regular expression without "/x"
                            
                            foreach my $ab(@cmd)
                            { 
                                if(grep({ /^\s*\Q$ab\E\s*$/xi} keys %users)) #Regular expression without "/x"
                                {   
                                    $matched_user=1; 
                                    
                                }
                            }
                            if($matched_user ==0 and $secondWord !~ /(?:_ADM.*|_ADM\s*$)/x)  #Regular expression without "/x" #ProhibitUnusedCapture
                            {
                                if($EXTENDED_CHECK_USER)
                                {
                                    ($header, $line2) = split /=/x, $line, 2; #Regular expression without "/x"
                                    $header =~ s/User_Alias//x; #Regular expression without "/x"
                                    $header =~ s/\s+//xg; #Regular expression without "/x"

                                    if ($DEBUG) { print "\t Alias has no valid members : skipping invalid alias at line number $lineCounter\n"; }
                                    my ($filename, $line_number, $master_text) = get_line_location_text($sudoers_line); #Sub called with "&"
                                    IssueNote($header, $line_number, "User_Alias", "Contains no valid User_Aliases or groups or userids",$master_text, $filename,'SFIT4755'); #Sub called with "&"
                                }
                                next;
                            }

                        }
                        elsif($secondWord !~ /_ADM.*/ and $secondWord !~ /_ADM\s*$/x) #Regular expression without "/x" 
                        {
                            # we have an alias that contains no valid members
                            #push(@remove_lines, $lineCounter);
                            if($EXTENDED_CHECK_USER)
                            {
                                ($header, $line2) = split /=/x, $line, 2; #Regular expression without "/x"
                                $header =~ s/User_Alias//x; #Regular expression without "/x"
                                $header =~ s/\s+//xg; #Regular expression without "/x"

                                if ($DEBUG) { print "\t Alias has no valid members : skipping invalid alias at line number $lineCounter\n"; }
                                my ($filename, $line_number, $master_text) = get_line_location_text($sudoers_line); #Sub called with "&"
                                IssueNote($header, $line_number, "User_Alias", "Contains no valid User_Aliases or groups or userids",$master_text, $filename,'SFIT4755'); #Sub called with "&"
                            }
                            next;
                        }
                    }
                    elsif( $case_insensitive_user  == 1 && $case_insensitive_group  == 0)
                    {
                        if ($UpdatedLine)
                        {
                            $line = $UpdatedLine;
                            push(@User_Alias,$line);
                            if ($DEBUG) { print "...updated line=$UpdatedLine\n"; }
                            my($temp, $orig_line) = split(/=/x, $UpdatedLine,2); #Regular expression without "/x"
                            my @cmd= (split(/,/x, $orig_line)); #Regular expression without "/x"
                            
                            foreach my $ab(@cmd)
                            { 
                                if(grep({ /^\s*\Q$ab\E\s*$/xi} keys %users)) #Regular expression without "/x" 
                                {   
                                    $matched_user=1; 
                                    
                                }
                            }
                            if($matched_user ==0 and $secondWord !~ /(?:_ADM.*|_ADM\s*$)/x) #ProhibitUnusedCapture #Regular expression without "/x" 
                            {
                                if($EXTENDED_CHECK_USER)
                                {
                                    ($header, $line2) = split /=/x, $line, 2; #Regular expression without "/x"
                                    $header =~ s/User_Alias//x; #Regular expression without "/x"
                                    $header =~ s/\s+//xg; #Regular expression without "/x"

                                    if ($DEBUG) { print "\t Alias has no valid members : skipping invalid alias at line number $lineCounter\n"; }
                                    my ($filename, $line_number, $master_text) = get_line_location_text($sudoers_line); #Sub called with "&"
                                    IssueNote($header, $line_number, "User_Alias", "Contains no valid User_Aliases or groups or userids",$master_text, $filename,'SFIT4755'); #Sub called with "&"
                                }
                                next;
                            }

                        }
                        elsif($secondWord !~ /_ADM.*/ and $secondWord !~ /_ADM\s*$/x) #Regular expression without "/x" 
                        {
                            # we have an alias that contains no valid members
                            #push(@remove_lines, $lineCounter);
                            if($EXTENDED_CHECK_USER)
                            {
                                ($header, $line2) = split /=/x, $line, 2; #Regular expression without "/x"
                                $header =~ s/User_Alias//x; #Regular expression without "/x"
                                $header =~ s/\s+//xg; #Regular expression without "/x"

                                if ($DEBUG) { print "\t Alias has no valid members : skipping invalid alias at line number $lineCounter\n"; }
                                my ($filename, $line_number, $master_text) = get_line_location_text($sudoers_line); #Sub called with "&"
                                IssueNote($header, $line_number, "User_Alias", "Contains no valid User_Aliases or groups or userids",$master_text, $filename,'SFIT4755'); #Sub called with "&"
                            }
                            next;
                        }

                    }
                    else
                    {
                        # old code i.e. before insensitive change
                        # if ($UpdatedLine)
                        # {
                            # $line = $UpdatedLine;
                            # push(@User_Alias,$line);
                            # if ($DEBUG) { print "...updated line=$UpdatedLine\n"; }

                        # }
                        # elsif($secondWord !~ /_ADM.*/ and $secondWord !~ /_ADM\s*$/)
                        # {
                            # # we have an alias that contains no valid members
                            # #push(@remove_lines, $lineCounter);
                            # if($EXTENDED_CHECK_USER)
                            # {
                                # ($header, $line2) = split /=/, $line, 2;
                                # $header =~ s/User_Alias//;
                                # $header =~ s/\s+//g;

                                # if ($DEBUG) { print "\t Alias has no valid members : skipping invalid alias at line number $lineCounter\n"; }
                                # my ($filename, $line_number, $master_text) = get_line_location_text($sudoers_line); #Sub called with "&"
                                # IssueNote($header, $line_number, "User_Alias", "Contains no valid User_Aliases or groups or userids",$master_text, $filename,'SFIT4755'); #Sub called with "&"
                            # }
                            # next;
                        # }
                        if ($UpdatedLine)
                        {
                            $line = $UpdatedLine;
                            push(@User_Alias,$line);
                            if ($DEBUG) { print "...updated line=$UpdatedLine\n"; }
                            my($temp, $orig_line) = split(/=/x, $UpdatedLine,2); #Regular expression without "/x"
                            my @cmd= (split(/,/x, $orig_line)); #Regular expression without "/x"
                            
                            foreach my $ab(@cmd)
                            { 
                                if(grep({ /^\s*\Q$ab\E\s*$/x} keys %users)) #Regular expression without "/x" 
                                {   
                                    $matched_user=1; 
                                    
                                }
                            }
                            if($matched_user ==0 and $secondWord !~ /(?:_ADM.*|_ADM\s*$)/x)  #Regular expression without "/x" #ProhibitUnusedCapture
                            {
                                if($EXTENDED_CHECK_USER)
                                {
                                    ($header, $line2) = split /=/x, $line, 2; #Regular expression without "/x"
                                    $header =~ s/User_Alias//x; #Regular expression without "/x"
                                    $header =~ s/\s+//xg; #Regular expression without "/x"

                                    if ($DEBUG) { print "\t Alias has no valid members : skipping invalid alias at line number $lineCounter\n"; }
                                    my ($filename, $line_number, $master_text) = get_line_location_text($sudoers_line); #Sub called with "&"
                                    IssueNote($header, $line_number, "User_Alias", "Contains no valid User_Aliases or groups or userids",$master_text, $filename,'SFIT4755'); #Sub called with "&"
                                }
                                next;
                            }

                        }
                        elsif($secondWord !~ /_ADM.*/ and $secondWord !~ /_ADM\s*$/x) #Regular expression without "/x" 
                        {
                            # we have an alias that contains no valid members
                            #push(@remove_lines, $lineCounter);
                            if($EXTENDED_CHECK_USER)
                            {
                                ($header, $line2) = split /=/x, $line, 2; #Regular expression without "/x"
                                $header =~ s/User_Alias//x; #Regular expression without "/x"
                                $header =~ s/\s+//xg; #Regular expression without "/x"

                                if ($DEBUG) { print "\t Alias has no valid members : skipping invalid alias at line number $lineCounter\n"; }
                                my ($filename, $line_number, $master_text) = get_line_location_text($sudoers_line); #Sub called with "&"
                                IssueNote($header, $line_number, "User_Alias", "Contains no valid User_Aliases or groups or userids",$master_text, $filename,'SFIT4755'); #Sub called with "&"
                            }
                            next;
                        }
                        
                    }

                    # look for other include User_aliases
                    ($header, $line2) = split /=/x, $line, 2; #Regular expression without "/x"
                    $header =~ s/User_Alias//x; #Regular expression without "/x"
                    $header =~ s/\s+//xg; #Regular expression without "/x"

                    foreach (split(/,/x, $line2)) #Regular expression without "/x"
                    {
                        $TESTSTR = trim($_); #Sub called with "&"
                        if ($DEBUG) { print "\t\tcheck $TESTSTR\n"; }

                        # does the list reference another User_Alias?
                        #       use last definition in case there are multiples
                        @ALIASLINE = (grep({ /^User_Alias\s+\Q$TESTSTR\E=/x } @sudoers_file))[-1]; #require block grep #Regular expression without "/x" 

                        if (@ALIASLINE)
                        {
                            $ALINE = (split(/=/x, join(" ", @ALIASLINE), 2))[1]; #pankaj #Regular expression without "/x"
                            ($header, $line2) = split(/=/x, $line, 2); #pankaj #Regular expression without "/x"
                            $line2 =~ s/$_/$ALINE/x; #Regular expression without "/x"
                            $line = $header . "=" . $line2;
                            $DONE = 0;                        # since we found an imbedded User_alias, check the line again

                            if ($DEBUG)
                            {
                                print "\t\t\tline contains an alias=@ALIASLINE\n";
                                print "\t\t\tALINE=$ALINE\n";
                                print "\t\t\theader=$header\n";
                                print "\t\t\tline2=$line2\n";
                                print "\t\t\tDONE=$DONE\n";
                                print "\t\t\tnew line=$line\n";
                            }
                        }
                        else
                        {
                            # if the user is an ibmer then any issues found on line are a deviation
                            if ($IBMIDLIST{$TESTSTR})
                            {
                                $SEVERITY_LIST{$linehdr} = "DEVIATION";
                                if ($DEBUG) { print "\t\t\t'$TESTSTR' is IBM ID, SEVERITY_LIST{$linehdr}=$SEVERITY_LIST{$linehdr}\n"; }
                            }
                        }
                    }    # end check for an imbeded user_alias

                    # -------------------------------------------------------------- #
                    # Cmnd_Alias :                                                   #
                    # Cmnd_Alias cannot specify a host, therefore valid on all hosts #
                    # Cmnd_Alias can include another Cmnd_Alias                      #
                    # -------------------------------------------------------------- #
                }
                elsif ($firstWord =~ /Cmnd_Alias/)
                {
                    push(@Cmnd_Alias,$line);    
                    $SEVERITY_LIST{$linehdr} = "DEVIATION";
                    if ($DEBUG) { print "\t\t\tCmnd_Alias gets full deviation, SEVERITY_LIST{$linehdr}=$SEVERITY_LIST{$linehdr}\n"; }

                    ($header, $line2) = split(/=/x, $line, 2); #Regular expression without "/x"
                    ($Cmnd_Alias_str, $name) = split(/\s+/x, $header); #Regular expression without "/x"
                    @USED = grep({ !/Cmnd_Alias/x } (grep({ /[=,\s!]+$name(([\s,]+)|($))/x } @sudoers_file))); #Regular expression without "/x"  #require block grep
                    if (!@USED)
                    {
                        @USED = grep({ /[=,\s]+$name(([\s,]+)|($))/x } @sudoers_file); #Regular expression without "/x" #require block grep
                        @USED = grep({ !/^Cmnd_Alias\s+$name=/x } @USED);#require block grep #Regular expression without "/x" 
                        if($#USED<0)
                        {
                            ##changes for defect 198095
                            next if($header =~ m/IBM_NONE_ALL/);
                            next if($header =~ m/IBM_ALL_NEG/);
                            # can't remove unused Cmnd_alias since we check contents in SFIT4360/SFIT4364
                            # push(@remove_lines, $lineCounter);
                            if ($DEBUG) { print "\tAlias is never used : skipping invalid alias at line number $lineCounter\n"; }
                            my ($header_name, $cmnd_alias_name) = split(/Cmnd_Alias\s+/x, $header, 2); #Regular expression without "/x"
                            if(!(($template_check==1) && (grep({ /\Q$cmnd_alias_name\E/x } @IBM_ALL_NEG_Array))))#require block grep #Regular expression without "/x" 
                            {
                                my ($filename, $line_number, $master_text) = get_line_location_text($sudoers_line); #Sub called with "&"
                                IssueWarning($header, $line_number, "$header", "'$header' is never used", $master_text, $filename, 'SFIT4755'); #Sub called with "&"
                            }   
                            next;
                        }
                    }

                    $line2 =~ s/\\,//xg; #Regular expression without "/x"
                    foreach (split(/,/x, $line2)) #Regular expression without "/x"
                    {                       
                        $TESTSTR = trim($_); #Sub called with "&"
                        $TESTSTR =~ s/!\s*//xg;   #Regular expression without "/x"                    
                        if ($DEBUG) { print "\t\tcheck $TESTSTR\n"; }

                        # if string contain a '/' then it is a command not another alias so we don't have to check it
                        if ($TESTSTR =~ /\//x or $TESTSTR =~ /^\s*sudoedit(\s|$)/x) #Regular expression without "/x" 
                        {
                            if ($DEBUG) { print "\t\t\tcommand...do not need to check\n"; }
                            next;
                        }

                        # does the list reference another Cmnd_Alias?
                        #       use last definition in case there are multiples
                        @ALIASLINE = (grep({ /^Cmnd_Alias\s+\Q$TESTSTR\E\s*=/x } @sudoers_file))[-1];  #Regular expression without "/x"  #require block grep      

                        if (@ALIASLINE)
                        {
                            $ALINE = (split(/=/x, join(" ", @ALIASLINE), 2))[1];  #pankaj #Regular expression without "/x"
                            ($header, $line2) = split(/=/x, $line, 2); #pankaj #Regular expression without "/x"
                            $line2 =~ s/$_/$ALINE/x; #Regular expression without "/x"
                            $line2 =~ s/^,//x; #Regular expression without "/x"
                            $line = $header . "=" . $line2;
                            $DONE = 0;                        # since we found an imbedded Cmnd_alias, check the line again

                            if ($DEBUG)
                            {
                                print "\t\t\tline contains an alias=@ALIASLINE\n";
                                print "\t\t\tALINE=$ALINE\n";
                                print "\t\t\theader=$header\n";
                                print "\t\t\tline2=$line2\n";
                                print "\t\t\tHAS_COMMAND=$HAS_COMMAND\n";
                                print "\t\t\tDONE=$DONE\n";
                                print "\t\t\tnew line=$line\n";
                            }
                        }
                        else
                        {
                            if ($TESTSTR !~ /sudoedit/)
                            {
                                # bad reference, remove from string
                                $line2 =~ s/\Q$TESTSTR\E$//x;  #Regular expression without "/x"   # remove if at end of string
                                $line2 =~ s/\Q$TESTSTR\E,//x; #Regular expression without "/x"   # remove if at beginning/middle of string
                                $line2 =~ s/^,//x; #Regular expression without "/x"
                                $line2 = trim($line2); #Sub called with "&"
                                $line  = $header . "=" . $line2;
                                if ($DEBUG)
                                {
                                    print "\t\t\tbad reference..remove from entry\n";
                                    print "\t\t\tline2=$line2\n";
                                    print "\t\t\tline=$line\n";
                                }

                                #IssueWarning("SFIT4755;'$TESTSTR' referenced in '$header' is not a valid Cmnd_Alias; LINE '$linehdr' \n"); #Sub called with "&"
                                # Changes related to template mode for Enhancement 293931 & Defect 291226   
                                if(($template_check!=1) && (!grep({ /^\Q$name\E$/x } @IBM_ALL_NEG_Array)) && ($TESTSTR !~ /\d+\\/x) && ($TESTSTR !~ /^\*$/x ))#require block grep #Regular expression without "/x" 
                                {
                                    my ($filename, $line_number, $master_text) = get_line_location_text($sudoers_line); #Sub called with "&"
                                    IssueWarning($header, $line_number, "$TESTSTR", "'$TESTSTR' referenced in '$header' is not a valid Cmnd_Alias",$master_text, $filename, 'SFIT4755'); #Sub called with "&"
                                }                                
                            }
                        }
                        $line = trim($line); #Sub called with "&"
                    }
                    if ($line =~ /=$/x) #Regular expression without "/x"
                    {

                        # we have an alias that contains no valid members
                        push(@remove_lines, $lineCounter);
                        if ($DEBUG) { print "\t Alias has no valid members : skipping invalid alias at line number $lineCounter\n"; }

                        #IssueWarning("SFIT4755; '$header' has no valid Cmnd_Aliases or commands; LINE '$linehdr'\n"); #Sub called with "&"
                        my ($filename, $line_number, $master_text) = get_line_location_text($sudoers_line); #Sub called with "&"
                        IssueWarning($header, $line_number, "$header", "'$header' has no valid Cmnd_Aliases or commands", $master_text, $filename, #Sub called with "&"
                                      'SFIT4755');

                        next;
                    }

                    #} # end check for an imbeded Cmnd_alias
                }    # end specific type checks

                if ($DONE)
                {
                    my @firstWord = \$firstWord;
                     push(@firstWord,$line);                                        #strict_use
                    if ($DEBUG) { print "...added line to $firstWord array\n"; }
                }
            }
            elsif ($firstWord =~ /^%/x) #Regular expression without "/x"
            {
                if ( $case_insensitive_user  == 1 && $case_insensitive_group == 1  )  # both group or usercase-insenstivity is enabled. 
                {
                    $tmpLine = expand_useralias_groups_insensitive("TempLine=" . $line,0);
                }
                elsif( $case_insensitive_group  == 1 ) #group enabled
                {
                     $tmpLine = expand_useralias_groups_insensitive("TempLine=" . $line,0);
                }
                else #user enabled or both user and group disabled
                {
                    $tmpLine = expand_useralias_groups("TempLine=" . $line,0);
                }
                #$tmpLine = expand_useralias_groups("TempLine=" . $line,0);
                $tmpLine =~ s/^TempLine=//x; #Regular expression without "/x"
                
                if ($DEBUG)
                {
                    print "\tline is a group definition\n";
                    print "\t'$firstWord' expands to '$tmpLine'\n";
                }
                foreach (split(/,/x, $tmpLine)) #Regular expression without "/x"
                {
                    $_ = trim($_); #Sub called with "&"
                    if ($IBMIDLIST{$_})
                    {
                        $SEVERITY_LIST{$linehdr}   = "DEVIATION";
                        $SEVERITY_LIST{$firstWord} = "DEVIATION";
                        if ($DEBUG) { print "\t\t'$firstWord' is IBM ID, SEVERITY_LIST{$linehdr}=$SEVERITY_LIST{$linehdr}\n"; }
                        last;
                    }
                }

            }
            else
            {
                if ($DEBUG) { print "\tline does not contain a linetype\n"; }

                # user line => if the user is an ibmer then any issues found on line are a deviation
                if (($IBMIDLIST{$firstWord}) || ($firstWord =~ /ALL/))
                {
                    $SEVERITY_LIST{$linehdr}   = "DEVIATION";
                    $SEVERITY_LIST{$firstWord} = "DEVIATION";
                    if ($DEBUG) { print "\t\t'$firstWord' is IBM ID, SEVERITY_LIST{$linehdr}=$SEVERITY_LIST{$linehdr}\n"; }
                }

            }
        }    # while still look at this line
        if ($sudoers_line ne $line)
        {
            update_line_location($sudoers_line, $line); #Sub called with "&"
        }
    }    # for each line in sudoers

    RemoveLinesFromSudoerArray(); #Sub called with "&"
    if ($DEBUG)
    {
        print "\nLOAD OTHER ALIASES:\n";
        print "\tDEFAULTS ARRAY:\n";
        foreach (@Defaults)
        {
            print "\t\tDefaults => $_\n";
        }
        print "\tRUNAS_ALIAS ARRAY:\n";
        foreach (@Runas_Alias)
        {
            print "\t\tRunas_Alias => $_\n";
        }
        print "\tUSER_ALIAS ARRAY:\n";
        foreach (@User_Alias)
        {
            print "\t\tUser_Alias => $_\n";
        }
        print "\tCMND_ALIAS ARRAY:\n";
        foreach (@Cmnd_Alias)
        {
            print "\t\tCmnd_Alias => $_\n";
        }

        print "\tSEVERITY_LIST ARRAY:\n";
        foreach (sort keys %SEVERITY_LIST)
        {
            print "\t\tSEVERITY_LIST{$_}=$SEVERITY_LIST{$_}\n";
        }
    }
    return ;##require final return
}

###################################################################################
# IsUserUsed($) : determines if the user alias passed to this subroutine is used  #
#          in a non-negative sense (ie, the alias is actually used and not #
#          just a !username).                                              #
#                                          #
#    Returns : 1 if used                              #
#          0 is not used                              #
###################################################################################
sub IsUserUsed
{
my($myUser,$myHosts)=@_; #require argument unpacking
    my $FoundHost;
    my @USED;
    $FoundHost = 0;

    if ($DEBUG)
    {
        print "In ISUSERUSED\n";
        print "\t..myUser=$myUser\n";
        print "\t..myHosts=$myHosts\n";
    }

    # ------------------------------------------------------------------------------------------------- #
    # if there are specific hosts specified                                                             #
    #    if User's Host List is a list of Host_aliases, if the current server is in the            #
    #        Host_Alias: set FoundHost to 1.                                #
    #    if current hostname is not in User's Host list, it is not valid for this server             #
    #    if current hostname is in User's Host List, it is valid for this server, set FoundHost to 1 #
    # ------------------------------------------------------------------------------------------------- #
    if ($myHosts)
    {
        $myHosts =~ s/,/ /xg;     #Regular expression without "/x" # convert commas to spaces
        # is  myHosts a list of Host_Aliase that might contain the current host?
        foreach my $entry (split(/ /, $myHosts))
        {
            if ($DEBUG) { print "\tentry=|$entry|\n"; }
            if ($Host_Aliases{$entry})
            {
                if ($DEBUG) { print "\tentry is a Host_Aliases=$Host_Aliases{$entry}\n"; }
                if (($Host_Aliases{$entry} =~ /$ShortHostName/x) or ($Host_Aliases{$entry} =~ /ALL/)) #Regular expression without "/x" 
                {
                    if ($DEBUG) { print "\t$ShortHostName is in Host_Alias $Host_Aliases{$entry}\n"; }
                    $FoundHost = 1;
                    last;
                }
                else
                {
                    if ($DEBUG) { print "\t$ShortHostName is NOT Host_Alias $Host_Aliases{$entry}\n"; }
                }
            }
            else
            {
                if ($DEBUG) { print "\tentry is NOT a Host_Aliases\n"; }
            }
        }

        $myHosts = " $myHosts ";    # add beginning and ending spaces so that we can test on " $ShortHostName "

        # is myHosts a list of actual Hostnames that contain the current host?
        if (($myHosts =~ /\sALL\s/x) || ($myHosts =~ /\s$ShortHostName\s/x)) #Regular expression without "/x" 
        {
            if ($DEBUG) { print "\thostname ($ShortHostName) in myHosts($myHosts)\n"; }
            $FoundHost = 1;
        }
    }
    else
    {
        # ---------------------------------------------------------- #
        # if no host is specified, it is always active - same as ALL #
        # ---------------------------------------------------------- #
        $FoundHost = 1;
    }

    # -------------------------------------------------------------------------------- #
    # if FoundHost = 0, the command is not valid for this server, return 0.            #
    # if FoundHost = 1, the command is valid for this server, continue to check usage. #
    # -------------------------------------------------------------------------------- #
    if (!$FoundHost)
    {
        if ($DEBUG) { print "\tUser $myUser not valid for this hostname ($ShortHostName)\n"; }
        return 0;
    }
    else
    {
        if ($DEBUG) { print "\tUser $myUser is valid for this hostname ($ShortHostName)\n"; }
    }

    # is $user used in a non-negation? ie, does command actually get executed?
    # @USED = bq grep -v "^#" $configfile bq;       # remove comment line from /etc/sudoers #backquote
    my $configfile_lines_fh = IO::File->new("$configfile", "<") or die "Could not open file '$configfile' $!";  #prohibit indirect syntax
    my @configfile_lines_arr=();
    while (my $line = <$configfile_lines_fh>)
    {    
        push(@configfile_lines_arr,$line);
    }
    $configfile_lines_fh->close();
    
    @USED = grep({!/^\#/x } @configfile_lines_arr);  #Regular expression without "/x"   #require block grep 
    @USED = grep({ /$myUser/x } @USED);     #Regular expression without "/x"#require block grep       # keep remaining lines that use non-negated user name
    @USED = grep({ !/^Cmnd_Alias/x } @USED);  #Regular expression without "/x"#require block grep
    @USED = grep({ !/!$myUser/x } @USED);   #Regular expression without "/x"       # remove lines that only use negated user name#require block grep

    if ($DEBUG) { print "\tUSED=\n@USED|\n"; }

    if (@USED)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

##################################################################
# load_Group_Alias_Array($test) : loads groups that are valid    #
# system groups with defined userids into the @Group_Alias array #
##################################################################
sub load_Group_Alias_Array
{
    my($test,$sudoers_line)=@_; ###require argument unpacking 
#    $test = $_[0];    # never used...what is this for?
    my ($line); #Reused variable name in lexical scope
    if ($DEBUG) { print "\nIN LOAD_GROUP_ALIAS_ARRAY\n"; }
    if ($group_mbrs_4756)
    {
        my ($user_entry, $next) = split(/,/x, $group_mbrs_4756, 2); #Regular expression without "/x"
        $group_mbrs_4756 = $next;
        if(!defined $next){$next="";}
        chomp($user_entry, $next);
        if ($DEBUG)
        {
            print "\t\tuser_entry=$user_entry\n";
            print "\t\tnext=$next|\n";
            #print "\t\tgroup_mbrs=$group_mbrs_4756\n";
        }

        if ((defined $user_entry) && (defined $users{$user_entry}) &&($user_entry eq $users{$user_entry}))
        {
            $line = "$group_alias_name_4756:$user_entry\t$entries_4756";
            push(@Group_Alias, $line);
            while ($next)
            {
                ($user_entry, $next) = split(/,/x, $group_mbrs_4756, 2); #Regular expression without "/x"
                $group_mbrs_4756 = $next;
                if(defined $next){chomp($user_entry, $next);}

                if ($user_entry eq $users{$user_entry})
                {
                    $line = "$group_alias_name_4756:$user_entry\t$entries_4756";
                    push(@Group_Alias, $line);
                }
                elsif (!$MASTERFILE)
                {
                    my ($filename, $line_number, $master_text) = get_line_location_text($sudoers_line); #Sub called with "&"
                    IssueNote($group_header, "$line_number", "$user_entry", "User $user_entry does not exist!", $master_text, $filename, 'SFIT4756'); #Sub called with "&"
                }
            }
        }
        elsif (($user_entry =~ /^p\//x) || ($user_entry =~ /^c\//x)) #Regular expression without "/x"
        {
            if ($DEBUG) { print "\t\t\t'$user_entry' is GSA entry\n"; }
            $line = "$group_alias_name_4756:$user_entry\t$entries_4756";
            push(@Group_Alias, $line);
        }
        elsif (!$MASTERFILE)
        {   
            my @netgroups_from_sudoers_file = grep({ /%_PLUS_/x } @sudoers_file);#require block grep #Regular expression without "/x"
            $group_header =~ s/%//x;  #Regular expression without "/x"
            if (grep { /%_PLUS_$group_header/x} @netgroups_from_sudoers_file)#require block grep #Regular expression without "/x"
            {
                $group_header = '+'.$group_header;
                $sudoers_line =~ s/%/%_PLUS_/x;   #Regular expression without "/x"                
            }
            else
            {
                $group_header = '%'.$group_header;                                      
            }
            my ($filename, $line_number, $master_text) = get_line_location_text($sudoers_line); #Sub called with "&"
            IssueNote($group_header, "$line_number", "$user_entry", "User $user_entry does not exist!", $master_text, $filename, 'SFIT4756');           #Sub called with "&"
        }
    }
return ;##require final return
}
sub load_Group_Alias_Array_insensitive
{
    my($test,$sudoers_line)=@_; ###require argument unpacking 
#    $test = $_[0];    # never used...what is this for?
    my ($line); #Reused variable name in lexical scope
    if ($DEBUG) { print "\nIN LOAD_GROUP_ALIAS_ARRAY\n"; }
    
    if ($group_mbrs_4756)
    {
        my ($user_entry, $next) = split(/,/x, $group_mbrs_4756, 2); #Regular expression without "/x"
        if(defined $next)
        {
        $group_mbrs_4756 = $next;
        }
        #chomp($user_entry, $next);
        if(defined $user_entry){chomp($user_entry);}
        if(defined $next){ chomp($next);}
        if ($DEBUG)
        {
            if(defined $user_entry){print "\t\tuser_entry=$user_entry\n";}
            if(defined $next){print "\t\tnext=$next|\n";}
             if(defined $group_mbrs_4756){print "\t\tgroup_mbrs=$group_mbrs_4756\n";}
        }
        
        my @insensitive_users = grep{/^\Q$user_entry\E$/ix} keys %users; #Regular expression without "/x"
        my $users_found=0;
        foreach my $usr (@insensitive_users)
        {
            if ($usr eq $users{$usr})
            {
                $users_found=1;
                last;
            }
        }
        #if ($user_entry eq $users{$user_entry})
        if($users_found==1)
        {
            $line = "$group_alias_name_4756:$user_entry\t$entries_4756";
            push(@Group_Alias, $line);
            while ($next)
            {
                ($user_entry, $next) = split(/,/x, $group_mbrs_4756, 2); #Regular expression without "/x"
                $group_mbrs_4756 = $next;
                if(defined $next)
                {
                chomp($user_entry, $next);
                }
                my @insensitive_users1 = grep{/^\Q$user_entry\E$/ix} keys %users;  #Regular expression without "/x" #Reused variable name in lexical scope
                $users_found=0; #Reused variable name in lexical scope
                foreach my $usr (@insensitive_users1)
                {
                    if ($usr eq $users{$usr})
                    {
                        $users_found=1;
                        last;
                    }
                }
                
                if($users_found==1)
                #if ($user_entry eq $users{$user_entry})
                {   
                    $line = "$group_alias_name_4756:$user_entry\t$entries_4756";
                    push(@Group_Alias, $line);
                }
                elsif (!$MASTERFILE)
                {
                    my ($filename, $line_number, $master_text) = get_line_location_text($sudoers_line); #Sub called with "&"
                    IssueNote($group_header, "$line_number", "$user_entry", "User $user_entry does not exist!", $master_text, $filename, 'SFIT4756'); #Sub called with "&"
                }
            }
        }
        elsif (($user_entry =~ /^p\//x) || ($user_entry =~ /^c\//x)) #Regular expression without "/x"
        {
            if ($DEBUG) { print "\t\t\t'$user_entry' is GSA entry\n"; }
            $line = "$group_alias_name_4756:$user_entry\t$entries_4756";
            push(@Group_Alias, $line);
        }
        elsif (!$MASTERFILE)
        {   
            my @netgroups_from_sudoers_file = grep({ /%_PLUS_/x } @sudoers_file); #Regular expression without "/x"#require block grep
            $group_header =~ s/%//x;  #Regular expression without "/x"
            if (grep { /%_PLUS_$group_header/x} @netgroups_from_sudoers_file) #Regular expression without "/x" #require block grep
            {
                $group_header = '+'.$group_header;
                $sudoers_line =~ s/%/%_PLUS_/x;    #Regular expression without "/x"               
            }
            else
            {
                $group_header = '%'.$group_header;                                      
            }
            my ($filename, $line_number, $master_text) = get_line_location_text($sudoers_line); #Sub called with "&"
            IssueNote($group_header, "$line_number", "$user_entry", "User $user_entry does not exist!", $master_text, $filename, 'SFIT4756');        #Sub called with "&"   
        }
    }
return ;##require final return
}

#########################################################################################################
# load_host_aliases : Create an array of hostnames contained within each host alias keeping only the    #
#              valid Host_Alias names                                #
#            - Invalid Host_Alias lines are removed from the @sudoers_file array as well.    #
#########################################################################################################
sub load_host_aliases
{
    my $line2;
    my $header;
    my $linecnt      = 0;
    my $DONE;

    $Host_Aliases{ALL} = "All";    # save this alias entry as default.
    if ($DEBUG)
    {
        print "\nIN LOAD_HOST_ALIASES\n";
        print "Host_Aliases{ALL}=$Host_Aliases{ALL}\n\n";
    }

    foreach my $line (@sudoers_file)
    {
        $DONE = 0;
        while (!$DONE)
        {
            $DONE = 1;
            if ($line =~ /Host_Alias/x) #Regular expression without "/x"
            {
                ($header, $line2) = split /=/x, $line, 2; #Regular expression without "/x"
                $header =~ s/Host_Alias//x; #Regular expression without "/x"
                $header =~ s/\s+//xg; #Regular expression without "/x"
                ### Changes for Task 208780
                $line2 =~ s/\+[a-zA-Z0-9]+/ALL/xg; #Regular expression without "/x"
                if ($DEBUG)
                {
                    print "\nline=$line\n";
                    print "\theader=$header|\n";
                    print "\tline2=$line2 \n";
                }

                # at least one host in list (line2) is the host
                if (($line2 =~ /$ShortHostName/x) or ($line2 =~ /ALL/x)) #Regular expression without "/x"
                {
                    $line2=~s/\s+//xg;#Regular expression without "/x"
                    $Host_Aliases{$header} = $line2;    # save this alias entry
                    if ($DEBUG) { print "\t\tkeeping Host_Aliases{$header}=$Host_Aliases{$header}\n"; }
                }
                else
                {
                    foreach (split(/,/x, $line2)) #Regular expression without "/x"
                    {
                        my $TESTSTR = trim($_); #Sub called with "&"
                        if ($DEBUG) { print "\t\tcheck $TESTSTR\n"; }

                        # does the list reference another Host_Alias?
                        #     use last definition in case there are multiples
                        #my @ALIASLINE = (grep(/^Host_Alias\s+$TESTSTR=/, @sudoers_file))[-1];
                        my @ALIASLINE = (grep({ /^Host_Alias\s+\Q$TESTSTR\E=/x } @sudoers_file))[-1]; #Regular expression without "/x"#require block grep
                        if (@ALIASLINE)
                        {
                            my $ALINE = (split(/=/x, join(" ", @ALIASLINE), 2))[1]; #pankaj #Regular expression without "/x"
                            ($header, $line2) = split(/=/x, $line, 2); #pankaj #Regular expression without "/x"
                            $line2 =~ s/$_/$ALINE/x; #Regular expression without "/x"
                            $line = $header . "=" . $line2;
                            $DONE = 0;
                            if ($DEBUG)
                            {
                                print "\t\t\tline contains an alias=@ALIASLINE\n";
                                print "\t\t\tALINE=$ALINE\n";
                                print "\t\t\theader=$header\n";
                                print "\t\t\tline2=$line2\n";
                                print "\t\t\tDONE=$DONE\n";
                                print "\t\t\tnew line=$line\n";
                            }
                        }
                    }
                }
            }
        }
        $linecnt = $linecnt + 1;
    };    # end of loop loading array

    # ----------------------------------------------------------------------- #
    # remove the invalid host alias lines from the sudoers_file array so that #
    #       we don't use them as valid "use" lines                            #
    # ----------------------------------------------------------------------- #
    RemoveLinesFromSudoerArray(); #Sub called with "&"
    return ;##require final return
}    # end of sub

################################################################################
# expand_useralias_groups :  Expand any user aliases that have a % group       #
#     reference in it.  Pick up the user names for that group from the       #
#    groups file, plus those who have it as their primary gid in            #
#    /etc/passwd. then put it back in the array as if it was a list of ids. #
#                                           #
# for this we use %User_Alias_hash, which is the most complete                 #
# list of users in a given useralias                                           #
################################################################################
sub expand_useralias_groups
{

    my $alias_line;
    my $orig_line;
    my $orig_header;
    my $user_alias_name;
    my $entries;
    my $group_name;
    my $rest;
    my $value;    
    my $firstWord;
    my $temp;
    my $target_gid;                     #strict_use
    my $more_folks;                     #strict_use
    my $user_alias_mbrs;                #strict_use
    

    $alias_line  = shift;
    my $violation_flag = shift;

    #handling parameter for group processing.
    if($alias_line =~ /TempLine=/x) #Regular expression without "/x"
    {
        ($temp, $orig_line) = split(/=/x, $alias_line,2); #Regular expression without "/x"
        $firstWord   = (split(/\s+/x, $orig_line, 2))[0]; #Regular expression without "/x"
        $orig_header = (split(/=/x  , $orig_line, 2))[0]; #Regular expression without "/x"
        $alias_line = $temp."=".$firstWord;     
    }
    
    #handling parameters for user_alias processing.
    else
    {
        $orig_line   = $alias_line;
        $orig_header = (split(/=/x, $orig_line, 2))[0]; #Regular expression without "/x"
    }
    $orig_header =~ s/User_Alias//xg; #Regular expression without "/x"
    if ($DEBUG)
    {
        print "\nIN EXPAND_USERALIAS_GROUP\n";
        print "\talias_line=$alias_line\n";
        print "\torig_line=$orig_line\n";
        print "\torig_header=$orig_header\n";
        print "\tviolation_flag:$violation_flag";
    }

    if ($DEBUG) { print "..alias_line=$alias_line\n"; }
    
    $alias_line =~ s/%_PLUS_/%/xg;  #Regular expression without "/x"  
    
    while ($alias_line =~ /%/x) #Regular expression without "/x"
    {

        ($user_alias_name, $entries) = split(/%/x, $alias_line, 2); #Regular expression without "/x"
        ($group_name,      $rest)    = split(/,/x, $entries,    2); #Regular expression without "/x"
        $group_name = strip_spaces($group_name); #Sub called with "&"
         
        if (!$groups{$group_name} && $gids{$group_name} && !$MASTERFILE)  #prohibit mixed boolean operators
        {
            $target_gid = $gids{$group_name};
            if(!$user_groups{$target_gid} && $orig_header !~ /_ADM.*/x &&  $orig_header !~ /_ADM\s*$/x) #Regular expression without "/x" #prohibit mixed boolean operators
            {
                my ($filename, $line_number, $master_text) = get_line_location_text($orig_line); #Sub called with "&"
                if($orig_header !~ /TempLine/x and $violation_flag == 1) #Regular expression without "/x"
                {
                    IssueNote($orig_header, $line_number, "$group_name", "group $group_name does not contain any user", $master_text, $filename, 'SFIT4757'); #Sub called with "&"
                }
                $RC = $RC + 10;
            }
        }
        if ($groups{$group_name})
        {
            if ($DEBUG) { print "\tmatch on groups{$group_name}\n"; }
            $group_mbrs = $groups{$group_name};
            $target_gid = $gids{$group_name};
            $more_folks = $user_groups{$target_gid};
            if ($more_folks) { $more_folks = ",$more_folks"; }
            if(!defined $more_folks){$more_folks="";}
            if ($rest)
            {
                $alias_line = $user_alias_name . $group_mbrs . $more_folks . "," . $rest;
            }
            else
            {
                $alias_line = $user_alias_name . $group_mbrs . $more_folks;
            }
        }
        elsif ($gids{$group_name})
        {
            if ($DEBUG) { print "\tmatch on gids{$group_name}\n"; }
            $target_gid = $gids{$group_name};
            $more_folks = $user_groups{$target_gid};
            if(!defined $more_folks){$more_folks="";}
            if ($rest)
            {
                $alias_line = $user_alias_name . $more_folks . "," . $rest;
            }
            else
            {
                $alias_line = $user_alias_name . $more_folks;
            }
        }
        elsif (($group_name =~ /^p\//x) || ($group_name =~ /^c\//x)) #Regular expression without "/x"
        {
            if ($DEBUG) { print "\t'$group_name' is a GSA group\n"; }
            $group_mbrs = $group_name;
            $target_gid = "GSA";
            $alias_line = $user_alias_name . $group_mbrs;
        }
        else
        {
            if (!$MASTERFILE)
            {
                $group_name =~ s/%_PLUS_/\+/xg; #Regular expression without "/x"
                $group_name =~ s/_PLUS_/\+/xg; #Regular expression without "/x"

                if($violation_flag == 1 and $orig_header !~ /_ADM.*/x and $orig_header !~ /_ADM\s*$/x) #Regular expression without "/x"
                {
                    my ($filename, $line_number, $master_text) = get_line_location_text($orig_line); #Sub called with "&"
                    my @netgroups_from_sudoers_file = grep({ /%_PLUS_/x } @sudoers_file);#require block grep #Regular expression without "/x"
                    my $groupStr;   
                    if (grep { /User_Alias.*%_PLUS_$group_name/x } @netgroups_from_sudoers_file)#require block grep #Regular expression without "/x"
                    {
                        $group_name = '+'.$group_name;                      
                        $groupStr="Netgroup";
                    }
                    else
                    {
                        $group_name = '%'.$group_name;                      
                        $groupStr="Group";
                    }
                    IssueNote($orig_header,$line_number,"$group_name","$groupStr $group_name does not exist!",$master_text,$filename,'SFIT4757');   #Sub called with "&"
                }

                $RC = $RC + 10;
               # a;
            }

            if (($user_alias_name =~ /=$/x) && ($rest)) #Regular expression without "/x"
            {
                $alias_line = $user_alias_name . $rest;
            }
            elsif ($rest)
            {
                $alias_line = $user_alias_name . "," . $rest;
            }
            else
            {
                $alias_line = $user_alias_name;
            }
        }
    }

    my @group = split(/=/x, $alias_line, 2); #Regular expression without "/x"
    my $user_alias_name_field = $group[0];
    my ($label, $user_alias_name1) = split(" ", $user_alias_name_field);
    $user_alias_mbrs = $group[1];
    $user_alias_mbrs = trim($user_alias_mbrs);    # remove any trailing spaces #Sub called with "&"
    $user_alias_mbrs =~ s/,$//x;  #Regular expression without "/x"                   # remove any trailing commas
    
    #create User_Alias_hash{useralias} entry with array
    if ($user_alias_mbrs)
    {
        if($violation_flag == 1)
        {
            $User_Alias_hash{$user_alias_name1} = $user_alias_mbrs;
            %User_Alias_hash_copy=%User_Alias_hash;
            if ($DEBUG)
            {
                print "\tadding $user_alias_name1 to User_Alias_hash\n";
                print "\t\tUser_Alias_hash{$user_alias_name1}=$User_Alias_hash{$user_alias_name1}\n";
            }
        }
    }
    else
    {
        if ($DEBUG && (defined $user_alias_name1)) { print "\tskipping '$user_alias_name1'. No valid entries\n"; }
        $alias_line = "";
    }

    $alias_line =~ s/,$//x; #Regular expression without "/x"
    return ($alias_line);
} 

sub expand_useralias_groups_insensitive
{

    my $alias_line="";
    my $orig_line;
    my $orig_header;
    my $user_alias_name="";
    my $entries;
    my $group_name;
    my $rest;
    my $value;    
    my $firstWord;
    my $temp;
    my $target_gid;                     #strict_use
    my $more_folks = "";                        #strict_use
    my $user_alias_mbrs;                #strict_use
    

    $alias_line  = shift;
    my $violation_flag = shift;

    #handling parameter for group processing.
    if($alias_line =~ /TempLine=/x) #Regular expression without "/x"
    {
        ($temp, $orig_line) = split(/=/x, $alias_line,2); #Regular expression without "/x"
        $firstWord   = (split(/\s+/x, $orig_line, 2))[0]; #Regular expression without "/x"
        $orig_header = (split(/=/x  , $orig_line, 2))[0]; #Regular expression without "/x"
        $alias_line = $temp."=".$firstWord;     
    }
    
    #handling parameters for user_alias processing.
    else
    {
        $orig_line   = $alias_line;
        $orig_header = (split(/=/x, $orig_line, 2))[0]; #Regular expression without "/x"
    }
    $orig_header =~ s/User_Alias//xg; #Regular expression without "/x"
    if ($DEBUG)
    {
        print "\nIN EXPAND_USERALIAS_GROUP\n";
        print "\talias_line=$alias_line\n";
        print "\torig_line=$orig_line\n";
        print "\torig_header=$orig_header\n";
        print "\tviolation_flag:$violation_flag";
    }
    if ($DEBUG) { print "..alias_line=$alias_line\n"; }
    my $rest4="";
    $alias_line =~ s/%_PLUS_/%/xg;   #Regular expression without "/x" 
    
    while ($alias_line =~ /%/x) #Regular expression without "/x"
    {
        my $rest1="";
        my $rest2="";
        my $rest3="";
        ($user_alias_name, $entries) = split(/%/x, $alias_line, 2); #Regular expression without "/x"
        my($k,$s) =split(/,/x, $entries,2); #Regular expression without "/x"
        if(!defined $s){$s="";}
        if(grep{/^\Q$k\E$/xi} keys %groups) #Regular expression without "/x"
        { 
            my @insensitive_groups = grep({/^\Q$k\E$/xi} keys %groups); #Regular expression without "/x"
            foreach my $grp (@insensitive_groups) 
            { 
                $group_name = strip_spaces($grp);   #Sub called with "&"
                $rest1=$rest1.",".$groups{$group_name}; 
                $rest3=$rest3.",".$rest1.",".$s;
                    
            }
            $rest3=~s/^\,*//xg; #Regular expression without "/x"
            
                
        }
        else
        {
            $rest3=$s;
            $group_name=$k;
            
        }
        my $group_found=0;
        my $group_found_gids=0;
        if(grep{/^\Q$group_name\E$/xi} keys %groups) #Regular expression without "/x"
        {
            my @insensitive_groups = grep{/^\Q$group_name\E$/ix} keys %groups; #Regular expression without "/x"
        
            foreach my $grp (@insensitive_groups)
            {
                if ($groups{$grp})
                { 
                    $group_found=1;
                    last;
                }
            }
        }
        if(grep{/\Q$group_name\E/xi} keys %gids) #Regular expression without "/x"
        {
            my @insensitive_groups_gids = grep{/^\Q$group_name\E$/ix} keys %gids; #Regular expression without "/x"
        
            foreach my $grp (@insensitive_groups_gids)
            {
                if ($gids{$grp})
                {
                    $group_found_gids=1;
                    last;
                }
            }
        }
        
        if ( $group_found != 1 && $group_found_gids==1 && !$MASTERFILE)
        #if (!$groups{$group_name} && $gids{$group_name} && !$MASTERFILE)  #prohibit mixed boolean operators
        { 
            $target_gid = $gids{$group_name};
            if(!$user_groups{$target_gid} && $orig_header !~ /_ADM.*/x &&  $orig_header !~ /_ADM\s*$/x)  #Regular expression without "/x"#prohibit mixed boolean operators
            {
                my ($filename, $line_number, $master_text) = get_line_location_text($orig_line); #Sub called with "&"
                if($orig_header !~ /TempLine/x and $violation_flag == 1) #Regular expression without "/x"
                {
                    IssueNote($orig_header, $line_number, "$group_name", "group $group_name does not contain any user", $master_text, $filename, 'SFIT4757'); #Sub called with "&"
                }
                $RC = $RC + 10;
                
            }
        }
        
        
            
        if ( $group_found ==1 )
        #if(grep{/$group_name/i} keys %groups) #groups{baigar}="" /enter
        #if ($groups{$group_name}) #groups{baigar}="" /not enter
        {   
            my @insensitive_groups = grep({/^\Q$group_name\E$/ix} keys %groups); #Regular expression without "/x"
            my $group_has_members=0;
            foreach my $grp (@insensitive_groups)
            {
                if($groups{$grp})
                {
                    my @uniqarray=();   
                    my @uniqarray1=();                      
                    if ($DEBUG) { print "\tmatch on groups{$group_name}\n"; }
                    $group_mbrs = $groups{$grp};
                    $target_gid = $gids{$grp};
                    $more_folks = $user_groups{$target_gid};
                    if ($more_folks) { $more_folks = ",$more_folks"; }
                    @uniqarray1=split(/,/x,$rest3); #Regular expression without "/x"
                    @uniqarray1=uniq(@uniqarray1);
                    $rest3=join(",", @uniqarray1);
                    if(!defined $more_folks){$more_folks="";}
                    if ($rest3)  
                    {
                        $alias_line = $user_alias_name . $group_mbrs . $more_folks . "," . $rest3;
                        #$alias_line = $user_alias_name . $group_mbrs . $more_folks . "," . $rest1  
                        my($first,$secondpart) = split(/=/x, $alias_line); #ProhibitAmbiguousNames #Regular expression without "/x"
                        @uniqarray=split(/,/x,$secondpart);  #Regular expression without "/x"#ProhibitAmbiguousNames
                        @uniqarray=uniq(@uniqarray);
                        $alias_line=$first."=".join(",", @uniqarray);
                        
                    }
                    else
                    {
                        $alias_line = $user_alias_name . $group_mbrs . $more_folks;
                        
                    }
                    
                }
            }
    
        }
        elsif($group_found_gids==1)
        #elsif(grep{/$group_name/i} keys %gids) #groups{baigar}=1088
        #elsif ($gids{$group_name})
        {
            my @insensitive_groups_gids = grep({/^\Q$group_name\E$/ix} keys %gids); #Regular expression without "/x"
            foreach my $grp (@insensitive_groups_gids)
            {
                if($gids{$grp})
                {   my @uniqarray=();
                    if ($DEBUG) { print "\tmatch on gids{$grp}\n"; }
                    $target_gid = $gids{$grp};
                    $more_folks = $user_groups{$target_gid};
                    if(!defined $more_folks){$more_folks="";}
                    if ($rest3)
                    {
                        $alias_line = $user_alias_name . $more_folks . "," . $rest3;
                        my($first,$secondpart) = split(/=/x, $alias_line); #ProhibitAmbiguousNames #Regular expression without "/x"
                        @uniqarray=split(/,/x,$secondpart);  #Regular expression without "/x"#ProhibitAmbiguousNames
                        @uniqarray=uniq(@uniqarray);
                        $alias_line=$first."=".join(",", @uniqarray);
                        
                    }
                    else
                    {$alias_line = $user_alias_name . $more_folks;
                    }
                }
            }
        }
        elsif (($group_name =~ /^p\//x) || ($group_name =~ /^c\//x)) #Regular expression without "/x"
        {
            if ($DEBUG) { print "\t'$group_name' is a GSA group\n"; }
            $group_mbrs = $group_name;
            $target_gid = "GSA";
            $alias_line = $user_alias_name . $group_mbrs;
        }
        else
        { 
            if (!$MASTERFILE)
            {
                $group_name =~ s/%_PLUS_/\+/xg; #Regular expression without "/x"
                $group_name =~ s/_PLUS_/\+/xg; #Regular expression without "/x"

                if($violation_flag == 1 and $orig_header !~ /_ADM.*/x and $orig_header !~ /_ADM\s*$/x) #Regular expression without "/x"
                {
                    my ($filename, $line_number, $master_text) = get_line_location_text($orig_line); #Sub called with "&"
                    my @netgroups_from_sudoers_file = grep({ /%_PLUS_/x } @sudoers_file); #Regular expression without "/x"#require block grep
                    my $groupStr;   
                    if (grep { /User_Alias.*%_PLUS_$group_name/x } @netgroups_from_sudoers_file) #Regular expression without "/x"#require block grep
                    {
                        $group_name = '+'.$group_name;                      
                        $groupStr="Netgroup";
                    }
                    else
                    {
                        $group_name = '%'.$group_name;                      
                        $groupStr="Group";
                    }
                    
                    IssueNote($orig_header,$line_number,"$group_name","$groupStr $group_name does not exist!",$master_text,$filename,'SFIT4757');   #Sub called with "&"
                }

                $RC = $RC + 10;
               
            }

            if (($user_alias_name =~ /=$/x) && ($rest3)) #Regular expression without "/x"
            {
                $alias_line = $user_alias_name . $rest3;
            }
            elsif ($rest3)
            {
                $alias_line = $user_alias_name . "," . $rest3;
            }
            else
            {
                $alias_line = $user_alias_name;
                
            }
        }
    
        
    }

    my @group = split(/=/x, $alias_line, 2); #Regular expression without "/x"
    my $user_alias_name_field = $group[0];
    my $label;
    my $user_alias_name1 = "";
     ($label, $user_alias_name1) = split(" ", $user_alias_name_field);
    $user_alias_mbrs = $group[1];
    $user_alias_mbrs = trim($user_alias_mbrs);    # remove any trailing spaces #Sub called with "&"
    $user_alias_mbrs =~ s/,$//x;  #Regular expression without "/x"                   # remove any trailing commas

    #create User_Alias_hash{useralias} entry with array
    if ($user_alias_mbrs)
    {
        if($violation_flag == 1)
        {
            $User_Alias_hash{$user_alias_name1} = $user_alias_mbrs;
            %User_Alias_hash_copy=%User_Alias_hash;
            if(defined $user_alias_name1)
            {
                if ($DEBUG )
                {
                print "\tadding $user_alias_name1 to User_Alias_hash\n";
                print "\t\tUser_Alias_hash{$user_alias_name1}=$User_Alias_hash{$user_alias_name1}\n";
            }
        }
    }
    }
    else
    {
        if(defined $user_alias_name1)
        {
        if ($DEBUG) { print "\tskipping '$user_alias_name1'. No valid entries\n"; }
        $alias_line = "";
    }
    }

    $alias_line =~ s/,$//x; #Regular expression without "/x"
    return ($alias_line);
}    # end of sub

sub strip_spaces
{
    my ($value) = @_; ###require argument unpacking 

    # -------------------------------------------------------------------------
    # If any string has leading or ending spaces then remove and return them.
    # -------------------------------------------------------------------------

    $value =~ s/^\s//x; #Regular expression without "/x"
    $value =~ s/\s$//x; #Regular expression without "/x"
    return $value;
}

###########################################################################
# validate_userids : ensures that each person in sudoers (by name or by   #
# membership in a User_Alias) is a defined user on the system. It is easy #
# to remove users and miss sudoers.                                       #
###########################################################################

sub validate_userids
{
    #my $usr_exists; #Reused variable name in lexical scope
    my $users;                                  #strict_use
    if ($DEBUG)
    {
        print "\nIN VALIDATE_USERIDS\n";
        print "\tchecking each actual userid in User_Alias_hash to ensure it is valid\n";
    }

    foreach my $User_Alias_to_check (sort (keys %User_Alias_hash))
    {       
        # ----------------------------------------------------------------
        # Kill the commas  at the start of line and remove any spaces
        # ----------------------------------------------------------------
        $User_Alias_hash{$User_Alias_to_check} =~ s/^,//x; #Regular expression without "/x"
        $User_Alias_hash{$User_Alias_to_check} =~ s/\s+//xg; #Regular expression without "/x"
        #removing blank users
        $User_Alias_hash{$User_Alias_to_check} =~ s/[\,]+/,/xg; #Regular expression without "/x"
        $User_Alias_hash{$User_Alias_to_check} =~ s/^\s*\,//xg; #Regular expression without "/x"
        my @names_in_alias = split(/,/x, $User_Alias_hash{$User_Alias_to_check}); #Regular expression without "/x"

        if ($DEBUG)
        {
            print "\n\t\tUser_Alias_to_check=$User_Alias_to_check\n";
            print "\t\tUser_Alias_hash{$User_Alias_to_check}=$User_Alias_hash{$User_Alias_to_check}\n";
            print "\t\tnames_in_alias=@names_in_alias\n";
        }

        # ----------------------------------------------------------------
        # Take the list of names from the User_Alias entry and check each
        # ----------------------------------------------------------------
        foreach my $specific_name (@names_in_alias)
        {
            my $backslash="";
            my $backslashval="";            
            if ($specific_name =~ /\\\w+/gx) #Regular expression without "/x"
            {
                $backslashval='\\';
                $backslash=1;
            }       
            $specific_name =~ s/(^\s*)|(\s*$)|(^\s*\\\s*)|(^\s*\\\s*$)//xg; #Regular expression without "/x"
            if ($DEBUG) { print "\t\tchecking $specific_name\n"; }

            if (!exists $users{$specific_name})
            {
                if ($DEBUG) { print "\t\t\tINVALID user : $specific_name...delete name from list\n"; }
                if(!grep({ /^\s*User_Alias\s+$specific_name\s*=/x } @sudoers_file)) #Regular expression without "/x"#require block grep
                {
                    my $line=(grep({ /^\s*User_Alias\s+$User_Alias_to_check\s*=/x } @sudoers_file))[0]; #Regular expression without "/x"#require block grep
                    my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                    if ( $backslash =~ /^\d+$/x && $backslash == 1 ) #Regular expression without "/x"
                    {
                        $specific_name=$backslashval.$specific_name;                        
                    }
                    IssueNote("$User_Alias_to_check", "$line_number", "$specific_name", "User spec $specific_name is not a valid userid", $master_text, $filename, 'SFIT4758');                     #Sub called with "&"
                    $RC = $RC + 10;
                }
                if ($User_Alias_hash{$User_Alias_to_check} =~ /\Q$specific_name\E$/x) #Regular expression without "/x"
                {
                    $User_Alias_hash{$User_Alias_to_check} =~ s/\Q$specific_name\E$//x; #Regular expression without "/x"
                }
                elsif ($User_Alias_hash{$User_Alias_to_check} =~ /=\Q$specific_name\E/x) #Regular expression without "/x"
                {
                    $User_Alias_hash{$User_Alias_to_check} =~ s/=\Q$specific_name\E,//x; #Regular expression without "/x"
                }
                elsif ($User_Alias_hash{$User_Alias_to_check} =~ /,\Q$specific_name\E,/x) #Regular expression without "/x"
                {
                    $User_Alias_hash{$User_Alias_to_check} =~ s/,\Q$specific_name\E,/,/x; #Regular expression without "/x"
                }
                else #Cascading if-elsif chain
                {
                    if ($User_Alias_hash{$User_Alias_to_check} =~ /^\s*\Q$specific_name\E,/x) #Regular expression without "/x"
                    {
                    $User_Alias_hash{$User_Alias_to_check} =~ s/^\s*\Q$specific_name\E,/,/x; #Regular expression without "/x"
                }
            }
            }
            elsif ($DEBUG)
            {
                print "\t\t\tValid user : $specific_name\n";
            }    # end of if to check id
        }    # end of foreach specific name
        if ($DEBUG) { print "\t\tFinal User_Alias_hash{$User_Alias_to_check}=$User_Alias_hash{$User_Alias_to_check}\n"; }

    }    # end of foreach to check each user-alias

    # ----------------------------------------------------------------
    # let's look for plain userauth lines and check their ids.
    # ----------------------------------------------------------------
    if ($DEBUG)
    {
        print "\n\tCHECKING PLAIN USERAUTH LINES\n";
        if(defined $users){print "\tusers= $users\n";}
    }
    my @remove_lines_copy = (); #Reused variable name in lexical scope
    my $linecnt      = 0;
    foreach my $line (@sudoers_file)
    {

        # ----------------------------------------------------------------
        # be sure we have only the lines we want
        # ----------------------------------------------------------------
        if ($line =~ /(^\#|^\s+\#)/x or $line =~/(^Defaults|^User_Alias|^Cmnd_Alias|^Runas_Alias|^Host_Alias)/x or $line =~/^%/x) #Regular expression without "/x" #ProhibitComplexRegexes
        {
            $linecnt = $linecnt + 1;
            next;
        }

        # ----------------------------------------------------------------
        # remove spaces
        # ----------------------------------------------------------------
        my ($user1, $junk) = split(/=/x, $line, 2); #Regular expression without "/x"
        my $header = $user1;
        my ($user, $myHosts) = split(/\s+/x, $user1, 2); #Regular expression without "/x"
        my $backslash="";
        my $backslashval="";

        #($user,$junk) = split(/\s+/,$line,2);
        if ($DEBUG)
        {
            print "\n\t\tline=$line\n";
            print "\t\tuser=$user\n";
            print "\t\tmyHosts=$myHosts\n";
            print "\t\tjunk=$junk\n";
            if((defined $user) && (defined $User_Alias_hash{$user})){print "\t\tUser_Alias_hash{$user}=$User_Alias_hash{$user}\n";}
            if((defined $user) && (defined $users{$user})){print "\t\tusers{$user}=$users{$user}\n";}
        }
        my $usr_exists=0;
        my $notexist_list="";
        foreach my $usr(split(/\s*,\s*/x,$user)) #perlcritic #Regular expression without "/x"
        {
                        
            if ($usr =~ /\\\w+/gx) #Regular expression without "/x"
            {
                $backslashval='\\';
                $backslash=1;
            }
            
            $usr =~ s/(^\s*)|(\s*$)|(^\s*\\\s*)|(^\s*\\\s*$)//xg; #Regular expression without "/x"
            $usr =~ s/%//xg; #Regular expression without "/x"
            if (exists $User_Alias_hash{$usr} or grep({ /^\s*User_Alias\s+$usr\s*=/x } @sudoers_file) or exists $users{$usr} or exists $groups{$usr})#require block grep #Regular expression without "/x"
            {
                $usr_exists=1;
            }
            else
            {
                $notexist_list .="$usr,"
            }
        }
        $notexist_list =~ s/,$//xg; #Regular expression without "/x"
        if ($notexist_list ne "")
        {
            if ($DEBUG)
            {
                print "remove line $linecnt from sudoers\n";
                print "\t\tsudoers_file[$linecnt]=$sudoers_file[$linecnt]\n";
            }
            push(@remove_lines_copy, $linecnt); #Reused variable name in lexical scope

            # is user entry valid for this server?
            if (IsUserUsed($user, $myHosts)) #Sub called with "&"
            {
                if ($DEBUG) { print "\t\t$user is a valid entry for this server\n"; }

                my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                if ( $backslash =~ /^\d+$/x && $backslash == 1 ) #Regular expression without "/x"
                {
                        $notexist_list=$backslashval.$notexist_list;                        
                }       
                IssueNote($header, $line_number, "$notexist_list", "User $notexist_list is not a valid userid", $master_text, $filename, 'SFIT4758'); #Sub called with "&"
                $RC = $RC + 10;
            }
        }
        elsif ($DEBUG)
        {
            print "\t\t$user is a valid user alias\n";
        }    # end of if to check id
        $linecnt = $linecnt + 1;
    }    # end of foreach line in sudoers

    # ----------------------------------------------------------------- #
    # remove the invalid user lines from the sudoers_file array so that #
    #    we don't use them as valid "use" lines                      #
    # ----------------------------------------------------------------- #
return ;##require final return
} 

sub validate_userids_insensitive
{
    #my $usr_exists; #Reused variable name in lexical scope
    my $users;                                  #strict_use
    if ($DEBUG)
    {
        print "\nIN VALIDATE_USERIDS\n";
        print "\tchecking each actual userid in User_Alias_hash to ensure it is valid\n";
    }

    foreach my $User_Alias_to_check (sort (keys %User_Alias_hash))
    {       
        # ----------------------------------------------------------------
        # Kill the commas  at the start of line and remove any spaces
        # ----------------------------------------------------------------
        $User_Alias_hash{$User_Alias_to_check} =~ s/^,//x; #Regular expression without "/x"
        $User_Alias_hash{$User_Alias_to_check} =~ s/\s+//xg; #Regular expression without "/x"
        #removing blank users
        $User_Alias_hash{$User_Alias_to_check} =~ s/[\,]+/,/xg; #Regular expression without "/x"
        $User_Alias_hash{$User_Alias_to_check} =~ s/^\s*\,//xg; #Regular expression without "/x"
        my @names_in_alias = split(/,/x, $User_Alias_hash{$User_Alias_to_check}); #Regular expression without "/x"

        if ($DEBUG)
        {
            print "\n\t\tUser_Alias_to_check=$User_Alias_to_check\n";
            print "\t\tUser_Alias_hash{$User_Alias_to_check}=$User_Alias_hash{$User_Alias_to_check}\n";
            print "\t\tnames_in_alias=@names_in_alias\n";
        }

        # ----------------------------------------------------------------
        # Take the list of names from the User_Alias entry and check each
        # ----------------------------------------------------------------
        foreach my $specific_name (@names_in_alias)
        {
            my $backslash="";
            my $backslashval="";            
            if ($specific_name =~ /\\\w+/xg) #Regular expression without "/x"
            {
                $backslashval='\\';
                $backslash=1;
            }       
            $specific_name =~ s/(^\s*)|(\s*$)|(^\s*\\\s*)|(^\s*\\\s*$)//xg; #Regular expression without "/x"
            if ($DEBUG) { print "\t\tchecking $specific_name\n"; }
            my @insensitive_users_hash = grep{/^\Q$specific_name\E$/xi} keys %users; #Regular expression without "/x"
            my $user_found=0;
            foreach my $username (@insensitive_users_hash)
            {
                if (exists $users{$username})
                {
                    $user_found=1;
                    last;
                }
            
            }
            #if (!exists $users{$specific_name})
             if ($user_found !=1)
            {
                if ($DEBUG) { print "\t\t\tINVALID user : $specific_name...delete name from list\n"; }
                if(!grep({ /^\s*User_Alias\s+$specific_name\s*=/x } @sudoers_file))#require block grep #Regular expression without "/x"
                {
                    my $line=(grep({ /^\s*User_Alias\s+$User_Alias_to_check\s*=/x } @sudoers_file))[0]; #Regular expression without "/x"#require block grep
                    my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                    if ( $backslash =~ /^\d+$/x && $backslash == 1 ) #Regular expression without "/x"
                    {
                        $specific_name=$backslashval.$specific_name;                        
                    }
                    IssueNote("$User_Alias_to_check", "$line_number", "$specific_name", "User spec $specific_name is not a valid userid", $master_text, $filename, 'SFIT4758');                     #Sub called with "&"
                    $RC = $RC + 10;
                }
                if ($User_Alias_hash{$User_Alias_to_check} =~ /\Q$specific_name\E$/x) #Regular expression without "/x"
                {
                    $User_Alias_hash{$User_Alias_to_check} =~ s/\Q$specific_name\E$//x; #Regular expression without "/x"
                }
                elsif ($User_Alias_hash{$User_Alias_to_check} =~ /=\Q$specific_name\E/x) #Regular expression without "/x"
                {
                    $User_Alias_hash{$User_Alias_to_check} =~ s/=\Q$specific_name\E,//x; #Regular expression without "/x"
                }
                elsif ($User_Alias_hash{$User_Alias_to_check} =~ /,\Q$specific_name\E,/x) #Regular expression without "/x"
                {
                    $User_Alias_hash{$User_Alias_to_check} =~ s/,\Q$specific_name\E,/,/x; #Regular expression without "/x"
                }
                else #Cascading if-elsif chain
                {
                    if ($User_Alias_hash{$User_Alias_to_check} =~ /^\s*\Q$specific_name\E,/x) #Regular expression without "/x"
                    {
                    $User_Alias_hash{$User_Alias_to_check} =~ s/^\s*\Q$specific_name\E,/,/x; #Regular expression without "/x"
                }
            }
            }
            elsif ($DEBUG)
            {
                print "\t\t\tValid user : $specific_name\n";
            }    # end of if to check id
        }    # end of foreach specific name
        if ($DEBUG) { print "\t\tFinal User_Alias_hash{$User_Alias_to_check}=$User_Alias_hash{$User_Alias_to_check}\n"; }

    }    # end of foreach to check each user-alias

    # ----------------------------------------------------------------
    # let's look for plain userauth lines and check their ids.
    # ----------------------------------------------------------------
    if ($DEBUG)
    {
        print "\n\tCHECKING PLAIN USERAUTH LINES\n";
        if(defined $users){print "\tusers= $users\n";}
    }
    my @remove_lines_copy = (); #Reused variable name in lexical scope
    my $linecnt      = 0;
    foreach my $line (@sudoers_file)
    {

        # ----------------------------------------------------------------
        # be sure we have only the lines we want
        # ----------------------------------------------------------------
        if ($line =~ /(^\#|^\s+\#)/x or $line =~/(^Defaults|^User_Alias|^Cmnd_Alias)/x 
           or $line =~/(^Runas_Alias|^Host_Alias)/x or $line =~/^%/x)#Regular expression without "/x" #ProhibitComplexRegexes
        {
            $linecnt = $linecnt + 1;
            next;
        }

        # ----------------------------------------------------------------
        # remove spaces
        # ----------------------------------------------------------------
        my ($user1, $junk) = split(/=/x, $line, 2); #Regular expression without "/x"
        my $header = $user1;
        my ($user, $myHosts) = split(/\s+/x, $user1, 2); #Regular expression without "/x"
        my $backslash="";
        my $backslashval="";

        #($user,$junk) = split(/\s+/,$line,2);
        if ($DEBUG)
        {
            print "\n\t\tline=$line\n";
            print "\t\tuser=$user\n";
            print "\t\tmyHosts=$myHosts\n";
            print "\t\tjunk=$junk\n";
            if((defined $user) && ( defined $User_Alias_hash{$user} )){print "\t\tUser_Alias_hash{$user}=$User_Alias_hash{$user}\n";}
            if((defined $user) && ( defined $users{$user} )){print "\t\tusers{$user}=$users{$user}\n";}
        }
        my $usr_exists=0;
        my $notexist_list="";
        foreach my $usr(split(/\s*,\s*/x,$user)) #perlcritic #Regular expression without "/x"
        {
                        
            if ($usr =~ /\\\w+/xg) #Regular expression without "/x"
            {
                $backslashval='\\';
                $backslash=1;
            }
            
            $usr =~ s/(^\s*)|(\s*$)|(^\s*\\\s*)|(^\s*\\\s*$)//xg; #Regular expression without "/x"
            $usr =~ s/%//xg; #Regular expression without "/x"
            my @insensitive_User_Alias_hash = grep{/^$usr$/xi} keys %User_Alias_hash; #Regular expression without "/x"
            my $User_Alias_hash_found=0;
            foreach my $username (@insensitive_User_Alias_hash)
            {
                if (exists $User_Alias_hash{$username})
                {
                    $User_Alias_hash_found=1; #Reused variable name in lexical scope
                    last;
                }
            }
            my @insensitive_users_hash = grep{/^\Q$usr\E$/ix} keys %users; #Regular expression without "/x"
            my $user_found=0;
            foreach my $username (@insensitive_users_hash)
            {
                if (exists $users{$username})
                {
                    $user_found=1;
                    last;
                }
            }
            my @insensitive_groups_hash = grep{/^$usr$/xi} keys %groups; #Regular expression without "/x"
            my $groups_found=0;
            foreach my $username (@insensitive_groups_hash)
            {
                if (exists $groups{$username})
                {
                    $groups_found=1;
                    last;
                }
            }
            if ($User_Alias_hash_found==1 or grep({ /^\s*User_Alias\s+$usr\s*=/xi } @sudoers_file) or $user_found==1 or  $groups_found==1)#require block grep #Regular expression without "/x"
            #if (exists $User_Alias_hash{$usr} or grep({ /^\s*User_Alias\s+$usr\s*=/ } @sudoers_file) or exists $users{$usr} or exists $groups{$usr})#require block grep
            { 
                $usr_exists=1;
            }
            else
            {
                $notexist_list .="$usr,"
            }
        }
        $notexist_list =~ s/,$//xg; #Regular expression without "/x"
        if ($notexist_list ne "")
        {
            if ($DEBUG)
            {
                print "remove line $linecnt from sudoers\n";
                print "\t\tsudoers_file[$linecnt]=$sudoers_file[$linecnt]\n";
            }
            push(@remove_lines_copy, $linecnt);

            # is user entry valid for this server?
            if (IsUserUsed($user, $myHosts)) #Sub called with "&"
            {
                if ($DEBUG) { print "\t\t$user is a valid entry for this server\n"; }

                my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                if ( $backslash =~ /^\d+$/x && $backslash == 1 ) #Regular expression without "/x"
                {
                        $notexist_list=$backslashval.$notexist_list;                        
                }       
                IssueNote($header, $line_number, "$notexist_list", "User $notexist_list is not a valid userid", $master_text, $filename, 'SFIT4758'); #Sub called with "&"
                $RC = $RC + 10;
            }
        }
        elsif ($DEBUG)
        {
            print "\t\t$user is a valid user alias\n";
        }    # end of if to check id
        $linecnt = $linecnt + 1;
    }    # end of foreach line in sudoers

    # ----------------------------------------------------------------- #
    # remove the invalid user lines from the sudoers_file array so that #
    #    we don't use them as valid "use" lines                      #
    # ----------------------------------------------------------------- #
return ;##require final return
}    # end of sub

sub update
{
    my $raw_date = localtime;
    my ($dow, $month, $dom, $tm, $year) = split /\s+/x, $raw_date, 5; #Regular expression without "/x"
    my $run_date  = "$month $dom, $year";
    $timestamp = "$month $dom $year $tm";
    return ;##require final return
}

###########################################
# Perl trim function to remove whitespace #
# from the start and end of the string    #
###########################################
sub trim
{   my ($string) = @_; #perl -w
    if(!defined $string){$string="";} #perl -w
    $string =~ s/^\s+//x; #Regular expression without "/x"
    $string =~ s/\s+$//x; #Regular expression without "/x"
    return $string;
}

sub IssueNote
{
    my ($msg_entry, $line_number, $msg_value, $msg_description, $file_type, $file_name, $msg_source) = @_; ###require argument unpacking
    my $message_severity;
    my $msg;                        #strict_use
    my $LINE_HEADER;
    my $IBM_ID_EXISTS =0;
    my $CSVmsg;
    if(grep({ /^$msg_source$/x } @DISABLED_MESSAGES)){return;} #require block grep #Regular expression without "/x"
    $LINE_HEADER=$msg_entry;
    if( defined $LINE_HEADER )
    {
        $LINE_HEADER =~ s/User_Alias//xg; #Regular expression without "/x"
        $LINE_HEADER =~ s/\s+ALL\s*$//xg; #Regular expression without "/x"
        $LINE_HEADER =~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"
        $LINE_HEADER =~ s/\|/,/xg; #Regular expression without "/x"
        $LINE_HEADER =~ s/\+/%_PLUS_/xg;  #Regular expression without "/x"
    }
    $IBM_ID_EXISTS = check_ibm_id($LINE_HEADER); #Sub called with "&"
    if ($DEBUG)
    {
        if( defined $LINE_HEADER )
        {print "For Header $LINE_HEADER value = $IBM_ID_EXISTS\n";}

    }
    if($IBM_ID_EXISTS == 0 and $IGNORE_CUSTOMER_ENTRY == 1  and $GECOS_RELIABLE==1){return;}#Enhancement 140662
    if( defined $LINE_HEADER )
    {
        if($LINE_HEADER eq ""){$IBM_ID_EXISTS=1;}
    }
    
    #$msg_entry = (split(/ /, $msg_entry))[0];  # Added 7Nov to remove trailing host_alias name in output

    ######
    my $removeall = $msg_entry;
    if(defined $removeall)
    {
        $removeall =~ s/\s*,\s*//xg; #Regular expression without "/x"
        $removeall =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
        $removeall =~ s/\s+[\w,]+$//xg; #Regular expression without "/x"
    }
    if(check_for_suppression($removeall) or check_for_suppression($line_number))
    {
        return;
    }
    $removeall = $msg_entry;
    if(defined $removeall)
    {
        $removeall =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
        $removeall =~ s/\s+[\w,]+$//xg; #Regular expression without "/x"
        $removeall =~ s/^"|"$//xg; #Regular expression without "/x"
        if($removeall =~ /,/x){$removeall =~ s/,/|/xg;} #Regular expression without "/x"
    }
    #####################
    if((defined $msg_entry) && ($msg_entry =~ /,/x)){$msg_entry =~ s/,/|/xg;} #Regular expression without "/x"
    if((defined $msg_value ) && ($msg_value =~ /,/x)){$msg_value =~ s/,/|/xg;} #Regular expression without "/x"
    if((defined $msg_description) && ($msg_description =~ /,/x)){$msg_description =~ s/,/|/xg;} #Regular expression without "/x"
    if((defined $file_name) && ($file_name =~ /,/x )){$file_name =~ s/,/|/xg;} #Regular expression without "/x"
    if($msg_source =~ /,/x){$msg_source =~ s/,/|/xg;}  #Regular expression without "/x"
    #$msg_entry, $line_number, $msg_value, $msg_description, $file_type, $file_name, $msg_source
    #####################
    if(!defined $removeall){$removeall= "";}
    if(!defined $line_number){$line_number= "";}
    if(!defined $msg_value){$msg_value= "";}
    if(!defined $msg_description){$msg_description= "";}
    if(!defined $file_type){$file_type= "";}
    if(!defined $file_name){$file_name= "";}
    if(!defined $msg_source){$msg_source= "";}
    $CSVmsg = "$removeall,$line_number,$msg_value,$msg_description,$file_type,$file_name,$msg_source";
    ######
    if ($template_check == 1 and template_storemessage($msg_source) == 1) #Sub called with "&"
    {
        return;
    }
    my $CSVLINE;
    $CSVmsg =~ s/\s+/ /xg; #Regular expression without "/x"
    $CSVmsg =~ s/,\sEXEC:\s'\s*$/'/xg; #Regular expression without "/x"
    $CSVmsg =~ s/,\sPASSWD:\s'\s*$/'/xg; #Regular expression without "/x"
    if ($IBM_ID_EXISTS != 1 and ((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER == 1)))
    {
        if ($IBM_ID_EXISTS == -1) 
        {
            $message_severity = "NOTE";
            $msg = "NOTE:,$CSVmsg\n\n";
            $exitNote = 11; 
        }
        else 
        {
            $message_severity = "CUST";
            $msg = "CUST:,$CSVmsg\n\n";
            $exitCust = 10;
        }       
    }
    else
    {
        $message_severity = "NOTE";
        $msg = "NOTE:,$CSVmsg\n\n";
        $exitNote = 11;
    }
    $msg =~ s/%_PLUS_/\+/xg; #Regular expression without "/x"
    $msg =~ s/,\+/, \+/xg; #Regular expression without "/x"
    print $ERR $msg;
    $WARN = $WARN + 1;
    $CSVmsg =~ s/;/,/xg; #Regular expression without "/x"
    $CSVmsg =~ s/\s*\,\s*/,/xg; #Regular expression without "/x"
    $CSVmsg           = "$message_severity,$CSVmsg";
    writeToCSV($CSVmsg);
    if ($DEBUG) { print "\n$msg"; }
    return ;##require final return
}

sub IssueWarning
{
    my ($msg_entry, $line_number, $msg_value, $msg_description, $file_type, $file_name, $msg_source) = @_; ##require argument unpacking
    my $LINE_HEADER;
    my $msg="";                     #strict_use
    my $IBM_ID_EXISTS =0;
    my $message_severity = "WARNING";
    if(grep({ /^$msg_source$/x } @DISABLED_MESSAGES)){return;}  #Regular expression without "/x" #require block grep
    $msg_value =~ s/^"|"$//xg; #Regular expression without "/x"
    $msg_description =~ s/^"|"$//xg; #Regular expression without "/x"
    if(defined $file_name ){$file_name =~ s/^"|"$//xg;} #Regular expression without "/x"
    $LINE_HEADER=$msg_entry;
    my $CSVmsg ;
    if( defined $LINE_HEADER )
    {
        $LINE_HEADER =~ s/User_Alias//xg; #Regular expression without "/x"
        $LINE_HEADER =~ s/\s+ALL\s*$//xg; #Regular expression without "/x"
        $LINE_HEADER =~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"
        $LINE_HEADER =~ s/\|/,/xg; #Regular expression without "/x"
        $IBM_ID_EXISTS = check_ibm_id($LINE_HEADER); #Sub called with "&"
    }
    if ($DEBUG)
    {
        if( defined $LINE_HEADER )
        {print "IssueWarning For Header $LINE_HEADER value = $IBM_ID_EXISTS\n";}
    }
    if($IBM_ID_EXISTS == 0 and $IGNORE_CUSTOMER_ENTRY == 1  and $GECOS_RELIABLE==1){return;}#Enhancement 140662
    if( defined $LINE_HEADER )
    {
        if($LINE_HEADER eq ""){$IBM_ID_EXISTS=1;}
    }
    $message_severity = "WARNING";
    ######
    my $removeall = $msg_entry;
    if(defined $removeall)
    {
        $removeall =~ s/\s*,\s*/,/xg; #Regular expression without "/x"
        $removeall =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
        $removeall =~ s/\s+[\w,]+$//xg; #Regular expression without "/x"
    }
    if(check_for_suppression($removeall) or check_for_suppression($line_number))
    {
        return;
    }
    if(defined $removeall)
    {
        $removeall =~ s/^"|"$//xg; #Regular expression without "/x"
        if($removeall =~ /,/x){$removeall =~ s/,/|/xg;} #Regular expression without "/x"
    }
    #####################
    if($msg_entry =~ /,/x){$msg_entry =~ s/,/|/xg;} #Regular expression without "/x"
    if($msg_value =~ /,/x){$msg_value =~ s/,/|/xg;} #Regular expression without "/x"
    if($msg_description =~ /,/x){$msg_description =~ s/,/|/xg;} #Regular expression without "/x"
    if((defined $file_name ) && ($file_name =~ /,/x)){$file_name =~ s/,/|/xg;} #Regular expression without "/x"
    if($msg_source =~ /,/x){$msg_source =~ s/,/|/xg;}  #Regular expression without "/x"
    #####################
    if(!defined $removeall){$removeall= "";}
    if(!defined $line_number){$line_number= "";}
    if(!defined $msg_value){$msg_value= "";}
    if(!defined $msg_description){$msg_description= "";}
    if(!defined $file_type){$file_type= "";}
    if(!defined $file_name){$file_name= "";}
    if(!defined $msg_source){$msg_source= "";}
    $CSVmsg = "$removeall,$line_number,$msg_value,$msg_description,$file_type,$file_name,$msg_source";
    ######
    if ($template_check == 1 and template_storemessage($msg_source) == 1) #Sub called with "&"
    {
        return;
    }

    #my $CSVmsg;
    my $CSVLINE;

    #$CSVmsg = $_[0];
    if ($msg_source !~ /^SFIT124468$/x) #Regular expression without "/x"
    {
        $CSVmsg =~ s/\s+/ /xg;  #Regular expression without "/x"  
    }
    #Defect 4229
    $CSVmsg =~ s/,\sEXEC:\s'\s*$/'/xg; #Regular expression without "/x"
    $CSVmsg =~ s/,\sPASSWD:\s'\s*$/'/xg; #Regular expression without "/x"

    if(($msg_source =~ /^SFIT77558$/x or $msg_source =~ /^SFIT77559$/x) and $EXTENDED_CHECK_USER == 1) #Regular expression without "/x"
    {
        $IBM_ID_EXISTS =-1;
    }
    if ($DEBUG) 
    { 
        print "$msg\n"; 
        print "IBM_ID_EXISTS = $IBM_ID_EXISTS\n"; 
        #print "EXTENDED_CHECK_USER = $EXTENDED_CHECK_USER\n";
        print "NO_DOWNGRADE = $NO_DOWNGRADE\n";
        print "msg_source = $msg_source\n";
    }
    if (($IBM_ID_EXISTS=~ /^\d+$/x && $IBM_ID_EXISTS == 1 ) or ((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER=~ /^\d+$/x && $EXTENDED_CHECK_USER == 0)) or ($IBM_ID_EXISTS=~ /^-\d+$/x && $IBM_ID_EXISTS == -1) or ($NO_DOWNGRADE=~ /^\d+$/x && $NO_DOWNGRADE == 1) or ($msg_source =~/^\s*SFIT67619\s*$/x)    ) #Regular expression without "/x"
    {
        $msg = "WARNING:,$CSVmsg\n\n";
        $msg =~ s/%_PLUS_/\+/xg; #Regular expression without "/x"
        $msg =~ s/,\+/, \+/xg; #Regular expression without "/x"
        print $ERR $msg;
        $WARN = $WARN + 1;
        $CSVmsg =~ s/;/,/xg; #Regular expression without "/x"
        $CSVmsg =~ s/\s*\,\s*/,/xg; #Regular expression without "/x"
        ####################
        $message_severity = "WARNING";
        $CSVmsg           = "$message_severity,$CSVmsg";
        writeToCSV($CSVmsg);
    }
    else
    {
        IssueNote($removeall, $line_number, $msg_value, $msg_description, $file_type, $file_name, $msg_source);
    }
    return ;##require final return
}


sub IssueAttention
{ 
    my ($msg_entry, $line_number, $msg_value, $msg_description, $file_type, $file_name, $msg_source) = @_; ###require argument unpacking
    my @message_array=@_;#require argument unpacking
    my $LINE_HEADER;
    my $IBM_ID_EXISTS =0;
    my $msg="";                     #strict_use
    my $message_severity = "ATTENTION";
    my $CSVmsg;
    if(grep({ /^$msg_source$/x } @DISABLED_MESSAGES)){return;}#require block grep #Regular expression without "/x"

    $msg_value =~ s/^"|"$//xg; #Regular expression without "/x"
    $msg_description =~ s/^"|"$//xg; #Regular expression without "/x"
    $file_name =~ s/^"|"$//xg; #Regular expression without "/x"
    if($msg_value =~ /,/x){$msg_value="\"$msg_value\"";} #Regular expression without "/x"
    if($msg_description =~ /,/x){$msg_description="\"$msg_description\"";} #Regular expression without "/x"
    if($file_name =~ /,/x){$file_name="\"$file_name\"";} #Regular expression without "/x"
    $LINE_HEADER=$msg_entry;
    if( defined $LINE_HEADER )
    {
        $LINE_HEADER =~ s/User_Alias//xg; #Regular expression without "/x"

        $LINE_HEADER =~ s/\s+ALL\s*$//xg; #Regular expression without "/x"
        $LINE_HEADER =~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"
    }
    $message_severity = "ATTENTION";
    ($msg_entry, $line_number, $msg_value, $msg_description, $file_type, $file_name, $msg_source) = @message_array;

    ######
    my $removeall = $msg_entry;
    if(defined $removeall)
    {
        $removeall =~ s/\s*,\s*/,/xg; #Regular expression without "/x"
        $removeall =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
        $removeall =~ s/\s+[\w,]+$//xg; #Regular expression without "/x"
    }
    if(check_for_suppression($removeall) or check_for_suppression($line_number))
    {
        return;
    }
    if(defined $removeall)
    {
        $removeall =~ s/^"|"$//xg; #Regular expression without "/x"
        if($removeall =~ /,/x){$removeall =~ s/,/|/xg;} #Regular expression without "/x"
    }
    if( defined $LINE_HEADER )
    {
        $LINE_HEADER =~ s/\|/,/xg; #Regular expression without "/x"
    }
    $IBM_ID_EXISTS = check_ibm_id($LINE_HEADER); #Sub called with "&"
    if($IBM_ID_EXISTS == 0 and $IGNORE_CUSTOMER_ENTRY == 1  and $GECOS_RELIABLE==1){return;}#Enhancement 140662
    #if(defined $removeall)
    {
        if((defined $removeall) && ($removeall eq "")){$IBM_ID_EXISTS=1;}
    }
    #####################
    if((defined $msg_entry) && ($msg_entry =~ /,/x)){$msg_entry =~ s/,/|/xg;} #Regular expression without "/x"
    if($msg_value =~ /,/x){$msg_value =~ s/,/|/xg;} #Regular expression without "/x"
    if($msg_description =~ /,/x){$msg_description =~ s/,/|/xg;} #Regular expression without "/x"
    if($file_name =~ /,/x){$file_name =~ s/,/|/xg;} #Regular expression without "/x"
    if($msg_source =~ /,/x){$msg_source =~ s/,/|/xg;}  #Regular expression without "/x"

    #####################
    if(!defined $removeall){$removeall= "";}
    if(!defined $line_number){$line_number= "";}
    if(!defined $msg_value){$msg_value= "";}
    if(!defined $msg_description){$msg_description= "";}
    if(!defined $file_type){$file_type= "";}
    if(!defined $file_name){$file_name= "";}
    if(!defined $msg_source){$msg_source= "";}
    $CSVmsg = "$removeall,$line_number,$msg_value,$msg_description,$file_type,$file_name,$msg_source";
    ######
    if ($template_check == 1 and template_storemessage($msg_source) == 1) #Sub called with "&"
    {
        return;
    }

    my $CSVLINE;
    $CSVmsg =~ s/\s+/ /xg;#Regular expression without "/x"

    #Defect 4229
    $CSVmsg =~ s/,\sEXEC:\s'\s*$/'/xg;#Regular expression without "/x"
    $CSVmsg =~ s/,\sPASSWD:\s'\s*$/'/xg;#Regular expression without "/x"

    if ($DEBUG) { print "\n$msg"; }
    if ($IBM_ID_EXISTS == 1 or ((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER=~ /^\d+$/x && $EXTENDED_CHECK_USER == 0)) or $IBM_ID_EXISTS == -1 or $NO_DOWNGRADE == 1) #Regular expression without "/x"
    {
        $msg = "ATTENTION:,$CSVmsg\n\n";
        $msg =~ s/%_PLUS_/\+/xg; #Regular expression without "/x"
        $msg =~ s/,\+/, \+/xg;#Regular expression without "/x"
        print $ERR $msg;
        $CSVmsg =~ s/;/,/xg; #Regular expression without "/x"
        $CSVmsg =~ s/\s*\,\s*/,/xg; #Regular expression without "/x"
        ####################
        $message_severity = "ATTENTION";
        $CSVmsg           = "$message_severity,$CSVmsg";
        writeToCSV($CSVmsg);
        $exitAttn = 14;
    }
    else
    {
        IssueNote($removeall, $line_number, $msg_value, $msg_description, $file_type, $file_name, $msg_source);
    }
    return ;##require final return
}

sub IssueNotice
{
    my ($msg_entry, $line_number, $msg_value, $msg_description, $file_type, $file_name, $msg_source) = @_; ###require argument unpacking
    my @message_array=@_;#require argument unpacking
    my $LINE_HEADER;
    my $IBM_ID_EXISTS =0;
    my $msg="";                     #strict_use
    my $message_severity = "NOTICE";
    my $CSVmsg;
    if(grep({ /^$msg_source$/x } @DISABLED_MESSAGES)){return;}#require block grep #Regular expression without "/x"

    $msg_value =~ s/^"|"$//xg; #Regular expression without "/x"
    $msg_description =~ s/^"|"$//xg; #Regular expression without "/x"
    $file_name =~ s/^"|"$//xg; #Regular expression without "/x"
    if($msg_value =~ /,/x){$msg_value="\"$msg_value\"";} #Regular expression without "/x"
    if($msg_description =~ /,/x){$msg_description="\"$msg_description\"";} #Regular expression without "/x"
    if($file_name =~ /,/x){$file_name="\"$file_name\"";} #Regular expression without "/x"
    $LINE_HEADER=$msg_entry;
    if( defined $LINE_HEADER )
    {
        $LINE_HEADER =~ s/User_Alias//xg; #Regular expression without "/x"

        $LINE_HEADER =~ s/\s+ALL\s*$//xg; #Regular expression without "/x"
        $LINE_HEADER =~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"

    }
    $message_severity = "NOTICE";
    ($msg_entry, $line_number, $msg_value, $msg_description, $file_type, $file_name, $msg_source) = @message_array;

    ######
    my $removeall = $msg_entry;
    if(defined $removeall)
    {
        $removeall =~ s/\s*,\s*/,/xg; #Regular expression without "/x"
        $removeall =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
        $removeall =~ s/\s+[\w,]+$//xg; #Regular expression without "/x"
    }
    if(check_for_suppression($removeall) or check_for_suppression($line_number))
    {
        return;
    }
    if(defined $removeall)
    {
        $removeall =~ s/^"|"$//xg; #Regular expression without "/x"
        if($removeall =~ /,/x){$removeall =~ s/,/|/xg;} #Regular expression without "/x"
    }
    if( defined $LINE_HEADER )
    {
        $LINE_HEADER =~ s/\|/,/xg; #Regular expression without "/x"
    }
    $IBM_ID_EXISTS = check_ibm_id($LINE_HEADER); #Sub called with "&"
    if($IBM_ID_EXISTS == 0 and $IGNORE_CUSTOMER_ENTRY == 1  and $GECOS_RELIABLE==1){return;}#Enhancement 140662
    #if(defined $removeall)
    {
        if((defined $removeall) && ($removeall eq "")){$IBM_ID_EXISTS=1;}
    }
    #####################
    if((defined $msg_entry) && ($msg_entry =~ /,/x)){$msg_entry =~ s/,/|/xg;} #Regular expression without "/x"
    if($msg_value =~ /,/x){$msg_value =~ s/,/|/xg;} #Regular expression without "/x"
    if($msg_description =~ /,/x){$msg_description =~ s/,/|/xg;} #Regular expression without "/x"
    if($file_name =~ /,/x){$file_name =~ s/,/|/xg;} #Regular expression without "/x"
    if($msg_source =~ /,/x){$msg_source =~ s/,/|/xg;}  #Regular expression without "/x"

    #####################

    #####################
    if(!defined $removeall){$removeall= "";}
    if(!defined $line_number){$line_number= "";}
    if(!defined $msg_value){$msg_value= "";}
    if(!defined $msg_description){$msg_description= "";}
    if(!defined $file_type){$file_type= "";}
    if(!defined $file_name){$file_name= "";}
    if(!defined $msg_source){$msg_source= "";}
    $CSVmsg = "$removeall,$line_number,$msg_value,$msg_description,$file_type,$file_name,$msg_source";
    ######
    if ($template_check == 1 and template_storemessage($msg_source) == 1) #Sub called with "&"
    {
        return;
    }

    my $CSVLINE;
    $CSVmsg =~ s/\s+/ /xg;#Regular expression without "/x"

    #Defect 4229
    $CSVmsg =~ s/,\sEXEC:\s'\s*$/'/xg;#Regular expression without "/x"
    $CSVmsg =~ s/,\sPASSWD:\s'\s*$/'/xg;#Regular expression without "/x"

    if ($DEBUG) { print "\n$msg"; }
    if ($IBM_ID_EXISTS == 1 or ((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER=~ /^\d+$/x && $EXTENDED_CHECK_USER == 0)) or $IBM_ID_EXISTS == -1 or $NO_DOWNGRADE == 1) #Regular expression without "/x"
    {
        $msg = "NOTICE:,$CSVmsg\n\n";
        $msg =~ s/%_PLUS_/\+/xg; #Regular expression without "/x"
        $msg =~ s/,\+/, \+/xg;#Regular expression without "/x"
        print $ERR $msg;
        $CSVmsg =~ s/;/,/xg; #Regular expression without "/x"
        $CSVmsg =~ s/\s*\,\s*/,/xg; #Regular expression without "/x"
        ####################
        $message_severity = "NOTICE";
        $CSVmsg           = "$message_severity,$CSVmsg";
        writeToCSV($CSVmsg);
    }
    else
    {
        IssueNote($removeall, $line_number, $msg_value, $msg_description, $file_type, $file_name, $msg_source);
    }
    return ;##require final return
}


# sub IncorporateFileIncludes 
# {
    # my $INCL_STMTS;
    # my $STMT;
   
    # my $INC_TYPE;
    # my $INC_FILE;
    # my @FILELIST;
    # my $CONTENTS;
    
    # $foundfile=1;
    # # hash lookup for the primary file name    
    # my $fh = IO::File->new("$configfile", "<");   #prohibit indirect syntax
    # while (my $line = <$fh>)
    # {
        # chomp($line);
        # if ($line =~ /^\s*(#.*)/ || $line =~ /.*(#.*)/){push(@orig_comment_array, $1);}
        # # line content, file name, line number, 1 = master file
        # add_line_location($line, "$configfile", $., 1); #Sub called with "&"
    # }    
    # $fh->close();
    # ###Changes for Task Task 63893###
    # $TMPSUDOER  = "$OUTDIR/$pn.sudoers.$PID.$PID";
    # $TMPSUDOER1 = "$OUTDIR/$pn.sudoers.$PID";

    # unlink $TMPSUDOER;
    # unlink $TMPSUDOER1;
    # my $lfh = IO::File->new("$TMPSUDOER", ">") or die "Unable to open file $TMPSUDOER : $!";  #prohibit indirect syntax
    # $lfh->close() or die "Unable to close file : $TMPSUDOER $!";
    
    # chmod oct("0600"),$TMPSUDOER;
    # copy("$configfile","$TMPSUDOER") or die "Copy failed: $!";
    # if($match_found==0){&expand_include_current_level();}
    # #$CNT        = bq cat $TMPSUDOER | wc -l bq; #backquote
     # my $TMPSUDOER_CNT_fh=IO::File->new ("$TMPSUDOER","<");   #prohibit indirect syntax
    # my $TMPSUDOER_ln_CNT=0;
    # $INCL_STMTS="";
    # while ( my $includeline = <$TMPSUDOER_CNT_fh> )
    # {   $includeline =~ s/\s*$//g; 
        # $TMPSUDOER_ln_CNT++;
        # if ( $includeline =~ /^#include\s+[a-zA-Z\/\.]+/ )
        # { 
            # #my($filename, $line_number, $master_text) = get_line_location_text($includeline); #Sub called with "&"
            # if ( $includeline !~ /^#include\s*\//)
            # {
                # #my $include1= $includeline."|".$filename."|". $line_number."|". $master_text;
                # push(@include_stmts,$includeline);    
                # $includeline =~ s/ /_/g;
                # $INCL_STMTS=$INCL_STMTS.$TMPSUDOER_ln_CNT.":".$includeline."\n";
            # }
            
        # }     
    # }
    # $CNT = $TMPSUDOER_ln_CNT;    
    # #
    # $CNT        = trim($CNT); #Sub called with "&"
    # #$INCL_STMTS = bq egrep -in "^#include(dir)? +[a-zA-Z\/\.]+" $TMPSUDOER | sed 's/ /_/' bq; #backquote
    # #Work item     3177
    # $INCL_STMTS =~ s/[^!-~\s]//g;
    # $TMPSUDOER_CNT_fh->close();
    # if ($DEBUG)
    # {
        # print "\nIncorporateIncludes:\n";
        # print "\tTMPSUDOER=$TMPSUDOER\n";
        # print "\tTMPSUDOER1=$TMPSUDOER1\n";
        # print "\tCNT=$CNT|\n";
        # print "\tINCL_STMTS=\n$INCL_STMTS|\n";
    # }

    # while ($INCL_STMTS)
    # {
        # if ($DEBUG)
        # {
            # print "\n\t\t'$TMPSUDOER' contains $CNT lines\n";
            # print "\t\tCNT=$CNT\n";
            # print "\t\tthere are #include statements in the '$TMPSUDOER' sudoer file\n";
            # print "\t\tINCL_STMTS=\n$INCL_STMTS|\n";
        # }

        # foreach (split(/\n/, $INCL_STMTS))
        # {
            # $STMT = $_;            
            
            # ###Changes for Defect 75948 - incorrect parse of include statement if tab is used before filename###
            # $STMT =~ s/[\t\_]+/_/g;
            
            # # --------------------------------------------------------------- #
            # # from sudoers manpage : The file name may include the %h escape, #
            # # signifying the short form of the host name                      #
            # # --------------------------------------------------------------- #
            
            
            
            # ($INC_LINE, $INC_TYPE) = split(/:/, $STMT);
            # ($INC_TYPE, $INC_FILE) = split(/_/, $INC_TYPE,2);
            # $INC_TYPE = lc($INC_TYPE);
            # $INC_FILE =~ s/%h/$HOST/;
            # if ($DEBUG)
            # {
                # print "\t\t\tSTMT=$STMT|\n";
                # print "\t\t\tINC_LINE=$INC_LINE\n";
                # print "\t\t\tINC_TYPE=$INC_TYPE\n";
                # print "\t\t\tINC_FILE=$INC_FILE\n";
            # }

            # if ($INC_TYPE =~ m/#include/)
            # {
                # if ($DEBUG) { print "\t\tFile include..INC_TYPE=$INC_TYPE\n"; }
                # $INC_FILE =~ s/\n|\r|^\s+|\s+$//g;
                # chomp($INC_FILE);
                # my $include = $INC_TYPE." ".$INC_FILE;
                # if($INC_FILE =~ /^\.\//)
                # {
                    # $INC_FILE =~ s/^\./$location_sudoers_file/g;
                # }
                # if (-f $INC_FILE)
                # { 
                    # push(@files_refered1,$INC_FILE);
                    # push(@files_included1,$INC_FILE);
                    # $security_settings{"included_file_$STMT"}=$INC_FILE;
                    # &check_sudo_template_file_min_reqd_version($INC_TYPE,$INC_FILE,$INC_FILE);
                    # #$CONTENTS = bq cat $INC_FILE bq; #backquote
                    # if ( -z $INC_FILE )
                    # {
                        # if ($DEBUG) { print "\t\tFile '$INC_FILE' is empty...delete entry from $TMPSUDOER file\n"; }

                        
                        # &DeleteLineFromFile("$INC_LINE", "$TMPSUDOER");
                    # }
                    # else
                    # {
                        # if ($DEBUG) { print "\t\tFile '$INC_FILE' has data...delete include entry from $TMPSUDOER file and add in\n"; }

                        # #&InsertDataAtLineInFile("$CONTENTS","$INC_LINE","$TMPSUDOER");
                        # #$CNT        = bq cat $TMPSUDOER | wc -l bq; #backquote
                        # #
                        # my $TMPSUDOER_CNT_fh=IO::File->new ("$TMPSUDOER","<");    #prohibit indirect syntax
                        # $CNT = @{[<$TMPSUDOER_CNT_fh>]};
                        # $TMPSUDOER_CNT_fh->close();
                        # #
                        # $CNT        = trim($CNT); #Sub called with "&"
                        # &InsertDataAtLineInFile("$INC_FILE", "$INC_LINE", "$TMPSUDOER");
                        # if($match_found==0){&expand_include_current_level();}
                        # $all_sudoers_files{$INC_FILE}="included";
                    # }
                # }
                # else
                # {
                    # # ------------------------------------------------  #
                    # # delete include line of non-existent file from the #
                    # # sudoers file we will use for processing.          #
                    # # ------------------------------------------------- #
                    # if ($DEBUG) { print "\t\tFile '$INC_FILE' does not exist...delete entry from $TMPSUDOER file\n"; }
                   

                    # &DeleteLineFromFile("$INC_LINE", "$TMPSUDOER");
                # }
            # }
            # else
            # {
                # if ($DEBUG) { print "\t\tUnrecognized include type '$INC_TYPE' in line '$STMT'\n"; }
                
                # &DeleteLineFromFile("$INC_LINE", "$TMPSUDOER");
            # }
            # last;
        # }
        # #$CNT        = bq cat $TMPSUDOER | wc -l bq; #backquote
        # #
        # my $TMPSUDOER_CNT_fh_new=IO::File->new ("$TMPSUDOER","<");    #prohibit indirect syntax
        # my $TMPSUDOER_ln_CNT_new=0;
        # $INCL_STMTS="";
        # while ( my $includeline = <$TMPSUDOER_CNT_fh_new> )
        # { $includeline =~ s/\s*$//g; 
            # $TMPSUDOER_ln_CNT_new++;
            
            # my $file_dir=$includeline;
            # $file_dir=~ s/#include\s*//g;
            # if(-d $file_dir && $includeline=~/^#include\s+[a-zA-Z\/\.]+/ )
            # {
                # $includeline=~ s/#include/#includedir/g;
            # }
            # if ( $includeline =~ /^#include\s+[a-zA-Z\/\.]+/ )
            # {
                # my($f_name, $l_number, $m_text) = get_line_location_text($includeline); #Sub called with "&"
                # if ( $includeline !~ /^#include\s*\// && $m_text=~/master/ )
                # {
                # }
                # else
                # {
                    # $includeline =~ s/ /_/g;
                    # $INCL_STMTS=$INCL_STMTS.$TMPSUDOER_ln_CNT_new.":".$includeline."\n"; 
                # }         
            # }  
                    
        # } 
        # $CNT = $TMPSUDOER_ln_CNT_new;    
        # # my $TMPSUDOER_CNT_fh=new IO::File ("$TMPSUDOER","<");
        # # $CNT = @{[<$TMPSUDOER_CNT_fh>]};
        # # $TMPSUDOER_CNT_fh->close();
        # #
        # $CNT        = trim($CNT);
        # #$INCL_STMTS = bq egrep -in "^#include(dir)? +[a-zA-Z\/\.]+" $TMPSUDOER | sed 's/ /_/' bq; #backquote
        # $TMPSUDOER_CNT_fh_new->close();
    # }

     # #&check_nonstandard_include_files();
     
    # #$configfile = $TMPSUDOER;

    # if ($DEBUG)
    # {
        # print "\nALL INCLUDE and INCLUDEDIR statements in '$ORIG_SUDOER' have been processed\n";
        # print "UPDATED FILE IS CONTAINED IN '$TMPSUDOER'\n";
        # print "examining updated '$configfile' file instead of original '$ORIG_SUDOER'\n";
    # }
    # return ;##require final return
# }


###########################################################################
# This subroutine will search out and incorporate any #include statements #
# specified in the sudoers file.  Each include is processed into a copy   #
# of the sudoers file and this updated file is then searched again for    #
# include statements.  In this way, include statements imbedded in other  #
# included files are processed in order.                                  #
#                                      #
# Also the include filename may include the %h escape, signifying the     #
# short form of the host name.  This is translated in this subroutined.   #
###########################################################################
sub IncorporateIncludes
{
    my $INCL_STMTS;
    my $STMT;
   
    my $INC_TYPE;
    my $INC_FILE;
    my @FILELIST;
    #my $CONTENTS; #is declared but not used
    

    #$foundfile=0;
    # hash lookup for the primary file name    
    my $fh = IO::File->new("$configfile", "<"); #prohibit indirect syntax
    while (my $line = <$fh>)
    {
        chomp($line);
        if ($line =~ /^\s*(\#.*)/x || $line =~ /.*(\#.*)/x){push(@orig_comment_array, $1);} #Regular expression without "/x"
        # line content, file name, line number, 1 = master file
        add_line_location($line, "$configfile", $., 1); #Sub called with "&"
    }    
    $fh->close();
    ###Changes for Task Task 63893###
    $TMPSUDOER  = "$OUTDIR/$pn.sudoers.$PID.$PID";
    $TMPSUDOER1 = "$OUTDIR/$pn.sudoers.$PID";

    unlink $TMPSUDOER;
    unlink $TMPSUDOER1;
    my $lfh = IO::File->new("$TMPSUDOER", ">") or die "Unable to open file $TMPSUDOER : $!";    #prohibit indirect syntax
    $lfh->close() or die "Unable to close file : $TMPSUDOER $!";
    
    chmod oct("0600"),$TMPSUDOER;
    copy("$configfile","$TMPSUDOER") or die "Copy failed: $!";
    if($match_found==0){expand_include_current_level();} #Sub called with "&"
    #$CNT        = bq cat $TMPSUDOER | wc -l bq; #backquote
     my $TMPSUDOER_CNT_fh=IO::File->new ("$TMPSUDOER","<"); #prohibit indirect syntax
    my $TMPSUDOER_ln_CNT=0;
    $INCL_STMTS="";
    while ( my $includeline = <$TMPSUDOER_CNT_fh> )
    {   $includeline =~ s/\s*$//xg;  #Regular expression without "/x"
        $TMPSUDOER_ln_CNT++;
        if ( $includeline =~ /^\#include(dir)?\s+[a-zA-Z\/\.]+/x ) #Regular expression without "/x"
        {   
             # if ( $includeline =~ /^#includedir\s+[a-zA-Z\/\.]+/ )
             # {
                # #my($filename, $line_number, $master_text) = get_line_location_text($includeline); #Sub called with "&"
                # #my $include1= $includeline."|".$filename."|". $line_number."|". $master_text;
                # push(@include_stmts,$includeline);
            # }
            push(@include_stmts,$includeline);
            $includeline =~ s/ /_/g;
            $INCL_STMTS=$INCL_STMTS.$TMPSUDOER_ln_CNT.":".$includeline."\n";
            
            
        }    
    }
    $CNT = $TMPSUDOER_ln_CNT;    
    #
    $CNT        = trim($CNT); #Sub called with "&"
    #$INCL_STMTS = bq egrep -in "^#include(dir)? +[a-zA-Z\/\.]+" $TMPSUDOER | sed 's/ /_/' bq; #backquote
    #Work item     3177
    $INCL_STMTS =~ s/[^!-~\s]//xg; #Regular expression without "/x"
    $TMPSUDOER_CNT_fh->close();
    if ($DEBUG)
    {
        print "\nIncorporateIncludes:\n";
        print "\tTMPSUDOER=$TMPSUDOER\n";
        print "\tTMPSUDOER1=$TMPSUDOER1\n";
        print "\tCNT=$CNT|\n";
        print "\tINCL_STMTS=\n$INCL_STMTS|\n";
    }

    while ($INCL_STMTS)
    {
        if ($DEBUG)
        {
            print "\n\t\t'$TMPSUDOER' contains $CNT lines\n";
            print "\t\tCNT=$CNT\n";
            print "\t\tthere are #include statements in the '$TMPSUDOER' sudoer file\n";
            print "\t\tINCL_STMTS=\n$INCL_STMTS|\n";
        }

        foreach (split(/\n/x, $INCL_STMTS)) #Regular expression without "/x"
        {
            $STMT = $_;            
            
            ###Changes for Defect 75948 - incorrect parse of include statement if tab is used before filename###
            $STMT =~ s/[\t\_]+/_/xg; #Regular expression without "/x"
            
            # --------------------------------------------------------------- #
            # from sudoers manpage : The file name may include the %h escape, #
            # signifying the short form of the host name                      #
            # --------------------------------------------------------------- #

            ($INC_LINE, $INC_TYPE) = split(/:/x, $STMT); #Regular expression without "/x"
            ($INC_TYPE, $INC_FILE) = split(/_/x, $INC_TYPE,2); #Regular expression without "/x"
            $INC_TYPE = lc($INC_TYPE);
            $INC_FILE =~ s/%h/$HOST/x; #Regular expression without "/x"
            if ($DEBUG)
            {
                print "\t\t\tSTMT=$STMT|\n";
                print "\t\t\tINC_LINE=$INC_LINE\n";
                print "\t\t\tINC_TYPE=$INC_TYPE\n";
                print "\t\t\tINC_FILE=$INC_FILE\n";
            }

            if ($INC_TYPE =~ m/\#includedir/x)#Regular expression without "/x"
            {
                my $for_getline="$INC_TYPE $INC_FILE";
                my ($filename, $line_number, $master_text) = get_line_location_text($for_getline); #Sub called with "&"
                if ($DEBUG) { print "\t\t\tDirectory include\n"; }
                $INC_FILE =~ s/\n|\r|^\s+|\s+$//xg; #Regular expression without "/x"
                $INC_FILE =~ s/\/\s*$//xg; #Regular expression without "/x"
                chomp($INC_FILE);
                if($INC_FILE =~ /^\.\//x) #Regular expression without "/x"
                {
                    $INC_FILE =~ s/^\./$location_sudoers_file/xg; #Regular expression without "/x"
                }
                # Removing below enhancement as per enhancement 399279
                #Enhancement 73861(3.6)
                #IssueWarning("#includedir","$line_number","$INC_TYPE $INC_FILE","Use of #includedir in the sudoers file does not satisfy the global requirement for sudo automation","$master_text","$filename", "SFIT73861"); #Sub called with "&"
                IssueNote("#includedir","$line_number","$INC_TYPE $INC_FILE","#includedir are used in the Sudo Configuration file","$master_text","$filename", "SFIT73861"); #Sub called with "&"
                
                # if #includedir directory name is different than /etc/sudoers.d and contains dot anywhere or ~ at the end then skip it. Defect 339289
                if ( -d $INC_FILE )
                {   
                    if ($DEBUG)
                    {
                        print "Processing $INC_FILE\n";
                    }   
                    push(@previouslyvisited,$INC_FILE);
                    push(@files_refered,$INC_FILE);
                    push(@files_included,$INC_FILE);
                    $security_settings{"included_directory_$STMT"}=$INC_FILE;
                    if ($DEBUG) { print "\t\t\tDirectory '$INC_FILE' exists\n"; }

                    # ---------------------------------------------------------------------- #
                    # from sudoers manpage :                                                 #
                    # sudo will read each file in the specified directory, skipping file     #
                    # names that end in ~ or contain a . character to avoid causing problems #
                    # with package manager or editor temporary/backup files.                 #
                    # ---------------------------------------------------------------------- #
                    #@FILELIST = bq ls $INC_FILE bq; #backquote
                    @FILELIST=(map { basename($_) } glob "$INC_FILE/*"); #require block map
                    if ($DEBUG) { print "\t\t\tRAW FILELIST=\n@FILELIST\n"; }                    
                                        
                    # . anywhere in file-name of files under #includedir directory not allowed and ~ at end of file-name is not allowed.
                    @FILELIST = (grep({ !/~$/x }  @FILELIST)); #require block grep #Regular expression without "/x"
                    @FILELIST = (grep({ !/\./x } @FILELIST));  #require block grep #Regular expression without "/x"
                    
                    if ($DEBUG) { print "\t\t\tFiltered FILELIST=\n@FILELIST\n"; }
                    #for(my $i=0;$i<=$#FILELIST;$i++)
                     for(0..$#FILELIST)
                    {
                        chomp $FILELIST[$_];
                        $FILELIST[$_]="#include $INC_FILE/".$FILELIST[$_]."\n";
                    }
                                        
                    if ($DEBUG) { print "\t\t\tFull Path FILELIST=\n@FILELIST\n"; }
                    
                    if (!@FILELIST)
                    {
                        if ($DEBUG) { print "\t\t\tDirectory '$INC_FILE' has no valid file entries\n"; }
                        DeleteLineFromFile("$INC_LINE", "$TMPSUDOER"); #Sub called with "&"
                    }
                    else
                    {
                        # ------------------------------------------- #
                        # add each valid file as an #include into the #
                        # the sudoer file to be processed again       #
                        # ------------------------------------------- #
                        if ($DEBUG) { print "\t\t\tDirectory '$INC_FILE' has valid file entries\n"; }
                        #$CNT        = bq cat $TMPSUDOER | wc -l bq; #backquote
                        #
                         my $TMPSUDOER_CNT_fh_copy=IO::File->new ("$TMPSUDOER","<");    #prohibit indirect syntax #Reused variable name in lexical scope
                        $CNT = @{[<$TMPSUDOER_CNT_fh_copy>]};
                        $TMPSUDOER_CNT_fh_copy->close();
                        #
                        $CNT        = trim($CNT); #Sub called with "&"
                        InsertDataAtLineInFile(join("\n", @FILELIST), "$INC_LINE", "$TMPSUDOER"); #Sub called with "&"
                        if($match_found==0){expand_include_current_level();} #Sub called with "&"
                    }
                }
                else
                {
                    if ($DEBUG) { print "\t\t\t'$INC_FILE' does not exist or is not a directory"; }
                    DeleteLineFromFile("$INC_LINE", "$TMPSUDOER"); #Sub called with "&"
                    if ($MASTERFILE)
                    {
                        IssueError("", "", "$INC_FILE",
                                      "'$INC_FILE' does not exist or is not a directory.  Possibly not copied/updated for 'Master' sudoer file test",
                                      "", "$INC_FILE", 'SFIT4759'); #Sub called with "&"
                    }
                    else
                    {
                        IssueError("", "", "$INC_FILE", "'$INC_FILE' does not exist or is not a directory", "", "$INC_FILE", 'SFIT4759'); #Sub called with "&"
                    }
                }
            }
            elsif ($INC_TYPE =~ m/\#include/x) #Regular expression without "/x"
            {
                if ($DEBUG) { print "\t\tFile include..INC_TYPE=$INC_TYPE\n"; }
                $INC_FILE =~ s/\n|\r|^\s+|\s+$//xg; #Regular expression without "/x"
                chomp($INC_FILE);
                if($INC_FILE =~ /^\.\//x) #Regular expression without "/x"
                {
                    $INC_FILE =~ s/^\./$location_sudoers_file/xg; #Regular expression without "/x"
                }
                if (-f $INC_FILE)
                {
                    push(@files_refered,$INC_FILE);
                    push(@files_included,$INC_FILE);
                    $security_settings{"included_file_$STMT"}=$INC_FILE;
                    check_sudo_template_file_min_reqd_version($INC_TYPE,$INC_FILE,$INC_FILE); #Sub called with "&"
                    #$CONTENTS = bq cat $INC_FILE bq; #backquote
                    if ( -z $INC_FILE )
                    {
                        if ($DEBUG) { print "\t\tFile '$INC_FILE' is empty...delete entry from $TMPSUDOER file\n"; }

                        IssueError("", "", "$INC_FILE", "File '$INC_FILE' exists but is empty", "", "$INC_FILE", 'SFIT4759'); #Sub called with "&"
                        DeleteLineFromFile("$INC_LINE", "$TMPSUDOER"); #Sub called with "&"
                    }
                    else
                    {
                        if ($DEBUG) { print "\t\tFile '$INC_FILE' has data...delete include entry from $TMPSUDOER file and add in\n"; }

                        #&InsertDataAtLineInFile("$CONTENTS","$INC_LINE","$TMPSUDOER");
                        #$CNT        = bq cat $TMPSUDOER | wc -l bq; #backquote
                        #
                        my $TMPSUDOER_CNT_fh_copy=IO::File->new ("$TMPSUDOER","<"); #prohibit indirect syntax #Reused variable name in lexical scope
                        $CNT = @{[<$TMPSUDOER_CNT_fh_copy>]};
                        $TMPSUDOER_CNT_fh_copy->close();
                        #
                        $CNT        = trim($CNT); #Sub called with "&"
                        InsertDataAtLineInFile("$INC_FILE", "$INC_LINE", "$TMPSUDOER"); #Sub called with "&"
                        if($match_found==0){expand_include_current_level();} #Sub called with "&"
                        $all_sudoers_files{$INC_FILE}="included";
                    }
                }
                else
                {
                    # ------------------------------------------------  #
                    # delete include line of non-existent file from the #
                    # sudoers file we will use for processing.          #
                    # ------------------------------------------------- #
                    if ($DEBUG) { print "\t\tFile '$INC_FILE' does not exist...delete entry from $TMPSUDOER file\n"; }
                    if ($MASTERFILE)
                    {
                        IssueError("", "", "$INC_FILE", "File '$INC_FILE' does not exist.  Possibly not copied/updated for 'Master' sudoer file test",
                                        "", "$INC_FILE", 'SFIT4759'); #Sub called with "&"
                    }
                    else
                    {
                        IssueError("", "", "$INC_FILE", "File '$INC_FILE' does not exist", "", "$INC_FILE", 'SFIT4759'); #Sub called with "&"
                    }

                    DeleteLineFromFile("$INC_LINE", "$TMPSUDOER"); #Sub called with "&"
                }
            }
            else
            {
                if ($DEBUG) { print "\t\tUnrecognized include type '$INC_TYPE' in line '$STMT'\n"; }
                IssueViolation("", "", "$INC_FILE", "Unrecognized include type '$INC_TYPE'", "", "$INC_FILE", 'SFIT4759'); #Sub called with "&"
                DeleteLineFromFile("$INC_LINE", "$TMPSUDOER"); #Sub called with "&"
            }
            last;
        }
        #$CNT        = bq cat $TMPSUDOER | wc -l bq; #backquote
        #
        my $TMPSUDOER_CNT_fh_new=IO::File->new ("$TMPSUDOER","<");  #prohibit indirect syntax
        my $TMPSUDOER_ln_CNT_new=0;
        $INCL_STMTS="";
        while ( my $includeline = <$TMPSUDOER_CNT_fh_new> )
        { $includeline =~ s/\s*$//xg;  #Regular expression without "/x"
            $TMPSUDOER_ln_CNT_new++;
            
            my $file_dir=$includeline;
            $file_dir=~ s/\#include\s*//xg;
            if(-d $file_dir && $includeline=~/^\#include\s+[a-zA-Z\/\.]+/x ) #Regular expression without "/x"
            {
                $includeline=~ s/\#include/#includedir/xg;#Regular expression without "/x"
            }
            if ( $includeline =~ /^\#include(dir)?\s+[a-zA-Z\/\.]+/x )
            {
                $includeline =~ s/ /_/g;
                $INCL_STMTS=$INCL_STMTS.$TMPSUDOER_ln_CNT_new.":".$includeline."\n";            
            }    
        }
        $CNT = $TMPSUDOER_ln_CNT_new;    
        # my $TMPSUDOER_CNT_fh=new IO::File ("$TMPSUDOER","<");
        # $CNT = @{[<$TMPSUDOER_CNT_fh>]};
        # $TMPSUDOER_CNT_fh->close();
        #
        $CNT        = trim($CNT); #Sub called with "&"
        #$INCL_STMTS = bq egrep -in "^#include(dir)? +[a-zA-Z\/\.]+" $TMPSUDOER | sed 's/ /_/' bq; #backquote
        $TMPSUDOER_CNT_fh_new->close();
    }

     check_nonstandard_include_files(); #Sub called with "&"
     
    $configfile = $TMPSUDOER;

    if ($DEBUG)
    {
        print "\nALL INCLUDE and INCLUDEDIR statements in '$ORIG_SUDOER' have been processed\n";
        print "UPDATED FILE IS CONTAINED IN '$TMPSUDOER'\n";
        print "examining updated '$configfile' file instead of original '$ORIG_SUDOER'\n";
    }
    return ;##require final return
}

###Task 60263 - Issue Attention message if non-standard include file name is used###

sub check_nonstandard_include_files
{
    my $header;
    my $line_number;
    my $master_text;
    #my $filename; #Reused variable name in lexical scope
    foreach my $inc_file(@files_included)
    {
       my $filename = $inc_file;
       $filename =~ s!^.*/([^/]*)$!$1!x; #Regular expression without "/x"      
       # Providing exception to /etc/sudoers.d directory as per WI. 399279
       if( ( $filename =~ m/^[5|6|7]/x or $filename =~ m/^[a-z]+/x ) and $inc_file !~ m/^\/etc\/sudoers.d\/$filename/x and $inc_file !~ m/^\/etc\/sudoers.d/x ) #Regular expression without "/x"
       {
           IssueAttention($header, $line_number,"Include File '$inc_file'", " Non-standard include file name is used", $master_text, $filename, 'SFIT60263'); #Sub called with "&"
       }
    }
    return ;##require final return
}

sub DeleteLineFromFile
{
    my($LINE, $FILE)= @_; ##require argument unpacking  
    my $TMPSUDOER1fh = IO::File->new("$TMPSUDOER1", ">");       #prohibit indirect syntax
    my $FILEfh = IO::File->new("$FILE", "<");   #prohibit indirect syntax
    my @Filearray=<$FILEfh>;
    my $line_number_to_delete=$LINE - 1;
    
    if ($DEBUG)
    {
        print "File Before:\n";
        foreach my $line (@Filearray)
        {
            print "$line";
        }
    }
    splice @Filearray, $line_number_to_delete, 1;
    foreach my $line (@Filearray)
    {
        print $TMPSUDOER1fh "$line";
    }   
    $TMPSUDOER1fh->close();
    $FILEfh->close();
    if ($DEBUG)
    {
        print "File After:\n";
        foreach my $line (@Filearray)
        {
                print "$line";
        }
    }        
    copy("$TMPSUDOER1","$FILE") or die "Copy failed: $!";
    unlink $TMPSUDOER1;
    return ;##require final return
}
sub expand_include_current_level
{
    #my $search_pattern;#Reused variable name in lexical scope
    #my $replace_pattern; #Reused variable name in lexical scope
    if($DEBUG)
    {
        print "\nexpand_include_current_level:\n";
    }
    if($tempdir_path =~ /[\d\w]+/x) #Regular expression without "/x"
    {
        $tempdir_path =~ s/(^s:)|:g$//xg; #Regular expression without "/x"
        my($search_pattern,$replace_pattern)=split(/:/x,$tempdir_path); #Regular expression without "/x"
        
        $search_pattern =~ s/\//\\\//xg ; #Regular expression without "/x"

        if($DEBUG){
            print "search_pattern = $search_pattern\n";
            print "replace_pattern = $replace_pattern\n";
        }
        copy("$TMPSUDOER","$TMPSUDOER1") or die "Copy failed: $!";
        my $READ_FILE = IO::File->new("$TMPSUDOER1", "<") || die("can't open to $TMPSUDOER1:\n");       #prohibit indirect syntax
        my $WRITE_FILE = IO::File->new("$TMPSUDOER", ">") || die("can't open to $TMPSUDOER:\n");    #prohibit indirect syntax
        while(<$READ_FILE>) 
        {
            if($match_found == 0 and ($_ =~ /^(\s*\#includedir\s+)$search_pattern/x or $_ =~ /^(\s*\#include\s+)$search_pattern/x)){$match_found=1;}#Regular expression without "/x"
            s/^(?:\s*\#includedir\s+)$search_pattern/#includedir $replace_pattern/xg; #ProhibitUnusedCapture #Regular expression without "/x"
            s/^(?:\s*\#include\s+)$search_pattern/#include $replace_pattern/xg; #ProhibitUnusedCapture #Regular expression without "/x"
            print($WRITE_FILE $_);
        }        
        $READ_FILE->close();
        $WRITE_FILE->close();
        unlink $TMPSUDOER1;
        
        if($DEBUG) 
        {
            my $TMPSUDOERfh = IO::File->new("$TMPSUDOER", "<") or die "Could not open file '$TMPSUDOER' $!";    #prohibit indirect syntax
            while (my $line = <$TMPSUDOERfh>) 
            {
              chomp $line;
              print "$line\n";
            }
            $TMPSUDOERfh->close();

        }
    }
    return ;##require final return
}
###########################################################################
# InsertDataAtLineinFile ($INSERTDATA, $LINE, $INTOFILE) : Inserts the    #
#       contents of the file or variable $INSERTDATA into the file        #
#       $INTOFILE in place of line number $LINE (ie, line number LINE     #
#       is replaced with the contents of the file or variable $INSERFILE) #
###########################################################################
sub InsertDataAtLineInFile
{
    my($INSERTDATA,$LINE,$INTOFILE)=@_; ##require argument unpacking
    chomp ($INSERTDATA);
    my $BEGINNING;
    my $ENDING;

    # ---------------------------------------#
    # copy the beginning of the INTOFILE up  #
    # to but not including line number $LINE #
    # into the intermediate temp file.       #
    # -------------------------------------- #
    $BEGINNING = $INC_LINE - 1;
    if ($DEBUG)
    {
        print "\nIn InsertDataAtLineInFile\n";
        print "\tINSERTDATA=$INSERTDATA\n";
        print "\tLINE=$LINE\n";
        print "\tINTOFILE=$INTOFILE\n";
    }
    
    my $head=$BEGINNING-1;  
    my $INTOFILEfh = IO::File->new("$INTOFILE", "<");   #prohibit indirect syntax
    chomp(my @match = (<$INTOFILEfh>)[0..$head]);
    $INTOFILEfh->close();
    my $TMPSUDOER1fh = IO::File->new("$TMPSUDOER1", ">");   #prohibit indirect syntax
    foreach my $line(@match)
    {
        print $TMPSUDOER1fh "$line\n";
    }
    $TMPSUDOER1fh->close();
    chomp(my $data=$INSERTDATA);
    #if (-f $data)
    if ($data!~/\n/x && -f $data ) #Regular expression without "/x"#added due to the warning "Unsuccessful stat on file"
    {
        if ($DEBUG) { print "\t\t\t\tData is a file...insert file contents\n"; }

        # -------------------------------------- #
        # copy the contents of the file          #
        # $INSERTDATA into the intermediate temp #
        # file.                                  #
        # -------------------------------------- #      
        my $TMPSUDOER1fh_copy = IO::File->new("$TMPSUDOER1", ">>") or die "Could not open file '$TMPSUDOER1' $!";       #prohibit indirect syntax #Reused variable name in lexical scope    
        my $INSERTDATAfh = IO::File->new("$INSERTDATA", "<") or die "Could not open file '$INSERTDATA' $!"; #prohibit indirect syntax
        while (my $line = <$INSERTDATAfh>) 
        {         
          print $TMPSUDOER1fh_copy "$line\n";
        }
        $INSERTDATAfh->close(); 
        $TMPSUDOER1fh_copy->close();    


        # track line content and file origin 
        my $fh = IO::File->new("$INSERTDATA", "<"); #prohibit indirect syntax
        while (my $line = <$fh>)
        {
            chomp($line);
            # line content, file name, line number, 0 = included file   
            if($line)
            {
                #my $include1= $line."|".$INSERTDATA."|". $.."|"."included" ; incase u want to append the lineno and more details wid file so that 2 files having same data can gv correct o/p
                #$include1=~ s/=\|.*//g;
                # if($INSERTDATA =~/^\// && $foundfile==1 ) #for #include
                # {
                    # push(@include_stmts,$line);
                # }
                if($INSERTDATA =~/^\//x && $line=~ /^\#include(dir)?\s+[a-zA-Z\/\.]+/x ) #Regular expression without "/x"#for #includedir an dir stmts
                {
                    push(@include_stmts,$line);
                }
            }
            
            add_line_location($line, $INSERTDATA, $., 0); #Sub called with "&"
        }        
        $fh->close();

    }
    else
    {
        if ($DEBUG)
        {
            print "\t\t\t\tData is just Data...insert the data\n";
            print "\t\t\t\tTMPSUODER1=$TMPSUDOER1\n";
            print "\t\t\t\tINSERTDATA=$INSERTDATA\n";
        }

        # -------------------------------------- #
        # copy the data contents of the variable #
        # $INSERTDATA into the intermediate temp #
        # file.                                  #
        # -------------------------------------- #              
        my $TMPSUDOER1fh_copy = IO::File->new("$TMPSUDOER1", ">>");         #prohibit indirect syntax #Reused variable name in lexical scope
        
        print $TMPSUDOER1fh_copy "$INSERTDATA\n";
        $TMPSUDOER1fh_copy->close();
    }

    # ---------------------------------------#
    # copy the ending of the INFILE after    #
    # but not including line number $LINE    #
    # into the intermediate temp file.       #
    # -------------------------------------- #  
    my $TMPSUDOER1fh2 = IO::File->new("$TMPSUDOER1", ">>"); #prohibit indirect syntax
    print $TMPSUDOER1fh2 "\n";
    $TMPSUDOER1fh2->close();

    
    $ENDING = $CNT - $INC_LINE;
    my $tail="-$ENDING";
    my $INTOFILEfh1 = IO::File->new("$INTOFILE", "<");  #prohibit indirect syntax
    chomp(my @match1 = (<$INTOFILEfh1>)[$tail..-1]);
    $INTOFILEfh1->close();
    my $TMPSUDOER1fh1 = IO::File->new("$TMPSUDOER1", ">>"); #prohibit indirect syntax
    foreach my $line(@match1)
    {
        print $TMPSUDOER1fh1 "$line\n";
    }
    $TMPSUDOER1fh1->close();

    # ------------------------------------ #
    # copy new temp file to sudoer file we #
    # will use for processing, then delete #
    # the intermediate temp file           #
    # ------------------------------------ #
    copy("$TMPSUDOER1","$INTOFILE") or die "Copy failed: $!";
    unlink $TMPSUDOER1;
    return ;##require final return
}

sub INT_handler
{

    # close all files.
    # note SIG doesn't work if there are print msgs to the STDOUT

    Delete_Temp_Files(); #Sub called with "&"

    # reset signals to default values (do we need this if we're quitting?)
    local $SIG{INT}  = "DEFAULT"; #require localized punctuation vars
    local $SIG{QUIT} = "DEFAULT"; #require localized punctuation vars
    local $SIG{ABRT} = "DEFAULT"; #require localized punctuation vars
    local $SIG{TERM} = "DEFAULT"; #require localized punctuation vars

    # send error message to log file.
    exit;
}

sub Delete_Temp_Files
{
    # note SIG doesn't work if there are print msgs to the STDOUT in the handler
    #if ($DEBUG) { print "\nIN DELETE_TEMP_FILES\n"; }
    unlink "$OUTDIR/$pn.err.$$";
    ###Changes for Task Task 63893###
    ### Deleting Copy of sudoers file and copy tmpcsv file from Output Directory#####
    unlink "$OUTDIR/$pn.sudoers.$PID.$PID";
    unlink "$OUTDIR/$pn.sudoers.$PID";
    unlink "$CSVTMP";
    unlink "$CSVTMP2";
    return ;##require final return
}

####################################################
# Iniitalize IBM Aliases arrays to "0" (not found) #
####################################################
sub InitializeIBMAliases
{
    foreach (split(/ /, trim($REQUIRED_IBM_ALIASES))) #Sub called with "&"
    {
        $DEFINED_IBM_ALIASES{$_} = 0;
        $USED_IBM_ALIASES{$_}    = 0;
    }
    return ;##require final return
}

##########################################################
# check_naked_ALL : issues a violation for any line in the #
#    @sudoers_file that ends in ALL                   #
##########################################################
sub check_naked_ALL
{   
    my ($array_ref_copy) = @_; ###require argument unpacking #Reused variable name in lexical scope     #Get reference of sudoers array and continue using it
    if($DEBUG)
    {
        print "In check_naked_ALL\n"; 
    }
    my @naked_ALL;
    my $header;
    my $rest;
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    my @sudoers_matches;
    @sudoers_file_copy = grep ({ defined() and length() } @sudoers_file_copy);
    @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_copy);  #Regular expression without "/x"  #require block grep
    # clarified the rule -- only ending with ALL
    @naked_ALL = grep ({ /\=\s*(.*[^\_\!])?ALL\s*(\,\s*(EXEC|PASSWD)\s*\:\s*)?$/x } @sudoers_matches);   #Regular expression without "/x"#require block grep
    #@naked_ALL = grep ({ !/\=\s*(?:.*[^\_\!])?[\w\/]+[\s\-\w]ALL\s*(?:\,\s*(?:EXEC|PASSWD)\s*\:\s*)?$/x } @naked_ALL);  #Regular expression without "/x" #require block grep #ProhibitUnusedCapture
    my $regex_for_tags ='(?:\,\s*(?:EXEC|PASSWD)\s*\:\s*)?';
    @naked_ALL = grep ({ !/\=\s*(?:.*[^\_\!])?[\w\/]+[\s\-\w]ALL\s*$regex_for_tags$/x } @naked_ALL);  #Regular expression without "/x" #require block grep #ProhibitUnusedCapture #ProhibitComplexRegexes
    # find those not followed by ! and NOEXEC:

    if (@naked_ALL)
    {
        foreach my $line (@naked_ALL)
        {
            ($header, $rest) = (split(/=/x, $line, 2)); #Regular expression without "/x"
            my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
            IssueViolation($header, $line_number, "ALL", "Line contains naked ALL", $master_text, $filename, 'SFIT2511'); #Sub called with "&"
        }
    }
    else
    {
        IssueSuccess("", "", "ALL", "No active  #Sub called with "&"naked ALL lines in sudoers", "", "", 'SFIT2511'); #Defect 52371
    }
    return; #require final return
}

####################################################################
# CheckSUDOSUDO :  Last line in sudoersfile must contain !SUDOSUDO #
#  - @sudoers_file already has blank lines and comments removed    #
#  - last line in @sudoers_file is [-1]                            #
####################################################################
sub CheckSUDOSUDO
{
    my ($array_ref_copy) = @_;             #Get reference of sudoers array and continue using it #Reused variable name in lexical scope
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    my $LASTLINE = "";
    my $header;
    my $rest;

    if ($DEBUG)
    {
        print "CheckSUDOSUDO\n";
        print "last line = $sudoers_file_copy[-1]\n";
    }
    
    #checking if array is non empty.
    if($sudoers_file_copy[-1])
    {
        $LASTLINE = grep({ /!SUDOSUDO/x } $sudoers_file_copy[-1]);   #Regular expression without "/x"#require block grep
    }

    if (!$LASTLINE)
    {
        ($header, $rest) = split(/=/x, $sudoers_file_copy[-1], 2); #pankaj #Regular expression without "/x"
        
        if($sudoers_file_copy[-1])
        {
            my ($filename, $line_number, $master_text) = get_line_location_text($sudoers_file_copy[-1]); #Sub called with "&"
            IssueError("$header", $line_number, "SUDOSUDO", "Last line in sudoers file does not contain '!SUDOSUDO'", $master_text, $filename, 'SFIT2527'); #Sub called with "&"
        }
        else
        {
            IssueError("$header", 1, "SUDOSUDO", "Last line in sudoers file does not contain '!SUDOSUDO'","master", $ORIG_SUDOER, 'SFIT2527'); #Sub called with "&"
        }
    }
    else
    {
        IssueSuccess("", "", "SUDOSUDO", "Last line in sudoers file is '!SUDOSUDO'", "", "", 'SFIT2527');        #Defect 52371     #Sub called with "&"
    }
    return; #require final return

}
#sub log
sub log_sfit #prohibit builtin homonyms
{
    my($file,$ECHO_COPY)=@_;###require argument unpacking  #Reused variable name in lexical scope
     
    if(!(-f $file)) { #unless block used 
        my $f = IO::File->new($file, "a") || die "open: $!";    #prohibit indirect syntax
        $f->close();
    }

    my $log_handle = IO::File->new("$file", ">>") || die("$pn can't append to $file:\n");   #prohibit indirect syntax

    #---------------------------------------------------
    # Uncomment next step to verbose all logging actions
    #---------------------------------------------------
    if ($ECHO_COPY)
    {
        print "$msg_CSV";
    }
    print($log_handle $msg_CSV);    
    $log_handle->close();
    return; #require final return
}
############# Defect 52371:Proper format of Pass messages is done ###########
sub IssueSuccess
{
    my ($msg_entry, $line_number, $msg_value, $msg_description, $file_type, $file_name, $msg_source) = @_; ###require argument unpacking
    my $CSVmsg;
    my $msg;                                                    #strict_use
    my $CSVLINE;
    my $message_severity = "PASS";
    if(grep({ /^$msg_source$/x } @DISABLED_MESSAGES)){return;}#require block grep #Regular expression without "/x"
    #$msg_entry = (split(/ /, $msg_entry))[0];  # Added 7Nov to remove trailing host_alias name in output
    #####################
    if($msg_entry =~ /,/x){$msg_entry =~ s/,/|/xg;} #Regular expression without "/x"
    if($msg_value =~ /,/x){$msg_value =~ s/,/|/xg;} #Regular expression without "/x"
    if($msg_description =~ /,/x){$msg_description =~ s/,/|/xg;} #Regular expression without "/x"
    if($file_name =~ /,/x){$file_name =~ s/,/|/xg;} #Regular expression without "/x"
    if($msg_source =~ /,/x){$msg_source =~ s/,/|/xg;}  #Regular expression without "/x"
    #$msg_entry, $line_number, $msg_value, $msg_description, $file_type, $file_name, $msg_source
    #####################
    $CSVmsg = "$msg_entry,$line_number,$msg_value,$msg_description,$file_type,$file_name,$msg_source";

    my @splitted_msg = split(/,/x, $CSVmsg); #Regular expression without "/x"
    $splitted_msg[-1] =~ s/\s//xg; #Regular expression without "/x"
    if ($template_check == 1 and template_storemessage($splitted_msg[-1]) == 1) #Sub called with "&"
    {
        return;
    }
    if ($verbose eq "yes")
    {
        $CSVmsg =~ s/\s+/ /xg;#Regular expression without "/x"
        $msg = "PASS:,$CSVmsg\n\n";
        $msg =~ s/%_PLUS_/\+/xg; #Regular expression without "/x"
        $msg =~ s/,\+/, \+/xg;#Regular expression without "/x"
        print $ERR $msg;
        $CSVmsg =~ s/;/,/xg; #Regular expression without "/x"
        $CSVmsg =~ s/\s*\,\s*/,/xg; #Regular expression without "/x"
        $NUMPASS = $NUMPASS + 1;
        writeToCSV($message_severity.",".$CSVmsg);
        if ($DEBUG) { print "\n$msg"; }
    }
    return; #require final return
}

###########################################################
# ($) : Issues a violation msg to STDOUT,   #
#                     the output report and the CSV file. #
# in this script a VIOLATION Is the same as an ERROR      #
###########################################################
sub IssueViolation
{
    my ($msg_entry, $line_number, $msg_value, $msg_description, $file_type, $file_name, $msg_source) = @_; ###require argument unpacking
    my $CSVLINE="";
    my $msg;                            #strict_use
    my $LINE_HEADER;
    my $IBM_ID_EXISTS =0;
    my $message_severity = "WARNING";
    my $CSVmsg;
    if(!defined $EXTENDED_CHECK_USER){$EXTENDED_CHECK_USER=0;}
    if(grep({ /^$msg_source$/x } @DISABLED_MESSAGES)){return;} #require block grep #Regular expression without "/x"
    $msg_value =~ s/^"|"$//xg; #Regular expression without "/x"
    $msg_description =~ s/^"|"$//xg; #Regular expression without "/x"
    $file_name =~ s/^"|"$//xg; #Regular expression without "/x"

    $LINE_HEADER=$msg_entry;
    if(defined $LINE_HEADER)
    {
        $LINE_HEADER =~ s/User_Alias//xg; #Regular expression without "/x"
        $LINE_HEADER =~ s/\s+ALL\s*$//xg; #Regular expression without "/x"
        $LINE_HEADER =~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"
        $LINE_HEADER =~ s/\|/,/xg; #Regular expression without "/x"
        $IBM_ID_EXISTS = check_ibm_entry_no_SU($LINE_HEADER); #Sub called with "&"
    }
    #if(defined $IBM_ID_EXISTS )
    {
        if(((defined $IBM_ID_EXISTS) && ($IBM_ID_EXISTS == 0)) and $IGNORE_CUSTOMER_ENTRY == 1  and $GECOS_RELIABLE==1){return;}#Enhancement 140662
    }
    if((defined $LINE_HEADER) && ($LINE_HEADER eq "")){$IBM_ID_EXISTS=1;}
    ######
    my $removeall = $msg_entry;
    $removeall =~ s/\s*,\s*/,/xg; #Regular expression without "/x"
    $removeall =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
    $removeall =~ s/\s+[\w,]+$//xg; #Regular expression without "/x"
    if(check_for_suppression($removeall) or check_for_suppression($line_number))
    {
        return;
    }
    $removeall =~ s/^"|"$//xg; #Regular expression without "/x"
    if($removeall =~ /,/x){$removeall =~ s/,/|/xg;} #Regular expression without "/x"
    #####################
    if($msg_entry =~ /,/x){$msg_entry =~ s/,/|/xg;} #Regular expression without "/x"
    if($msg_value =~ /,/x){$msg_value =~ s/,/|/xg;} #Regular expression without "/x"
    if($msg_description =~ /,/x){$msg_description =~ s/,/|/xg;} #Regular expression without "/x"
    if($file_name =~ /,/x){$file_name =~ s/,/|/xg;} #Regular expression without "/x"
    if($msg_source =~ /,/x){$msg_source =~ s/,/|/xg;}  #Regular expression without "/x"
    #$msg_entry, $line_number, $msg_value, $msg_description, $file_type, $file_name, $msg_source
    #####################
    if(!defined $removeall){$removeall= "";}
    if(!defined $line_number){$line_number= "";}
    if(!defined $msg_value){$msg_value= "";}
    if(!defined $msg_description){$msg_description= "";}
    if(!defined $file_type){$file_type= "";}
    if(!defined $file_name){$file_name= "";}
    if(!defined $msg_source){$msg_source= "";}
    $CSVmsg = "$removeall,$line_number,$msg_value,$msg_description,$file_type,$file_name,$msg_source";
    #my $CSVmsg = "$removeall,$line_number,$msg_value,$msg_description,$file_type,$file_name,$msg_source";
    ######
    if ($template_check == 1 and template_storemessage($msg_source) == 1) #Sub called with "&"
    {
        return;
    }

    $CSVmsg =~ s/\s+/ /xg;#Regular expression without "/x"
    $msg = $CSVmsg;
    $CSVmsg =~ s/;/,/xg; #Regular expression without "/x"
    $CSVmsg =~ s/\s*\,\s*/,/xg; #Regular expression without "/x"

    # -------------------------------------------------------------- #
    # If it's in the SEVERITY_LIST it is a deviation/error/violation #
    # otherwise downgrade it to a warning                            #
    # -------------------------------------------------------------- #

    if (($SEVERITY_LIST{$CSVLINE}) || ($NO_DOWNGRADE)||($opt{l})) #Package variable declared or used
    {
        $msg = "ERROR:,$msg\n\n";
        $msg =~ s/%_PLUS_/\+/xg; #Regular expression without "/x"
        $msg =~ s/,\+/, \+/xg;#Regular expression without "/x"
        print $ERR $msg;
        $ERRORS = $ERRORS + 1;

        if ($DEBUG) { print "\n$msg"; }
        $message_severity = "ERROR";
        $CSVmsg           = "$message_severity,$CSVmsg";
        writeToCSV($CSVmsg);
    }
    else
    {
        if (((defined $IBM_ID_EXISTS) && ($IBM_ID_EXISTS =~ /^\d+$/x && $IBM_ID_EXISTS == 1 )) or ($EXTENDED_CHECK_USER == 0) or ((defined $IBM_ID_EXISTS) && ($IBM_ID_EXISTS =~ /^-\d+$/x && $IBM_ID_EXISTS == -1 )) or ($NO_DOWNGRADE =~ /^\d+$/x && $NO_DOWNGRADE == 1)) #Regular expression without "/x"
        {
            IssueWarning($removeall, $line_number, $msg_value, $msg_description, $file_type, $file_name, $msg_source);
        }
        else
        {
            IssueNote($removeall, $line_number, $msg_value, $msg_description, $file_type, $file_name, $msg_source);
        }
        
        return;
    }
    return; #require final return
}

sub IssueError
{
    my ($msg_entry, $line_number, $msg_value, $msg_description, $file_type, $file_name, $msg_source) = @_; ###require argument unpacking
    my @message_array=@_;#require argument unpacking
    my $LINE_HEADER="";
    my $IBM_ID_EXISTS =0;
    my $message_severity = "ERROR";
    my $msg="";             #strict_use
    my $CSVmsg;
    if(grep({ /^\s*$msg_source\s*$/x } @DISABLED_MESSAGES)){return;}#require block grep #Regular expression without "/x"
    $LINE_HEADER=$msg_entry;
    if( defined $LINE_HEADER )
    {
        $LINE_HEADER =~ s/User_Alias//xg; #Regular expression without "/x"
        $LINE_HEADER =~ s/\s+ALL\s*$//xg; #Regular expression without "/x"
        $LINE_HEADER =~ s/(^\s+)|(\s+$)//xg; #Regular expression without "/x"
        $LINE_HEADER =~ s/\|/,/xg;  #Regular expression without "/x"
        $IBM_ID_EXISTS = check_ibm_id($LINE_HEADER); #Sub called with "&"
    }
    if($IBM_ID_EXISTS == 0 and $IGNORE_CUSTOMER_ENTRY == 1  and $GECOS_RELIABLE==1){return;}#Enhancement 140662
    if( defined $LINE_HEADER )
    {
        if($LINE_HEADER eq "" or $msg_source =~ "SFIT2527" or $msg_source =~ "SFIT67619"){$IBM_ID_EXISTS=1;}
    }
    $message_severity = "ERROR";
    ($msg_entry, $line_number, $msg_value, $msg_description, $file_type, $file_name, $msg_source) = @message_array;
    ######
    my $removeall = $msg_entry;
    if(defined $removeall)
    {
        $removeall =~ s/\s*,\s*/,/xg; #Regular expression without "/x"
        $removeall =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
        $removeall =~ s/\s+[\w,]+$//xg; #Regular expression without "/x"
    }
    if(check_for_suppression($removeall) or check_for_suppression($line_number))
    {
        return;
    }
    if(defined $removeall)
    {
        $removeall =~ s/^"|"$//xg; #Regular expression without "/x"
        if($removeall =~ /,/x){$removeall =~ s/,/|/xg;} #Regular expression without "/x"
    }
    #####################
    if((defined $msg_entry) && ($msg_entry =~ /,/x)){$msg_entry =~ s/,/|/xg;} #Regular expression without "/x"
    if((defined $msg_value) && ($msg_value =~ /,/x)){$msg_value =~ s/,/|/xg;} #Regular expression without "/x"
    if((defined $msg_description) && ($msg_description  =~ /,/x)){$msg_description =~ s/,/|/xg;} #Regular expression without "/x"
    if((defined $file_name) && ($file_name =~ /,/x)){$file_name =~ s/,/|/xg;} #Regular expression without "/x"
    if($msg_source =~ /,/x){$msg_source =~ s/,/|/xg;}  #Regular expression without "/x"
    #$msg_entry, $line_number, $msg_value, $msg_description, $file_type, $file_name, $msg_source
    #####################
    if(!defined $removeall){$removeall= "";}
    if(!defined $line_number){$line_number= "";}
    if(!defined $msg_value){$msg_value= "";}
    if(!defined $msg_description){$msg_description= "";}
    if(!defined $file_type){$file_type= "";}
    if(!defined $file_name){$file_name= "";}
    if(!defined $msg_source){$msg_source= "";}
    $CSVmsg = "$removeall,$line_number,$msg_value,$msg_description,$file_type,$file_name,$msg_source";
    ######
    if ($template_check == 1 and template_storemessage($msg_source) == 1) #Sub called with "&"
    {
        return;
    }
    my $CSVLINE;
    $CSVmsg =~ s/\s+/ /xg; #Regular expression without "/x"
    if ($DEBUG) { print "\n$msg"; }
    if ($IBM_ID_EXISTS == 1 or ((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER == 0)) or $IBM_ID_EXISTS == -1 or ((defined $NO_DOWNGRADE) && ($NO_DOWNGRADE == 1)))
    {
        $msg = "ERROR:,$CSVmsg\n\n";
        $msg =~ s/%_PLUS_/\+/xg; #Regular expression without "/x"
        $msg =~ s/,\+/, \+/xg; #Regular expression without "/x"
        print $ERR $msg;
        $ERRORS = $ERRORS + 1;
        $CSVmsg =~ s/;/,/xg; #Regular expression without "/x"
        $CSVmsg =~ s/\s*\,\s*/,/xg; #Regular expression without "/x"
        #############################
        $message_severity = "ERROR";
        $CSVmsg           = "$message_severity,$CSVmsg";
        writeToCSV("$CSVmsg");
    }
    else
    {
        IssueNote($removeall, $line_number, $msg_value, $msg_description, $file_type, $file_name, $msg_source);
    }
    return; #require final return
        
}

#########################################################################################
# RemoveLinesFromSudoerArray : remove the line numbers designated in @remove_lines    #
#                   from the @sudoer_files array                #
#########################################################################################
sub RemoveLinesFromSudoerArray
{
   # my $linecnt;
    my $header;

    if ($DEBUG)
    {
        print "\nin REMOVELINESFROMSUDOERSARRAY\n";
        print "\tremove_lines=@remove_lines\n";
    }

    # ------------------------------------------------------------ #
    # remove the invalid lines from the sudoers_file array so that #
    #       we don't use them as valid "use" lines                 #
    # ------------------------------------------------------------ #
    #for ($linecnt = @remove_lines - 1 ; $linecnt >= 0 ; $linecnt--)
    for(reverse 0..@remove_lines-1)
    {    # from last element backwards so index doesn't change if item is deleted
        my $remove = $remove_lines[$_];

        # ---------------------------------------------------- #
        # issue Naked ALL violations even on empty (N/A) lines #
        # ---------------------------------------------------- #
        # not sure why we're doing this twice?
        #        if ( $sudoers_file[$remove] =~ /=ALL$/ ) {
        #            $header = ( split( /=/, $sudoers_file[$remove] ) )[0];
        #            IssueViolation("LINE '$header' : Line contains naked ALL.\n"); #Sub called with "&"
        #        }
        if ($DEBUG) { print "..removing line sudoers[$remove]=$sudoers_file[$remove]\n"; }

        splice(@sudoers_file, $remove, 1);    # delete 1 element from the array
    }

    @remove_lines = ();
    return; #require final return
}

######################################################################################################
# There are now several valid GECOS layouts :                                                        #
#     OLD => Original gecos version                                                                  #
#     ITIM => GECOS used on servers which have ids maintained by ITIM.  ITIM uses Bluepage codes for #
#             Client (id) Type.  Since Bluepages does not have customer entries there is no code     #
#             designation for "customer".  For the purposes of this function, it is assumed that any #
#             server using ITIM layout does not have customer ids and all ids must be valid IBM ids. #
#             From ITIM instructions :  "In order for ITIM to function correctly with the existing   #
#             security entries, either change the GECOS to the following content/format or append    #
#             the following to the existing GECOS:                                                   #
#                    Full Name; CC/Employee Type/SERIAL ;Intranet Email Address                      #
#                       Where:                                                                       #
#                         CC = Country Code                                                          #
#                         EmployeeType = All valid codes for employees can be found at:              #
#                                        http://bluepages.ibm.com/BpHttpApis/wsapi?eCodes=%25        #
#                         SERIAL = IBM Account Employee Serial Number                                #
#                       Examples of standardized GECOS:                                              #
#                          Kurt Funderburg; 897/P/123456 ;funder@us.ibm.com                          #
#                                                                                                    #
#     URT => User Revalidation Tool.  GECOS used on servers which have ids maintained by URT.        #
#               CC/Employee Type/SERIAL//Full Name                                                   #
#                       Where:                                                                       #
#                         CC = Country Code                                                          #
#                         EmployeeType = All valid codes for employees can be found at:              #
#                               'e' => vendor                                                        #
#                               'I' => IBM Full                                                      #
#                               'c' => customer                                                      #
#                         SERIAL = IBM Account Employee Serial Number                                #
#                       Examples of standardized GECOS:                                              #
#                               897/I/123456//Reszitnyk Stephen
######################################################################################################
sub DetermineIBMId
{
    my($name,$gcos)=@_; ###require argument unpacking 
    if (($NO_DOWNGRADE =~ /^\d+$/x && $NO_DOWNGRADE == 1) and ($opt{l}))   #Regular expression without "/x"#Package variable declared or used
    {
       $IBM_STR = "[a-z,A-Z,0-9]" ;
       if ($DEBUG)
       { 
          print "\nIBM_STR now set to $IBM_STR $name will process as IBMID $gcos \n\n";
       }
    }

    # --------------------------------------------------------------------- #
    # If GECOS_TYPE is URT, and gcos contains the string /I/, /IBM/, /ibm/, /S/,
    # --------------------------------------------------------------------- #
    if ($GECOS_TYPE =~ m/URT/x)
    {
        if (   $gcos =~ /\/I\//x
            or $gcos =~ /\/IBM\//x
            or $gcos =~ /\/ibm\//x
            or $gcos =~ /\/S\//x
            or $gcos =~ /\/F\//x
            or $gcos =~ /\/E\//x
            or $gcos =~ /\/N\//x
            or $gcos =~ /\/T\//x
            or $gcos =~ /\/V\/\*/x
            or $gcos =~ /IBM/x
            or $gcos =~ /$IBM_STR/x) #Regular expression without "/x" #Regular expression without "/x"
        {
            # URT customer type is '/C/', keep any id that does not contain that string
            $IBMIDLIST{$name} = $name;
        }
        else
        {
            return;
        }
    }

    # ---------------------------------------------------------------------- #
    # If IBM_STR was specified and is contained in the gcos, it is an IBM id #
    # ---------------------------------------------------------------------- #
    elsif ($GECOS_TYPE =~ m/ORIG/x) #Regular expression without "/x"
    {
        if ($gcos =~ /ibm/ix) #Regular expression without "/x"
        {
            $IBMIDLIST{$name} = $name;
        }
        else
        {
            return;
        }

        # --------------------------------------------------------------------------------------------- #
        # ITIM          : assumption ITIM is not valid for customer ids.  Therefore ALL ids are ibm ids #
        # unknown GECOS : keep all ids                                                                  #
        # --------------------------------------------------------------------------------------------- #
    }
    else
    {
        $IBMIDLIST{$name} = $name;
    }
    return; #require final return
}

#########################################################################################################
# JoinMulitpleUserLines() : Joins multiple line definitions for a User/Group (alias) line into one long #
#                line for processing.                                                        #
#                - Naked ALLs (ALL=ALL) are still flagged during RemoveLineFromSudoerArray() #
#                - Assumption is that all lines pertain to the current server.  Lines not    #
#                  active for this server were removed in an earlier subroutine.             #
#                - The last line is saved and then deleted and readded to the end of the     #
#                  file listing to retain its position.  Otherwise the updated user lines    #
#                  would appear AFTER the last !SUDOSUDO line and cause a violation.         #
#########################################################################################################
sub JoinMultipleUserLines
{
    #my @NAMELIST; #is declared but not used
    my $CURRENT;
    my $REST;
    #my %KEEP; #is declared but not used
    #my $SAVE_LAST_LINE; #is declared but not used
    #my $line_counter; #is declared but not used
    #my @remove_lines    = ();
    my @processed_lines = ();

    if ($DEBUG)
    {
        print "\nIn JOINMULTIPLEUSERLINE\n";
    }

    # ------------------------------------------------------------------------------ #
    # when merging, lines must be processed in the order in which they are received. #
    # ------------------------------------------------------------------------------ #
    my $lineCounter = -1;
    foreach my $LINE (@sudoers_file)
    {

        $lineCounter = $lineCounter + 1;
        if(!defined $LINE){$LINE="";}
        ($CURRENT, $REST) = split(/=/x, $LINE, 2);  #Regular expression without "/x"

        if (($LINE =~ /^Defaults/x) || ($LINE =~ /^Host_Alias/x) || ($LINE =~ /^Cmnd_Alias/x) || ($LINE =~ /^Runas_Alias/x) || ($LINE =~ /!SUDOSUDO/x)) #Regular expression without "/x"
        {
            push(@processed_lines, $LINE);
            next;
        }
        elsif ($LINE =~ /^%/x) #Regular expression without "/x"
        {

            # group definition
            $CURRENT =~ s/\s*,\s*/,/xg; #Regular expression without "/x"
            $CURRENT =~ s/^\s*|\s*$//xg; #Regular expression without "/x"
            $CURRENT = (split(/\s+/x, $CURRENT))[0]; #Regular expression without "/x"
            my @temp_arr = (split(/,/x, $CURRENT)); #Regular expression without "/x"
            $CURRENT = join(',' ,@temp_arr );
        }
        elsif ($LINE =~ /^User_Alias/x) #Regular expression without "/x"
        {

            # user_alias definition...drop servername if specified. we already have only valid server lines
            $CURRENT = (split(/\s+/x, $CURRENT))[1];    # keep alias name #Regular expression without "/x"
            $CURRENT = "User_Alias " . $CURRENT;       # add back in User_Alias
        }
        else
        {
            # userid definition
            if(!defined $CURRENT){$CURRENT="";}
            $CURRENT =~ s/\s*,\s*/,/xg; #Regular expression without "/x"
            $CURRENT =~ s/^\s*|\s*$//xg; #Regular expression without "/x"
            $CURRENT = (split(/\s+/x, $CURRENT))[0]; #Regular expression without "/x"
            if(!defined $CURRENT){$CURRENT="";}
            my @arr = (split(/,/x, $CURRENT)); #Regular expression without "/x"
            $CURRENT = join(',' ,@arr );
        }

        if ($DEBUG)
        {
            print "\tLINE=$LINE\n";
            print "\t\tCURRENT=$CURRENT\n";
            if(defined $REST)
            {
                print "\t\tREST=$REST\n";
            }
        }
        if(defined $REST)
        {
            my $processed = "$CURRENT=$REST";
        
            push(@processed_lines, $processed);
            update_line_location($LINE, $processed); #Sub called with "&"
        }
    }

    @sudoers_file = @processed_lines;
    return; #require final return
}

##################################################################################################
# writeToCSV ($string) : All messages to the CSV will be printed through this single subroutine. #
#       CSV (INFOLINE) LAYOUT :
#               HOST,RUNDATE,MESSAGE SEVERITY,TYPE,VALUE,DESCRIPTION,FILE TYPE,FILE,OWNER,GROUP,PERMISSIONS,$SOURCE
#               HOST,RUNDATE are added in here so in put string is
#                       MESSAGE SEVERITY,TYPE,VALUE,DESCRIPTION,FILE TYPE,FILE,OWNER,GROUP,PERMISSIONS,SOURCE
##################################################################################################
sub writeToCSV
{
    my $INFOLINE;
    my $SEVERITY;
    my $msg="";
    $INFOLINE = shift;
    $SEVERITY = (split(/,/x, $INFOLINE))[0]; #Regular expression without "/x"
    $INFOLINE = $HOST . "," . $RPTDATE . $RPTTIME . "," . $INFOLINE;
    $INFOLINE =~ s/%_PLUS_/\+/xg; #Regular expression without "/x"
    $INFOLINE =~ s/,\+/, \+/xg; #Regular expression without "/x"
    # ------------------------------------- #
    # add column header line to output file #
    # ------------------------------------- #
     $msg_CSV = "";
    if ($SEVERITY =~ /ERROR/ or $SEVERITY =~ /NOTE/ or $SEVERITY =~ /EXCEPTED/ or $SEVERITY =~ /ATTENTION/ or $SEVERITY =~ /WARNING/)  #Cascading if-elsif chain
    {
        $msg_CSV = "$INFOLINE\n";
    }
    elsif ($SEVERITY =~ /EVALUATE/ or $SEVERITY =~ /PASS/) #Cascading if-elsif chain
    {
       if ($verbose) { $msg_CSV = "$INFOLINE\n"; }
    }
    else
    {
        $msg_CSV = "$INFOLINE\n";
    }
    if ($msg_CSV) { log_sfit($CSVTMP, $NOECHO); } #prohibit builtin homonyms #Sub called with "&"
    if ($DEBUG)
    {
        print "writing line to CSV file : $msg\n";
    }
    return; #require final return
}

sub CloseOutCSV
{

    # ------------------------------------------ #
    # add file and OSR info to end of CSV report #
    # ------------------------------------------ #
    my $input_parms = "";
    my $input_comma_parms = ",,,,,,,";
    my $input_comma_parms1 = ",,,,,,";
    if (!$MERGEMODE)
    {
        if ($IBM_STR == 0xdeadbeef) { $IBM_STR = ""; }

        $msg_CSV = ",,,,,,,,,\n,,,,,,,,,\n,,,,,,,,,\n";      
        $msg_CSV = $msg_CSV . "RUNDATE/TIME :," . trim(`date`) . ",METADATA" . $input_comma_parms . "\n"; #Sub called with "&"
        $msg_CSV = $msg_CSV . "PROGRAM NAME :,$pn $version,METADATA" . $input_comma_parms . "\n";
        $msg_CSV = $msg_CSV . "HOSTNAME:,$HOST,METADATA" . $input_comma_parms . "\n";
        ###Changes for task - 67249#####
        $msg_CSV = $msg_CSV . "OS:,$OS,METADATA," . $input_comma_parms1 . "\n";
        $msg_CSV = $msg_CSV . "DETAILED OS:," . which_OS() . ",METADATA" . $input_comma_parms . "\n"; #Sub called with "&"
        if(grep({ /,$ORIG_SUDOER,/x }@metadata_comments))#require block grep #Regular expression without "/x"
        {
            $msg_CSV = $msg_CSV . "SUDOERS FILE:,$ORIG_SUDOER,METADATA" . $input_comma_parms . "\n";
            foreach (grep({ /,$ORIG_SUDOER,/x } @metadata_comments))#require block grep #Regular expression without "/x"
            {
                $msg_CSV = $msg_CSV . "$_" . $input_comma_parms1 . "\n";
            }
        }
        ## Task 73862 - Add include file names to METADATA lines
        if(@files_included)
        {   
            foreach my $inc_file(@files_included)
            {
                $msg_CSV = $msg_CSV . "INCLUDE_FILE:,$inc_file,METADATA" . $input_comma_parms . "\n";
                if(grep({ /,$inc_file,/x } @metadata_comments))#require block grep #Regular expression without "/x"
                {
                    foreach (grep({ /,$inc_file,/x } @metadata_comments))#require block grep #Regular expression without "/x"
                    {
                        $msg_CSV = $msg_CSV . "$_" . $input_comma_parms1 . "\n";
                    }
                }
            }
        }

        if(!$EXTENDED_CHECK_USER)
        {
            $msg_CSV = $msg_CSV . "Default mode:,yes,METADATA" . $input_comma_parms . "\n";
        }
        else{
            $msg_CSV = $msg_CSV . "Extended mode:,yes,METADATA" . $input_comma_parms . "\n";
        }
        $msg_CSV = $msg_CSV . "Template mode:,$template_check,METADATA" . $input_comma_parms . "\n";
        
        $msg_CSV = $msg_CSV . "OUTPUT DIRECTORY:,$OUTDIR,METADATA" . $input_comma_parms . "\n";
        $msg_CSV = $msg_CSV . "";
       
        $msg_CSV = $msg_CSV . "RUNTIME FLAG SPECIFICATIONS:,$command_line,METADATA" . $input_comma_parms . "\n";
        $msg_CSV = $msg_CSV . "GECOS_TYPE:,$GECOS_TYPE,METADATA" . $input_comma_parms . "\n";
        $msg_CSV = $msg_CSV . "IBM EMPLOYEE ID STRING:,$IBM_STR,METADATA" . $input_comma_parms . "\n";
        if($record_number =~ /[\d\w]+/x){$msg_CSV = $msg_CSV . "CHANGE TICKET NUMBER:,$record_number,METADATA" . $input_comma_parms . "\n";} #Regular expression without "/x"
        $msg_CSV = $msg_CSV . "DO NOT DOWNGRADE CUSTOMER MESSAGES:,$NO_DOWNGRADE,METADATA" . $input_comma_parms . "\n";
        $msg_CSV = $msg_CSV . "VERBOSE:,$verbose,METADATA" . $input_comma_parms . "\n";
        $msg_CSV = $msg_CSV . "SKIP LOG FILE CREATION:,$no_log,METADATA" . $input_comma_parms . "\n";
        if (!$no_log)
        {
            $msg_CSV = $msg_CSV . "LOG FILE :,$logfile,METADATA" . $input_comma_parms . "\n";
        }

        $msg_CSV = $msg_CSV . "DEBUG:,$DEBUG,METADATA" . $input_comma_parms . "\n";
        $msg_CSV = $msg_CSV . "";

        ####Changes for the enhancement SFIT147509
        my @data = (); 
        my $header;
        my @template_data = ();
        my $template_header;
        if(@filter_files)
        {
            foreach my $file(@filter_files)
            {
                my $IN = IO::File->new("$file", "<");   #prohibit indirect syntax
                @data = <$IN>;  
                @data=(grep({ !/^\s*$/xg }@data));       #require block grep  #Regular expression without "/x"            #for defect 339293        
                $header = (grep({ /^\#(.*?)$/x } @data))[0];  #require block grep   #Regular expression without "/x"          
                chomp $header;   ## HACK 2 Mar remove newline so that the next line prints right.
                $msg_CSV = $msg_CSV . "FILTER_FILE_USED:,$file,METADATA" . $input_comma_parms . "\n"."WITH HEADER:, $header ,METADATA" . $input_comma_parms . "\n";  ## HACK 2 Mar added missing  METADATA tag 27May added commas
               $IN->close();
            }           
        $msg_CSV = $msg_CSV . "FILTERING RULES:, applied ##count_of_filter_rules## rules,METADATA" . $input_comma_parms . "\n"."FILTERING RESULTS:, removed ##count_of_filter_removals## records,METADATA" . $input_comma_parms . "\n";  ## HACK 2 Mar added metrics 27May added commas
        }
      
        #Enhancement 381742: Add METADATA information about the Template version file used
        if(@template_files)
        {
            foreach my $file1(@template_files)
            {
                my $INPUT = IO::File->new("$file1", "<");   #prohibit indirect syntax
                @template_data= <$INPUT>; 
                @template_data=(grep({ !/^\s*$/xg } @template_data));    #require block grep     #Regular expression without "/x"                 #for defect 339293
                $template_header = (grep({ /^\#(.*?)$/x} @template_data))[0]; #require block grep     #Regular expression without "/x"         
                chomp $template_header;   ## HACK 2 Mar remove newline so that the next line prints right.
                $msg_CSV = $msg_CSV . "Template version file used:,$file1,METADATA" . $input_comma_parms . "\n"."WITH HEADER:, $template_header ,METADATA" . $input_comma_parms . "\n";
            }
        }
        else
        {
           $msg_CSV = $msg_CSV . "NO TEMPLATE FILE :,METADATA," . $input_comma_parms . "\n";
        }
        $msg_CSV = $msg_CSV . "SUMMARY:,,METADATA" . $input_comma_parms . "\n";
        $msg_CSV = $msg_CSV . "Number of Errors,$ERRORS,METADATA" . $input_comma_parms . "\n";

        if ($verbose)
        {
            $msg_CSV = $msg_CSV . "Number of Passes,$NUMPASS,METADATA" . $input_comma_parms . "\n";
        }
        $msg_CSV = $msg_CSV . "Number of Warnings,$WARN,METADATA" . $input_comma_parms . "\n";
        
        #Enhancement 381740
        $msg_CSV = $msg_CSV . "Remaining Number of Errors,##count_of_error_removals##,METADATA" . $input_comma_parms . "\n";
        $msg_CSV = $msg_CSV . "Remaining Number of Warnings,##count_of_warning_removals##,METADATA" . $input_comma_parms . "\n";


        if (($ERRORS == 0) && ($WARN == 0))
        {
            $msg_CSV = $msg_CSV . "CONGRATULATIONS! CLEAN RUN!,,METADATA" . $input_comma_parms1 . "\n";
        }
        log_sfit($CSV, $NOECHO); #prohibit builtin homonyms #Sub called with "&"
       if ($ERRORS > 0)
       {
         $exitErr = 18;
       }
       if ($WARN > 0)
       {
        $exitWarn = 12;
       }
    }
    return; #require final return
}


###Changes for the enhancement 73868
###If METADATA for OS: contains string RH4 issue error message in 2 situations (extended mode only)
sub check_noexec_sudoedit_main
{
   my $os = which_OS(); #Sub called with "&"
   my @os_list = ("RedHat 4", "AIX 4.3.3", "AIX 5.3", "AIX 5.2");

   foreach my $item (@os_list)
   {
      if(grep({ /$item/ix } $os))#require block grep  #Regular expression without "/x"
      {
          check_noexec_sudoedit(\@sudoers_file_expanded); #Sub called with "&"
          last;
      }
   }
   return; #require final return
} 

######In extended mode only---if the OS:  METADATA row contains  the string  RH4
######On any active entry that uses the  NOEXEC keyword or is using  sudoedit 
######issue error   "NOEXEC is not functional on Red Hat 4, and cannot be used in entries." or
#######issue error   "sudoedit is not functional on Red Hat 4, and cannot be used in entries."
sub check_noexec_sudoedit
{
    my ($array_ref_copy) = @_;  #require argument unpacking  #Reused variable name in lexical scope           #Get reference of sudoers array and continue using it
    if ($DEBUG)
    {
       print "\nin check_noexec_sudoedit\n";
    }

    my $line;
    my $match;
    my $found;
    my @sudoers_matches;
    my $header;
    my $rest;
    my @sudoers_file_copy = @{$array_ref_copy};  #Reused variable name in lexical scope #Double-sigil dereference
    my $filename;
    my $line_number;
    my $master_text;
    my $os_name;
    my $os; 
    
    @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_copy); #Regular expression without "/x"#require block grep    

    $os_name = `uname -a`;
    if($os_name =~ m/Linux/ig)
    {
        $os = "Red Hat 4";
    }
    if($os_name =~ m/^AIX/xig) #Regular expression without "/x"
    {
         $os = `oslevel`;
         $os = "AIX".$os; 
    }

    foreach my $line (@sudoers_matches)
    {
         ($header, $rest) = split(/=/x, $line,2); #Regular expression without "/x"

         while($rest =~ m/(([a-z0-9A-Z\/])*sudoedit)/xig)   #Regular expression without "/x"
         {
            $found = ${^MATCH};#$found = $&; #Similar to $& without performance penalty ###prohibit match vars
            my $sudoedit_line = $rest;
            next if ($sudoedit_line =~ m/\!/xig); #Regular expression without "/x"
            ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
               IssueError($header, $line_number, "$found", "sudoedit is not functional on $os, and cannot be used in entries.", $master_text, $filename, 'SFIT73868'); #Sub called with "&"
         }
         while($rest =~ m/(NOEXEC\s*\:\s*\/([a-z0-9A-Z\/])+)(\,)?/xig) #Regular expression without "/x"
         {
               $found = $1;
              ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
               IssueError($header, $line_number, "$found", "NOEXEC is not functional on $os, and cannot be used in entries.", $master_text, $filename, 'SFIT73868'); #Sub called with "&"
         }
    }
    return; #require final return
}

#### Changes for the Enhancement 67468
sub execute_visudo_on_configfile
{
    if ($DEBUG)
    {
       print "\nin visudo_on_configfile\n";
    }
    my ($entry, $refered,$error,$file_type,$file,$line_no,$undeclared,$value,$desc); ##is declared but not used # #Reused variable name in lexical scope

    my $command="visudo -c -f $configfile";
   
    if ($DEBUG)
    {
       print "\nCommand $command ... starting\n";
    }
     my  @output = `$command 2>&1`;  ####to get the output and warnings/errors messages
    
    if ($DEBUG)
    {
       print "\nCommand $command ... ending\n";
    }
    #enhancement SFIT603757 
    my $count =0;
    if(@filter_files)
    {
    	$count = 0;
        foreach my $file(@filter_files) 
	{
            if ($file =~ /SFIT_FILTER_GLB.txt/) 
       	    {
	        $count += 1;                                                  
            }
        }
        if($count == 0)
        {
	    IssueError("","",'','Missing Global Standard Filter File - the global filter file name accepted is SFIT_FILTER_GLB.txt',"","",'SFIT603757');
        }
    }
    else
    {
	IssueError("","",'','No filter file used',"","",'SFIT603757');
    }
my @filter_global_files = ();
@filter_global_files = glob "$filter_dir/*.txt";  
my $count1 = 0;
foreach my $file(@filter_global_files)
{
  my $fileN = $1 if $file =~ /([^\/]+)$/;
  if ($fileN =~ /SFIT_FILTER_GLB.+.txt$/) {
     # @files = sort grep { not m/\SFIT_FILTER_GLB_.*.txt$/ and -f } glob "$filter_dir/*.txt";
     $count1 = $count1 + 1;
   }
}
if ($count1 >0) {   
   IssueError("","",'','Only one SFIT_FILTER_GLB file is allowed - with the exact name SFIT_FILTER_GLB.txt',"","",'SFIT603757');
}
    my @all_filter_files = ();
    my $filter_dir = "/etc/sfit/filters";
    @all_filter_files = glob "$filter_dir/*";

    foreach my $file(@all_filter_files) 
    {
	if($file !~ /.txt/) 
	{	
	    IssueNotice("","",'',"the file $file has been not parsed as sfit filter because the extension is not .txt","","",'SFIT603757');
    	}
    } 
   ### 
 
    foreach my $line (@output)
    {
         if($line =~ m/referenced\s*but\s*not\s*defined/xig)  #Regular expression without "/x"
         {
            $refered = $line;
            if($refered =~ m/^visudo\:\s+Warning\:\s+(.*?)\s*\`(.*?)\'\s*(.*?)$/xig) #Regular expression without "/x" #Capture variable used outside conditional
            {
            $entry  = $1;
            $value = $2;
            $desc = $3;
            IssueError($entry,"",$value,$desc,"visudo","",'SFIT67468'); #Sub called with "&"
         }
         }
         if($line =~ m/undeclared/ig)
         {
            $undeclared = $line;
            if($undeclared =~ m/^Warning\:\s+(.*?)\s*(\w+)\s*\`(\w+)\'\s*(.*?)(\d+)$/xig) #Regular expression without "/x"#Capture variable used outside conditional 
            {
            $entry  = $2;
            $line_no = $5;
            $value = $3;
            $desc = $1;
            }
            IssueError($entry,$line_no,$value,$desc,"visudo","",'SFIT67468'); #Sub called with "&"
         }
         #####changes for the defect 149298
         if($line =~ m/already defined/ig)
         {
            my $defined = $line;
            my $regex = 'Alias\s*\`(.*?)\'(.*?)\s*near\s*line';
            if($defined =~ m/visudo\:\s*>>>\s*(.*?)\:\s*$regex\s*(\d+)\s*/xig)  #Regular expression without "/x"#Capture variable used outside conditional #ProhibitComplexRegexes 
            {
            $file = $1;
            $line_no = $4;
            $value = $2;
            $desc = $3;
            }
             if((defined $file) && ( $file eq $configfile))
             {
                    $file_type = "master";
             }
             else
              {
                  $file_type = "included";
             }
            IssueError($entry,$line_no,$value,$desc,$file_type,$file,'SFIT67468'); #Sub called with "&"
         }
         if($line =~ m/parsed\s*OK/xig) #Regular expression without "/x"
         {
            if($DEBUG) {
           print "\nOutput of $command\n";
                print "\n$line\n";
         }
         }
         if($line =~ m/error/ig)
         {
            $error =  $line;
            if($error =~ m/parse\s*error\s*in(.*?)near\s*line\s*(\d+)$/xig) #Regular expression without "/x"
            {
                $file = $1;
                $line_no = $2;
                $file =~ s/^\s*|\s*$//xig; #Regular expression without "/x"
                $file = $configfile if ($file =~m/sudoers\s*file/xig); #Regular expression without "/x"
                if($file eq $configfile)
                {
                    $file_type = "master";
                }
                else
                {
                     $file_type = "included";
                }
                ###Changed violation..added description as 'parse error' as per melody's suggestion 
                IssueError("",$line_no,'visudo_output','parse error',$file_type,$file,'SFIT67468'); #Sub called with "&"
            }
            my $error_mesg='syntax\s*error(\,)?\s*(near\s*)?line\s*';
            if($error =~ m/>>>\s*(.*?)\:\s*$error_mesg(\d+)\s*<<</xig) #Regular expression without "/x" #ProhibitComplexRegexes
            {
                $file = $1;
                $line_no = $4;
                $file =~ s/^\s*|\s*$//xig; #Regular expression without "/x"
                $file = $configfile if ($file =~m/sudoers\s*file/xig); #Regular expression without "/x"
                if($file eq $configfile) 
                {
                    $file_type = "master";
                }
                else
                {
                     $file_type = "included";
                }
                ###Changed violation, added description as 'syntax error' as per melody's suggestion
                IssueError("",$line_no,'visudo_output','syntax error',$file_type,$file,'SFIT67468'); #Sub called with "&"
            }
         }
     }
     return; #require final return
}


####Chanegs for the Enhancement 140660
#####Cleanup /var/log/sfitout directory

sub clean_var_log_sfitout_directory
{
   if ($DEBUG)
   {
      print "\n In clean_var_log_sfitout_directory\n";
   }

   my $dir = $OUTDIR;
   my @all_files = glob "$dir/sfit*"; #my @all_files = <$dir/sfit*>; #perlcritic
   my $num_files_to_retain = "15";

    my @files_to_retain=();    
    my $DIR = IO::Dir->new($dir) or die "could not open $dir $!";
    if (defined $DIR)
    {
        while (defined($_ = $DIR->read))
        {
            if ($_ !~ /^\.|\.\.$/x)  # skipping . and .. #Regular expression without "/x"
            {
                push (@files_to_retain,$_);
            }
        }
    }
    @files_to_retain = sort { -M "$dir/$a" <=> -M "$dir/$b" } (@files_to_retain); # sort by latest modified on top
    @files_to_retain = @files_to_retain[0..($num_files_to_retain-1)]; # cut first 15 elements 
    $DIR->close();
    @files_to_retain = grep ({ defined() and length() } @files_to_retain);
   foreach my $file (@all_files)
   {
        my $temp_file = $file;
        my @arr = split('\/',$temp_file);
        my $filename = $arr[-1];
     
        if( grep({ /$filename/igx } @files_to_retain))#require block grep     #Regular expression without "/x"
        {
        }
        else
        {
            if ($DEBUG)
            {
                 print "\n Deleting files from /var/log/sfitout Directory...... \n";
            }
            unlink $file;

            if ($DEBUG)
            {
                print "\n Deleted files from /var/log/sfitout Directory...... \n";
            }
        }
    }
    return; #require final return
}

#####################################################################################
# which_OS () : Detects which OS and if it is Linux then it will detect which Linux #
#               Distribution.                                                       #
#                                            #
#         SuSE Linux Standard Server => SLSS                     #
#         SuSE Linux Enterprise Server => SLES                    #
#####################################################################################
sub which_OS
{
    my $os;
    my $REV;
    my $MACH;
    my $ARCH;
    my $OSSTR;
    my $KERNEL;
    my $DIST;
    my $PSEUDONAME;
    my $SLES;
    my $SLSS;

    $os   = trim(`uname -s`); #Sub called with "&"
    $REV  = trim(`uname -r`); #Sub called with "&"
    $MACH = trim(`uname -m`); #Sub called with "&"
    if(!defined $os){$os="";} #perl -w

    if ($os =~ /SunOS/)
    {
        $os    = "Solaris";
        $ARCH  = trim(`uname -p`); #Sub called with "&"
        $OSSTR = "$os $REV$ARCH" . trim(`uname -v`); #Sub called with "&"
    }
    if ($os =~ /AIX/) #Cascading if-elsif chain
    {
        $OSSTR = "$os " . trim(`oslevel`) . trim(`oslevel -r`); #Sub called with "&"
    }
    if ($os =~ /HP-UX/x) #Regular expression without "/x" #Cascading if-elsif chain
    {
        $OSSTR = "$os $REV " . trim(`/bin/model`); #Sub called with "&"
    }
    if ($os =~ /Linux/) #Cascading if-elsif chain
    {
        $KERNEL = trim(`uname -r`); #Sub called with "&"
        SWITCH:{  #Cascading if-elsif chain
        if (-f "/etc/redhat-release")
        {
            $DIST = "RedHat";

            #(21062013) fixed defect:2811
            $PSEUDONAME = trim(`cat /etc/redhat-release | sed 's/.*\(//' | sed 's/\)//'`); #Sub called with "&"
            $REV        = trim(`cat /etc/redhat-release | sed 's/.*release\ //' | sed 's/\ .*//'`); #Sub called with "&"
            if ($DEBUG)
            {
                print "---------------START: TEST FOR 2811---------------\n";
                print "\tDIST=$DIST\n";
                print "\tPSEUDONAME=$PSEUDONAME\n";
                print "\tREV=$REV\n";
                print "---------------END: TEST FOR 2811---------------\n";
            }
                last SWITCH;
        }
            if (-f "/etc/SuSE-release") #Cascading if-elsif chain
        {
            $SLES = trim(`grep -i Enterprise /etc/SuSE-release`); #Sub called with "&"
            $SLSS = trim(`grep -i Standard /etc/SuSE-release`); #Sub called with "&"
            if ($SLES)
            {
                $PSEUDONAME = "SLES";
            }
            elsif ($SLSS)
            {
                $PSEUDONAME = "SLSS";
            }

            #(26062013) fixed defect:2812
            $DIST = trim(`cat /etc/SuSE-release | tr "\n" ' '| sed 's/VERSION.*//'`); #Sub called with "&"
            $REV  = trim(`cat /etc/SuSE-release | tr "\n" ' ' | sed 's/.*=\ //'`); #Sub called with "&"

            if ($DEBUG)
            {
                print "---------------START: TEST FOR 2812---------------\n";
                print "\tDIST=$DIST\n";
                print "\tREV=$REV\n";
                print "---------------END: TEST FOR 2812---------------\n";
            }
                last SWITCH;
        }
            if (-f "/etc/SUSE-release") #Cascading if-elsif chain
        {
            $SLES = trim(`grep -i Enterprise /etc/SuSE-release`); #Sub called with "&"
            $SLSS = trim(`grep -i Standard /etc/SuSE-release`); #Sub called with "&"
            if ($SLES)
            {
                $PSEUDONAME = "SLES";
            }
            elsif ($SLSS)
            {
                $PSEUDONAME = "SLSS";
            }
            $DIST = trim(`cat /etc/SUSE-release | tr "\n" ' '| sed s/VERSION.*//`); #Sub called with "&"
            $REV  = trim(`cat /etc/SUSE-release | tr "\n" ' ' | sed s/.*=\ //`); #Sub called with "&"
                last SWITCH;
        }
            if (-f "/etc/lsb-release") #Cascading if-elsif chain
        {
            $DIST = trim(`cat /etc/lsb-release | tr "\n" ' '|sed -e 's/.*DESCRIPTION=//' | sed -e 's/"//g'`); #Sub called with "&"
            $REV  = trim(`cat /etc/lsb-release | tr "\n" ' '|sed -e 's/.*RELEASE=//' | sed -e 's/ .*//'`); #Sub called with "&"
                last SWITCH;
        }
            if (-f "/etc/mandrake-release") #Cascading if-elsif chain
            {
                $DIST       = "Mandrake";
                $PSEUDONAME = trim(`cat /etc/mandrake-release | sed s/.*\(// | sed s/\)//`); #Sub called with "&"
                $REV        = trim(`cat /etc/mandrake-release | sed s/.*release\ // | sed s/\ .*//`); #Sub called with "&"
                last SWITCH;
        }
            if (-f "/etc/debian_version") #Cascading if-elsif chain
        {
            $DIST = "Debian " . trim(`cat /etc/debian_version`); #Sub called with "&"
            $REV  = "";
                last SWITCH;
        }
            if (-f "/etc/UnitedLinux-release") #Cascading if-elsif chain
        {
            $DIST = "[" . trim(`cat /etc/UnitedLinux-release | tr "\n" ' ' | sed s/VERSION.*//`) . "]"; #Sub called with "&"
                last SWITCH;
        }
            
        }
        $OSSTR = "$os $DIST $REV($PSEUDONAME $KERNEL $MACH)";
    }

    return $OSSTR;
}

sub check_disallowed_editors
{
    my ($array_ref_copy) = @_;   #Reused variable name in lexical scope           #Get reference of sudoers array and continue using it
    my $line_temp;
    my $tt;                                 #strict_user
    my @tmp;                                #strict_use
    my @sudoers_matches_temp = @{$array_ref_copy};  #Reused variable name in lexical scope #Double-sigil dereference
    #my $line_number; #Reused variable name in lexical scope
    #my $filename=""; #Reused variable name in lexical scope
    #my $master_text=""; #Reused variable name in lexical scope
    my $array_ref1 = Filter_negations(\@sudoers_matches_temp,1);    #Sub called with "&"          #Get reference of sudoers array and continue using it
    @sudoers_file = @{$array_ref1}; #Double-sigil dereference
    

    if ($DEBUG)
    {
        print "\nin check_disallowed_editors\n";
    }

    foreach my $editor (@DISALLOWED_EDITORS)
    {
        foreach my $line (@sudoers_file)
        {
            my $header ;
            my $rest;
            if(defined $line)
            {
                ($header,$rest)= split(/=/x, $line, 2); #Regular expression without "/x"
            }
            if ((defined $header) && ($header !~ /Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x))  #Regular expression without "/x"
            {
                ###Changes for Task 198144  
                if((defined $rest) && ($rest=~ m/NOEXEC\s*\:\s*(.*?)(\,(.*?))?$/xig)) #Regular expression without "/x"
                {
                      $tt = $1;
                      $tt =~ s/^\s*|\s*$//xig; #Regular expression without "/x"
                      ######changes for defect 218838
                      if($tt =~ m/\s+/x) { #Regular expression without "/x"
                         @tmp = split(/\s+/x,$tt) ; #Regular expression without "/x"
                      }
                      else
                      {
                        push(@tmp,$tt);
                      }                      
                      my @tmp1;                     
                      foreach my $x(@tmp) #perlcritic
                      {
                          next if($x =~ m/\s*\*\s*/xg); #Regular expression without "/x"
                          next if($x =~ m/\s*\*$/xg); #Regular expression without "/x"
                           push (@tmp1,$x) if(grep({ /\Q$x\E/x } @DISALLOWED_EDITORS));#require block grep #Regular expression without "/x"   
                      }             
                      foreach my $tt1 (@tmp1) #perlcritic
                      {                   
                          if($rest =~ m/\!\s*$tt1\s*/x) #Regular expression without "/x"
                          {                    
                             $line_temp = $rest;                                
                          }                   
                          else
                          {
                             $line_temp = "";                        
                          }
                      }
                }
                else
                {
                    $line_temp = "";
                }
                
                if ($line_temp eq "" )
                {
                    my @commands;
                    if(defined $rest )
                    {
                        @commands = split(/\,/x, $rest); #Regular expression without "/x"
                    }
                    my @command_matches = grep({ /^[^\!\/]*\Q$editor\E(\s*$|\s+\S+)/x } @commands); #Regular expression without "/x"#require block grep   

                    foreach my $match (@command_matches)
                    {
                        my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                        IssueViolation($header, $line_number, $editor, 'contains disallowed editor', $master_text, $filename, 'SFIT2522'); #Sub called with "&"
                    }
                }
            }
        }
    }
    return; #require final return
}

sub check_environment
{
    # Pre-execution Verification: Run with root privileges

    #($EFFECTIVE_USER_ID == 0) or die "Effective user ID ($EFFECTIVE_USER_ID) must be root (0) to run this program";

    # Pre-execution Verification: Verify another instance of the remediation agent is not running

    
    #flock($LOCK_HANDLE, LOCK_EX | LOCK_NB) or die "Unable to lock $LOCK_FILE, another instance of this program may be running";

    # Pre-execution Verification: Verify OS and level compatibility with script

    #grep(/$OSNAME/, @os_supported) or die "Unsupported operating system $OSNAME for this program";

    # Pre-execution Verification: Verify or set umask to x77

    # my $umask_value = 0077;
    
    

    #Save commandline arguments.
    foreach (@ARGV)
    {
        $command_line = $command_line." ".$_;
    }

    if($> == 0)
    {
        $IS_ROOT = 1;
    }
    return; #require final return
}

##@@## ##@@## START OF INSERTED CODE FOR LOGGING UPDATES
sub CheckAllUsers_EtcProfile #Sub called with "&"
{
    if ($DEBUG)
    {
        print "Debug seclogin_active_all_users return initial value = $seclogin_active_all_users\n";
        print "\nin CheckAllUsers_EtcProfile. Applies only to sh ksh and bash userids \n";
    }

    my $BashOrKsh_LogAllUserids_active = 0;
    my $permossions;                        #strict_use
    my $usr;
    my $user_shell;
   # Check for existence of standard logging directory not level dependent
   my $configfile_copy="/var/log/hist"; #Reused variable name in lexical scope
   my  $varloghist;
   my $sticky;
   my $user;
   my $group;
   my $other;
   $varloghist="NotFound";
   if (-d "/var/log/hist")
   {
        #######################################
        $varloghist="varloghist_exists";
        my ($dev, $ino, $mode, $nlink, $uid, $gid, $rdev, $size, $atime, $mtime, $ctime, $blksize, $blocks) = stat $configfile_copy;
        if(defined $sticky_filter){$sticky  = ($mode & $sticky_filter) >> 9;}
        if(defined $user_filter){$user  = ($mode & $user_filter) >> 6;}
        if(defined $group_filter){$group = ($mode & $group_filter) >> 3;}
        if(defined $other_filter){$other = $mode & $other_filter;}
        if(defined $sticky_filter){$permossions="$sticky$user$group$other";}
        
        my $perms = (stat $configfile_copy)[2] & oct("7777"); #my $perms = (stat("$configfile"))[2] & 07777; #perlcritic
        my $MODE = sprintf "%o", $perms;
        $permossions=$MODE;
        if (($DEBUG) && ($opt{l})) { print "All users Logging Directory found ($configfile) with ($permossions) \n"  }; #Package variable declared or used
        
        if($permossions != 1777)
        {
             if (($DEBUG) && ($opt{l})) { print "\n $configfile permissions not 1777 \n Exiting checks for-all-users methods of setting up logging\n "; }; #Package variable declared or used
             if ((defined $opt{e}) || (defined $opt{l})) { if($DEBUG) { print "\nERROR: Required secondary logging directory$configfile  permissions  -$permossions- rather than 1777 \n\n"}}; #Package variable declared or used
            $seclogin_active_all_users=3; #error code for incorrect permission in /var/log/hist directory.
            if ($DEBUG) 
            {
                print "permossions=$permossions\n";
                print "Debug seclogin_active_all_users return 1 =$seclogin_active_all_users\n";
            }
            return $seclogin_active_all_users;
        }
        $varloghist="varloghist_ok" ;
        #######################################
   }  
   else
   {  
       $seclogin_active_all_users=2;   #error code for directory /var/log/hist directory does not exist.
       if ((defined $opt{e}) || (defined $opt{l})) { if($DEBUG) { print "\nERROR: Required secondary logging directory $configfile not found. \n\n"}}; #Package variable declared or used
       if ($DEBUG) 
        {
            print "Debug seclogin_active_all_users return 2 =$seclogin_active_all_users\n";
        }
       return $seclogin_active_all_users;   
   }

   # Logging check for  BashOrKsh_LogAllUserids_V3.1 and higher (also known as kbs2.1)
    my $check_sec_log_codeC1;
       $check_sec_log_codeC1=0;
    my $check_sec_log_codeC2;
       $check_sec_log_codeC2=0;
    my $check_sec_log_codeC3;
       $check_sec_log_codeC3=0;
    my $check_sec_log_codeC4;
       $check_sec_log_codeC4=0;
    my $check_sec_log_codeC4_1;
       $check_sec_log_codeC4_1=0;
    my $check_sec_log_codeC5;
       $check_sec_log_codeC5=0;
    my $check_sec_log_codeC5_1;
       $check_sec_log_codeC5_1=0;
    my $check_sec_log_codeC5_2;
       $check_sec_log_codeC5_2=0;
    my $check_sec_log_codeC6;
       $check_sec_log_codeC6=0;


   # Check for compoents of standard logging solution in /etc/profile.d/secondary_logging_IBM.sh at V3.1 and higher (also known as kbs2.1)
    if (-e "/etc/profile.d/secondary_logging_IBM.sh" ) 
    {
           if (($DEBUG) && ($opt{l})) { print "checking /etc/profile.d/secondary_logging_IBM.sh \n"  }; #Package variable declared or used
        $check_sec_log_codeC1 = `egrep -e  ' xxBEGIN_IBM_SEC_LOGxx '  /etc/profile.d/secondary_logging_IBM.sh 2>/dev/null`;

        $check_sec_log_codeC2 = `egrep -e  ' xxEND_IBM_SEC_LOGxx '  /etc/profile.d/secondary_logging_IBM.sh 2>/dev/null `;

        $check_sec_log_codeC3 = `egrep -e 'From=.*who.am.i...awk.*print.*1'  /etc/profile.d/secondary_logging_IBM.sh  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_codeC4 = `egrep -e  'To=..*whoami...awk.*print..1' /etc/profile.d/secondary_logging_IBM.sh  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_codeC4_1 = `egrep -e  'HISTFILE=..HIST_DIR....To....FILE....export.HISTFILE' /etc/profile.d/secondary_logging_IBM.sh  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_codeC5_1 = `egrep -e  'for.*/etc/profile.d/.*sh.*do' /etc/profile  2>/dev/null | egrep -v -e '^#' `; #called via loop

        $check_sec_log_codeC5_2 = `egrep -e  '/etc/profile.d/secondary_logging_IBM.sh' /etc/profile  2>/dev/null | egrep -v -e '^#' `; #called via explicit call

        # If either of those 5_1 or 5_2 calls to the script is found we are calling it and codeC5 becomes true.
        if ( $check_sec_log_codeC5_1 || $check_sec_log_codeC5_2) {$check_sec_log_codeC5 = "found_call_to_/etc/profile.d/secondary_logging_IBM.sh"}; 
        $check_sec_log_codeC6 = `egrep -e  'exec..bin.*sh' /etc/profile.d/secondary_logging_IBM.sh  2>/dev/null | egrep -v -e '#.*exec' `;
    } 
    else 
    {
   # Otherwise, check for components of standard logging solution directly in /etc/profile at V3.1 and higher (also known as kbs2.1 but its an alternate methods...)
           if (($DEBUG) && ($opt{l})) { print "no /etc/profile.d/secondary_logging_IBM.sh, checking /etc/profile directly at V3.1 and higher\n"  }; #Package variable declared or used
        $check_sec_log_codeC1 = `egrep -e  ' xxBEGIN_IBM_SEC_LOGxx '  /etc/profile 2>/dev/null`;

        $check_sec_log_codeC2 = `egrep -e  ' xxEND_IBM_SEC_LOGxx '  /etc/profile 2>/dev/null`;

        $check_sec_log_codeC3 = `egrep -e 'From=.*who.am.i...awk.*print.*1'  /etc/profile  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_codeC4 = `egrep -e  'To=..*whoami...awk.*print..1' /etc/profile  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_codeC4_1 = `egrep -e  'HISTFILE=..HIST_DIR....To....FILE....export.HISTFILE' /etc/profile  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_codeC5 = "codeC5 is_always_true_in_/etc/profile_direct_approach";  # nothing to check. free one.
        $check_sec_log_codeC6 = `egrep -e  'exec..bin.*sh' /etc/profile  2>/dev/null | egrep -v -e '^#' `;
        
        if ($DEBUG)
        {
            print "In else part\n";
            print "check_sec_log_codeC1=$check_sec_log_codeC1\n";
            print "check_sec_log_codeC2=$check_sec_log_codeC2\n";
            print "check_sec_log_codeC3=$check_sec_log_codeC3\n";
            print "check_sec_log_codeC4=$check_sec_log_codeC4\n";
            print "check_sec_log_codeC4_1=$check_sec_log_codeC4_1\n";
            print "check_sec_log_codeC5=$check_sec_log_codeC5\n";
            print "check_sec_log_codeC6=$check_sec_log_codeC6\n";
            print "completed else where /etc/profile.d/secondary_logging_IBM.sh files does not exist\n";
        }
        
    }; # End of check in either profile.d dir or /etc/profile itself. at V3.1 and higher


   # Time to assess if the method is active.
    if ($check_sec_log_codeC1 and $check_sec_log_codeC2 and $check_sec_log_codeC3 and $check_sec_log_codeC4 and $check_sec_log_codeC4_1 and $check_sec_log_codeC5 and $varloghist )
    {
        $BashOrKsh_LogAllUserids_active = 1;
    } else {
        $BashOrKsh_LogAllUserids_active = 0;
    }

    if ($DEBUG)
    {
        print "##BashOrKsh_LogAllUserids_active=$BashOrKsh_LogAllUserids_active\n";
    }
    
   # Can the all users method that is active cover for /sh login shells also?
   if ( $BashOrKsh_LogAllUserids_active and  $check_sec_log_codeC6 )
   {
        $SH_LogAllUserids_active = 1;
           if (($DEBUG) && ($opt{l})) { print "Method to handle /sh is found? yes  $SH_LogAllUserids_active \n"  }; #Package variable declared or used
    } else {
        $SH_LogAllUserids_active = 0;
           if (($DEBUG) && ($opt{l})) { print "Method to handle /sh is found? no  $SH_LogAllUserids_active \n"  }; #Package variable declared or used
    }
        
    # It is active.
    if ($BashOrKsh_LogAllUserids_active) 
       { 
       $seclogin_active_all_users = 1; # # It is active.
       if (($DEBUG) && ($opt{l})) { print "\nPassed. seclogin_active_all_users is set by CheckAllUsers_EtcProfile : BashOrKsh_LogAllUserids_active. Coverage for sh: $SH_LogAllUserids_active  Method kbs2 at 3.2 and higher. No Logging Active for csh or tcsh. \n"; }; #Package variable declared or used
        if ($DEBUG) 
        {
            print "Debug seclogin_active_all_users return 3 =$seclogin_active_all_users\n";
        }
       return $seclogin_active_all_users = 1 ;
    } else {
           if (($DEBUG) && ($opt{l})) { print "\nFailed to find BashOrKsh_LogAllUserids_ Method kbs2 at V3.1 and higher\n Requires: codeC1 $check_sec_log_codeC1 \n codeC2 $check_sec_log_codeC2 \n codeC3 $check_sec_log_codeC3 \n codeC4 $check_sec_log_codeC4 \n codeC4_1 $check_sec_log_codeC4_1  \n codeC5 $check_sec_log_codeC5 \n C5 is from EITHER codeC5_1 $check_sec_log_codeC5_1 \n OR codeC5_2 $check_sec_log_codeC5_2 \n logdir $varloghist \n"  }; #Package variable declared or used
   # End of Logging check for BashOrKsh_LogAllUserids_ at Version 3.1 and higher This is the only method that can set all users that can handle id's using  /sh


 # Diagnostic info to gather all for-all-users logging info in one place
           if (($DEBUG) && ($opt{l})) {    #Package variable declared or used
           print "\n\n>> >> Diagnostic info for for-all-users methods of setting up logging residing in /etc/profile, /etc/profile.d and/or secondary_logging_IBM.sh";print "\n"  ;
           print "End of diagnostic info for for-all-users methods of setting up logging";print "\n\n\n"  ;
           }
        # Extraordinary levels of debug info.

           if (($DEBUG) && ($opt{l})) { print "End of /etc/profile.d/secondary_logging_IBM.sh \n"  }; #Package variable declared or used
           if (($DEBUG) && ($opt{l})) { print "End of /etc/profile \n"  }; #Package variable declared or used
    }

   # Logging check for  BashOrKsh_LogAllUserids_PREV-3.1
    my $check_sec_log_code1;
    $check_sec_log_code1=0;
    my $check_sec_log_code2;
    $check_sec_log_code2=0;
    my $check_sec_log_code3;
    $check_sec_log_code3=0;
    my $check_sec_log_code4;
    $check_sec_log_code4=0;
    my $check_sec_log_code4a;
    $check_sec_log_code4a=0;
    my $check_sec_log_code5;
    $check_sec_log_code5=0;
    my $check_sec_log_code5_1;
    $check_sec_log_code5_1=0;
    my $check_sec_log_code5_2;
    $check_sec_log_code5_2=0;

   # Check for compoents of standard logging solution in /etc/profile.d/secondary_logging_IBM.sh
    if (-e "/etc/profile.d/secondary_logging_IBM.sh" ) 
    {
        $check_sec_log_code1 = `egrep -e  ' xxBEGIN_IBM_SEC_LOGxx '  /etc/profile.d/secondary_logging_IBM.sh 2>/dev/null`;
           if (($DEBUG) && ($opt{l})) { print "\n\n checking /etc/profile.d/secondary_logging_IBM.sh at PRE-V3.1 $usr $user_shell \n"  }; #Package variable declared or used

        $check_sec_log_code2 = `egrep -e  ' xxEND_IBM_SEC_LOGxx '  /etc/profile.d/secondary_logging_IBM.sh 2>/dev/null `;

        $check_sec_log_code3 = `egrep -e 'From=..*who.am.i.*awk.*print.*1'  /etc/profile.d/secondary_logging_IBM.sh  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_code4 = `egrep -e  'To=..*whoami...awk..*print..1' /etc/profile.d/secondary_logging_IBM.sh  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_code4a = `egrep -e  'HISTFILE=/var/log/hist/.To/.FILE' /etc/profile.d/secondary_logging_IBM.sh  2>/dev/null | egrep -v -e '^#' `;

           if (($DEBUG) && ($opt{l})) { print "checking /etc/profile for secondary_logging call inside it \n"  };   #DB_add #Package variable declared or used
        $check_sec_log_code5_1 = `egrep -e  'for.*/etc/profile.d/.*sh.*do' /etc/profile  2>/dev/null | egrep -v -e '^#' `; #called via loop

        $check_sec_log_code5_2 = `egrep -e  '/etc/profile.d/secondary_logging_IBM.sh' /etc/profile  2>/dev/null | egrep -v -e '^#' `; #called via explicit call

        # If either of those calls to the script is found we are calling it and code5 becomes true.
        if ( $check_sec_log_code5_1 || $check_sec_log_code5_2) {$check_sec_log_code5 = "found_call_to_/etc/profile.d/secondary_logging_IBM.sh"}; 
    } 
    else 
    {
   # Otherwise, check for components of standard logging solution directly in /etc/profile
        $check_sec_log_code1 = `egrep -e  ' xxBEGIN_IBM_SEC_LOGxx '  /etc/profile 2>/dev/null`;
           if (($DEBUG) && ($opt{l})) { print "no /etc/profile.d/secondary_logging_IBM.sh, checking /etc/profile directly at PRE-V3.1 \n"  }; #Package variable declared or used
        $check_sec_log_code2 = `egrep -e  ' xxEND_IBM_SEC_LOGxx '  /etc/profile 2>/dev/null`;

        $check_sec_log_code3 = `egrep -e 'From=..*who.am.i.*awk.*print.*1'  /etc/profile  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_code4 = `egrep -e  'To=..*whoami...awk..*print..1..' /etc/profile  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_code4a = `egrep -e  'HISTFILE=.*/.To/.FILE' /etc/profile  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_code5 = "code5_is_always_true_in_/etc/profile_direct_approach";  # nothing to check. free one.
    }; # End of check in either profile.d dir or /etc/profile itself. 


   # Time to assess if the method is active.
    if ($check_sec_log_code1 and $check_sec_log_code2 and $check_sec_log_code3 and $check_sec_log_code4 and $check_sec_log_code4a and $check_sec_log_code5 and $varloghist)
    {
        $BashOrKsh_LogAllUserids_active = 1;
    } else {
        $BashOrKsh_LogAllUserids_active = 0;
    }

    # It is active.
    if ($BashOrKsh_LogAllUserids_active) 
       { 
       $seclogin_active_all_users = 1; # # It is active.
       if (($DEBUG) && ($opt{l})) { print "\nPassed. seclogin_active_all_users is set by CheckAllUsers_EtcProfile: BashOrKsh_LogAllUserids_active. Method kb2 at PRE-V3.1. No Logging Active for csh or tcsh. \n"; }; #Package variable declared or used
        if ($DEBUG) 
        {
            print "BashOrKsh_LogAllUserids_active=$BashOrKsh_LogAllUserids_active\n";
            print "Debug seclogin_active_all_users return 4 =$seclogin_active_all_users\n";
        }
       return $seclogin_active_all_users = 1 ;
    } else {
           if (($DEBUG) && ($opt{l})) { print "\nFailed to find BashOrKsh_LogAllUserids_ Method kb2 at PRE-V3.1 \n Requires: code1 $check_sec_log_code1 code2 $check_sec_log_code2 code3 $check_sec_log_code3 code4 $check_sec_log_code4 code4a $check_sec_log_code4a code5 $check_sec_log_code5 code5_1$check_sec_log_code5_1 5_2 $check_sec_log_code5_2 \n logdir $varloghist \n"  }; #Package variable declared or used
        if ($DEBUG) 
        {
            print "BashOrKsh_LogAllUserids_active=$BashOrKsh_LogAllUserids_active\n";
            print "Debug seclogin_active_all_users return else 4 =$seclogin_active_all_users\n";
        }
        # Extraordinary levels of debug info.
    }
   # End of Logging check for BashOrKsh_LogAllUserids_PRE-V3.1
   # We want to accept some of the older logging methods. Those checks follow.
   # Checking the earlier Secondary Logging code versions that were on the wiki as of Mar 2015
 
    #case1 from old logging solutions.
    my $check_sec_loga="";
    my $check_sec_logb="";
    my $check_sec_logc="";
    my $check_sec_logd="";
    if (($DEBUG) && ($opt{l})) #Package variable declared or used
    {
        print "\nin CheckAllUsers_EtcProfile old case1 code. Applies only to ksh and bash users.\n";
    }

    if ( -f "/etc/profile" )
    {
        $check_sec_loga = `grep -v "^#" /etc/profile | egrep -e 'File=.*From:.*To' 2>/dev/null`;
        $check_sec_logc = `grep -v "^#" /etc/profile | egrep -i -e 'HISTFILE=.*File' 2>/dev/null`;
        if ($DEBUG) 
        {
            print "Contents of /etc/profile are :\n";
            print `cat /etc/profile`;
            print "check_sec_loga=$check_sec_loga\n";
            print "check_sec_logc=$check_sec_logc\n";
        }
    }
    if ( -f "/etc/profile.d/history.sh" )
    {
        $check_sec_logb = `grep -v "^#" /etc/profile.d/history.sh | egrep -e 'File=.*From:.*To'  2>/dev/null`;
        $check_sec_logd = `grep -v "^#" /etc/profile.d/history.sh | egrep  -i -e 'HISTFILE=.*File' 2>/dev/null`;
        if ($DEBUG) 
        {
            print "Contents of /etc/profile.d/history.sh are :\n";
            print `cat /etc/profile.d/history.sh`;
            print "check_sec_logb=$check_sec_logb\n";
            print "check_sec_logd=$check_sec_logd\n";
    }
    }
    
    $seclogin_active_all_users = 0;
    if (($check_sec_loga and $check_sec_logc)  || ($check_sec_logb and $check_sec_logd)) { 
        $seclogin_active_all_users = 1; 
        if (($DEBUG) && ($opt{l})) { print "\nPassed. seclogin_active_all_users is set by CheckAllUsers_EtcProfile:$seclogin_active_all_users\n";}; #Package variable declared or used
        if ($DEBUG) 
        {
            print "Debug seclogin_active_all_users return 5 =$seclogin_active_all_users\n";
        }
        return $seclogin_active_all_users ;
        } else {
        if ($DEBUG) 
        {
            print "Debug seclogin_active_all_users return else 5 =$seclogin_active_all_users\n";
        }
         #Package variable declared or used below
        if (($DEBUG) && ($opt{l})) { print "\nFailed to set seclogin_active_all_users  in case1 from old logging solutions  \n";};
        if (($DEBUG) && ($opt{l})) { print "\nRequires $check_sec_loga and $check_sec_logc  || $check_sec_logb and $check_sec_logd \n";};
        if (($DEBUG) && ($opt{l})) { print "\nseclogin_active_all_users checking in  /etc/profile chk \n  File=.*From:.*To  = $check_sec_loga \n  HISTFILE=.*File =  $check_sec_logc \n";};
        if (($DEBUG) && ($opt{l})) { print "\nseclogin_active_all_users checking in  /etc/profile.d/history.sh \n File=.*From:.*To = $check_sec_logb \n HISTFILE=.*File  =  $check_sec_logd \n";};
        if (($DEBUG) && ($opt{l})) { print "\nEnd of check for  seclogin_active_all_users  in case1 from old logging solutions  \n";};
        }

    #New case based on David Perantoni/Burlington/IBM approach
    #my $check_sec_loga="";
    #my $check_sec_logb="";
    #my $check_sec_logc="";
    #my $check_sec_logd="";

    if (($DEBUG) && ($opt{l})) #Package variable declared or used
    {
        print "\nin CheckAllUsers_EtcProfile Perantoni case code. Applies only to ksh and bash users.\n";
    }

    if ( -f "/etc/profile" )
    {
        $check_sec_loga = `grep -v "^#" /etc/profile | grep '/etc/enhanced_shell_history' 2>/dev/null`;
    }
    if ( -f "/etc/enhanced_shell_history" )
    {
        $check_sec_logb = `grep -v "^#" /etc/enhanced_shell_history | grep 'REAL_USER=.*who.am.i.2./dev/null..cut.' 2>/dev/null`;
        $check_sec_logc = `grep -v "^#" /etc/enhanced_shell_history | grep 'HISTFILE=/var/adm/history/.REAL_USER.as..EFFECTIVE_USER.sh_history' 2>/dev/null`;
        $check_sec_logd = `grep -v "^#" /etc/enhanced_shell_history | egrep -e 'EXTENDED_HISTORY HISTSIZE HISTFILE ' 2>/dev/null`;
    }

    $seclogin_active_all_users = 0;
    if ($check_sec_loga and $check_sec_logb and $check_sec_logc and $check_sec_logd) {
        $seclogin_active_all_users = 1;
        if (($DEBUG) && ($opt{l})) { print "\nPassed. seclogin_active_all_users set via Perantoni-CheckAllUsers_EtcProfile:$seclogin_active_all_users\n";};#Package variable declared or used
        if ($DEBUG) 
        {
            print "Debug seclogin_active_all_users return 6 =$seclogin_active_all_users\n";
        }
        return $seclogin_active_all_users ;
        } else {
         #Package variable declared or used below
        if (($DEBUG) && ($opt{l})) { print "\nFailed Did not set seclogin_active_all_users in case Perantoni in CheckAllUsers_EtcProfile:$seclogin_active_all_users  \n";};
        if (($DEBUG) && ($opt{l})) { print "\nseclogin_active_all_users  /etc/profile chk call requires  $check_sec_loga \n";};
        if (($DEBUG) && ($opt{l})) { print "\nseclogin_active_all_users via /etc/enhanced_shell_history Requires:  $check_sec_logb and  $check_sec_logc and  $check_sec_logd \n";};
        if ($DEBUG) 
        {
            print "Debug seclogin_active_all_users return else 6 =$seclogin_active_all_users\n";
        }
        return $seclogin_active_all_users;
        }

} # end of sub.

####Changes for Enhancement 76184
sub Convert_file_to_IBMids()
{
        if($DEBUG)
        {
            print "\nIN Convert_file_to_IBMids\n";
            print "\nReading $flat_file\n";
        }
        if ( -e "$flat_file" )
        {
            if ( -f "$flat_file" ) 
            {
                my $IN = IO::File->new("$flat_file", "<");  #prohibit indirect syntax
                my @flat_file_users = <$IN>; 
                my @matched_user_id;
                
                foreach my $match(@flat_file_users)
                {
                    print "\nPriting user : $match from $flat_file..\n" if($DEBUG);
                    next if( $match =~ m/^\s*$/xg); #Regular expression without "/x"
                    $match =~ s/\r//xg;   #Regular expression without "/x"  
                    $match =~ s/\*/.\*/xg; #Regular expression without "/x"
                    $match =~ s/\?/.\?/xg; #Regular expression without "/x"
                    $match = trim($match); #Sub called with "&"
                    print "\nPriting Processed user : $match from $flat_file..\n" if($DEBUG);        
                    @matched_user_id = grep({ /^\s*\Q$match\E\s*$/x } keys %users);  #Regular expression without "/x"     #require block grep  
                    
                    print "\nMatched User ID's = @matched_user_id \n" if($DEBUG);     
              
                    foreach my $user(@matched_user_id)
                    {                        
                        if (exists $users{$user})
                        { 
                            print "\nUser $user will be considered as IBM User.\n" if($DEBUG);
                            $IBMIDLIST{$user} = $user;
                        }
                        else
                        {
                           print "\nUser $user Does not Exists\n" if($DEBUG);
                        }
                    }
                }
            }
            else
            {
                if ($DEBUG)
                {
                    print "File $flat_file is not a flat file\n";
                }
            }
        }
        else
        {
            if ($DEBUG)
            {
                print "File $flat_file is does not exist\n";
            }
        }
        return; #require final return
}

sub CheckPerUser_SecLogin #Sub called with "&"
{ 
    my ($usr) = @_; ##require argument unpacking
    #my $check_sec_log;
    #my $check_sec_log1;
    my $seclogin_active_per_user = 0;

    ###########################
    my $other_filter_copy = 0x0007; #Reused variable name in lexical scope
    my $group_filter_copy = 0x0038; #Reused variable name in lexical scope
    my $user_filter_copy  = 0x01C0; #Reused variable name in lexical scope
    my $sticky_filter_copy  = 0x0E00; #Reused variable name in lexical scope
    my $configfile_copy="/var/log/hist"; #Reused variable name in lexical scope
    ###########################
    # $output_val = bq grep -v "^#" /etc/passwd | grep "^$usr:" 2>/dev/null bq;  #backquote
    ###Changes for defect 148564
    my $user_home;                      #strict_use
    my $user_shell;                     #strict_use
    $user_home =(getpwnam $usr)[7];
    
    #if ( ! -e $user_home ) { print "ERROR: $usr has no local home directory. Logging check skipped.\n"; return $seclogin_active_per_user = 0 }
    # To know what locations to check, we need the users default login shell
    
    #####changes for Defect 148564
    $user_shell = (getpwnam $usr)[8];

    if ((defined $user_shell) && ($DEBUG))
    {
        print "\nin CheckPerUser_SecLogin for $usr $user_shell\n";
    }

# First, a check on two  boundary cases. Any /sh user with  $SH_LogAllUserids_active is logging. Else, if $seclogin_active_all_users is 1 and the shell is bash or ksh, this userid has logging set up.
    if(defined $user_shell)
    {
        if ( ($user_shell =~ /\/sh/x ) and (  $SH_LogAllUserids_active )) { #Regular expression without "/x"
            $seclogin_active_per_user = 1;
               #Package variable declared or used below
               if (($DEBUG) && ($opt{l})) { print "\nPassed for all /sh users.  Logging already set up for all /sh userids including $usr default of shell $user_shell\n"}
            return $seclogin_active_per_user;
        } elsif (($user_shell =~ /\/sh/x ) and (! $SH_LogAllUserids_active ) ) { #Regular expression without "/x"
               if (($DEBUG) && ($opt{l})) { print "   Logging not set up for all sh ids $SH_LogAllUserids_active . Continuing testing $usr default of shell $user_shell\n"  };
        } else {
               if (($DEBUG) && ($opt{l})) { print "   Not /sh userid. Continuing testing $usr default of shell $user_shell\n"  };
        }
    }
    if (((defined $user_shell) && ($user_shell =~ /ksh/) || ($user_shell =~ /bash/)) && $seclogin_active_all_users)  #prohibit mixed boolean operators#brackets_added_because_of_precedence #defect 561331
    {
        $seclogin_active_per_user = 1;
           if (($DEBUG) && ($opt{l})) { print "\nPassed.  Logging already set up for all ksh and bash userids including $usr default of shell $user_shell\n"}
        return $seclogin_active_per_user;
    } else {
           if (($DEBUG) && ($opt{l})) { print "   Continuing testing $usr default of shell $user_shell\n"  };
    }

# another check on a boundary case. If  the user_shell imediately exits,  we do not care if  this userid has logging set up.
    if ((defined $user_shell) && (($user_shell =~ /nologin/x) || ($user_shell =~ /false/x) || ($user_shell =~ /dev.null/x) ||  ($user_shell =~ /true/x)) ) #Regular expression without "/x"
    {
        $seclogin_active_per_user = 1;
           if (($DEBUG) && ($opt{l})) { print "\nPassed. No secondary logging required  because of shell for  $usr default of shell $user_shell\n"}
        return $seclogin_active_per_user;
    } else {
           if (($DEBUG) && ($opt{l})) { print "   User $usr does not have /nologin or /false in shell. Continuing testing $usr default of shell $user_shell\n"  };
    }

## Start checking for user by user logging.

# Check for existence of standard logging directory. Not version dependent
   my  $varloghist;
   $varloghist="NotFound";
   if (-d "/var/log/hist")
   {
    #######################################
    my ($dev, $ino, $mode, $nlink, $uid, $gid, $rdev, $size, $atime, $mtime, $ctime, $blksize, $blocks) = stat $configfile_copy;
    my $sticky  = ($mode & $sticky_filter_copy) >> 9;
    my $user  = ($mode & $user_filter_copy) >> 6;
    my $group = ($mode & $group_filter_copy) >> 3;
    my $other = $mode & $other_filter_copy;
    my $permossions="$sticky$user$group$other";
  
    $varloghist="varloghist_exists";
        my $perms = (stat $configfile_copy)[2] & oct("7777"); #my $perms = (stat("$configfile"))[2] & 07777; #perlcritic
        my $MODE = sprintf "%o", $perms;
        $permossions=$MODE;
        
        if($permossions != 1777)
        {
             $varloghist="varloghist_perms_bad" ;
             $seclogin_active_per_user=0;
             if (($DEBUG) && ($opt{l})) { print "\nFailed. User $usr was not tested further because incorrect var/log/hist $configfile not found or permissions  - $permossions - not  1777 "; }; #Package variable declared or used
             print "Secondary logging for user $usr was not tested because of incorrect var/log/hist $configfile permissions  - $permossions - not  1777 \n";
             return $seclogin_active_per_user;
        }
    $varloghist="varloghist_ok_peruser";
    #######################################
    }
    else
    {
       $seclogin_active_per_user=0;
        if (!($opt{t})) { print "Secondary logging for user $usr not tested because logging directory /var/log/hist does not exist \n"  }; #Package variable declared or used
       return $seclogin_active_per_user;
    }


    # Check for Per-Userid Logging Setup at V3.1 or higher. 
    my $check_sec_log_codeD1;
       $check_sec_log_codeD1=0;
    my $check_sec_log_codeD2;
       $check_sec_log_codeD2=0;
    my $check_sec_log_codeD2a;
       $check_sec_log_codeD2a=0;
    my $check_sec_log_codeD3;
       $check_sec_log_codeD3=0;
    my $check_sec_log_codeD4;
       $check_sec_log_codeD4=0;
    my $check_sec_log_codeD4a;
       $check_sec_log_codeD4a=0;
    my $check_sec_log_codeD5;
       $check_sec_log_codeD5=0;
    my $check_sec_log_codeD6;
       $check_sec_log_codeD6=0;
    my $check_sec_log_codeD7;
       $check_sec_log_codeD7=0;
    my $check_sec_log_codeD8;
       $check_sec_log_codeD8=0;
    my $check_sec_log_codeD9;
       $check_sec_log_codeD9=0;
    my $check_sec_log_codeDa;
       $check_sec_log_codeDa=0;

# Logging check for BashOrKsh_SetupPerUserid installation option #1(execute in profile or bash_profile). Method kbs1.1 at V3.1 or higher.
# If $usr shell is ksh, Check for secondary logging setup in users .profile
    if ((defined $user_shell) && ($user_shell =~ /ksh/ ) ) {
        $check_sec_log_codeD1 = `egrep -e  ' xxBEGIN_IBM_SEC_LOGxx '  $user_home/.profile 2>/dev/null`;
           if (($DEBUG) && ($opt{l})) { print "\nChecking for ksh user $usr $user_shell   secondary logging setup at V3.1 or higher in users .profile\n"  }; #Package variable declared or used

        $check_sec_log_codeD2 = `egrep -e  ' xxEND_IBM_SEC_LOGxx '  $user_home/.profile 2>/dev/null`;

        $check_sec_log_codeD3 = `egrep -e 'From=.*who.am.i...awk.*print.*1'  $user_home/.profile  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_codeD4 = `egrep -e  'To=.*whoami...awk.*print..1' $user_home/.profile  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_codeD4a = `egrep -e  'HISTFILE=..HIST_DIR....To....FILE....export.HISTFILE' $user_home/.profile  2>/dev/null | egrep -v -e '^#' `;

    }
# If $usr shell is bash, Check for secondary logging setup at V3.1 or higher in users  .bash_profile if it exists, otherwise check in users .profile
    if ((defined $user_shell) && ($user_shell =~ /bash/)) {
       my $bash_user_profile_to_test="$user_home/.bash_profile";
       if (-f $bash_user_profile_to_test) 
       {
        $check_sec_log_codeD1 = `egrep -e  ' xxBEGIN_IBM_SEC_LOGxx '  $user_home/.bash_profile 2>/dev/null `;
           if (($DEBUG) && ($opt{l})) { print "\nChecking for bash user $usr default of shell $user_shell   secondary logging setup at V3.1 or higher in users .bash_profile\n"  }; #Package variable declared or used

        $check_sec_log_codeD2 = `egrep -e  ' xxEND_IBM_SEC_LOGxx '  $user_home/.bash_profile 2>/dev/null `;

        $check_sec_log_codeD3 = `egrep -e 'From=.*who.am.i...awk.*print.*1'  $user_home/.bash_profile  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_codeD4 = `egrep -e  'To=.*whoami...awk.*print..1' $user_home/.bash_profile  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_codeD4a = `egrep -e  'HISTFILE=..HIST_DIR....To....FILE....export.HISTFILE' $user_home/.bash_profile  2>/dev/null | egrep -v -e '^#' `;

     }
     else
     { 
        $check_sec_log_codeD1 = `egrep -e  ' xxBEGIN_IBM_SEC_LOGxx '  $user_home/.profile 2>/dev/null `;
           if (($DEBUG) && ($opt{l})) { print "\nChecking for bash user $usr default of shell $user_shell   secondary logging setup at V3.1 or higher in users .PROFILE (no .bash_profile) \n"  }; #Package variable declared or used

        $check_sec_log_codeD2 = `egrep -e  ' xxEND_IBM_SEC_LOGxx '  $user_home/.profile 2>/dev/null `;

        $check_sec_log_codeD3 = `egrep -e 'From=.*who.am.i...awk.*print.*1'  $user_home/.profile  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_codeD4 = `egrep -e  'To=.*whoami...awk.*print..1' $user_home/.profile  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_codeD4a = `egrep -e  'HISTFILE=..HIST_DIR....To....FILE....export.HISTFILE' $user_home/.profile  2>/dev/null | egrep -v -e '^#' `;

      } # We have looked in .bash_profile or maybe in .profile.... 
    }  # and this was a bash id

# Time to assess if the method is active if its either a ksh or bash user since we just tested those 2 cases..
    if ((defined $user_shell) && (($user_shell =~ /ksh/) || ($user_shell =~ /bash/))) {
    if ($check_sec_log_codeD1 and $check_sec_log_codeD2 and $check_sec_log_codeD3 and $check_sec_log_codeD4 and $check_sec_log_codeD4a and $varloghist)   
    {
        $seclogin_active_per_user = 1;
           if (($DEBUG) && ($opt{l})) { print "\nPassed. BashOrKsh_SetupPerUserid option #1(code is right in profile or bash_profile) Method kbs1.1 at V3.1 or higher. for $usr\n"} #Package variable declared or used
        return $seclogin_active_per_user;
    } else {
           if (($DEBUG) && ($opt{l})) { print "\nFailed: BashOrKsh_SetupPerUserid option #1 (code is not in profile or bash_profile) Method kbs1.1 at V3.1 or higher. for $usr \n Requires: code D1 $check_sec_log_codeD1 \n codeD2 $check_sec_log_codeD2 \n codeD3 $check_sec_log_codeD3 \n codeD4 $check_sec_log_codeD4 \n codeD4a $check_sec_log_codeD4a \n logdir $varloghist  )\n"  }; #Package variable declared or used
    }
    } # end of if- for ksh or bash cases.
# End of Logging check for BashOrKsh_SetupPerUserid_V2.0 installation method kb1 option 1 (execute in profile or bash_profile)direct into .profile and .bashrc

# Since V3.5 added support for kbs1.1 to handle /sh we need to look for it.

    my $check_sec_log_codeS1;
    $check_sec_log_codeS1=0;
    my $check_sec_log_codeS2;
    $check_sec_log_codeS2=0;
    my $check_sec_log_codeS3;
    $check_sec_log_codeS3=0;
    my $check_sec_log_codeS4;
    $check_sec_log_codeS4=0;
    my $check_sec_log_codeS4a;
    $check_sec_log_codeS4a=0;
    my $check_sec_log_codeS5;
    $check_sec_log_codeS5=0;
    my $check_sec_log_codeS11;
    $check_sec_log_codeS11=0;
    my $check_sec_log_codeS12;
    $check_sec_log_codeS12=0;
    my $check_sec_log_codeS13;
    $check_sec_log_codeS13=0;
    my $check_sec_log_codeS14;
    $check_sec_log_codeS14=0;
    my $check_sec_log_codeS14a;
    $check_sec_log_codeS14a=0;

# Logging check for \sh userids as part of   BashKshSh_LogSingleUserid_Vx  installation option #1(execute in profile or bash_profile). Part of Method kb1 at V3.1 or higher.
# If $usr shell is sh, Check for secondary logging setup in users .profile and .bashrc (in case he execs to ksh then issues bash) 
    if ((defined $user_shell) && ($user_shell =~ /\/sh$/x ) ) { #Regular expression without "/x"
        $check_sec_log_codeS1 = `egrep -e  ' xxBEGIN_IBM_SEC_LOGxx '  $user_home/.profile 2>/dev/null`;
           if (($DEBUG) && ($opt{l})) { print "\nChecking for sh user $usr $user_shell   secondary logging setup at V3.1 or higher in users .profile\n"  }; #Package variable declared or used

        $check_sec_log_codeS2 = `egrep -e  ' xxEND_IBM_SEC_LOGxx '  $user_home/.profile 2>/dev/null`;

        $check_sec_log_codeS3 = `egrep -e 'From=.*who.am.i...awk..*print.*1'  $user_home/.profile  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_codeS4 = `egrep -e  'To=.*whoami...awk..*print.*1' $user_home/.profile  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_codeS4a = `egrep -e  'HISTFILE=..HIST_DIR....To....FILE....export.HISTFILE' $user_home/.profile  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_codeS5 = `egrep -e  'exec..bin.*sh' $user_home/.profile  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_codeS11 = `egrep -e  ' xxBEGIN_IBM_SEC_LOGxx '  $user_home/.bashrc 2>/dev/null `;

        $check_sec_log_codeS12 = `egrep -e  ' xxEND_IBM_SEC_LOGxx '  $user_home/.bashrc 2>/dev/null `;

        $check_sec_log_codeS13 = `egrep -e 'From=.*who.am.i..*awk..*print.*1'  $user_home/.bashrc  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_codeS14 = `egrep -e  'To=.*whoami...awk..*print.*1' $user_home/.bashrc  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_codeS14a = `egrep -e  'HISTFILE=..HIST_DIR....To....FILE....export.HISTFILE' $user_home/.bashrc  2>/dev/null | egrep -v -e '^#' `;

    }
# Time to assess if the method is active if its a user with \sh.
    if ((defined $user_shell) && ($user_shell =~ /\/sh$/x )) { #Regular expression without "/x"
    if (     $check_sec_log_codeS1 and $check_sec_log_codeS2 and $check_sec_log_codeS3 and $check_sec_log_codeS4 and $check_sec_log_codeS4a and $check_sec_log_codeS5 and $check_sec_log_codeS11 and $check_sec_log_codeS12 and $check_sec_log_codeS13 and $check_sec_log_codeS14 and $check_sec_log_codeS14a and $varloghist)   
    {
        $seclogin_active_per_user = 1;
           if (($DEBUG) && ($opt{l})) { print "\nPassed. for $usr using /sh covered in  BashKshSh_LogSingleUserid_Vx  (code in .profile)  Method kbs1.1 at V3.1 or higher. \n"} #Package variable declared or used
        return $seclogin_active_per_user;
    } else {
           if (($DEBUG) && ($opt{l})) { print "\nFailed: BashKshSh_LogSingleUserid_Vx  (code in .profile) Method kbs1.1 at V3.1 or higher for /sh user  $usr \n"  };
           if (($DEBUG) && ($opt{l})) { print "\nRequires $check_sec_log_codeS1 and $check_sec_log_codeS2 and $check_sec_log_codeS3 and $check_sec_log_codeS4 and $check_sec_log_codeS4a and $check_sec_log_codeS5 and $check_sec_log_codeS11 and $check_sec_log_codeS12 and $check_sec_log_codeS13 and $check_sec_log_codeS14 and $check_sec_log_codeS14a and $varloghist \n"  }; #Package variable declared or used
    }
    } # end of if- for /sh userid  looking in .profile

    # Look for /sh userid calling secondary_logging_IBM.sh from .profile and .bashrc
    $check_sec_log_codeS1=0;
    $check_sec_log_codeS2=0;
    $check_sec_log_codeS3=0;
    $check_sec_log_codeS4=0;
    $check_sec_log_codeS4a=0;
    $check_sec_log_codeS5=0;
    my $check_sec_log_codeS6;
    $check_sec_log_codeS6=0;
    my $check_sec_log_codeS7;
    $check_sec_log_codeS7=0;

# Logging check for \sh userids  BashKshSh_LogSingleUserid_Vx  option  with file called from .profile. Method kbs1.1 at V3.1 or higher.
# If $usr shell is sh, Check for  call to secondary logging setup in users .profile and .bashrc (in case he execs to ksh then issues bash) 
    if ((defined $user_shell) && ($user_shell =~ /\/sh$/x ) ) { #Regular expression without "/x"
        $check_sec_log_codeS1 = `egrep -e  ' xxBEGIN_IBM_SEC_LOGxx '  $user_home/secondary_logging_IBM.sh 2>/dev/null`;
           if (($DEBUG) && ($opt{l})) { print "\nChecking for sh user $usr $user_shell   secondary logging setup at V3.1 or higher in users .profile\n"  }; #Package variable declared or used

        $check_sec_log_codeS2 = `egrep -e  ' xxEND_IBM_SEC_LOGxx '  $user_home/secondary_logging_IBM.sh 2>/dev/null`;

        $check_sec_log_codeS3 = `egrep -e 'From=.*who.am.i...awk..*print.*1'  $user_home/secondary_logging_IBM.sh  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_codeS4 = `egrep -e  'To=.*whoami...awk..*print..1' $user_home/secondary_logging_IBM.sh  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_codeS4a = `egrep -e  'HISTFILE=..HIST_DIR....To....FILE....export.HISTFILE' $user_home/secondary_logging_IBM.sh  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_codeS5 = `egrep -e  'exec..bin.*sh' $user_home/secondary_logging_IBM.sh  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_codeS6 = `egrep -e  'secondary_logging_IBM.sh' $user_home/.profile  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_codeS7 = `egrep -e  'secondary_logging_IBM.sh' $user_home/.bashrc  2>/dev/null | egrep -v -e '^#' `;
    }
# Time to assess if the method is active if its a ksh or bash user.
    if ((defined $user_shell) && (($user_shell =~ /\/sh$/x) )) { #Regular expression without "/x"
    if ($check_sec_log_codeS1 and $check_sec_log_codeS2 and $check_sec_log_codeS3 and $check_sec_log_codeS4 and $check_sec_log_codeS4a and $check_sec_log_codeS5 and $check_sec_log_codeS6 and $check_sec_log_codeS7 and $varloghist)   
    {
        $seclogin_active_per_user = 1;
           if (($DEBUG) && ($opt{l})) { print "\nPassed. /sh user $usr covered in BashKshSh_LogSingleUserid_Vx  (code called from .profile)  Method kbs1.1 at V3.1 or higher. \n"} #Package variable declared or used
        return $seclogin_active_per_user;
    } else {
           if (($DEBUG) && ($opt{l})) { print "\nFailed: /sh $usr covered in BashKshSh_LogSingleUserid_Vx  (code called from .profile) Method kbs1.1 at V3.1 or higher for $usr \n"  };
           if (($DEBUG) && ($opt{l})) { print "\nRequires: $check_sec_log_codeS1 \n and $check_sec_log_codeS2 \n and $check_sec_log_codeS3 \n and $check_sec_log_codeS4 \n and $check_sec_log_codeS4a \n and $check_sec_log_codeS5 \n and $check_sec_log_codeS6 \n and $check_sec_log_codeS7 \n and $varloghist \n"  }; #Package variable declared or used
    }
    } # end of if-/sh userid  looking in .profile


# End of Logging check for /sh userid BashKshSh_LogSingleUserid_Vx  installation method kb1.

# Logging check for bash and ksh userids BashOrKsh_SetupPerUserid_V2.0 installation option #2(call file from profile)  at V3.1 or higher.
       $check_sec_log_codeD1=0;
       $check_sec_log_codeD2=0;
       $check_sec_log_codeD2a=0;
       $check_sec_log_codeD3=0;
       $check_sec_log_codeD4=0;
       $check_sec_log_codeD5=0;

    # If $usr shell is ksh, Check for user_secondary_logging_IBM.sh call in profile. Method kbs1.1.
    if ((defined $user_shell) && ($user_shell =~ /ksh/ )) {
        $check_sec_log_codeD1 = `egrep -e  'secondary_logging_IBM.sh' $user_home/.profile  2>/dev/null | egrep -v -e '^#' `;
           if (($DEBUG) && ($opt{l})) { print "\nChecking for ksh user $usr  default of shell $user_shell using  secondary logging script at V3.1 or higher via a call in users .profile. Method  kbs1.1\n"  }; #Package variable declared or used
    }

    # If $usr shell is bash, Check for user_secondary_logging_IBM.sh call in .bash_profile
    if ((defined $user_shell) && ($user_shell =~ /bash/ )) {
       my $bash_user_profile_to_test="$user_home/.bash_profile";
       if (-f $bash_user_profile_to_test) 
        {
        $check_sec_log_codeD1 = `egrep -e  'secondary_logging_IBM.sh' $user_home/.bash_profile 2>/dev/null  | egrep -v -e '^#' `;
           if (($DEBUG) && ($opt{l})) { print "\nBash_profile exists. Checking for bash user $usr default of shell $user_shell   calling secondary logging script  at V3.1+ via a call in  .bash_profile\n"  }; #Package variable declared or used
        }     
        else
        {
        $check_sec_log_codeD1 = `egrep -e  'secondary_logging_IBM.sh' $user_home/.profile 2>/dev/null  | egrep -v -e '^#' `;
           if (($DEBUG) && ($opt{l})) { print "\nNo bash_profile. Checking for bash user $usr default of shell $user_shell call to   secondary logging script  at V3.1 or higher in .profile \n"  }; #Package variable declared or used
        }
    }
       
    if ((defined $user_shell) && (( $user_shell =~ /ksh/) || ($user_shell =~ /bash/ ) ) ) {
    # Check on contents of secondary logging script  $user_home/user_secondary_logging_IBM.sh 
    # Check for *who.am.i.awk.*print.*1 to be sure origin id is captured in secondary logging script 
        $check_sec_log_codeD2 = `egrep -e 'From=..*who.am.i.*awk.*print.*1'  $user_home/secondary_logging_IBM.sh  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_codeD2a = `egrep -e 'HISTFILE=..HIST_DIR....To./..FILE.*export HISTFILE' $user_home/secondary_logging_IBM.sh  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_codeD3 = `egrep -e  'To=..*whoami...awk..*print..1..' $user_home/secondary_logging_IBM.sh  2>/dev/null | egrep -v -e '^#' `;
        # Check for xxBEGIN_IBM_SEC_LOGxx in secondary logging script
        $check_sec_log_codeD4 = `egrep -e  ' xxBEGIN_IBM_SEC_LOGxx '  $user_home/secondary_logging_IBM.sh 2>/dev/null `;

        # Check for xxEND_IBM_SEC_LOGxx in secondary logging script
        $check_sec_log_codeD5 = `egrep -e  ' xxEND_IBM_SEC_LOGxx '  $user_home/secondary_logging_IBM.sh 2>/dev/null  `;
     }


# Time to assess if the method is active if its an sh,  ksh or bash user.
    #if (($user_shell =~ /ksh/) || ($user_shell =~ /bash/ ) ||  ($user_shell = "sh" )) {  # Ver 7n commented out 22July. I think /sh is test4ed earlier.
    if ((defined $user_shell) && (( $user_shell =~ /ksh/) || ($user_shell =~ /bash/ ) ) ){
              if (($DEBUG) && ($opt{l})) { print "Testing the results for  BashOrKsh_SetupPerUserid installation (call file from profile) . Method kb1 at all versions .  for $usr shell: $user_shell \n"} #Package variable declared or used
       if ($check_sec_log_codeD1 and $check_sec_log_codeD2 and $check_sec_log_codeD2a and $check_sec_log_codeD3 and $check_sec_log_codeD4 and $check_sec_log_codeD5 and $varloghist  )
       {
           $seclogin_active_per_user = 1;
              if (($DEBUG) && ($opt{l})) { print "\nPassed.  BashOrKsh_SetupPerUserid installation  call from profile or  bash_profile Method kbs1.1   for $usr  shell: $user_shell  \n"} #Package variable declared or used
           return $seclogin_active_per_user;
       } else {
           if (($DEBUG) && ($opt{l})) { print "\nFailed: ksh or bash id using BashOrKsh_SetupPerUserid (called fr profile). Method kbs1.1  at V3.1 or higher . for $usr \n Requires: codeD1 $check_sec_log_codeD1 \n codeD2 $check_sec_log_codeD2 \n codeD2a $check_sec_log_codeD2a \n codeD3 $check_sec_log_codeD3 \n codeD4 $check_sec_log_codeD4 \n codeD5 $check_sec_log_codeD5 \n logdir $varloghist  )\n"  }; #Package variable declared or used
       }
    } # end of if-ksh or bash

# End of Logging check for BashOrKsh_SetupPerUserid_ installation option #2. Method kbs1.1   at V3.1 or higher .


# Checks on PRE V3.1 Secondary Logging PerUserid code kb1

    my $check_sec_log_code1;
    $check_sec_log_code1=0;
    my $check_sec_log_code2;
    $check_sec_log_code2=0;
    my $check_sec_log_code2a;
    $check_sec_log_code2a=0;
    my $check_sec_log_code3;
    $check_sec_log_code3=0;
    my $check_sec_log_code4;
    $check_sec_log_code4=0;
    my $check_sec_log_code4a;
    $check_sec_log_code4a=0;
    my $check_sec_log_code5;
    $check_sec_log_code5=0;
    my $check_sec_log_code6;
    $check_sec_log_code6=0;
    my $check_sec_log_code7;
    $check_sec_log_code7=0;
    my $check_sec_log_code8;
    $check_sec_log_code8=0;
    my $check_sec_log_code9;
    $check_sec_log_code9=0;
    my $check_sec_log_codea;
    $check_sec_log_codea=0;
    my $check_sec_log_code8a;
    $check_sec_log_code8a=0;

# Logging check for BashOrKsh_SetupPerUserid installation option #1 (executed from profile and bash_profile). Method kb1 at PREV3.1 levels.
# If $usr shell is ksh, Check for secondary logging setup in users .profile
    if ((defined $user_shell) && ($user_shell =~ /ksh/ ) ) {
        $check_sec_log_code1 = `egrep -e  ' xxBEGIN_IBM_SEC_LOGxx '  $user_home/.profile 2>/dev/null`;
           if (($DEBUG) && ($opt{l})) { print "\nChecking for ksh user $usr $user_shell   secondary logging setup in users .profile at PRE-V3.1 levels\n"  }; #Package variable declared or used

        $check_sec_log_code2 = `egrep -e  ' xxEND_IBM_SEC_LOGxx '  $user_home/.profile 2>/dev/null`;

        $check_sec_log_code3 = `egrep -e 'From=..*/who.am.i.*awk.*print.*1'  $user_home/.profile  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_code4 = `egrep -e  'To=..*/whoami...awk..*print..1' $user_home/.profile  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_code4a = `egrep -e  'HISTFILE=/var/log/hist/.To/.FILE' $user_home/.profile  2>/dev/null | egrep -v -e '^#' `;

    }

# If $usr shell is bash, Check for secondary logging setup in users  .bash_profile
       if ((defined $user_shell) && ($user_shell =~ /bash/)) {
       my $bash_user_profile_to_test="$user_home/.bash_profile";
       if (-f $bash_user_profile_to_test) 
       {
        $check_sec_log_code1 = `egrep -e  ' xxBEGIN_IBM_SEC_LOGxx '  $user_home/.bash_profile 2>/dev/null `;
           if (($DEBUG) && ($opt{l})) { print "\nChecking for bash user $usr default of shell $user_shell   secondary logging setup in users .bash_profile at PRE-V3.1 levels\n"  }; #Package variable declared or used

        $check_sec_log_code2 = `egrep -e  ' xxEND_IBM_SEC_LOGxx '  $user_home/.bash_profile 2>/dev/null `;

        $check_sec_log_code3 = `egrep -e 'From=..*/who.am.i.*awk.*print.*1'  $user_home/.bash_profile  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_code4 = `egrep -e  'To=..*/whoami...awk..*print..1' $user_home/.bash_profile  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_code4a = `egrep -e  'HISTFILE=/var/log/hist/.To/.FILE' $user_home/.bash_profile  2>/dev/null | egrep -v -e '^#' `;

      }
       else
        {
        $check_sec_log_code1 = `egrep -e  ' xxBEGIN_IBM_SEC_LOGxx '  $user_home/.profile 2>/dev/null `;
           if (($DEBUG) && ($opt{l})) { print "\nChecking for bash user $usr default of shell $user_shell   secondary logging setup in users .profile (no bash_profile exists) at PRE-V3.1 levels\n"  }; #Package variable declared or used

        $check_sec_log_code2 = `egrep -e  ' xxEND_IBM_SEC_LOGxx '  $user_home/.profile 2>/dev/null `;

        $check_sec_log_code3 = `egrep -e 'From=..*/who.am.i.*awk.*print.*1'  $user_home/.profile  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_code4 = `egrep -e  'To=..*/whoami...awk..*print..1' $user_home/.profile  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_code4a = `egrep -e  'HISTFILE=/var/log/hist/.To/.FILE' $user_home/.profile  2>/dev/null | egrep -v -e '^#' `;

       } 
     }


# Time to assess if the method is active if its a ksh or bash user.
    if ((defined $user_shell) && (($user_shell =~ /ksh/) || ($user_shell =~ /bash/))) {
    if ($check_sec_log_code1 and $check_sec_log_code2 and $check_sec_log_code3 and $check_sec_log_code4 and $check_sec_log_code4a and $varloghist)   
    {
        $seclogin_active_per_user = 1;
           if (($DEBUG) && ($opt{l})) { print "\nPassed.  BashOrKsh_SetupPerUserid installation option #1 (executed from profile and bash_profile) Method kb1 at PRE-V3.1 levels. for $usr  shell: $user_shell \n"} #Package variable declared or used
        return $seclogin_active_per_user;
    } else {
           if (($DEBUG) && ($opt{l})) { print "\nFailed: BashOrKsh_SetupPerUserid installation option #1 (executed from profile and bash_profile) Method kb1 at PRE-V3.1 levels. for $usr  shell: $user_shell  \n Requires:  $check_sec_log_code1 and $check_sec_log_code2 and $check_sec_log_code3 and $check_sec_log_code4 and $check_sec_log_code4 and $varloghist  )\n"  }; #Literal line breaks in a string #Package variable declared or used
    }
    } # end of if-ksh or bash

# End of Logging check for BashOrKsh_SetupPerUserid_V2.0 installation option #1.




# Logging check for BashOrKsh_SetupPerUserid_V2.0 installation option #2.

    # If $usr shell is ksh, Check for user_secondary_logging_IBM.sh call in profile. Method kb1.Older version has user_ in front of filename.
    if ((defined $user_shell) && ($user_shell =~ /ksh/ )) {
        $check_sec_log_code1 = `egrep -e  'user_secondary_logging_IBM.sh' $user_home/.profile  2>/dev/null | egrep -v -e '^#' `;
           if (($DEBUG) && ($opt{l})) { print "\nChecking for ksh user $usr  default of shell $user_shell   secondary logging script call in users .profile at PRE-V3.1 levels. Method  kb1\n"  }; #Package variable declared or used

    }

    # If $usr shell is bash, Check for user_secondary_logging_IBM.sh call in .bash_profile
    if ((defined $user_shell) && ($user_shell =~ /bash/ )) {
       my $bash_user_profile_to_test="$user_home/.bash_profile";
       if (-f $bash_user_profile_to_test) 
       {
        $check_sec_log_code1 = `egrep -e  'user_secondary_logging_IBM.sh' $user_home/.bash_profile 2>/dev/null  | egrep -v -e '^#' `;
           if (($DEBUG) && ($opt{l})) { print "\nChecking for bash user $usr default of shell $user_shell   secondary logging script call in users .bash_profile\n"  }; #Package variable declared or used

      }
       else
       {
        $check_sec_log_code1 = `egrep -e  'user_secondary_logging_IBM.sh' $user_home/.profile 2>/dev/null  | egrep -v -e '^#' `;
           if (($DEBUG) && ($opt{l})) { print "\nChecking for bash user $usr default of shell $user_shell   secondary logging script call in users .profile because no bash_profile exists\n"  }; #Package variable declared or used

       }  
    }


    if ((defined $user_shell) && (($user_shell =~ /ksh/) || ($user_shell =~ /bash/))) {
    # Check on contents of secondary logging script  $user_home/user_secondary_logging_IBM.sh 
    # Check for */who.am.i.awk.*print.*1 to be sure origin id is captured in secondary logging script 
        $check_sec_log_code2 = `egrep -e 'From=..*/who.am.i.*awk.*print.*1'  $user_home/user_secondary_logging_IBM.sh  2>/dev/null | egrep -v -e '^#' `;
        $check_sec_log_code2a = `egrep -e  'HISTFILE=/var/log/hist/.To/.FILE' $user_home/user_secondary_logging_IBM.sh  2>/dev/null | egrep -v -e '^#' `;
        $check_sec_log_code3 = `egrep -e  'To=..*/whoami...awk..*print..1..' $user_home/user_secondary_logging_IBM.sh  2>/dev/null | egrep -v -e '^#' `;

        # Check for xxBEGIN_IBM_SEC_LOGxx in secondary logging script
        $check_sec_log_code4 = `egrep -e  ' xxBEGIN_IBM_SEC_LOGxx '  $user_home/user_secondary_logging_IBM.sh 2>/dev/null `;

        # Check for xxEND_IBM_SEC_LOGxx in secondary logging script
        $check_sec_log_code5 = `egrep -e  ' xxEND_IBM_SEC_LOGxx '  $user_home/user_secondary_logging_IBM.sh 2>/dev/null  `;

     }


# Time to assess if the method is active if its a  ksh or bash user.
    if ((defined $user_shell) && (($user_shell =~ /ksh/) || ($user_shell =~ /bash/) ) ){

    if ($check_sec_log_code1 and $check_sec_log_code2 and $check_sec_log_code2a and $check_sec_log_code3 and $check_sec_log_code4 and $check_sec_log_code5 and $varloghist  )
    {
        $seclogin_active_per_user = 1;
           if (($DEBUG) && ($opt{l})) { print "\nPassed.  BashOrKsh_SetupPerUserid installation (call to user_sec file fr .profile or bash_profile). Method kb1 at PRE-V3.1 levels.  for $usr  shell: $user_shell \n"} #Package variable declared or used
        return $seclogin_active_per_user;
    } else {
           if (($DEBUG) && ($opt{l})) { print "\nFailed: BashOrKsh_SetupPerUserid installation (call to user_sec file fr .profile or bash_profile). Method kb1 at PRE-V3.1 levels. for $usr  shell: $user_shell \n Requires: $check_sec_log_code1 and $check_sec_log_code2 and $check_sec_log_code2a and $check_sec_log_code3 and $check_sec_log_code4 and $check_sec_log_code5 and $varloghist  )\n"  }; #Literal line breaks in a string #Package variable declared or used

           #Diagnostic module to gather all per-userid setup logging info in one place
           if (($DEBUG) && ($opt{l})) { #Package variable declared or used
           print "\n\n>> >> Diagnostic Info for per-userid methods of setting up logging residing in $usr $user_home $user_shell  profile, bash_profile and/or user_secondary_logging_IBM.sh";print "\n"  ;
           print "End of diagnostic info for per-userid methods of setting up logging $usr";print "\n\n\n\n"  ;
           }

    }
    } # end of if-ksh or bash

# End of Logging check for BashOrKsh_SetupPerUserid_ installation option #2(call file from profile) . Method kb1.


# Start of Logging check for CSH_dotLogin and CSH_dotLogout method
# If $usr shell is csh, Check for key strings in ~$user/.login
    if ((defined $user_shell) && ($user_shell =~ /\/csh/x ) ){ #Regular expression without "/x"
        # Check for the 3 key strings in users .login
        $check_sec_log_code1 = `egrep -e  'set.history.30000' $user_home/.login  2>/dev/null | egrep -v -e '^#' `;
           if (($DEBUG) && ($opt{l})) { print "\nChecking for csh user $usr  default of shell $user_shell   secondary logging setup in users .login Method c1.\n"  }; #Package variable declared or used


        $check_sec_log_code2 = `egrep -e  'set.histdir./var/log/hist/.LOGNAME' $user_home/.login  2>/dev/null | egrep -v -e '^#' `;


        $check_sec_log_code3 = `egrep -e  'if.*bin.mkdir..m.0700...histdir' $user_home/.login  2>/dev/null | egrep -v -e '^#' `;



        # Check for xxBEGIN_IBM_SEC_LOGxx in secondary logging setup
           $check_sec_log_code4 = `egrep -e  ' xxBEGIN_IBM_SEC_LOGxx '  $user_home/.login 2>/dev/null `;

        
        # Check for xxEND_IBM_SEC_LOGxx in secondary logging setup
           $check_sec_log_code5 = `egrep -e  ' xxEND_IBM_SEC_LOGxx '  $user_home/.login 2>/dev/null  `;


        # Check for the 4 key strings in users .logout
        $check_sec_log_code6 = `egrep -e  'From=.*/who.am.i...awk... print..1' $user_home/.logout  2>/dev/null | egrep -v -e '^#' `;
           if (($DEBUG) && ($opt{l})) { print "\nChecking for csh user $usr  default of shell $user_shell   secondary logging setup in users .logout\n"  }; #Package variable declared or used


        $check_sec_log_code7 = `egrep -e  'To=.*/whoami...awk..*print..1' $user_home/.logout  2>/dev/null | egrep -v -e '^#' `;


        $check_sec_log_code8 = `egrep -e  'histfile=sh_history..histdate..host_tag..From..To.tty.tty' $user_home/.logout  2>/dev/null | egrep -v -e '^#' `;

        $check_sec_log_code8a = `egrep -e  'history.*histdir/.histfile' $user_home/.logout  2>/dev/null | egrep -v -e '^#' `;

        # Check for xxBEGIN_IBM_SEC_LOGxx in secondary logging setup
                $check_sec_log_code9 = `egrep -e  ' xxBEGIN_IBM_SEC_LOGxx '  $user_home/.logout 2>/dev/null `;

        # Check for xxEND_IBM_SEC_LOGxx in secondary logging setup
                $check_sec_log_codea = `egrep -e  ' xxEND_IBM_SEC_LOGxx '  $user_home/.logout 2>/dev/null  `;

    # Time to assess if the method is active.
        if ($check_sec_log_code1 and $check_sec_log_code2 and $check_sec_log_code3 and $check_sec_log_code4 and $check_sec_log_code5 and $check_sec_log_code6 and $check_sec_log_code7 and $check_sec_log_code8 and $check_sec_log_code8a and $check_sec_log_code9 and $check_sec_log_codea and $varloghist  )
        {
            $seclogin_active_per_user = 1;
               if (($DEBUG) && ($opt{l})) { print "\nPassed.CSH_dotLogin Method c1 for  $usr  shell: $user_shell \n"};#Package variable declared or used
            return $seclogin_active_per_user;
        } else {

           if (($DEBUG) && ($opt{l})) { print "\nFailed: CSH_dotLogin Method c1 for $usr   shell: $user_shell \nRequires: $check_sec_log_code1 and $check_sec_log_code2 and $check_sec_log_code3 and $check_sec_log_code4 and $check_sec_log_code5 and $check_sec_log_code6 and $check_sec_log_code7 and $check_sec_log_code8 and $check_sec_log_code8a and $check_sec_log_code9 and $check_sec_log_codea and $varloghist   \n"  }; #Package variable declared or used
          #Diagnostic module to gather all per-userid setup logging info in one place
           if (($DEBUG) && ($opt{l})) {  #Package variable declared or used
           print "\n\n>> >> Diagnostic Info for per-userid methods of setting up logging residing in $usr $user_home $user_shell  profile, bash_profile and/or secondary_logging_IBM.sh";print "\n"  ;
           print "End of diagnostic info for for per-userid methods of setting up logging $usr";print "\n\n\n\n"  ;
           }
        }
      }

# End of Logging check for CSH_dotLogin and CSH_dotLogout method

# Start of Logging check for tcsh TCSH_dotCshrc  and TCSH_dotLogout

# If $usr shell is csh, Check for key strings in ~$user/.cshrc
    if ((defined $user_shell) && ($user_shell =~ /\/tcsh/x )) { #Regular expression without "/x"
        # Check for the 3 key strings in users .cshrc
        $check_sec_log_code1 = `egrep -e  'set.history.30000' $user_home/.cshrc  2>/dev/null | egrep -v -e '^#' `;
           if (($DEBUG) && ($opt{l})) { print "\nChecking for tcsh user $usr  default of shell $user_shell   secondary logging setup in users .cshrc. Method t1.\n"  }; #Package variable declared or used


        $check_sec_log_code2 = `egrep -e  'set.histdir./var/log/hist/.LOGNAME' $user_home/.cshrc  2>/dev/null | egrep -v -e '^#' `;


        $check_sec_log_code3 = `egrep -e  'if.*bin.mkdir..m.0700...histdir' $user_home/.cshrc  2>/dev/null | egrep -v -e '^#' `;



        # Check for xxBEGIN_IBM_SEC_LOGxx in secondary logging setup
           $check_sec_log_code4 = `egrep -e  ' xxBEGIN_IBM_SEC_LOGxx '  $user_home/.cshrc 2>/dev/null `;


        # Check for xxEND_IBM_SEC_LOGxx in secondary logging setup
           $check_sec_log_code5 = `egrep -e  ' xxEND_IBM_SEC_LOGxx '  $user_home/.cshrc 2>/dev/null  `;


        # Check for the 4 key strings in users .logout
        $check_sec_log_code6 = `egrep -e  'From=.*/who.am.i...awk... print..1' $user_home/.logout  2>/dev/null | egrep -v -e '^#' `;
           if (($DEBUG) && ($opt{l})) { print "\nChecking for csh user $usr  default of shell $user_shell   secondary logging setup in users .logout\n"  }; #Package variable declared or used


        $check_sec_log_code7 = `egrep -e  'To=.*/whoami...awk..*print..1' $user_home/.logout  2>/dev/null | egrep -v -e '^#' `;


        $check_sec_log_code8 = `egrep -e  'histfile=sh_history..histdate..host_tag..From..To.tty.tty' $user_home/.logout  2>/dev/null | egrep -v -e '^#' `;



        $check_sec_log_code8a = `egrep -e  'history.*histdir/.histfile' $user_home/.logout  2>/dev/null | egrep -v -e '^#' `;

        # Check for xxBEGIN_IBM_SEC_LOGxx in secondary logging setup
                $check_sec_log_code9 = `egrep -e  ' xxBEGIN_IBM_SEC_LOGxx '  $user_home/.logout 2>/dev/null `;


        # Check for xxEND_IBM_SEC_LOGxx in secondary logging setup
                $check_sec_log_codea = `egrep -e  ' xxEND_IBM_SEC_LOGxx '  $user_home/.logout 2>/dev/null  `;

        #Time to assess if the method is active.
        if ($check_sec_log_code1 and $check_sec_log_code2 and $check_sec_log_code3 and $check_sec_log_code4 and $check_sec_log_code5 and $check_sec_log_code6 and $check_sec_log_code7 and $check_sec_log_code8 and $check_sec_log_code8a and $check_sec_log_code9 and $check_sec_log_codea and $varloghist  )
        {
            $seclogin_active_per_user = 1;
               if (($DEBUG) && ($opt{l})) { print "\nPassed . TCSH_dotLogout Method t1 for  $usr  shell: $user_shell \n"}; #Package variable declared or used
            return $seclogin_active_per_user; 
        } else {
               if (($DEBUG) && ($opt{l})) { print "\nFailed: TCSH_dotLogout Method t1 for $usr   shell: $user_shell \nRequires: $check_sec_log_code1 and $check_sec_log_code2 and $check_sec_log_code3 and $check_sec_log_code4 and $check_sec_log_code5 and $check_sec_log_code6 and $check_sec_log_code7 and $check_sec_log_code8 and $check_sec_log_code8a and $check_sec_log_code9 and $check_sec_log_codea and $varloghist   \n"  }; #Package variable declared or used
        }
      }

# End of Logging check for tcsh TCSH_dotCshrc  and TCSH_dotLogout

   # We want to accept some of the older logging methods. Those checks follow.
    # Checking the earlier Secondary Logging code versions that were on the wiki as of Mar 2015

           if (($DEBUG) && ($opt{l})) { print "Checking for  Logging case3 $usr  shell: $user_shell\n";  #Package variable declared or used
                         print "check profile for Histfile with _tag strings : \n";

                         print "check bash_profile for Histfile with _tag strings : \n";

                         print "check profile for Histfile  string : \n";

                         print "check bash_profile for Histfile string: \n ";

                       } 
    #case 3Updated 16Mar to check only for the profile file related to the users shell.
    my $check_sec_log;                              #strict_use
    my $check_sec_log1;                             #strict_use
    my $check_sec_log2;                             #strict_use
    $check_sec_log=0;
    $check_sec_log1=0;
    $seclogin_active_per_user = 0;
    if ((defined $user_home) and (-f "$user_home/.profile") and ($user_shell =~/ksh/))
    {
        $check_sec_log  = `grep -v "^#"  $user_home/.profile | egrep -e 'HISTFILE=.*date_tag.*from_tag.*to_tag' 2>/dev/null`;
    }
    if ((defined $user_home) and (-f "$user_home/.bash_profile") and ($user_shell =~/bash/))
    {
        $check_sec_log1 = `grep -v "^#"  $user_home/.bash_profile | egrep -e 'HISTFILE=.*date_tag.*from_tag.*to_tag' 2>/dev/null`;
    }
    if ($check_sec_log || $check_sec_log1 )
    {
        $seclogin_active_per_user = 1;
           if (($DEBUG) && ($opt{l})) { print "\nPassed. Old Logging case3 $usr   shell: $user_shell Found HISTFILE To and From in .profile or  bash_profile \n"} #Package variable declared or used
        return $seclogin_active_per_user;
    } else {
           if (($DEBUG) && ($opt{l})) { print "\nFailed Old Logging case3 $usr  shell: $user_shell Did not find HISTFILE To and From in .profile or bash_profile \n"} #Package variable declared or used
    }
    
    #case2  Updated 16Mar to check only for the profile file related to the users shell.
           if (($DEBUG) && ($opt{l})) { print "\nChecking for Old Logging case2 $usr\n"} #Package variable declared or used
    $check_sec_log=0;
    $check_sec_log1=0;
    $seclogin_active_per_user = 0;
    if ((defined $user_home) and (-f "$user_home/.profile") and ($user_shell =~/ksh/))
    {
        $check_sec_log = `grep -v "^#"  $user_home/.profile | egrep -e 'HISTFILE=.*To/.sh_history..File|WHOas=.*REAL_USER.*LOGNAME' 2>/dev/null`;
        $check_sec_log2 = `grep -v "^#"  $user_home/.profile | egrep -e 'HISTFILE=.*date_tag.*from_tag.*to_tag' 2>/dev/null`;

    }
    #if ($check_sec_log and $seclogin_active_per_user == 0)
    if (($check_sec_log || $check_sec_log2) and $seclogin_active_per_user == 0)
    {
        $seclogin_active_per_user = 1;
           if (($DEBUG) && ($opt{l})) { print "\nPassed. Old Logging case2 $usr  shell: $user_shell Found HISTFILE To and From in .profile \n"} #Package variable declared or used
        return $seclogin_active_per_user;
    } else {
           if (($DEBUG) && ($opt{l})) { print "\nFailed Old Logging case2 $usr  shell: $user_shell Did not find HISTFILE string in .profile  \n"} #Package variable declared or used
    }

    #case4 16Mar added more complete grep string to check both export and capture of original userid
           if (($DEBUG) && ($opt{l})) { print "\nChecking for  Old Logging case4 $usr\n"} #Package variable declared or used
    $check_sec_log=0;
    $check_sec_log1=0;
    $seclogin_active_per_user = 0;
    if ((defined $user_home) and (-f "$user_home/.bashrc") and  ($user_shell =~/bash/))
    {
        $check_sec_log = `grep -v "^#"  $user_home/.bashrc | grep 'HISTFILE=/var/log/bashhist/root_history.*who.am.i.*awk.*print.*1' 2>/dev/null`;
    }
    if ($check_sec_log and $seclogin_active_per_user == 0)
    {
        $seclogin_active_per_user = 1;
           if (($DEBUG) && ($opt{l})) { print "\nPassed. Old Logging  case4 $usr Found HISTFILE in .bashrc \n"} #Package variable declared or used
        return $seclogin_active_per_user;
    }

# This method must no longer be acceptable as PASS for csh users! The cat command is the clue it only logs at subsequent login.
    #case5 csh Logging
    $check_sec_log=0;
    $check_sec_log1=0;
    $seclogin_active_per_user = 0;
    if ((defined $user_home) and ( -f "$user_home/.logout") and ($user_shell =~ /csh/))
    {

        $check_sec_log1 = `grep -v "^#"  $user_home/.logout | grep 'cat \$.myhistory. > \${histdir}/.history.\$.histdate.' 2>/dev/null`;
    }
    if ($check_sec_log1 and $seclogin_active_per_user == 0)
    {
        $seclogin_active_per_user = 0;
           print "Logging check failed for $usr. Solaris logging using cat of histfile not acceptable. See wiki..  case5 $usr  shell: $user_shell \n";
           if (($DEBUG) && ($opt{l})) { print "\nFailed. Solaris logging using cat of histfile not acceptable. See wiki..  case5 $usr  shell: $user_shell \n"} #Package variable declared or used
        return $seclogin_active_per_user;
    }

    #case6 use of logsh no other secondary logging needed.
    $check_sec_log=0;
    $check_sec_log1=0;
    $seclogin_active_per_user = 0;
    if ((-f "/etc/passwd") and (-x "/bin/logsh") and ($user_shell =~ /bin.logsh/x)) #Regular expression without "/x"
    {
        $check_sec_log = `grep -v "^#"  /etc/passwd | grep "^$usr:"|cut -d: -f7 |egrep -e '^/bin/logsh\$' 2>/dev/null`;
           if (($DEBUG) && ($opt{l})) { print "\n Checking /bin/logsh method check_sec_log is $check_sec_log for   $usr $user_shell \n"} #Package variable declared or used
    }
    if ($check_sec_log )
    {
        $seclogin_active_per_user = 1;
           if (($DEBUG) && ($opt{l})) { print "\nPassed. /bin/logsh in use for secondary logging. Method L1.   $usr $user_shell \n"}#Package variable declared or used
        return $seclogin_active_per_user;
    } else {
 # Diagnostic module to gather all per-userid setup logging info in one place
           if (($DEBUG) && ($opt{l})) { #Package variable declared or used
           print "\n\n>> >> Diagnostic Info for per-userid methods of setting up logging residing in $usr $user_home $user_shell  profile, bash_profile and/or secondary_logging_IBM.sh";print "\n"  ;

           print "End of diagnostic info for per-userid methods of setting up logging";print "\n\n\n"  ;
           print "End of diagnostic info for for per-userid methods of setting up logging $usr  shell: $user_shell ";print "\n\n\n\n"  ;
           }
           if (($DEBUG) && ($opt{l})) { print "\nFailed. /bin/logsh Method check_sec_log is $check_sec_log. Method L1.  $usr $user_shell FAILED_ALL_CHECKS time to return \n"} #Package variable declared or used
        return $seclogin_active_per_user;
    } 
}
#2515 - Issue deviation for any IBM ID found as the target id in "su - ",
#       that does not have signs of secondary logging
sub check_su_ibmid_with_hyphen_extended
{   
    my ($array_ref_copy) = @_; ###require argument unpacking #Reused variable name in lexical scope        #Get reference of sudoers array and continue using it
    if ($DEBUG)
    {
        print "\nin check_su_ibmid_with_hyphen_extended\n";
    }

    my $line;
    my $line1;
    my @matched_user_id;
    my @all_matches;
    my @sudoers_matches;
    my $header;
    my $rest;
    my @ibm_id;
    my $user_string;
    my $hist_log      = "";
    my $check_sec_log = "";
    my $user_id;
    #my $cnt; #is declared but not used
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    my @sudoers_matches_temp;
    my @temp;
    my $alias;
    my $match;
    my $line_count=1;
    my @lineidToLine = ();
    my $id_type = "";    # Added variable to carry ID ownership into message.
    my $entry_type ="";   # Added variable to carry entry type (IBM vs cust) into message.
    my $ibm_entry = 0; 
    my $verify_user;
    my $user_home;
    my $user_shell;
    my $usr;
    
    if($seclogin_active_all_users == 2)
    {
        IssueError("", "", "/var/log/hist", "Secondary logging directory does not exist. Hence secondary logging cannot be checked", "", "", 'SFIT2515'); #Sub called with "&"
        return;
    }

    if($seclogin_active_all_users == 3)
    {
        IssueError("", "", "/var/log/hist", "Secondary logging directory does not have required permission 0x1777. Hence secondary logging can not be checked", "", "", 'SFIT2515'); #Sub called with "&"
        return;
    }

    @sudoers_matches = grep({ /(\/su\s-\s\S+$)|(\/su\s-\s\S+\,)/x } @sudoers_file_copy); #Regular expression without "/x"#require block grep  
    @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_matches); #Regular expression without "/x"#require block grep  

    # 16Mar This test is much too crude to use for checking universal logging. Commenting out
    $hist_log = "";

    @ibm_id = keys %IBMIDLIST;
    ##########################
    @sudoers_matches_temp = ();
    foreach my $original_line (@sudoers_matches)
    {
        $lineidToLine[$line_count]=$original_line;
        $line = $original_line;
        $line =~ s/(![^,]*)|.*=//xg; #Regular expression without "/x"
        $line =~ s/,+/,/xg; #Regular expression without "/x"
        $line =~ s/^\s*,|,\s*$|^\s*//xg; #Regular expression without "/x"
        foreach (split(/,/x, $line)) #Regular expression without "/x"
        {
            #push(@sudoers_matches_temp, $_ . "|" . $original_line);
            if ($_ =~ /\/su(\s*|$)/x) { push(@sudoers_matches_temp, $_ . "|" . $line_count); } #Regular expression without "/x"
        }
        $line_count+=1;
    }
    @sudoers_matches = @sudoers_matches_temp;
    ##########################
    foreach my $line (@sudoers_matches)
    {       
        #Defect 4376
        $user_id = "";
        if (($line =~ m/(.*)su\s+-\s+(.*)\s*\|/x)) #Regular expression without "/x"
        {
            $user_id = $2;
        }
        $user_id =~ s/\*/.\*/xg; #Regular expression without "/x"
        $user_id =~ s/\?/.\?/xg; #Regular expression without "/x"
        $user_id = trim($user_id); #Sub called with "&"
        @matched_user_id = grep({ /^\s*$user_id\s*$/x } keys %users);#require block grep  #Regular expression without "/x"
        foreach (@matched_user_id)
        {
            $match=$_;          
            if ($match =~ /\//x)     ### changes for defect 78505    #Regular expression without "/x"           
            {
                $match =~ s/\///x; #Regular expression without "/x"
              
            }
            my $seclogin_active_per_user = 0;
            #We don't know the userids shell at this point, so we can't accept seclogin_active_all_users=1 as setting up logging. Might be csh userid.
            #if ($seclogin_active_all_users == 0 and $match ne "") { $seclogin_active_per_user = CheckPerUser_SecLogin($match); }
            if ($match ne "") { $seclogin_active_per_user = CheckPerUser_SecLogin($match); } #if the id exists check its logging. #Sub called with "&"
            if ($DEBUG) { print " \nReturned from  CheckPerUser_SecLogin for $match ( $user_id )  result is $seclogin_active_per_user \n Line was: $line"; }
            if (($DEBUG) && ($opt{l})) { #Package variable declared or used
            if((defined $user_home) && (defined $user_shell))
            {
               print "\n\n>> >> Diagnostic Info at return ($seclogin_active_per_user ) for $match logging residing in $usr $user_home $user_shell";print "\n"  ;
            
            }
                    if (grep({ /^\s*\Q$match\E\s*$/x } @ibm_id)) { print "   Target id $match is an IBM ID \n" } else { print "$match is not an IBM ID \n" }#require block grep   #Regular expression without "/x"
               print "   check for seclogin_active_per_use result = ( $seclogin_active_per_user ) \n"  ;
               print "   check for seclogin_all_users setup = ( $seclogin_active_all_users )  \n"  ;
               if((defined $match) && ( defined $USER_SHELL{$match} ) ){print "   check for  USER_SHELL{$match} = ( $USER_SHELL{$match} )  \n"  ;}
                  }
                # 23 July. Ver 7n because the ownership of the target id does not matter and the all_users is tested in the per_user, we have only 1 test left.             
            if ( $seclogin_active_per_user == 0 ) # 23 July. Ver 7n Only 1 test is needed.
            {
                $alias = (split(/\|/x, $line))[0]; #Regular expression without "/x"
                $line1 = (split(/\|/x, $line))[1]; #Regular expression without "/x"
                $line1=$lineidToLine[$line1];
                ($header, $rest) = split(/=/x, $line1, 2); #pankaj  #Regular expression without "/x"              
                # Determine the right words for the message. Then insert the strings into the description field.
                if (grep({ /^\s*\Q$match\E\s*$/x } @ibm_id)) { $id_type = "IBM shared" } else {$id_type = "Customer shared" };#require block grep  #Regular expression without "/x"   
                ###Changes for Defect 167339
                #if (  $NO_DOWNGRADE == 1 ) {  $id_type = "shared" };

                if (($DEBUG) && ($opt{l}) && (defined $header) && (defined $SEVERITY_LIST{$header})&& (defined $match)&& (defined $id_type)&& (defined $NO_DOWNGRADE) ) { print "Entry $header entry_gets_deviation=($SEVERITY_LIST{$header}) target_userid: $match type: ($id_type) no_downgrade_flag:($NO_DOWNGRADE) \n"}; #Package variable declared or used
                # if this is an IBM entry (not IBM owned shared id) or we are warning on all entries... issue message
                #$ibm_entry = &check_ibm_entry_no_SU("$header",\@sudoers_file);
                #if (($NO_DOWNGRADE == 1) || ($ibm_entry == 0)) {  $entry_type = "" } else { $entry_type = "IBM"} ;
                my ($filename, $line_number, $master_text) = get_line_location_text($line1); #Sub called with "&"
                    ######################
                @temp=split(/\s*,\s*/x,$header); #Regular expression without "/x"
                $user_string="";
                foreach my $usr_val (@temp)
                {                       
                    if($User_Alias_hash{$usr_val})#expand user alias
                    {
                        $user_string=$user_string.$User_Alias_hash{$usr_val}.",";                           
                    }
                    else
                    {
                        $user_string=$user_string.$usr_val.",";                         
                    }
                }
                $user_string =~ s/,$//xg; #Regular expression without "/x"
                @temp=();
                $ibm_entry=0;
                foreach my $usr_val (split(/\s*,\s*/x,$user_string)) #Regular expression without "/x"
                {
                    $verify_user=$usr_val;
                    $verify_user =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
                    $verify_user=(split(/\s+/x,$verify_user))[0]; #Regular expression without "/x"
                    if($verify_user =~ /%/x) #Regular expression without "/x"
                    {
                        $verify_user =~ s/%_PLUS_//xg; #Regular expression without "/x"
                        $verify_user =~ s/%//xg; #Regular expression without "/x"
                        if($#temp < 0)
                        {
                            @temp = grep({ /^\s*$verify_user\s*$/x } keys %groups);#require block grep   #Regular expression without "/x" 
                        }
                        #last;
                    }
                    else
                    {
                        if($#temp < 0)
                        {
                            @temp = grep({ /^\s*$verify_user\s*$/x } keys %users);#require block grep    #Regular expression without "/x" 
                        }
                        #last;
                    }
                    if($ibm_entry != 1)
                    {
                        $ibm_entry = check_ibm_entry_no_SU("$usr_val",\@sudoers_file_copy); #Sub called with "&"
                    }
                    if(((defined $ibm_entry) && ($ibm_entry == 1)) and $#temp >= 0){last;}
                }
                
                if (($NO_DOWNGRADE=~ /^\d+$/x && $NO_DOWNGRADE == 1) || ((defined $ibm_entry) && ($ibm_entry=~ /^\d+$/x && $ibm_entry == 0))) {  $entry_type = "" } else { $entry_type = "IBM"} ; #Regular expression without "/x"
                ###Changes for Defect 167339
                if (($NO_DOWNGRADE=~ /^\d+$/x && $NO_DOWNGRADE == 1) && (defined $opt{c})) #Package variable declared or used #Regular expression without "/x"
                {
                     $entry_type = "IBM";
                     $id_type = "IBM shared";                                 
                }   
                if($#temp < 0)
                { 
                    @temp = grep({ /^User_Alias\s+$verify_user\s*=/x } @User_Alias);#require block grep  
                }
                ######################
                if ($#temp >= 0 and ($entry_type =~ /^IBM$/x or $id_type =~ /^IBM\sshared$/x)) #Regular expression without "/x"
                {
                  if ($match !~ /^root/x) #Regular expression without "/x"
                  {
                    if($entry_type eq "" and $id_type eq "Customer shared")
                    {
                        IssueNote($header, $line_number, "$match", "$entry_type entry accesses $id_type ID without required secondary logging", $master_text, $filename, 'SFIT2515');     #Sub called with "&"            
                    }
                    else
                    {
                        IssueViolation($header, $line_number, "$match", "$entry_type entry accesses $id_type ID without required secondary logging", $master_text, $filename, 'SFIT2515');  #Sub called with "&"              
                    }
                  }
                  else
                  {
                      if($entry_type eq "" and $id_type eq "Customer shared")
                      {
                        IssueNote($header, $line_number, "$match", "$entry_type entry accesses $id_type ID without required secondary logging", $master_text, $filename, 'SFIT2515'); #Sub called with "&"
                      }
                      else
                      {
                        IssueViolation($header, $line_number, "$match", "$entry_type entry accesses $id_type ID without required secondary logging", $master_text, $filename, 'SFIT2515'); #Sub called with "&"
                      }
                  }
                }
                else
                {
                  if($#temp >= 0)
                  {
                    IssueNote($header, $line_number, "$match", "$entry_type entry accesses $id_type ID without required secondary logging", $master_text, $filename, 'SFIT2515');  #Sub called with "&"               
                  }
                   #23July Ver 7n Added verbosity.
                  if (($DEBUG) && ($opt{l})) { print "Userid $match logging checks failed, not an IBM entry, so no msg issued for id_type: $id_type ,entry_type: $entry_type ,no_downgrade_flag: $NO_DOWNGRADE. \n"}; #Package variable declared or used
                }
            }
            else 
            {
                # 22July Ver 7n Added verbosity.
                if (($DEBUG) && ($opt{l})) { print "Passed. Userid $match logging checks passed. \n"}; #Package variable declared or used
            }
        }
    }
    
    # Defect 329068. Now if Global Secondary Logging is Not enabled then SFIT2525 warnings needs to be displayed against /bin/su and /bin/su -
    # my @temp_alias_array=();
    # my @temp_sudoers_file_expanded=&ExpandAlias(\@sudoers_file_without_useralias_expansion,\@temp_alias_array);

    # @temp_sudoers=grep(!/Cmnd_Alias/,@temp_sudoers_file_expanded);
    # foreach my $line (@temp_sudoers)
    # {
        # my ($lineheader, $linerest) = split(/=/, $line);          
        # my @rest = split(/\,/, $linerest);        
        
        # foreach my $matched_su(@su_matches)               
        # {         
            # my ($filename, $line_number, $master_text) = get_line_location_text($line);           #Sub called with "&"
            # if ( $seclogin_active_all_users != 1 )
            # {
                # IssueViolation($lineheader, $line_number, "$matched_su", "contains 'su' without target and without required secondary logging", $master_text, $filename, 'SFIT2515');   #Sub called with "&"               
            # }         
        # }
    # }
    return; #require final return
    
}
##@@## ##@@## END OF INSERTED CODE FOR LOGGING UPDATES


#10933 - for su with hyphen command, ensures owner of the target userid must
#ensure secondary logging is active on the target userid

sub check_su_ibmid_with_hyphen_default
{
    my ($array_ref_copy) = @_; ## #require argument unpacking           #Get reference of sudoers array and continue using it #Reused variable name in lexical scope
    if ($DEBUG)
    {
        print "\nin check_su_ibmid_with_hyphen_default\n";
    }

    my $line;
    my $line1;
    my @matched_user_id;
    my @all_matches;
    my @sudoers_matches;
    my $header;
    my $rest;
    my @sudoers_file_copy = @{$array_ref_copy};#Reused variable name in lexical scope #Double-sigil dereference
    my @sudoers_matches_temp;
    my $alias;
    my $filename;
    my $line_number;
    my $master_text;
    my $line_count=1;
    my @lineidToLine = ();

    @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_copy); #Regular expression without "/x" #require block grep    
    

    ##########################
    @sudoers_matches_temp = ();
    foreach my $original_line (@sudoers_matches)
    {
        $lineidToLine[$line_count]=$original_line;
        $line = $original_line;
        $line =~ s/(![^,]*)|.*=//xg; #Regular expression without "/x"
        $line =~ s/,+/,/xg; #Regular expression without "/x"
        $line =~ s/^\s*,|,\s*$|^\s*//xg; #Regular expression without "/x"
        if ($DEBUG)
        {
            print "Matched Line = $original_line\n";
            print "Matched Processed Line = $line\n";
        }       
        foreach (split(/,/x, $line)) #Regular expression without "/x"
        {
            if ($_ =~ /\/su(\s*|$)/x) { push(@sudoers_matches_temp, $_ . "|" . $line_count); } #Regular expression without "/x"
        }
        $line_count+=1;
    }
    @sudoers_matches = @sudoers_matches_temp;
    
    ##########################
    @sudoers_matches = grep({ /(.*)\/su(\s*|\s+-\s+(\S*)\s*|\s+-)\|/x } @sudoers_matches);  #Regular expression without "/x"# covers /bin/su and /bin/su - as well # Defect 329068#require block grep 
    
    foreach (@sudoers_matches)
    {
        $line  = $_;
        $alias = (split(/\|/x, $line))[0]; #Regular expression without "/x"
        $line1 = (split(/\|/x, $line))[1]; #Regular expression without "/x"
        $line1=$lineidToLine[$line1];
        ($header, $rest) = split(/=/x, $line1, 2); #pankaj #Regular expression without "/x"
        ($filename, $line_number, $master_text) = get_line_location_text($line1); #Sub called with "&"
        IssueViolation($header, $line_number, $alias,
                        "use of /su - the owner of the target userid must ensure secondary logging is active on the target userid",
                        $master_text, $filename, 'SFIT10933'); #Sub called with "&"
    }
    return; #require final return
}

#SFIT60259 - IBM_NONE_SA:Add logic for SA team entry inspection 
#entries with IBM_NONE_SA should be assumed to be SA entries

sub check_IBM_NONE_SA
{
    my ($array_ref_copy) = @_;  ###require argument unpacking #Reused variable name in lexical scope        #Get reference of sudoers array and continue using it
    if ($DEBUG)
    {
        print "\nin check_IBM_NONE_SA\n";
    }
    my $line;
    #my $line1; #Reused variable name in lexical scope
    my @sudoers_matches;
    my $header;
    my $rest;
    my @sudoers_file_copy = @{$array_ref_copy};#Reused variable name in lexical scope #Double-sigil dereference
    my @sudoers_matches_count;
    my $filename;
    my $line_number;
    my $master_text;
  
    @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_copy);#require block grep #Regular expression without "/x"    
    @sudoers_matches = grep({ /IBM_NONE_SA/x } @sudoers_matches);#require block grep  #Regular expression without "/x"
    @sudoers_matches_count = grep({ /Cmnd_Alias\s+IBM_NONE_SA/x } @sudoers_file_copy);#require block grep     #Regular expression without "/x"
    if($#sudoers_matches_count > 0)
    {
        IssueError($header, $line_number, "IBM_NONE_SA","Multiple Sysadmin entries found",
        $master_text, $filename, 'SFIT60259'); #Sub called with "&"
    }
    foreach (@sudoers_matches)
    {
        $line = $_;
        ($header, $rest) = split(/=/x, $line, 2); #pankaj #Regular expression without "/x"
        ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
        if($line  =~ /IBM_NONE_SA/x) #Regular expression without "/x"
        {
            IssueViolation($header, $line_number, "IBM_NONE_SA","Entry contains IBM_NONE_SA. Confirm this is an IBM SA team entry",
            $master_text, $filename, 'SFIT60259'); #Sub called with "&"
            if($line !~ /!\s*IBM_SHELLS_ALL/x and $line !~ /!\s*IBM_NONE_EDITOR/x) #Regular expression without "/x"
            {
                IssueViolation($header, $line_number, "IBM_NONE_SA","Entry does not contain both !IBM_SHELLS_ALL and !IBM_NONE_EDITOR",
                $master_text, $filename, 'SFIT60259'); #Sub called with "&"
            }
        }
        my $line1 = $line;
        my $found=0;
        if($line1  =~ /NOEXEC\s*:\s*IBM_SHELLESCAPE_ALL/x) #Regular expression without "/x"
        {
            if($line1  =~ /NOEXEC\s*:\s*IBM_SHELLESCAPE_ALL.*!\s*IBM_NONE_EDITOR.*/x) #Regular expression without "/x"
            {
                $found=1;
                $line1 =~ s/NOEXEC\s*:\s*IBM_SHELLESCAPE_ALL.*!\s*IBM_NONE_EDITOR//xg; #Regular expression without "/x"
            }
            if($found == 0 or ($found == 1 and $line1  =~ /NOEXEC\s*:\s*IBM_SHELLESCAPE_ALL/x and $line1 !~ /NOEXEC\s*:\s*IBM_SHELLESCAPE_ALL.*!\s*IBM_NONE_EDITOR.*/x)) #Regular expression without "/x"
            {
                IssueViolation($header, $line_number, "IBM_NONE_SA","The entry must end with !IBM_NONE_EDITOR ",
                $master_text, $filename, 'SFIT60259'); #Sub called with "&"
            }
        }
    }
    return; #require final return
}

#SFIT60269 - Suppress checks for IBM_MAN entries
#For entries with
#= IBM_MANIAM_    these are userid teams who get special privs....

#Suppress messages related to
#"contains disallowed command"
#/chgroup
#/chuser
#/mkuser
#/smit*

#and they can have these without scoping---
#chmod
#chgroup
#chown
########################

sub check_IBM_MANIAM_entries
{
    my ($array_ref_copy) = @_; #Reused variable name in lexical scope ###require argument unpacking          #Get reference of sudoers array and continue using it
    
    if ($DEBUG)
    {
        print "\nin check_IBM_MANIAM_entries\n";
    }

    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    #my $filename; #Reused variable name in lexical scope
    #my $line_number;#Reused variable name in lexical scope
    #my $master_text;#Reused variable name in lexical scope
    my @sudoers_matches;
    my @suppress_message=("/chgroup","/chuser","/mkuser","/smit","/smitty");
    my @allow_without_scoping=("/chmod","/chown");
    @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_copy); #Regular expression without "/x"#require block grep    

    # look for each command from the internal lists @suppress_message,@allow_without_scoping in the alias
    my $found = 0;
    foreach my $line (@sudoers_matches) #perlcritic
    {
        foreach my $command (@suppress_message)
        {
            if($line =~ /[,\s=]+[\w\/]+$command([^\w]+|$)/x) #Regular expression without "/x"
            {
                my ($header, $rest) = split(/=/x, $line, 2); #pankaj #Regular expression without "/x"
                my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                IssueViolation($header, $line_number, "$command", "contains disallowed command",
                $master_text, $filename, "SFIT60269"); #Sub called with "&"
            }
        }
        
        foreach my $command (@allow_without_scoping)
        {
            if($line =~ /[,\s=]+[\w\/]+$command\s*(,|$)/x) #Regular expression without "/x"
            {
                my ($header, $rest) = split(/=/x, $line, 2); #pankaj #Regular expression without "/x"
                my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                IssueViolation($header, $line_number, "$command", "contains disallowed command",
                $master_text, $filename, "SFIT60269"); #Sub called with "&"
            }
        }
    }
    return; #require final return
}

#2516 - for su without hiphen command, checks for accesses to IBM ID, without required secondary logging
sub check_su_without_hyphen_extended
{
    my ($array_ref_copy) = @_; ###require argument unpacking #Reused variable name in lexical scope           #Get reference of sudoers array and continue using it
    if ($DEBUG)
    {
        print "\nin check_su_without_hyphen_extended\n";
    }
    my $line;
    my @sudoers_matches;
    my @sudoers_matches_temp;
    my @matched_user_id;
    my $header;
    my $rest;
    my @ibm_id;
    my $hist_log = "";
    my $user_id;
    my $sudoers_line;
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    my $filename;
    my $line_number;
    my $master_text;
    my $match;
    @sudoers_matches = grep({ /(\/su\s*($|\,))|(\/su\s+([^\-])+$)|(\/su\s+([^\-])+(\,)?)/x } @sudoers_file_copy);#require block grep  #Regular expression without "/x"   #ProhibitComplexRegexes
    @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_matches);#require block grep   #Regular expression without "/x"
    $hist_log="";
    @ibm_id          = keys %IBMIDLIST;
    my $line_count=1;
    my @lineidToLine = ();

    if ($DEBUG)
    {
        print "\nIBM ID List:\n@ibm_id\n";
    }
    ######################## Defect 4372
    @sudoers_matches_temp = ();
    foreach my $original_line (@sudoers_matches)
    {
        if ($original_line =~ /\/su\s\[/x)    #Regular expression without "/x" #HACK db 22 Dec for Gates #Regular expression without "/x"
        {
            $original_line =~ s/su\s\[..\]/su /xg; #Regular expression without "/x"
        }
        $lineidToLine[$line_count]=$original_line;
        $line = $original_line;
        $line =~ s/(![^,]*)|.*=//xg; #Regular expression without "/x"
        $line =~ s/,+/,/xg; #Regular expression without "/x"
        $line =~ s/^\s*,|,\s*$|^\s*//xg; #Regular expression without "/x"
        foreach (split(/,/x, $line)) #Regular expression without "/x"
        {
            #defect 5718
            if ($_ =~ /\/su(\s*|$)/x && !($_ =~ /\/su\s+\-/x)) { push(@sudoers_matches_temp, $_ . "|" . $line_count); } #prohibit mixed boolean operators #Regular expression without "/x"
        }
        $line_count+=1;
    }
    @sudoers_matches = @sudoers_matches_temp;

    ############################ Defect 4372
    foreach my $original_line (@sudoers_matches)
    {
        ($line, $sudoers_line) = split(/\|/x, $original_line); #Regular expression without "/x"
        $sudoers_line=$lineidToLine[$sudoers_line];
        ($filename, $line_number, $master_text) = get_line_location_text($sudoers_line); #Sub called with "&"

        # Defect 4372
        $user_id = "";
        if (($line =~ m/(.*)su\s+(\S*)\s*$/x)) #Regular expression without "/x"
        {
            $user_id = $2;
            $user_id =~ s/\*/.\*/xg; #Regular expression without "/x"
            $user_id =~ s/\?/.\?/xg; #Regular expression without "/x"
            @matched_user_id = grep({ /^\s*$user_id\s*$/x } keys %users);#require block grep  #Regular expression without "/x"
            foreach (@matched_user_id)
            {
                $match                    = $_;
                my $seclogin_active_per_user = 0;
                #16 Mar $seclogin_active_all_users = 1 only covers ksh and bash users so we need to call  CheckPerUser_SecLogin anyways
                if ($match ne "")
                {
                    $seclogin_active_per_user = CheckPerUser_SecLogin($match); #Sub called with "&"
                }
                #16 Mar $seclogin_active_all_users = 1 only covers ksh and bash users so we need to use result from  CheckPerUser_SecLogin 
                if ((grep({ /^\s*\Q$match\E\s*$/x } @ibm_id)) && ($seclogin_active_per_user == 1))    #Regular expression without "/x" #defect 5718#require block grep    
                {
                    IssueSuccess("", "","$match", "$match is IBM ID and secondary logging is enabled", "", "", 'SFIT2516');    #Defect 52371     #Sub called with "&"
                }
                elsif ((grep({ /^\s*\Q$match\E\s*$/x } @ibm_id)) && !$hist_log && $seclogin_active_per_user == 0 && ($seclogin_active_all_users == 0 || $USER_SHELL{$match} =~ /csh/))  #Regular expression without "/x" #prohibit mixed boolean operators#require block grep 
                {
                    ($header, $rest) = split(/=/x, $sudoers_line, 2);  #pankaj #Defect 4460. #Regular expression without "/x"
                    IssueViolation($header, $line_number, "/$match", "accesses IBM ID without required secondary logging",
                                    $master_text, $filename, 'SFIT2516'); #Sub called with "&"
                }
            }
        }
    }
    return; #require final return
}


#2523 - for su without hiphen command, checks contains "su" command without hyphen
sub check_su_without_hyphen_default
{
     my ($array_ref1)=@_; ##require argument unpacking
     if ($DEBUG)
     {
        print "\nin check_su_without_hyphen_default\n";
    }
    my $line;
    my @sudoers_matches;
    my @sudoers_matches_temp;
    my $header;
    my $rest;
    my $sudoers_line;
    my @temp_sudoers_file_expanded = @{$array_ref1}; #Double-sigil dereference

    my $filename;
    my $line_number;
    my $master_text;
    my $line_count=1;
    my @lineidToLine = ();
    my @temp_sudoers = ();
    @temp_sudoers_file_expanded = grep ({ defined() and length() } @temp_sudoers_file_expanded);
    ######################## Defect 4372
    @temp_sudoers=grep({ !/Cmnd_Alias/x } @temp_sudoers_file_expanded);#require block grep    #Regular expression without "/x"
     
    @sudoers_matches_temp = ();
    foreach my $original_line (@temp_sudoers)
    {
        $lineidToLine[$line_count]=$original_line;
        $line = $original_line;
        if(defined $line)
        {
            $line =~ s/(![^,]*)|.*=//xg; #Regular expression without "/x"
            $line =~ s/,+/,/xg; #Regular expression without "/x"
            $line =~ s/^\s*,|,\s*$|^\s*//xg; #Regular expression without "/x"
            foreach (split(/,/x, $line)) #Regular expression without "/x"
            {
                #defect 5718
                if ($_ =~ /\/su\s+(\S+)(\s*|$)/x && !($_ =~ /\/su\s+\-/x) && !($_ =~ /\/su\s+\[\s*\-\s*\]/x)) { push(@sudoers_matches_temp, $_ . "|" . $line_count); }  #Regular expression without "/x"#prohibit mixed boolean operators
            }
            $line_count+=1;
        }
    }
    @temp_sudoers = @sudoers_matches_temp;
    ############################ Defect 4372

    foreach my $original_line (@temp_sudoers)
    {
        ($line, $sudoers_line) = split(/\|/x, $original_line); #Regular expression without "/x"
        $sudoers_line=$lineidToLine[$sudoers_line];
        ($filename, $line_number, $master_text) = get_line_location_text($sudoers_line); #Sub called with "&"
        ($header, $rest) = split(/=/x, $sudoers_line, 2); #pankaj  #Regular expression without "/x"
        IssueViolation($header, $line_number, "'su'", "contains \"su\" without hyphen", $master_text, $filename, 'SFIT2523'); #Sub called with "&"
    }
    return; #require final return
}

sub check_su_without_target
{
    my ($array_ref1)=@_; ###require argument unpacking 
     if ($DEBUG)
    {
        print "\nin check_su_without_target\n";
    }
    my @rest;                   #strict_use
    my @matches;                #strict_use
    my @temp_sudoers_file_expanded = @{$array_ref1}; #Double-sigil dereference
    @temp_sudoers_file_expanded = grep ({ defined() and length() } @temp_sudoers_file_expanded);
    my $root_sec_login = CheckPerUser_SecLogin("root");
    # Changes as per 587016
    
    if ($DEBUG)
    {
        print "seclogin_active_all_users=$seclogin_active_all_users\n";
        print "root_sec_login=$root_sec_login\n";
    }   
    
    if ( $seclogin_active_all_users != 1 )          
    {   
        my @temp_sudoers=grep({ !/Cmnd_Alias/x }@temp_sudoers_file_expanded); #Regular expression without "/x"#require block grep 
        foreach my $command (@temp_sudoers)
        {   
            my ($header, $rest) = split(/=/x, $command);   #Regular expression without "/x"
            my ($alias,$aliasname)=split(/\s/x,$header); #Regular expression without "/x"
            if(defined $rest)
            {
                @rest = split(/\,/x, $rest);  #Regular expression without "/x"
            }
            #@matches=(grep({ /^[^\!]*(\/su|-)(\su\-)?\s*$/x } @rest));#require block grep    #Regular expression without "/x" 
            # Changes as per defect 414172
            @matches=(grep({ /^(\/usr){0,1}\/bin\/su(\s+\-|\s+\-\s+root){0,1}\s*$/x } @rest));#require block grep    #Regular expression without "/x" 
            # Changes as per 587016
            if (@matches)
            {
                foreach my $line1(@matches) #perlcritic
                {
                    if ( $line1 =~ /(\/usr){0,1}\/bin\/su\s+\-(\s+root){0,1}\s*$/x and $root_sec_login == 1 ) # /bin/su - or /bin/su - root & root's sec logging set 
                    {
                          if($DEBUG)
                          {
                              print "Violation not to be reproted for $line1 since root sec logging is set\n";
                          }
                    }
                    else
                    {
                      my ($filename, $line_number, $master_text) = get_line_location_text($command);             
                      IssueNote($header, $line_number, "$line1", "contains 'su' without target without global secondary logging", $master_text, $filename, 'SFIT2518'); #Sub called with "&"
                    }
                }
            }
        }   
    }
    return; #require final return
}
#SFIT2509

sub check_aliases_without_noexec
{
    my ($array_ref_copy) = @_;   ###require argument unpacking#Reused variable name in lexical scope           #Get reference of sudoers array and continue using it

    if ($DEBUG)
    {
        print "\nin check_aliases_without_noexec\n";
    }

    my $alias = "IBM_SHELLESCAPE_ALL";
    my @all_matches;
    my $match;
    my $found;
    my @sudoers_matches;
    my $header;
    my $rest;
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference

    if ($DEBUG)
    {
        print "The alias value is = $alias\n";
    }

    # remove aliases and defaults lines first
    @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_copy);#require block grep     #Regular expression without "/x"

    # find the lines with the alias and no negation character "!" in front
    @sudoers_matches = grep({ /=[^\!]*\Q$alias/x } @sudoers_matches); #require block grep     #Regular expression without "/x"

    # Filter further, find lines with alias which are not having "NOEXEC" in front
    @sudoers_matches = grep({ !/=.*(?:\!|NOEXEC\s*\:)\s*(?:$alias)/x } @sudoers_matches);#require block grep ProhibitUnusedCapture #Regular expression without "/x"

    if ($DEBUG)
    {
        print "SFIT2509 line matches = @sudoers_matches\n";
    }

    foreach my $line (@sudoers_matches)
    {   
        if (!grep({ /\Q$line/x } @all_matches))#require block grep  #Regular expression without "/x"   
        {
            push(@all_matches, $line);
        }
    }

    foreach my $line (@all_matches)
    {
        ($header, $rest) = split(/=/x, $line, 2); #pankaj  #Regular expression without "/x"

        my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
        IssueViolation($header, $line_number, "$alias", "contains alias requiring negation or NOEXEC", $master_text, $filename, 'SFIT2509'); #Sub called with "&"
    }
    return; #require final return
}

#SFIT2508
sub check_aliases_without_negation
{
    my ($array_ref_copy) = @_; ## #require argument unpacking #Reused variable name in lexical scope            #Get reference of sudoers array and continue using it

    if ($DEBUG)
    {
        print "\nin check_aliases_without_negation\n";
    }

    my @all_matches;
    my $match;
    my $found;
    my @sudoers_matches;
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference

    foreach my $alias (@NEGATED_ALIASES)
    {
        # remove aliases and defaults lines first
        @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_copy);#require block grep #Regular expression without "/x"

        # find the lines with the alias and no negation character "!" in front
        @sudoers_matches = grep({ /=[^\!]*\Q$alias/x } @sudoers_matches);#require block grep  #Regular expression without "/x"

        # Fix 2509:Filter further, find lines with alias which are not having "NOEXEC" in front

        if ($DEBUG)
        {
            print "SFIT2508 line matches = @sudoers_matches\n";
        }

        foreach my $line (@sudoers_matches)
        {
            my $line1 = $line . "|" . $alias;
            if (!grep({ /\Q$line1/x } @all_matches))#require block grep   #Regular expression without "/x" 
            {
                push(@all_matches, $line1);
            }
        }
    }

    foreach my $line1 (@all_matches)
    {
        my ($line,   $alias) = split(/\|/x, $line1); #Regular expression without "/x"
        my ($header, $rest)  = split(/=/x,  $line, 2); #pankaj #Regular expression without "/x"

        my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
        IssueViolation($header, $line_number, "$alias", "contains alias requiring negation", $master_text, $filename, 'SFIT2508'); #Sub called with "&"
    }
    return; #require final return
}

#SFIT60264
sub check_aliases_SA_host_user
{
    my ($array_ref_copy) = @_; ## #require argument unpacking#Reused variable name in lexical scope            #Get reference of sudoers array and continue using it
    if ($DEBUG)
    {
        print "\nin check_aliases_SA_host_user\n";
    }

    my @all_matches;
    my $match;
    my $found;
    my @sudoers_matches;
    my @matches1=();
    my @matches2=();
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    my $user_alias="IBM_UNIX_SA";
    my $host_alias="IBM_UNIX_SA_HOSTS";
    # remove aliases and defaults lines first
    @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_copy);#require block grep   #Regular expression without "/x"  
    
    # find the lines with the alias and no negation character "!" in front
    @matches1 = grep({ /^\s*[^\s=]*$user_alias[^\s=]*\s+/x } @sudoers_matches); #Regular expression without "/x"#require block grep   
    @matches2 = grep({ /^\s*[^\s=]+\s+[^\s=]*$host_alias[^\s=]*\s*=/x } @sudoers_matches); #Regular expression without "/x"#require block grep    
    if(!grep({ /^\s*User_Alias\s+$user_alias\s*=/x } @sudoers_file_copy))  #Regular expression without "/x"#require block grep    
    {
        @matches1 = ();
    }
    if(!grep({ /^\s*Host_Alias\s+$host_alias\s*=/x } @sudoers_file_copy))  #Regular expression without "/x"#require block grep    
    {
        @matches2 = ();
    }
    if($#matches1>0)
    {
        my ($header, $rest)  = split(/\s+/x,  $matches1[0], 2); #pankaj #Regular expression without "/x"
        my ($filename, $line_number, $master_text) = get_line_location_text($matches1[0]); #Sub called with "&"
        IssueWarning($header, $line_number, "$user_alias", "SA team required alias appears more than once", $master_text, $filename, 'SFIT60264'); #Sub called with "&"
    }
    if($#matches2>0)
    {
        my ($header, $rest)  = split(/\s+/x,  $matches2[0], 2); #pankaj #Regular expression without "/x"
        my ($filename, $line_number, $master_text) = get_line_location_text($matches2[0]); #Sub called with "&"
        IssueWarning($header, $line_number, "$host_alias", "SA team required alias appears more than once", $master_text, $filename, 'SFIT60264'); #Sub called with "&"
    }
    my %all_lines=map{$_ => "1"} (@matches1,@matches2);#Get unique lines
    foreach my $sudoers_line(keys %all_lines)
    {
        my ($header1, $rest)  = split(/=/x,  $sudoers_line, 2); #Regular expression without "/x"
        $header1 =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
        my($user_field,$host_field)= split(/\s+/x,  $header1, 2); #Regular expression without "/x"
        my ($header, $rest1)  = split(/\s+/x,  $sudoers_line, 2); #Regular expression without "/x"
        $header =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
        if(($host_field !~ /^\s*$host_alias\s*$/x and $host_field !~ /,$host_alias,/x and $host_field !~ /^\s*$host_alias,/x and $host_field !~ /,$host_alias\s*$/x) and ($user_field =~ /^\s*$user_alias\s*$/x or $user_field =~ /,$user_alias,/x or $user_field =~ /^\s*$user_alias,/x or $user_field =~ /,$user_alias\s*$/x))  #Regular expression without "/x"#Regular expression without "/x"
        {
            my ($filename, $line_number, $master_text) = get_line_location_text($sudoers_line); #Sub called with "&"
            IssueAttention($header, $line_number, "$host_alias", "Missing IBM SA team host alias", $master_text, $filename, 'SFIT60264'); #Sub called with "&"
        }
        if(($user_field !~ /^\s*$user_alias\s*$/x and $user_field !~ /,$user_alias,/x and $user_field !~ /^\s*$user_alias,/x and $user_field !~ /x,$user_alias\s*$/x) and ($host_field =~ /^\s*$host_alias\s*$/x or $host_field =~ /,$host_alias,/x or $host_field =~ /^\s*$host_alias,/x or $host_field =~ /,$host_alias\s*$/x)) #Regular expression without "/x"
        {
            my ($filename, $line_number, $master_text) = get_line_location_text($sudoers_line); #Sub called with "&"
            IssueAttention($header, $line_number, "$user_alias", "Missing IBM SA team user alias", $master_text, $filename, 'SFIT60264'); #Sub called with "&"
        }
    }
    return; #require final return
}
#SFIT 2520
sub check_chown_chgrp_chmod_without_scoping
{
    my ($array_ref_copy) = @_; ###require argument unpacking #Reused variable name in lexical scope            #Get reference of sudoers array and continue using it
    if ($DEBUG)
    {
        print "\nin check_chown_chgrp_chmod_without_scoping SFIT2520\n";
    }

    my $alias;
    my @all_matches;
    my $match;
    my $found;
    my $header;
    my $rest;
    my @sudoers_file_copy = @{$array_ref_copy};#Reused variable name in lexical scope #Double-sigil dereference

    my %check_unscoped = ("chown", "user", "chgrp", "group", "chmod", "mode");
    @sudoers_file_copy = grep ({ defined() and length() } @sudoers_file_copy);
    foreach my $cmd (keys %check_unscoped)
    {
        my $scope = $check_unscoped{$cmd};

        # remove aliases and defaults lines first
        my @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_copy); #Regular expression without "/x"#require block grep 

        # find the candidate lines -- coarse grained search

        foreach my $line (@sudoers_matches)
        {
            if(defined $line)
            {
                ($header, $rest) = split(/=/x, $line, 2); #Regular expression without "/x"
            }
            my @commands;
            if(defined $rest)
            {
                @commands = split(/\,/x, $rest); #Regular expression without "/x"
            }

            if ($DEBUG)
            {
                print "split = $line\n";
                print "header = $header\n";
                print "rest = $rest\n";
            }

            # selecting all the commands that are not compliant.

            my @matches;
            my $regex='(\s+\S+)|((\s+\S+)?\s+\*(\s+\S+)?)|(\s+[\/[:alnum:]]+\*)|(\s+[^\[\]\=0-7rwxugo]+){2}';
            my $regex_substitute = '(\s+\*(\s+\S+)?)|(\s+[\/[:alnum:]]+\*?)';
            if ($cmd =~ /chmod/)
            {
                @matches = grep({ /^[^\!]*\Q$cmd\E[\s\-R]*($regex)?\s*$/x } @commands); #Regular expression without "/x"#require block grep  #ProhibitComplexRegexes
            
            }
            else
            {
                @matches = grep({ /^[^\!]*\Q$cmd\E(\s*\-\S+)*($regex_substitute)?\s*$/x } @commands);#require block grep   #Regular expression without "/x" #ProhibitComplexRegexes 
            }
            @matches = grep({ /(\*)|($cmd\s*$)|($cmd\s+[\-\\R\s\/\.a-zA-Z]+$)/x } @matches); #Regular expression without "/x"#require block grep  
            foreach my $match (@matches)
            {
                #IssueViolation("SFIT2520;$cmd requires $scope scoping; LINE '$header'\n");
                my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                IssueViolation($header, $line_number, "$cmd", "$cmd requires $scope scoping", $master_text, $filename, 'SFIT2520'); #Sub called with "&"
            }
        }
    }
    return; #require final return
}

#SFIT2524
sub check_deviation_all_and_ibm_none_
{
    my ($array_ref_copy,$data) = @_; ###require argument unpacking  #Reused variable name in lexical scope           #Get reference of sudoers array and continue using it
    my @none_sa_all;
    my $header;
    my $rest;
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    
    @none_sa_all = grep ({ /=ALL/x } @sudoers_file_copy);#require block grep   #Regular expression without "/x"
    
    @none_sa_all = grep({ /=[^\!]*\Q$data/x } @none_sa_all);#require block grep    #Regular expression without "/x"
    if (@none_sa_all)
    {
        foreach (@none_sa_all)
        {
            $header = (split(/=/x, $_, 2))[0]; #pankaj #Regular expression without "/x"
            $rest   = (split(/=/x, $_, 2))[1]; #pankaj #Regular expression without "/x"

            my ($filename, $line_number, $master_text) = get_line_location_text($_); #Sub called with "&"
            IssueViolation($header, $line_number, $data, "contains $data requiring negation", $master_text, $filename, 'SFIT2524'); #Sub called with "&"
        }
    }
    else
    {
        IssueSuccess("", "","ALL", "No active use of =ALL without !IBM_NONE_SA", "", "", 'SFIT2524');    #Defect 52371    #Sub called with "&" 
    }
    return; #require final return
}

#SFIT 2521

sub check_shellescape_aliases
{   my @arr_ref_copy= @_; #Reused variable name in lexical scope
    my $array_ref_copy = Filter_negations_with_runas(\@arr_ref_copy,1); ##require argument unpacking    #Reused variable name in lexical scope #Sub called with "&"
    my @sudoers_file_copy = @{$array_ref_copy};#Reused variable name in lexical scope #Double-sigil dereference
    if ($DEBUG)
    {
        print "In function check_shellescape_aliases \n";
    }
    check_shellescape_aliases_without_noexec(\@sudoers_file_copy); #Sub called with "&"
    check_shellescape_aliases_with_noexec(\@sudoers_file_copy); #Sub called with "&"
    return; #require final return
}

sub check_shellescape_aliases_with_noexec
{
    my ($array_ref_copy) = @_; ###require argument unpacking #Reused variable name in lexical scope             #Get reference of sudoers array and continue using it
    my @sudoers_matches;
    my $header;
    my $rest;
    my $alias;
    my $cmds;
    #my $cmd_list;  #is declared but not used
    my @sudoers_file_copy = @{$array_ref_copy};#Reused variable name in lexical scope #Double-sigil dereference

    my $filename;
    my $line_number;
    my $master_text;

    $parm = 0;

    if ($DEBUG)
    {
        print "In function - check_shellescape_alisas_with_noexec \n";
    }

    #remove all the alias.
    my $regex1 ='IBM_SHELLESCAPE_ALL'; #Reused variable name in lexical scope
    @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|$regex1|Defaults/x } @sudoers_file_copy);  #Regular expression without "/x"#require block grep  #ProhibitComplexRegexes  

    #extract all the lines containing NOEXEC.
    @sudoers_matches = grep({ /NOEXEC/ } @sudoers_matches); #require block grep 

    foreach my $line (@sudoers_matches)
    {
        $line =~ s/,\sEXEC:\s$//xg;      #Regular expression without "/x"   #removing EXEC: from the end of the string.
        $line =~ s/,\sEXEC:/,EXEC:/xg;  #Regular expression without "/x"       #removing extra space before EXEC if any.
        ($header, $rest) = split(/=/x, $line, 2); #Regular expression without "/x"
        $header=~s/\s*$//x; #Regular expression without "/x"
        $header=(split " ",$header)[0];
        $rest=~s/\s*,\s*/,/xg; #Regular expression without "/x"
        $rest=~s/^\s*//x; #Regular expression without "/x"
        $rest=~s/\s*$//x; #Regular expression without "/x"
        $line="$header=$rest";
    }

    foreach my $line (@sudoers_matches)
    {
        my $chars= '[A-Za-z0-9_@%]*';
        my $run_as = '(root)|(ALL)|(root\@ALL)|(ALL\@root)';
        my $tag1 = 'NOEXEC:(.*)';
        my $tag2 = 'EXEC:(.*)';
        my $regex = '(.*)=(.*)';
        # =NOEXEC...........EXEC.......
        if ($line =~ m/(.*)=\($chars\b($run_as)\b$chars\)$tag1,\($chars\b($run_as)\b$chars\)$tag2/x) #Regular expression without "/x" #ProhibitComplexRegexes
        {
            #$parm = 3;
            $parm = 13; #changed
            process_noexec_exec_data($line); #Sub called with "&"

            if ($DEBUG)
            {
                print("NOEXEC at beginning and EXEC in between.\n");
            }
        }
        elsif ($line =~ m/$regex,\($chars\b($run_as)\b$chars\)$tag1,\($chars\b($run_as)\b$chars\)$tag2/x)# =........NOEXEC...........EXEC....... #ProhibitComplexRegexes
        {
            
            $parm = 2;
            process_noexec_exec_data($line); #Sub called with "&"

            #$parm = 4;
            $parm = 14; #changed  #ProhibitComplexRegexes
            process_noexec_exec_data($line); #Sub called with "&"

            if ($DEBUG)
            {
                print("NOEXEC and EXEC in between.\n");
            }

        }
        elsif ($line =~ m/$regex,\($chars\b($run_as)\b$chars\)$tag2,\($chars\b($run_as)\b$chars\)$tag1/x)  # =........EXEC...........NOEXEC....... #Regular expression without "/x" #ProhibitComplexRegexes
        {
            $parm = 2;
            process_noexec_exec_data($line); #Sub called with "&"
            #$parm = 3;
            $parm = 8; #changed
            process_noexec_exec_data($line); #Sub called with "&"
            if ($DEBUG)
            {
                print("EXEC and NOEXEC in between.\n");
            }
        }
        else    #Cascading if-elsif chain   # =...........NOEXEC....................
        {
            if ($line =~ m/$regex,\($chars\b($run_as)\b$chars\)$tag1/x) #Regular expression without "/x" #ProhibitComplexRegexes
            {
                $parm = 2;
                process_noexec_exec_data($line); #Sub called with "&"
                if ($DEBUG)
                {
                    print("Only NOEXEC.\n");
                }
            }
            elsif ($line =~ m/(.*)=\($chars\b($run_as)\b$chars\)$tag1/x)     # =NOEXEC...............................(no processing)#Regular expression without "/x" #ProhibitComplexRegexes
            {
                if ($DEBUG)
                {
                    print("$line\n");
                    print("NOEXEC at beginning - Doing nothing.\n");
                }
            }
        }

    }

    foreach (@all_matches_2521)
    {
        my $line  = (split(/\|/x, $_))[0]; #Regular expression without "/x"
        $alias = (split(/\|/x, $_))[1]; #Regular expression without "/x"
        ($header, $rest) = split(/=/x, $line, 2); #pankaj #Regular expression without "/x"

        ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
        IssueViolation($header, $line_number, "$alias", "Shellescape command $alias used without NOEXEC", $master_text, $filename, 'SFIT2521'); #Sub called with "&"
        #########################
        if (!grep({ /^SFIT77559$/x } @DISABLED_MESSAGES) && ((defined $EXTENDED_CHECK_USER) && ($EXTENDED_CHECK_USER == 1))) #prohibit mixed boolean operators #require block grep #Regular expression without "/x"
        {
            my $CUST_ID_EXISTS = check_cust_id($header,\@sudoers_file_copy); #Sub called with "&"
            if($CUST_ID_EXISTS == 1)
            {
                IssueWarning("$header", $line_number, "Privilege_elevation", "Grants customer cmds with shell escapes giving root privs and violating sudo tech spec. Account team must have customer exception and risk acceptance in place.", $master_text, $filename, 'SFIT77559'); #Sub called with "&"
            }
        }
        #########################

    }
    if ($DEBUG)
    {
        print "In function - check_shellescape_alisas_with_noexec completed\n";
    }
    return; #require final return
}

sub process_noexec_exec_data
{
    my ($line) = @_; ##require argument unpacking ##not working
    my $line1;
    my @cmd_list;                       #strict_use
    SWITCH: { #Cascading if-elsif chain
        if ($parm == 2) #Cascading if-elsif chain
        {
            @cmd_list = split(',', $2);
            last SWITCH;
        }
        if ($parm == 8)
        {
            @cmd_list = split(',', $8); #Cascading if-elsif chain
            last SWITCH;
        }
        if ($parm == 14)
        {
            @cmd_list = split(',', $14); #Cascading if-elsif chain
            last SWITCH;
        }
        if ($parm == 13)
        {
            @cmd_list = split(',', $13); #Cascading if-elsif chain
            last SWITCH;
        }
    }

    foreach my $cmds (@cmd_list)
    {

        $cmds = trim($cmds); #Sub called with "&"
        my $chars= '[A-Za-z0-9_@%]*';
        my $run_as = 'root|ALL|root\@ALL|ALL\@root';
       #next if ($cmds =~ m/^\([A-Za-z0-9_@%]*(root|ALL)[A-Za-z0-9_@%]*\)!(.*)/) ;###prohibit unreachable code
       next if ($cmds =~ m/^\(($chars)*\b($run_as)\b($chars)*\)!(.*)/x) ; #Regular expression without "/x"###prohibit unreachable code #ProhibitComplexRegexes
       
        $cmds=~s/\([A-Za-z0-9_@%]+\)//xg;#Regular expression without "/x"
        $line=~s/\([A-Za-z0-9_@%]+\)//xg;#Regular expression without "/x"
        $line1 = $line . "|" . $cmds;

      if (grep({ /\Q$cmds\E(\s|$|,)/x } @IBM_SHELLESCAPE_ALL)and ($cmds !~ /^\*$/x)) #require block grep  #Regular expression without "/x" 
        {
            if (!grep({ /\Q$line1/x } @all_matches_2521)) #require block grep    #Regular expression without "/x" 
            {
                push(@all_matches_2521, $line1);
            }
        }
    }
    return; #require final return
}

sub check_shellescape_aliases_without_noexec
{
    my ($array_ref_copy) = @_; ## #require argument unpacking #Reused variable name in lexical scope           #Get reference of sudoers array and continue using it
    my $line;
    my @all_matches;
    my @sudoers_matches;
    my $header;
    my $rest;
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference

    if ($DEBUG)
    {
        print "In function - check_shellescape_aliases_without_noexec \n";
    }
    #for(my $i=0;$i<=$#sudoers_file_copy;$i++){
    for(0..$#sudoers_file_copy){
    ($header,$rest)=split(/=/x, $sudoers_file_copy[$_], 2);  #Regular expression without "/x"
    $header=~s/\s*$//x;  #Regular expression without "/x"
    $header=(split " ",$header)[0];
    $rest=~s/\s*,\s*/,/xg; #Regular expression without "/x"
    $rest=~s/^\s*//x; #Regular expression without "/x"
    $rest=~s/\s*$//x; #Regular expression without "/x"
    $sudoers_file_copy[$_]="$header=$rest";
    }
    
    foreach my $alias (@IBM_SHELLESCAPE_ALL)
    {
        @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_copy);  #Regular expression without "/x"#require block grep  
        #extract all the lines, does not containing NOEXEC.
        @sudoers_matches = grep({ !/NOEXEC/ } @sudoers_matches); #require block grep
        my $chars_in_runas = '[A-Za-z0-9_@%]*\b(root|ALL|root\@ALL|ALL\@root)\b[A-Za-z0-9_@%]*';
        my $tags = '[EXEC|PASSWD|NOPASSWD]';
        #@sudoers_matches = grep({ /(\s|,|=)\([A-Za-z0-9_@%]*\b(root|ALL|root\@ALL|ALL\@root)\b[A-Za-z0-9_@%]*\)\Q$alias\E(\s|$|,)/ } @sudoers_matches); #require block grep    
        @sudoers_matches = grep({ /(\s|,|=)\($chars_in_runas\)\s*($tags)*\s*:*\s*\Q$alias\E(\s|$|,)/x } @sudoers_matches); #Regular expression without "/x"#require block grep    #ProhibitComplexRegexes
        foreach (@sudoers_matches)          
        {           
            if($_ !~ /\Q$alias\E/x)#Regular expression without "/x"
            {
                $line = $_ . "|" . $alias;
                
            }
            else
            {
                $line=$_;
            
            }
            if ($DEBUG)
            {
                print "Matched Line =$_\n";
                print "Processed Matched Line = $line\n";
            }
            if (!grep({ /\Q$line\E\s*$/x } @all_matches)) #require block grep  #Regular expression without "/x"   
            {
                if ($DEBUG)
                {
                    print "Processed Matched Line = $line does not found in all_matches array\n";                   
                }
                push(@all_matches, $line);
                $line = (split(/\|/x, $line))[0]; #Regular expression without "/x"
                $line=~s/\([A-Za-z0-9%_@]+\)//xg; #Regular expression without "/x" # _ is added for netgroups which starts with %_PLUS_(non existing netgroups)
                ($header, $rest) = split(/=/x, $line, 2); #pankaj #Regular expression without "/x"
                #($header, $rest) = split(/=/, $line. 2); #pankaj #ProhibitMismatchedOperators

                my ($filename, $line_number, $master_text) = get_line_location_text($line);     #Sub called with "&"
                if (!grep({ /^\s*Defaults\s*!\s*IBM_SHELLESCAPE_ALL\s+noexec/x } @sudoers_file_dot)) #Regular expression without "/x"#require block grep 
                {
                    if ($DEBUG)
                    {
                        print "Not Found default negated shell escape with noexec\n";
                    }
                    IssueViolation($header, $line_number, "$alias", "Shellescape command $alias used without NOEXEC", $master_text, $filename, 'SFIT2521'); #Sub called with "&"
                }           
                
                #########################
                if (!grep({ /^SFIT77559$/x } @DISABLED_MESSAGES) && defined ($EXTENDED_CHECK_USER) && $EXTENDED_CHECK_USER=~ /^\d+$/x && $EXTENDED_CHECK_USER == 1) #Regular expression without "/x"#prohibit mixed boolean operators #require block grep
                {
                    my $CUST_ID_EXISTS = check_cust_id($header,\@sudoers_file_copy); #Sub called with "&"
                    if($CUST_ID_EXISTS == 1)
                    {
                        IssueWarning("$header", $line_number, "Privilege_elevation", "Grants customer cmds with shell escapes giving root privs and violating sudo tech spec. Account team must have customer exception and risk acceptance in place.", $master_text, $filename, 'SFIT77559'); #Sub called with "&"
                    }
                }
                #########################
            }
        }

    }
    if ($DEBUG)
    {
        print "In function - check_shellescape_aliases_without_noexec completed\n";
    }
    return; #require final return

}

# SFIT2510
sub check_required_command_aliases
{
    if ($DEBUG)
    {
        print "\nin check_required_command_aliases\n";
    }

    my $found;

    foreach my $required (@REQUIRED_COMMAND_ALIASES)
    {
        if ($DEBUG)
        {
            print "looking for $required Cmnd_Alias\n";
        }
        $found = 0;
        foreach my $alias (@Cmnd_Alias)
        {
            if ($alias =~ /Cmnd_Alias.*$required.*\=/x) #Regular expression without "/x"
            {
                $found = 1;
                if ($DEBUG)
                {
                    print "found $required Cmnd_Alias\n";
                }
                last;
            }

        }
        if ($found == 0)
        {
            if ($DEBUG)
            {
                print "not found $required Cmnd_Alias\n";
            }

            IssueViolation("", "", "$required", "Cmnd_Alias $required must be defined and used in this sudoers file", "", "", 'SFIT2510'); #Sub called with "&"
        }
    }
    return; #require final return
}

# more than one entry doing subtractive approach on =*ALL
sub check_subtractive_approach_all
{
    my ($array_ref_copy) = @_;             #Get reference of sudoers array and continue using it #Reused variable name in lexical scope
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    if ($DEBUG)
    {
        print "\nin check_subtractive_approach_all\n";
    }
    @sudoers_file_copy = grep ({ defined() and length() } @sudoers_file_copy);
    # remove aliases and defaults lines first
    my @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_copy); #require block grep    #Regular expression without "/x"
    @sudoers_matches = grep({ !/[\s,=!]+IBM_NONE_SA/x } @sudoers_matches); #require block grep   #Regular expression without "/x"

    # find the lines starting with ALL and followed with more entries
    @sudoers_matches = grep({ /=\s*(\([^\)]+\)\s*)?ALL\s*\,/x } @sudoers_matches);#require block grep  #Regular expression without "/x"  
    
    if ($DEBUG)
    {
        foreach (@sudoers_matches) {
            print "check_subtractive_approach_all - $_\n";
        }
    }   

    # check if following entries are negated
    foreach my $line (@sudoers_matches)
    {
        (my $header, my $rest) = split(/=/x, $line, 2); #Regular expression without "/x"
        my @commands = split(/\,/x, $rest); #Regular expression without "/x"
        my $negation_count = 0;
        foreach my $cmd (@commands)
        {
            if ($cmd =~ /\!/x) #Regular expression without "/x"
            {
                $negation_count = $negation_count + 1;
            }
        }
        if ($negation_count > 1)
        {
            my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
            IssueViolation($header, $line_number, "ALL", "Subtractive approach detected for $header", $master_text, $filename, 'SFIT2519'); #Sub called with "&"
        }
    }
    return; #require final return
}
sub ProcessHostAlias
{
    my $ALINE;
    my $array_index;
    my $attach_noexec;
    my $DEBUG_COPY; #Reused variable name in lexical scope
    my $DONE;
    my $editable_line;
    my $editable_splitted_line;
    my $firstWord;
    my $header;
    my $line2;
    my $linehdr;
    my $name;
    my $rest;
    my $secondWord;
    my $splitted_line;
    my $TESTSTR;
    my $push_line = "";
    my @ALIASLINE;
    my @expandedline_array;
    my $lineTypes = " User_Alias Cmnd_Alias Runas_Alias Defaults ";
    #my %IBMIDLIST; #Reused variable name in lexical scope
    #my %SEVERITY_LIST; #Reused variable name in lexical scope
    my $process_commands;

    
    #Loop for inner alias expansion and removing unwanted lines
    foreach my $sudoers_line (@sudoers_file)
    {
        my $line = $sudoers_line;
        ($firstWord, $secondWord) = split(/\s+/x, $line); #Regular expression without "/x"
        $firstWord =~ s/://x;#Regular expression without "/x"
        $linehdr = (split(/=/x, $line, 2))[0]; #pankaj #Regular expression without "/x"
        $linehdr =~ s/\s+/ /xg;#Regular expression without "/x"
        $DONE = 0;
        while ($DONE != 1)
        {
            $DONE = 1;
            if ($lineTypes =~ /\s$firstWord\s/x)#Regular expression without "/x"
            {
                #Process Cmnd_Alias aliases and skip pther aliases
                if ($firstWord =~ /Host_Alias/)
                {
                    ($header, $line2) = split(/=/x, $line, 2); #Regular expression without "/x"
                    ($c, $name) = split(/\s+/x, $header); #Regular expression without "/x"
                    $line2 =~ s/^\s*|\s*$//xg; #Regular expression without "/x"
                    foreach (split(/,/x, $line2)) #Regular expression without "/x"
                    {
                        $TESTSTR = $_;

                        # if string contain a '/' then it is a command not another alias so we don't have to check it
                        if ($TESTSTR =~ /\//x) #Regular expression without "/x"
                        {
                            if ($DEBUG_COPY) { print "\t\t\t $TESTSTR command...do not need to check\n"; }
                            next;
                        }

                        # does the list reference another Cmnd_Alias?
                        #use last definition in case there are multiples
                        @ALIASLINE = (grep({ /^\s*Host_Alias\s+$TESTSTR\s*=/x } @sudoers_file))[-1];#Regular expression without "/x" #require block grep 
                        if (@ALIASLINE)
                        {
                            $ALINE = (split(/=/x, join(" ", @ALIASLINE), 2))[1]; #pankaj #Regular expression without "/x"
                            ($header, $line2) = split(/=/x, $line, 2); #pankaj #Regular expression without "/x"
                            $ALINE =~ s/^\s*|\s*$|\n//xg; #Regular expression without "/x"
                            $line2 =~ s/$_/$ALINE/x;#Regular expression without "/x"
                            $line2 =~ s/^,//x;#Regular expression without "/x"
                            $line = $header . "=" . $line2;
                            $DONE = 0;
                        }
                    }
                    if ($line =~ /=$/x)    #Remove if empth line#Regular expression without "/x"
                    {
                        next;
                    }
                }
            }
            if ($DONE == 1)
            {
                $line =~ s/\s*$|\n$|^\s*//xg;#Regular expression without "/x"
                push(@expandedline_array, $line);    # ok, the line is worth pursuing
                                                     # update line location
                update_line_location($sudoers_line, $line); #Sub called with "&"
            }
        }
    }    # for each line in sudoers
    $array_index = 1;

    #Loop for alias expansion in use cases
    foreach my $line (@expandedline_array)
    {
        $editable_line = (split(/=/x, $line, 2))[1]; #Regular expression without "/x"
        $linehdr       = (split(/=/x, $line, 2))[0]; #Regular expression without "/x"
        $attach_noexec = 0;
        if ($line =~ /=/x and $line !~ /Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x) #Regular expression without "/x"
        {
            $process_commands=(split(/=/x, $line, 2))[0]; #Regular expression without "/x"
            if($process_commands =~ /[^\s]+\s+[^\s]+/x) #Regular expression without "/x"
            {
            $process_commands=(split(/\s+/x, $process_commands))[1]; #Regular expression without "/x"
            }
            foreach my $cmd (split(/\,/x,$process_commands))    #check all command in line to find alias #Regular expression without "/x"
            {
                $splitted_line = $cmd;
                if($cmd eq ""){next;}
                @ALIASLINE = (grep({ /^\s*Host_Alias\s+$cmd\s*=/x } @expandedline_array))[-1]; #Regular expression without "/x"#require block grep   
                if (@ALIASLINE)
                {
                    $editable_splitted_line = join(" ", @ALIASLINE);
                    #If alias is used with negation then negate all command in alias definition, for replacement
                    if ($splitted_line =~ /^\s*!\s*/x) #Regular expression without "/x"
                    {
                        $editable_splitted_line =~ s/\s*,\s*/,!/xg;#Regular expression without "/x"
                        $editable_splitted_line =~ s/\s*=\s*/=!/xg;#Regular expression without "/x"
                    }
                    $rest = (split(/=/x, $editable_splitted_line, 2))[1]; #Regular expression without "/x"
                    #Replace command by its expanded value
                    $linehdr =~ s/!*$cmd(,|\s|$)/$rest$1/x; #Regular expression without "/x"
                }
            }

            #If !! comes then remove, since 2 times ! means no !
            $editable_line =~ s/!!//xg; #Regular expression without "/x"
            $editable_line =~ s/\s*,\s*/,/xg; #Regular expression without "/x"
            $editable_line =~ s/\s*$|^\s*//xg; #Regular expression without "/x"
            $editable_line =~ s/=\s*/=/xg; #Regular expression without "/x"

            #Add expanded lines to final array
            my $final_line = $linehdr . "=" . $editable_line;
            push(@sudoers_file_host_expanded, $final_line);
            update_line_location($line, $final_line); #Sub called with "&"
        }
        else
        {
            if(defined $editable_line)
            {
                $editable_line =~ s/\s*,\s*/,/xg; #Regular expression without "/x"
                $editable_line =~ s/\s*$|^\s*//xg; #Regular expression without "/x"
                $editable_line =~ s/=\s*/=/xg; #Regular expression without "/x"
                my $final_line = $linehdr . "=" . $editable_line;
                push(@sudoers_file_host_expanded, $final_line);
                update_line_location($line, $final_line); #Sub called with "&"
            }
        }
        
        $array_index += 1;
    }
    return; #require final return
    
}

sub ExpandAlias_main
{
    my ($array_ref_copy,$array_ref1) = @_;   ###require argument unpacking #Reused variable name in lexical scope
    my $ALINE;
    my $array_index;
    my $attach_noexec;
    my $DONE = 0;
    my $editable_line;
    my $editable_splitted_line;
    my $firstWord;
    my $header;
    my $line2;
    my $linehdr;
    my $name;
    my $rest;
    my $secondWord;
    my $splitted_line;
    my $TESTSTR;
    my $push_line = "";
    my @ALIASLINE;
    my @expandedline_array;
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    my @alias_array_copy = @{$array_ref1}; #Reused variable name in lexical scope #Double-sigil dereference
    my $lineTypes = " User_Alias Cmnd_Alias Runas_Alias Defaults ";
    #my %IBMIDLIST; #Reused variable name in lexical scope
    #my %SEVERITY_LIST; #Reused variable name in lexical scope
    my $process_commands;
    my @sudoers_file_expanded_copy; #Reused variable name in lexical scope

    
    if($DEBUG)
    {
        print "\nIn ExpandAlias";
    }
    #Loop for inner alias expansion and removing unwanted lines
    foreach my $sudoers_line (@sudoers_file_copy)
    {
        my $line = $sudoers_line;
        ($firstWord, $secondWord) = split(/\s+/x, $line); #Regular expression without "/x"
        $firstWord =~ s/://x; #Regular expression without "/x"
        $linehdr = (split(/=/x, $line, 2))[0]; #Regular expression without "/x"
        $linehdr =~ s/\s+/ /xg;#Regular expression without "/x"
        $DONE = 0;
        while ($DONE != 1)
        {
            $DONE = 1;
            if ($lineTypes =~ /\s$firstWord\s/x)#Regular expression without "/x"
            {
                #Process Cmnd_Alias aliases and skip pther aliases
                if ($firstWord =~ /Cmnd_Alias/)
                {
                    ($header, $line2) = split(/=/x, $line, 2); #Regular expression without "/x"
                    ($c, $name) = split(/\s+/x, $header); #Regular expression without "/x"
                    $line2 =~ s/^\s*|\s*$//xg; #Regular expression without "/x"
                    foreach (split(/,/x, $line2)) #Regular expression without "/x"
                    {
                        $TESTSTR = $_;
                        $TESTSTR =~ s/^\s+|\s+$//xg;  #Regular expression without "/x"#removes spaces so that the cmd_alias is expanded
                        # if string contain a '/' then it is a command not another alias so we don't have to check it
                        if ($TESTSTR =~ /\//x)#Regular expression without "/x"
                        {
                            if ($DEBUG) { print "\t\t\t $TESTSTR command...do not need to check\n"; }
                            next;
                        }

                        # does the list reference another Cmnd_Alias?
                        #use last definition in case there are multiples
                        @ALIASLINE = (grep({ /^\s*Cmnd_Alias\s+\Q$TESTSTR\E\s*=/x } @sudoers_file_copy))[-1]; #Regular expression without "/x"#require block grep    
                        if (@ALIASLINE)
                        {
                            $ALINE = (split(/=/x, join(" ", @ALIASLINE), 2))[1]; #Regular expression without "/x"
                            ($header, $line2) = split(/=/x, $line, 2); #Regular expression without "/x"
                            $ALINE =~ s/^\s*|\s*$|\n//xg; #Regular expression without "/x"
                            $line2 =~ s/$_/$ALINE/x; #Regular expression without "/x"
                            $line2 =~ s/^,//x; #Regular expression without "/x"
                            $line = $header . "=" . $line2;
                            $DONE = 0;
                        }
                    }
                    if ($line =~ /=$/x) #Regular expression without "/x"   #Remove if empth line
                    {
                        next;
                    }
                }
            }
            if ($DONE == 1)
            {
                $line =~ s/\s*$|\n$|^\s*//xg; #Regular expression without "/x"
                push(@expandedline_array, $line);    # ok, the line is worth pursuing
                                                     # update line location
                update_line_location($sudoers_line, $line); #Sub called with "&"
            }
        }
    }    # for each line in sudoers
    $array_index = 1;

    #Loop for alias expansion in use cases
    foreach my $line (@expandedline_array)
    {
        $editable_line = (split(/=/x, $line, 2))[1]; #Regular expression without "/x"
        $linehdr       = (split(/=/x, $line, 2))[0]; #Regular expression without "/x"
        $attach_noexec = 0;
        if ($line =~ /=/x and $line !~ /Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x) #Regular expression without "/x"
        {
            $process_commands=(split(/=/x, $line, 2))[1];     #Regular expression without "/x"        
            $process_commands =~ s/\([^\)]+\)//xg;  #Regular expression without "/x"      
            
            foreach my $cmd (split(/\,/x,$process_commands)) #Regular expression without "/x"    #check all command in line to find alias
            {
                $splitted_line = $cmd;
                if (    !($cmd =~ /\//x)  #Regular expression without "/x"                         #prohibit mixed boolean operators
                    && $cmd !~ /!+\s*IBM_SHELLESCAPE_ALL\s*$/x
                    && $cmd !~ /!+\s*IBM_SHELLS_ALL\s*$/x
                    && $cmd !~ /!+\s*IBM_NONE_SA\s*$/x
                    && $cmd !~ /!+\s*SUDOSUDO\s*$/x
                    && !grep({ /^$cmd$/x } @alias_array_copy))  #require block grep   #Regular expression without "/x"
                {
                    $cmd =~ s/NOEXEC\s*\:\s*|EXEC\s*\:\s*|^\s*|\s*$|\n//xg; #Regular expression without "/x"
                    $cmd =~ s/^!//xg; #Regular expression without "/x"
                    $cmd =~ s/(\s*\(.*\)\s*)|(\s*NOPASSWD\s*:\s*)//xg; #Regular expression without "/x"
                    if($cmd eq ""){next;}   
                    @ALIASLINE = (grep({ /^\s*Cmnd_Alias\s+\Q$cmd\E\s*=/x } @expandedline_array))[-1]; #Regular expression without "/x" #require block grep   
                    if (@ALIASLINE)
                    {
                        $editable_splitted_line = join(" ", @ALIASLINE);

                        #If alias is used with negation then negate all command in alias definition, for replacement
                        if ($splitted_line =~ /^\s*!\s*/x) #Regular expression without "/x"
                        {
                            $editable_splitted_line =~ s/\s*,\s*/,!/xg; #Regular expression without "/x"
                            $editable_splitted_line =~ s/\s*=\s*/=!/xg; #Regular expression without "/x"
                        }
                        $rest = (split(/=/x, $editable_splitted_line, 2))[1]; #Regular expression without "/x"

                        #Replace command by its expanded value
                        if ($splitted_line =~ /IBM_SHELLESCAPE_ALL|IBM_SHELLS_ALL|IBM_NONE_SA|SUDOSUDO/x) #Regular expression without "/x" #60265 - IBM_NONE_ALL is not required alias.
                        {
                            $editable_line =~ s/([^!])\s*$cmd(,|\s|$)/$1$rest$2/x; #Regular expression without "/x"
                            $editable_line =~ s/^\s*$cmd(,|\s|$)/$rest$1/x; #Regular expression without "/x"
                        }
                        else
                        {
                            $editable_line =~ s/!*$cmd(,|\s|$)/$rest$1/x; #Regular expression without "/x"
                        }
                    }
                    elsif($cmd !~ /^[!\s]*sudoedit\s*/x and $cmd !~ /^\s*ALL\s*$/x and $cmd !~ /\W/x) #Regular expression without "/x"
                    {
                        my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                        # Changes for Enhancement 302531, template mode check change. 
                        
                        if(!(($template_check==1) && (grep({ /\Q$cmd\E/x } @IBM_ALL_Standard_Aliases))))  #Regular expression without "/x"#require block grep 
                        {
                            IssueError("Cmnd_Alias $cmd", $line_number, "$cmd", "Contains no valid Cmnd_Aliases or commands",
                            $master_text, $filename, 'SFIT11043'); #Sub called with "&"
                        }                       
                    }
                }
            }

            #If !! comes then remove, since 2 times ! means no !
            $editable_line =~ s/!!//xg; #Regular expression without "/x"
            $editable_line =~ s/\s*,\s*/,/xg; #Regular expression without "/x"
            $editable_line =~ s/\s*$|^\s*//xg; #Regular expression without "/x"
            $editable_line =~ s/=\s*/=/xg; #Regular expression without "/x"

            #Add expanded lines to final array
            my $final_line = $linehdr . "=" . $editable_line;
            push(@sudoers_file_expanded_copy, $final_line);
            update_line_location($line, $final_line); #Sub called with "&"
        }
        else
        {
            my $final_line;
            if(defined $editable_line)
            {
                $editable_line =~ s/\s*,\s*/,/xg; #Regular expression without "/x"
                $editable_line =~ s/\s*$|^\s*//xg; #Regular expression without "/x"
                $editable_line =~ s/=\s*/=/xg; #Regular expression without "/x"
                $final_line = $linehdr;
                if($editable_line ne "")
                {
                    $final_line = $final_line . "=" . $editable_line;
                }
            }
            push(@sudoers_file_expanded_copy, $final_line);
            update_line_location($line, $final_line); #Sub called with "&"
        }
        $array_index += 1;
    }

    return @sudoers_file_expanded_copy;#require final return   #@sudoers_file_expanded;#perl -w  
}

sub ExpandAlias
{
    my ($array_ref_copy,$array_ref1) = @_; ##require argument unpacking  #Reused variable name in lexical scope
    my $ALINE;
    my $array_index;
    my $attach_noexec;
    my $DONE = 0;
    my $editable_line;
    my $editable_splitted_line;
    my $firstWord;
    my $header;
    my $line2;
    my $linehdr;
    my $name;
    my $rest;
    my $secondWord;
    my $splitted_line;
    my $TESTSTR;
    my $push_line = "";
    my @ALIASLINE;
    my @expandedline_array;
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    my @alias_array_copy = @{$array_ref1}; #Double-sigil dereference
    my $lineTypes = " User_Alias Cmnd_Alias Runas_Alias Defaults ";
    #my %IBMIDLIST; #Reused variable name in lexical scope
    #my %SEVERITY_LIST; #Reused variable name in lexical scope
    my $process_commands;
    my @sudoers_file_expanded_copy; #Reused variable name in lexical scope
    @sudoers_file_copy = grep ({ defined() and length() } @sudoers_file_copy);

    
    if($DEBUG)
    {
        print "\nIn ExpandAlias";
    }
    #Loop for inner alias expansion and removing unwanted lines
    foreach my $sudoers_line (@sudoers_file_copy)
    {
        my $line = $sudoers_line;
        if(defined $line)
        {
            ($firstWord, $secondWord) = split(/\s+/x, $line); #Regular expression without "/x"
            $firstWord =~ s/://x; #Regular expression without "/x"
            $linehdr = (split(/=/x, $line, 2))[0]; #Regular expression without "/x"
        }
        $linehdr =~ s/\s+/ /xg;#Regular expression without "/x"
        $DONE = 0;
        while ($DONE != 1)
        {
            $DONE = 1;
            if ($lineTypes =~ /\s$firstWord\s/x)#Regular expression without "/x"
            {
                #Process Cmnd_Alias aliases and skip pther aliases
                if ($firstWord =~ /Cmnd_Alias/)
                {
                    if(defined $line)
                    {
                        ($header, $line2) = split(/=/x, $line, 2); #Regular expression without "/x"
                    }
                    ($c, $name) = split(/\s+/x, $header); #Regular expression without "/x"
                    $line2 =~ s/^\s*|\s*$//xg; #Regular expression without "/x"
                    foreach (split(/,/x, $line2)) #Regular expression without "/x"
                    {
                        $TESTSTR = $_;
                        $TESTSTR =~ s/^\s+|\s+$//xg;  #Regular expression without "/x"#removes spaces so that the cmd_alias is expanded

                        # if string contain a '/' then it is a command not another alias so we don't have to check it
                        if ($TESTSTR =~ /\//x) #Regular expression without "/x"
                        {
                            if ($DEBUG) { print "\t\t\t $TESTSTR command...do not need to check\n"; }
                            next;
                        }

                        # does the list reference another Cmnd_Alias?
                        #use last definition in case there are multiples
                        @ALIASLINE = (grep({ /^\s*Cmnd_Alias\s+\Q$TESTSTR\E\s*=/x } @sudoers_file_copy))[-1];  #Regular expression without "/x" #require block grep    
                        if (@ALIASLINE)
                        {
                            $ALINE = (split(/=/x, join(" ", @ALIASLINE), 2))[1]; #Regular expression without "/x"
                            ($header, $line2) = split(/=/x, $line, 2); #Regular expression without "/x"
                            $ALINE =~ s/^\s*|\s*$|\n//xg; #Regular expression without "/x"
                            $line2 =~ s/$_/$ALINE/x; #Regular expression without "/x"
                            $line2 =~ s/^,//x; #Regular expression without "/x"
                            $line = $header . "=" . $line2;
                            $DONE = 0;
                        }
                    }
                    if ((defined $line) && ($line =~ /=$/x))   #Remove if empth line #Regular expression without "/x"
                    {
                        next;
                    }
                }
            }
            if ((defined $line) && ($DONE == 1))
            {
                #if(defined $line)
                {
                    $line =~ s/\s*$|\n$|^\s*//xg; #Regular expression without "/x"
                    push(@expandedline_array, $line); # ok, the line is worth pursuing
                }                                    # update line location
                update_line_location($sudoers_line, $line); #Sub called with "&"
            }
        }
    }    # for each line in sudoers
    $array_index = 1;

    #Loop for alias expansion in use cases
    foreach my $line (@expandedline_array)
    {
        $editable_line = (split(/=/x, $line, 2))[1]; #Regular expression without "/x"
        $linehdr       = (split(/=/x, $line, 2))[0]; #Regular expression without "/x"
        $attach_noexec = 0;
        if ($line =~ /=/x and $line !~ /Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x) #Regular expression without "/x"
        {
            $process_commands=(split(/=/x, $line, 2))[1]; #Regular expression without "/x"
            
            if ($DEBUG) {
                print "Before process_commands $process_commands\n";
            }
            
            $process_commands =~ s/\([^\)]+\)//xg; #Regular expression without "/x"
            
            if ($DEBUG) {
                print "After process_commands $process_commands\n";
            }           
            
            foreach my $cmd (split(/\,/x,$process_commands))   #Regular expression without "/x"  #check all command in line to find alias
            {
                
                $splitted_line = $cmd;
                $cmd =~ s/\#/\\#/xg;
                $cmd =~ s/\s/\\s/xg;
                if (    !($cmd =~ /\//x)                    #prohibit mixed boolean operators #Regular expression without "/x"
                    && $cmd !~ /!+\s*IBM_SHELLESCAPE_ALL\s*$/x
                    && $cmd !~ /!+\s*IBM_SHELLS_ALL\s*$/x
                    && $cmd !~ /!+\s*IBM_NONE_SA\s*$/x
                    && $cmd !~ /!+\s*SUDOSUDO\s*$/x
                    && !grep({ /^$cmd$/x} @alias_array_copy))  #require block grep    #Regular expression without "/x"
                {
                    $cmd =~ s/\\\#/#/xg;
                    $cmd =~ s/\\s/ /xg;
                    $cmd =~ s/NOEXEC\s*\:\s*|EXEC\s*\:\s*|^\s*|\s*$|\n//xg; #Regular expression without "/x"
                    $cmd =~ s/^!//xg; #Regular expression without "/x"
                    $cmd =~ s/(\s*\(.*\)\s*)|(\s*(NOPASSWD|PASSWD)\s*:\s*)//xg; #Regular expression without "/x"
                    if($cmd eq ""){next;}
                    @ALIASLINE = (grep({ /^\s*Cmnd_Alias\s+\Q$cmd\E\s*=/x } @expandedline_array))[-1];  #Regular expression without "/x"#require block grep   
                    if (@ALIASLINE)
                    {
                        $editable_splitted_line = join(" ", @ALIASLINE);

                        #If alias is used with negation then negate all command in alias definition, for replacement
                        if ($splitted_line =~ /^\s*!\s*/x) #Regular expression without "/x"
                        {
                            $editable_splitted_line =~ s/\s*,\s*/,!/xg; #Regular expression without "/x"
                            $editable_splitted_line =~ s/\s*=\s*/=!/xg; #Regular expression without "/x"
                        }
                        $rest = (split(/=/x, $editable_splitted_line, 2))[1]; #Regular expression without "/x"

                        #Replace command by its expanded value
                        if ($splitted_line =~ /IBM_SHELLESCAPE_ALL|IBM_SHELLS_ALL|IBM_NONE_SA|SUDOSUDO/x)  #Regular expression without "/x"#60265 - IBM_NONE_ALL is not required alias.
                        {
                            $editable_line =~ s/([^!])\s*$cmd(,|\s|$)/$1$rest$2/x; #Regular expression without "/x"
                            $editable_line =~ s/^\s*$cmd(,|\s|$)/$rest$1/x; #Regular expression without "/x"
                        }
                        else
                        {
                            $editable_line =~ s/!*$cmd(,|\s|$)/$rest$1/x; #Regular expression without "/x"
                        }
                    }
                    elsif($cmd !~ /^[!\s]*sudoedit\s*/x and $cmd !~ /^\s*ALL\s*$/x and $cmd !~ /\W/x) #Regular expression without "/x"
                    {
                        my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                        #IssueError("Cmnd_Alias $cmd", $line_number, "$cmd", "Contains no valid Cmnd_Aliases or commands",             $master_text, $filename, 'SFIT11043'); #Sub called with "&"
                    }
                }
            }

            #If !! comes then remove, since 2 times ! means no !
            $editable_line =~ s/!!//xg; #Regular expression without "/x"
            $editable_line =~ s/\s*,\s*/,/xg; #Regular expression without "/x"
            $editable_line =~ s/\s*$|^\s*//xg; #Regular expression without "/x"
            $editable_line =~ s/=\s*/=/xg; #Regular expression without "/x"

            #Add expanded lines to final array
            my $final_line = $linehdr . "=" . $editable_line;
            push(@sudoers_file_expanded_copy, $final_line);
            update_line_location($line, $final_line); #Sub called with "&"
        }
        else
        {
            my $final_line;
            if(defined $editable_line)
            {
                $editable_line =~ s/\s*,\s*/,/xg; #Regular expression without "/x"
                $editable_line =~ s/\s*$|^\s*//xg; #Regular expression without "/x"
                $editable_line =~ s/=\s*/=/xg; #Regular expression without "/x"
                $final_line = $linehdr;
                if($editable_line ne "")
                {
                    $final_line = $final_line . "=" . $editable_line;
                }
            }
            push(@sudoers_file_expanded_copy, $final_line);
            update_line_location($line, $final_line); #Sub called with "&"
        }
        $array_index += 1;
    }

     return @sudoers_file_expanded_copy;#require final return    #@sudoers_file_expanded;#perl -w 
}

sub merge_user_entries #Sub called with "&"
{
    my ($array_ref_copy) = @_; ###require argument unpacking #Reused variable name in lexical scope
    my $editable_line;
    my $linehdr;
    my @splitted_sudoers_file;
    my $merged_line;
    my @similar_user_lines;
    my @completed_users;
    my @sudoers_file_expanded_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference

    foreach my $line (@sudoers_file_expanded_copy) #Reused variable name in lexical scope
    {
        ($linehdr,$editable_line) = split(/=/x, $line, 2); #Regular expression without "/x"
        foreach(split(/,/x, $linehdr)) #Regular expression without "/x"
        {
            push(@splitted_sudoers_file,$_."=".$editable_line);
        }
    }
    @sudoers_file_merged=();
    foreach my $line (@splitted_sudoers_file)
    {
        ($linehdr,$editable_line) = split(/=/x, $line, 2); #Regular expression without "/x"
        @similar_user_lines=grep({ /^\s*\Q$linehdr\E\s*=/x } @splitted_sudoers_file);#require block grep  #Regular expression without "/x"
        if($#similar_user_lines >= 1)
        {
            $merged_line="";
            foreach my $new_line (@similar_user_lines)
            {
                ($linehdr,$editable_line) = split(/=/x, $new_line, 2); #Regular expression without "/x"
                $merged_line=$merged_line.",".$editable_line;
            }
            if(!grep({ /^\s*$linehdr\s*$/x } @completed_users)) #require block grep   #Regular expression without "/x"
            {
                $merged_line=$linehdr."=".$merged_line;
                $merged_line =~ s/=,/=/xg;  #Regular expression without "/x"
                push(@completed_users,$linehdr);
                push(@sudoers_file_merged,$merged_line);
            }
        }
        else
        {
            $merged_line = $line;
            push(@sudoers_file_merged,$merged_line);
        }
    }
    return; #require final return
}
sub Filter_negations #Sub called with "&"
{
    my ($array_ref_copy,$update_line) = @_; #Reused variable name in lexical scope #Get reference of sudoers array and continue using it
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    
    my @commands_array;
    my %commands_hash;
    my $plain_command;
    my $new_line;
    my $old_line;
    my $key;
    my @new_sudoers_file;
    my $line;                               #strict_use
    my $new_cmd;                            #strict_use
    my $next_index;                         #strict_use
    if ($DEBUG)
    {
        print "\nin Filter_negations\n";
    }
    foreach (@sudoers_file_copy)
    {
        $line = $_;
        $old_line=$_;
        if(defined $line)
        {
            $line =~ s/\s*!\s*/!/xg;  #Regular expression without "/x"
        }
        if ((defined $line) && ($line !~ /^\s*Host_Alias/x and $line !~ /^\s*User_Alias/x))#Regular expression without "/x"
        {
            #################For removing non-negation commands
            #@commands_array = reverse(split(/,/, (split(/=/, $line, 2))[1]));
            my($header,$rest)=split(/=/x, $line, 2); #Regular expression without "/x"
            if(defined $rest)
            {
                @commands_array = reverse(split(/,/x,$rest));  #Regular expression without "/x"
            }
            my $current_index = 0;
            my $regex = '[\s\[\\\:space\\\:\]]+';
            foreach my $cmd (@commands_array)
            {
                if ($cmd =~ /!.*(($regex\/\*$regex\*)|($regex\*\.(\.|\/)\*))\s*$/x) #Regular expression without "/x" #ProhibitComplexRegexes
                {
                    $current_index += 1;
                    next;
                }
                if ($cmd =~ /\/find/x)  #Regular expression without "/x"
                {
                    $current_index += 1;
                    next;
                }
                $new_cmd = $cmd;
                if ($new_cmd =~ /^\s*!/x)  #Regular expression without "/x"
                {
                    $new_cmd =~ s/^\s*!//xg;  #Regular expression without "/x"
                }
                else
                {
                    $current_index += 1;
                    next;
                }
                #for ($next_index = $current_index + 1 ; $next_index <= $#commands_array ; $next_index++)
                for ($current_index + 1..$#commands_array)
                {
                    if ($commands_array[$_] eq $new_cmd or $commands_array[$_] eq "!" . $new_cmd)
                    {
                        $commands_array[$_] = "";
                    }
                }
                $current_index += 1;
            }
            @commands_array = reverse(@commands_array);
            $line           = join(",", @commands_array);
            $line           = (split(/=/x, $_, 2))[0] . "=" . $line; #Regular expression without "/x"
            $line =~ s/=\s*,/=/xg; #Regular expression without "/x"
            #################For removing negation commands
            @commands_array = reverse(split(/,/x, (split(/=/x, $line, 2))[1])); #Regular expression without "/x"
            $current_index = 0;
            foreach my $cmd (@commands_array)
            {
                if ($cmd =~ /!.*(($regex\/\*$regex\*)|($regex\*\.(\.|\/)\*))\s*$/x) #Regular expression without "/x" #ProhibitComplexRegexes
                {
                    $current_index += 1;
                    next;
                }
                $new_cmd = $cmd;
                if ($new_cmd =~ /^\s*!/x) #Regular expression without "/x"
                {
                    $current_index += 1;
                    next;
                }
               # for ($next_index = $current_index + 1 ; $next_index <= $#commands_array ; $next_index++)
                for ($current_index + 1..$#commands_array)
                {
                    if ($commands_array[$_] eq "!" . $new_cmd or $commands_array[$_] eq $new_cmd)
                    {
                        $commands_array[$_] = "";
                    }
                }
                $current_index += 1;
            }
            @commands_array = reverse(@commands_array);
            $line           = join(",", @commands_array);
            $line           = (split(/=/x, $_, 2))[0] . "=" . $line; #Regular expression without "/x"
            $line =~ s/=\s*,*/=/xg; #Regular expression without "/x"
            $line =~ s/,+/,/xg; #Regular expression without "/x"
            $line =~ s/,$//xg; #Regular expression without "/x"
            ###################################
            push(@new_sudoers_file, $line);
            if($update_line)
            {
                update_line_location($old_line, $line); #Sub called with "&"
            }
        }
        else
        {
            push(@new_sudoers_file, $_);
        }
    }

    if ($DEBUG)
    {
        print "\nexiting... Filter_negations\n";
    }
    return \@new_sudoers_file;
}

sub Filter_negations_with_runas #Sub called with "&"
{
    my ($array_ref_copy,$update_line) = @_;  #Reused variable name in lexical scope #Get reference of sudoers array and continue using it
    my @sudoers_file_copy = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference

    my @commands_array;
    my %commands_hash;
    my $plain_command;
    #my $new_line; #Reused variable name in lexical scope
    my $old_line;
    my $key;
    my $line;                       #strict_use
    my $current_index;              #strict_use
    my $new_cmd;                    #strict_use
    my $newcmd_header;              #strict_use
    my $next_index;                 #strict_use
    my $newcmd_rest;                #strict_use
    my @new_sudoers_file;
    if ($DEBUG)
    {
        print "\nin Filter_negations\n";
    }
    foreach (@sudoers_file_copy)
    {
       $line = $_;
        $old_line=$_;
        $line =~ s/\s*!\s*/!/xg;  #Regular expression without "/x"
        if ($line !~ /^\s*Host_Alias/x and $line !~ /^\s*User_Alias/x) #Regular expression without "/x"
        {
            #################For removing non-negation commands
            @commands_array = reverse(split(/,/x, (split(/=/x, $line, 2))[1])); #Regular expression without "/x"
            $current_index = 0;
            my $regex = '[\s\[\\\:space\\\:\]]+';
            my $chars = '[A-Za-z0-9@,_]+';
            foreach my $cmd (@commands_array)
            {
                if ($cmd =~ /\($chars\)!.*(($regex\/\*$regex\*)|($regex\*\.(\.|\/)\*))\s*$/x)  #Regular expression without "/x" #ProhibitComplexRegexes
                {
                    $current_index += 1;
                    next;
                }
                if ($cmd =~ /\([A-Za-z0-9@,_]\)\/find/x)  #Regular expression without "/x"
                {
                    $current_index += 1;
                    next;
                }
                $new_cmd = $cmd;
                if ($new_cmd =~ /^\([A-Za-z0-9@,_]+\)\s*!/x) #Regular expression without "/x"
                {
                    $new_cmd =~ s/(^\([A-Za-z0-9@,_]+\))\s*!/$1/xg;  #Regular expression without "/x"
                }
                else
                {
                    $current_index += 1;
                    next;
                }
            $newcmd_header=substr $new_cmd,0,index($new_cmd,')')+1;
            $newcmd_rest=substr $new_cmd,index($new_cmd,')')+1;
        
                #for ($next_index = $current_index + 1 ; $next_index <= $#commands_array ; $next_index++)
                for ($current_index + 1..$#commands_array)
                {
                    $commands_array[$_]=~s/^\s*//x; #Regular expression without "/x"
                    if ($commands_array[$_] eq $new_cmd or $commands_array[$_] eq  $newcmd_header . "!" . $newcmd_rest)
                    {
                        $commands_array[$_] = "";
                    }
                }
                $current_index += 1;
            }
            @commands_array = reverse(@commands_array);
            $line           = join(",", @commands_array);
            $line           = (split(/=/x, $_, 2))[0] . "=" . $line; #Regular expression without "/x"
            $line =~ s/=\s*,/=/xg; #Regular expression without "/x"
            #################For removing negation commands
            @commands_array = reverse(split(/,/x, (split(/=/x, $line, 2))[1])); #Regular expression without "/x"
            $current_index = 0;
            foreach my $cmd (@commands_array)
            {
                if ($cmd =~ /\($chars\)!.*(($regex\/\*$regex\*)|($regex\*\.(\.|\/)\*))\s*$/x) #Regular expression without "/x" #ProhibitComplexRegexes
                {
                    $current_index += 1;
                    next;
                }
                $new_cmd = $cmd;
                if ($new_cmd =~ /^\([A-Za-z0-9@,_]+\)\s*!/x)  #Regular expression without "/x"
                {
                    $current_index += 1;
                    next;
                }
                $newcmd_header=substr $new_cmd,0,index($new_cmd,')')+1;
                $newcmd_rest=substr $new_cmd,index($new_cmd,')')+1;

                #for ($next_index = $current_index + 1 ; $next_index <= $#commands_array ; $next_index++)
                for ($current_index + 1..$#commands_array)
                {
                    $commands_array[$_]=~s/^\s*//x; #Regular expression without "/x"
                    if ($commands_array[$_] eq $newcmd_header . "!" . $newcmd_rest or $commands_array[$_] eq $new_cmd)
                    {
                        $commands_array[$_] = "";
                    }
                }
                $current_index += 1;
            }
            @commands_array = reverse(@commands_array);
            $line           = join(",", @commands_array);
            $line           = (split(/=/x, $_, 2))[0] . "=" . $line; #Regular expression without "/x"
            $line =~ s/=\s*,*/=/xg; #Regular expression without "/x"
            $line =~ s/,+/,/xg; #Regular expression without "/x"
            $line =~ s/,$//xg; #Regular expression without "/x"
            ###################################
            push(@new_sudoers_file, $line);
            if($update_line)
            {
                # Below if block added to fix Defect 453715
                if ("$old_line" ne "$line")
                {                
                    # removing runas from old_line
                    $old_line =~ s/\([^)]+\)+//xg;  #Regular expression without "/x"
                    my $old_line_lhs=substr $old_line,0,index($old_line,'=');
                    $old_line_lhs =~ s/\s.*//x;  #Regular expression without "/x"
                    my $old_line_rhs=substr $old_line,index($old_line,'=')+1;
                    $old_line_rhs=~s/^\s*//xg;  #Regular expression without "/x"
                    $old_line_rhs =~s/,\s+/,/xg;  #Regular expression without "/x"
                    $old_line="$old_line_lhs=$old_line_rhs";
                    
                    # removing runas from new_line
                    my $new_line=$line;
                    $new_line =~ s/\([^)]+\)+//xg;  #Regular expression without "/x"
                    my $new_line_lhs=substr $new_line,0,index($new_line,'=');
                    $new_line_lhs =~ s/\s.*//x;  #Regular expression without "/x"
                    my $new_line_rhs=substr $new_line,index($new_line,'=')+1;
                    $new_line_rhs=~s/^\s*//xg;  #Regular expression without "/x"
                    $new_line_rhs =~s/,\s+/,/xg;  #Regular expression without "/x"
                    $new_line="$new_line_lhs=$new_line_rhs";
                    
                    # updating line location without runas ()
                    update_line_location($old_line, $new_line); #Sub called with "&"
                    
                    # print "Old_line= $old_line\n";
                    # print "new_line= $new_line\n";
                    # my ($filename, $sudoline_number, $master_text) = get_line_location_text($new_line); #Sub called with "&"
                    # print "New_loc=$filename, $sudoline_number, $master_text\n";
                }
                
            }
        }
        else
        {
            push(@new_sudoers_file, $_);
        }
    }
    
    if ($DEBUG)
    {
        print "\nexiting... Filter_negations\n";
    }
    return \@new_sudoers_file;
}

# SFIT 2517

sub check_root_equivalent
{
    my ($array_ref_copy)          = @_; ###require argument unpacking #Reused variable name in lexical scope
    my @sudoers_matches;
    my @all_matches;
    my $header;
    my $rest;
    my $lalias;
    my @su_matches;
    my $key;
    my $cmd;
    my $runas_list;
    my $runas_flag=0;
    my @sudoers_matches_temp = ();
    my @sudoers_file_copy         = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    my @lineidToLine = ();
    my @alias_array_copy=("IBM_NONE_SA"); #Reused variable name in lexical scope
    @sudoers_matches_temp=@sudoers_file_copy;
    my $line_count;                                 #strict_use
    my $line;                                       #strict_use
    my $lhs;                                        #strict_use
    my $rhs;                                        #strict_use

    my $array_ref1 = Filter_negations_with_runas(\@sudoers_matches_temp,1);             #Get reference of sudoers array and continue using it #Sub called with "&"
    @sudoers_file_copy = @{$array_ref1}; #Reused variable name in lexical scope #Double-sigil dereference
    #remove all the alias CMnd/Runs/Host/Default
    @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file_copy); #Regular expression without "/x" #require block grep   
    @sudoers_matches = grep({ !/[\s,=!]+IBM_NONE_SA/x } @sudoers_matches); #Regular expression without "/x" #require block grep   
    if($DEBUG)
    {
    print "\n in check_root_equivalent";
    }
    
    #remove negation commands and split lines into single commands
    @sudoers_matches_temp = ();
    $line_count=1;
    foreach my $original_line (@sudoers_matches)
    {
        $original_line=~s/^\s*|\s*$//xg;  #Regular expression without "/x"
        $lineidToLine[$line_count]=$original_line;
        $line = $original_line;
        $line=(split(/=/x,$line,2))[1]; #Regular expression without "/x"
        $line =~ s/(![^,]*)//xg;  #Regular expression without "/x"
        $line =~ s/,+/,/xg;  #Regular expression without "/x"
        $line =~ s/^\s*,|,\s*$|^\s*//xg;  #Regular expression without "/x"
        $runas_list="";
        $runas_flag=0;
        foreach (split(/,/x, $line)) #Regular expression without "/x"
        {
            $cmd = $_;
            if($cmd =~ /^\s*\(\s*[a-zA-Z0-9@%]+/x) #Regular expression without "/x"
            {
                $runas_list=$cmd;
                $runas_flag=1;
                if($cmd =~ /\w+\s*\)/x) #Regular expression without "/x"
                {
                    $runas_flag=0;
                    $cmd =~ s/^\s*\([\w\s@%]+\)(.*)/$1/x; #Regular expression without "/x"
                    $runas_list =~ s/^\s*(\([\w,\s@%]+\)).*/$1/x; #Regular expression without "/x"
                }
                else
                {
                    next;
                }
            }
            if($cmd =~ /\w+\s*\)/x and $runas_flag==1) #Regular expression without "/x"
            {
                $runas_list=$runas_list.",".$cmd;
                $cmd =~ s/^[\w\s]+\)(.*)/$1/x; #Regular expression without "/x"
                $runas_list =~ s/^(\([\w,\s%@]+\)).*/$1/x; #Regular expression without "/x"
                $runas_flag=0;
            }
            if($runas_flag==1)
            {
                $runas_list=$runas_list.",".$cmd;
                next;
            }
            if($cmd =~ /(>|<)\s*[\w\/]+/x) #Regular expression without "/x"
            {
                $cmd =~ s/(>|<)(\s*[\w\/]+)/replaced-redirect$2/xg; #Regular expression without "/x"
                $cmd =~ s/\$/replaced-dollar/xg; #Regular expression without "/x"
                $cmd =~ s/'/replaced-Qmark/xg; #Regular expression without "/x"
            }
            push(@sudoers_matches_temp, $runas_list.$cmd . "|" . $line_count);
        }
        $line_count+=1;
    }
    foreach my $alias (@ROOT_EQUIVALENTS_QUALIFICATION)
    {
        @sudoers_matches = @sudoers_matches_temp;
        $alias =~ s/\#/\\#/xg;
        $alias =~ s/\s/\\s/xg;
        my $tag = '(NOPASSWD\:\s*)?[a-zA-Z0-9\/]*';
        my $alpha= '(\s*\([\w,@%\s]+\)\s*)|(\s*)';
        my $space1 = '\s*[\*]*\s*\|';
        my $space2 = '(,|\s)*\|';
        my $chars = '[\w\-\s\/\:\.()\$\*\"\'\=]';
        if   ($alias =~ /visudo/) { @sudoers_matches = grep({ /\s*$alias\s*[a-zA-Z\-]*\s*[\*]*\s*\|/x } @sudoers_matches); } #require block grep  #Regular expression without "/x"
        # Extract all ROOT_EQUIVALENTS_QUALIFICATION from sudoers_matches   (\([\w,\s]+\))*
        ##Changes for 230035
        else { @sudoers_matches = grep({ /(^($alpha)($tag)$alias((\s+($chars)*$space1)|($space2)))/x } @sudoers_matches); } #require block grep   not working  #Regular expression without "/x" #ProhibitComplexRegexes
        $alias =~ s/\\\#/#/xg;
        $alias =~ s/\\s/ /xg;
        foreach my $line (@sudoers_matches)
        {
            if (!grep({ /^\s*\Q$line/x } @all_matches)) #require block grep   #Regular expression without "/x"
            {
                push(@all_matches, $alias."|".$line);
            }
        }
    }
    foreach my $alias (@ROOT_EQUIVALENTS_NO_QUALIFICATION)
    {
        @sudoers_matches = @sudoers_matches_temp;
        my $regex = '(\s*\([\w,@%\s]+\)\s*)|(\s*)';
        # Extract all ROOT_EQUIVALENTS_NO_QUALIFICATION from sudoers_matches
        $alias =~ s/\#/\\#/xg;
        $alias =~ s/\s/\\s/xg;
        @sudoers_matches = grep({ /^($regex)[a-zA-Z0-9\s\/]*$alias\s*[\*]*\s*\|/x } @sudoers_matches); #require block grep #notworking   #ProhibitComplexRegexes
        $alias =~ s/\\\#/#/xg;
        $alias =~ s/\\s/ /xg;
        foreach my $line (@sudoers_matches)
        {
            if (!grep({ /^\s*\Q$line/x } @all_matches)) #require block grep   #Regular expression without "/x"
            {
                push(@all_matches, $alias."|".$line);
            }
        }
    }
    #for(my $i=0;$i<=$#all_matches;$i++)
    for(0..$#all_matches)
    {
        my ($cmd_copy, $alias, $lineno) = split(/\|/x, $all_matches[$_]);  #Regular expression without "/x"#Reused variable name in lexical scope
        # my $rev_lineno = split(/\|/, reverse $all_matches[$i]);
        # my $cmd = split(/\|/, $all_matches[$i]);
        # my $alias = $all_matches[$i];
        # $alias =~ s/.+?\|(.+)\|\d+/$1/;
        # my $lineno = reverse $rev_lineno;

        my $alias1 = $alias;
        $alias1 =~ s/^\(.*\)//x; #Regular expression without "/x"
        
        if($alias =~ /^\s*(\([\w,@%\s]+\))/x)  #Regular expression without "/x"
        {
            $runas_list=$1;
            $runas_list =~ s/(\(\s*)|(\s*\))//xg; #Regular expression without "/x"
            $runas_list =~ s/\s*,\s*/,/xg; #Regular expression without "/x"
            if($runas_list =~ /^\b(root|ALL|root\@ALL|ALL\@root)\b$/x or $runas_list =~ /@\s*\b(root|ALL|root\@ALL|ALL\@root)\b\s*@/x or $runas_list =~ /^\b(root|ALL|root\@ALL|ALL\@root)\b\s*@/x or $runas_list =~ /@\s*\b(root|ALL|root\@ALL|ALL\@root)\b/x) #Regular expression without "/x"
            {
                if ($lineno =~ /^\d+$/x) #Regular expression without "/x"
                {
                    $line=$lineidToLine[$lineno];
                        ($header, $rest) = split(/=/x,  $line, 2); #pankaj #Regular expression without "/x"
                        $line =~ s/\([^)]+\)+//xg; #Regular expression without "/x"
                        $lhs=substr $line,0,index($line,'=');
                        $lhs =~ s/\s.*//x; #Regular expression without "/x"
                        $rhs=substr $line,index($line,'=')+1;
                    $rhs=~s/^\s*//xg; #Regular expression without "/x"
                    $rhs =~s/,\s+/,/xg; #Regular expression without "/x"
                    $line="$lhs=$rhs";
                my ($filename, $line_number, $master_text) = get_line_location_text($line);  #Sub called with "&"
                my $regex = '\"unsuccessful_login_count\s*\=\s*0\"';
                my $etc_file = '\s+\/etc\/security\/lastlog';
                my $chsec_reg = '^\/chsec\|.+\/chsec\s+';
                    if ( $all_matches[$_] =~ /^\/chsec\|.+/x ) #Regular expression without "/x"
                    {
                        if ($all_matches[$_] =~ /$chsec_reg\-f$etc_file\s+\-a\s+$regex\s+\-s\s+\*\s*\|.+$/x or $all_matches[$_] =~ /$chsec_reg\-f$etc_file\s+\-s\s+\*\s+\-a\s+$regex\s*\|.+$/x or $all_matches[$_] =~ /$chsec_reg\-a\s+$regex\s+\-f$etc_file\s+\-s\s+\*\s*\|.+$/x or $all_matches[$_] =~ /$chsec_reg\-a\s+$regex\s+\-s\s+\*\s+\-f$etc_file\s*\|.+$/x or $all_matches[$_] =~ /$chsec_reg\-s\s+\*\s+\-f$etc_file\s+\-a\s+$regex\s*\|.+$/x or $all_matches[$_] =~ /$chsec_reg\-s\s+\*\s+\-a\s+$regex\s+\-f$etc_file\s*\|.+$/x or $all_matches[$_] =~ /$chsec_reg\-f\s+\/etc\/security\/limits\|.+$/x )  #Regular expression without "/x"  #ProhibitComplexRegexes
                        {
                            if ($DEBUG)
                            {
                                #As per Defect 412266
                                print "Skipping $all_matches[$_] since its an exception to chsec\n";
                            }
                        }
                        else
                        {
                            IssueWarning($header, $line_number, $alias1, "root equivalent command used", $master_text, $filename, 'SFIT2517'); #Sub called with "&"
                        }    
                    }
                    # Task 565340: SFIT2517 should only be generated if the chuser command are used with a  specific parameter
                    elsif($all_matches[$_] =~ /^\/chuser\|.+/x ) #Regular expression without "/x"
                    {
                        if ($all_matches[$_] =~ /\s+(groups|id|pgrp|roles|minsl)=/x or $all_matches[$_] =~ /\s+(maxsl|defsl|mintl|maxtl|deftl)=/x) #Regular expression without "/x" #ProhibitComplexRegexes
                        {
                            IssueWarning($header, $line_number, $alias1, "root equivalent command used", $master_text, $filename, 'SFIT2517'); #Sub called with "&"
                        }
                    }
                    else
                    {
                        IssueWarning($header, $line_number, $alias1, "root equivalent command used", $master_text, $filename, 'SFIT2517'); #Sub called with "&"
                    }
                }
            }   
        }
        else
        {
            if ($lineno =~ /^\d+$/x) #Regular expression without "/x"
            {
                $line=$lineidToLine[$lineno];
                ($header, $rest) = split(/=/x,  $line, 2); #pankaj #Regular expression without "/x"
                $line =~ s/\([^)]+\)+//xg; #Regular expression without "/x"
                $lhs=substr $line,0,index($line,'=');
                $lhs =~ s/\s.*//x;#Regular expression without "/x"
                $rhs=substr $line,index($line,'=')+1;
                $rhs=~s/^\s*//xg; #Regular expression without "/x"
                $rhs =~s/,\s+/,/xg; #Regular expression without "/x"
                $line="$lhs=$rhs";            
                my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                my $regex = '\"unsuccessful_login_count\s*\=\s*0\"';
                my $etc_file = '\s+\/etc\/security\/lastlog';
                my $chsec_reg = '^\/chsec\|.+\/chsec\s+';
                if ( $all_matches[$_] =~ /^\/chsec\|.+/x ) #Regular expression without "/x"
                {
                    if ($all_matches[$_] =~ /$chsec_reg\-f$etc_file\s+\-a\s+$regex\s+\-s\s+\*\s*\|.+$/x or $all_matches[$_] =~ /$chsec_reg\-f$etc_file\s+\-s\s+\*\s+\-a\s+$regex\s*\|.+$/x or $all_matches[$_] =~ /$chsec_reg\-a\s+$regex\s+\-f$etc_file\s+\-s\s+\*\s*\|.+$/x or $all_matches[$_] =~ /$chsec_reg\-a\s+$regex\s+\-s\s+\*\s+\-f$etc_file\s*\|.+$/x or $all_matches[$_] =~ /$chsec_reg\-s\s+\*\s+\-f$etc_file\s+\-a\s+$regex\s*\|.+$/x or $all_matches[$_] =~ /$chsec_reg\-s\s+\*\s+\-a\s+$regex\s+\-f$etc_file\s*\|.+$/x or $all_matches[$_] =~ /$chsec_reg\-f\s+\/etc\/security\/limits\|.+$/x )  #Regular expression without "/x" #ProhibitComplexRegexes
                    {
                        if ($DEBUG)
                        {
                            #As per Defect 412266
                            print "Skipping $all_matches[$_] since its an exception to chsec\n";
                        }
                    }
                    else
                    {
                        IssueWarning($header, $line_number, $alias1, "root equivalent command used", $master_text, $filename, 'SFIT2517'); #Sub called with "&"
                    }    
                }
                # Task 565340: SFIT2517 should only be generated if the chuser command are used with a  specific parameter
                elsif($all_matches[$_] =~ /^\/chuser\|.+/x ) #Regular expression without "/x"
                {
                    if ($all_matches[$_] =~ /\s+(groups|id|pgrp|roles|minsl)=/x or $all_matches[$_] =~ /\s+(maxsl|defsl|mintl|maxtl|deftl)=/x) #Regular expression without "/x" #ProhibitComplexRegexes
                    {
                        IssueWarning($header, $line_number, $alias1, "root equivalent command used", $master_text, $filename, 'SFIT2517'); #Sub called with "&"
                    }
                }
                else
                {
                    IssueWarning($header, $line_number, $alias1, "root equivalent command used", $master_text, $filename, 'SFIT2517'); #Sub called with "&"
                }
            }
        }
    }
    return; #require final return
}

##########################
#Issue "warning" for customer entries that have root equivalent commands
#This is a special case of a Warning in extended mode on a non-IBM entry.
#Warning "Root_Privileges" line # "entry-name-as-usual" "Entry grants customer root privileges. Confirm Account team has signed #customer exception and risk acceptance in place."
##########################
sub check_customerentries_root_equivalent
{
    my ($array_ref_copy)          = @_; ###require argument unpacking #Reused variable name in lexical scope
    my @sudoers_matches;
    my @all_matches;
    my $header;
    my $rest;
    my $lalias;
    my @su_matches;
    my $key;
    my $cmd;
    my @sudoers_matches_temp = ();
    my @sudoers_file1         = @{$array_ref_copy}; #Reused variable name in lexical scope #Double-sigil dereference
    my $line_count=1;
    my @lineidToLine = ();
    my $line;                               #strict_use
    my $lhs;                                #strict_use
    my $rhs;                                #strict_use
    my @tmp;                                #strict_use
    my $CUST_ID_EXISTS;                     #strict_use
    my $id;                                 #strict_use

    @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file1);  #Regular expression without "/x"#require block grep   ##Reused variable name in lexical scope
    @sudoers_matches = grep({ !/[\s,=!]+IBM_NONE_SA/x } @sudoers_matches); #require block grep    #Regular expression without "/x"
        
    #remove negation commands and split lines into single commands
    @sudoers_matches_temp = ();
    foreach my $original_line (@sudoers_matches)
    {
        $lineidToLine[$line_count]=$original_line;
        $line = $original_line;
        $line=(split(/=/x,$line,2))[1]; #Regular expression without "/x"
        $line =~ s/(![^,]*)//xg; #Regular expression without "/x"
        $line =~ s/,+/,/xg; #Regular expression without "/x"
        $line =~ s/^\s*,|,\s*$|^\s*//xg; #Regular expression without "/x"
        foreach (split(/,/x, $line)) #Regular expression without "/x"
        {
            $cmd = $_;
            if($cmd =~ /(>|<)\s*[\w\/]+/x) #Regular expression without "/x"
            {
                $cmd =~ s/(>|<)(\s*[\w\/]+)/replaced-redirect$2/xg; #Regular expression without "/x"
                $cmd =~ s/\$/replaced-dollar/xg; #Regular expression without "/x"
                $cmd =~ s/'/replaced-Qmark/xg; #Regular expression without "/x"
            }
            push(@sudoers_matches_temp, $cmd . "|" . $line_count);
        }
        $line_count+=1;
    }
     
    foreach my $alias (@ROOT_EQUIVALENTS_QUALIFICATION)
    {
        if($DEBUG)
        {
            print "Looping over \@ROOT_EQUIVALENTS_QUALIFICATION\n";
            print "\$alias=$alias\n";           
        }    
        @sudoers_matches = @sudoers_matches_temp;
        $alias =~ s/\#/\\#/xg;
        $alias =~ s/\s/\\s/xg;
        my $chars_in_runas = '[A-Za-z0-9_@%]*\b(root|ALL|root\@ALL|ALL\@root)\b[A-Za-z0-9_@%]*';
        my $chars = '[A-Za-z0-9\/%]';
        my $chars2 = '[a-zA-Z0-9\/]';
        my $s ='\s*[\*]*\s*\|';
        my $all_char = '[\w\$\-\s\/\:\.()\*"\=\'\']';
        my $regex = '[0-9a-zA-Z\$\-\s\/\:\_\.()\*"\=\'\']';
        my $s1 = '\s*\|';
        if   ($alias =~ /visudo/) 
        { 
            @sudoers_matches = grep({ /\($chars_in_runas\)\s*($chars)*$alias\s*[a-zA-Z0-9\-%]*\s*[\*]*\s*\|/x } @sudoers_matches);  #Regular expression without "/x"#require block grep   #ProhibitComplexRegexes
            
        }
        else                      
        { 
            @sudoers_matches = grep({ /(^\s*\($chars_in_runas\)\s*(($chars2)*|($chars)*)$alias((\s+($regex)*$s)|($s1)))/x } @sudoers_matches); #require block grep  #Regular expression without "/x" #ProhibitComplexRegexes
    
        }
        foreach my $line (@sudoers_matches)
        { 
            if (!grep({ /^\s*\(\b(root|ALL|root\@ALL|ALL\@root)\b\)\s*\Q$alias\|$line/x } @all_matches)) #require block grep  #Regular expression without "/x"
            {
                $alias =~ s/\\\#/#/xg;
                $alias =~ s/\\s/ /xg;
                push(@all_matches, $alias."|".$line);
            }
        }
    }
    foreach my $alias (@ROOT_EQUIVALENTS_NO_QUALIFICATION)
    {
        if($DEBUG)
        {
            print "Looping over \@ROOT_EQUIVALENTS_NO_QUALIFICATION\n";
            print "\$alias=$alias\n";           
        }    
        @sudoers_matches = @sudoers_matches_temp;
        $alias =~ s/\#/\\#/xg;
        $alias =~ s/\s/\\s/xg;
        my $chars_in_runas = '[\@A-Za-z0-9%_]*\b(root|ALL|root\@ALL|ALL\@root)\b[\@A-Za-z0-9%_]*';
        @sudoers_matches = grep({ /^\s*\($chars_in_runas\)\s*[a-zA-Z0-9\/%]*$alias\s*[\*]*\s*\|/x } @sudoers_matches);#require block grep  #Regular expression without "/x" #ProhibitComplexRegexes
        foreach my $line (@sudoers_matches)
        {
            if (!grep({ /^\s*\($chars_in_runas\)\s*\Q$alias\|$line/x } @all_matches)) #require block grep  #Regular expression without "/x" #ProhibitComplexRegexes
            {
                $alias =~ s/\\\#/#/xg;
                $alias =~ s/\\s/ /xg;
                push(@all_matches, $alias."|".$line);
            }
        }
    }
    
    foreach (@all_matches)
    {
        my ($cmd1, $alias, $lineno) = split(/\|/x, $_); #Reused variable name in lexical scope #Regular expression without "/x"
        if ( $lineno =~ /^\d+$/x ) #Regular expression without "/x"
        {
            $line=$lineidToLine[$lineno];
                $line =~ s/\([^)]+\)+//xg; #Regular expression without "/x"
                $lhs=substr $line,0,index($line,'=');
                $lhs =~ s/\s.*//x; #Regular expression without "/x"
                $rhs=substr $line,index($line,'=')+1;
            $rhs=~s/^\s*//xg; #Regular expression without "/x"
            $rhs =~s/,\s+/,/xg; #Regular expression without "/x"
            $line="$lhs=$rhs";
            ($header, $rest) = split(/=/x,  $line, 2); #pankaj #Regular expression without "/x"
        my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
        ###Changes for 229719        
        if($DEBUG)
        {
            if(defined $CUST_ID_EXISTS ){print "\$CUST_ID_EXISTS=$CUST_ID_EXISTS\n";}
            print "\$header=$header\n";
            if(defined $id ){print "\$id=$id\n";}
            if((defined $id) && (defined $IBMIDLIST{$id})){print "\$IBMIDLIST\{\$id\}=$IBMIDLIST{$id}\n";}
        }
        if ($header =~ m/\,/xg)  #Regular expression without "/x"
        {
          @tmp = split(/\,/x, $header); #Regular expression without "/x"
        }
        else
        {
           push (@tmp,$header);
        }       
        foreach my $header1 (@tmp) #perlcritic
        {
           $CUST_ID_EXISTS = check_cust_id($header1,\@sudoers_file1);      #Reused variable name in lexical scope                #Sub called with "&"
        }           
        if($CUST_ID_EXISTS == 1)
        {
            IssueWarning("$header", $line_number, "Root_Privileges", "Entry grants customer root privileges. Account team must have customer exception and risk acceptance in place.", $master_text, $filename, 'SFIT77558'); #Sub called with "&"
        }
    }
    }
    return; #require final return
}
#2525 - Issue deviation on any item that uses a "file affecting command" that has no target or simply a * in the target.

sub check_file_affecting_commands
{
    my ($array_reff) = @_;  ###require argument unpacking #Reused variable name in lexical scope
    my @sudoers_matches;
    my @all_matches;
    my $header;
    my $rest;             
    my @sudoers_matches_temp = @{$array_reff}; #Double-sigil dereference
    my $array_ref1 = Filter_negations(\@sudoers_matches_temp,1);             #Get reference of sudoers array and continue using it #Sub called with "&"
    @sudoers_file = @{$array_ref1}; #Double-sigil dereference
    my $filename;
    my $line_number;
    my $master_text;
    my @array_chown_chgrp_chmod = ("/chown", "/chgrp", "/chmod");
    my $nopath;
    @sudoers_file = grep ({ defined() and length() } @sudoers_file);

    if ($DEBUG)
    {
        print "SFIT2525 START\n";
        print "\@FILE_AFFECTING_COMMANDS = @FILE_AFFECTING_COMMANDS\n"; 
    }

    foreach my $cmd (@FILE_AFFECTING_COMMANDS)
    {
        @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file);  #Regular expression without "/x" #require block grep    

        foreach my $line (@sudoers_matches)
        {
            if(defined $line)
            {
                ($header, $rest) = split(/=/x, $line, 2); #Regular expression without "/x"
            } #pankaj
            my ($header_without_host, $host) = split(/\s/x, $header, 2);  #Regular expression without "/x"
            my @commands = split(/\,/x, $rest); #Regular expression without "/x"      
            my $regex1 = '\s+[A-Za-z0-9\:\+\[\]\-\s"\|\?\.]*\s+\*';
            my $regex2 = '\s+\-[A-Za-z0-9\:\+\[\]]*';
            my $regex3 = '\s+\*[a-zA-Z0-9\+\-\[\]\/\s\*]*';
            my $regex4 = '\s+\-[A-Za-z0-9\:\+\[\]\s]+\*[a-zA-Z0-9\+\-\[\]\/]*\s*';
            #my $regex5 = '';
            
            # selecting all the commands that are not compliant.
            my @matches = grep({ 
                /^\s*((\Q$cmd\E)|(\Q$cmd\E(($regex1)|($regex2)|($regex3)|($regex4))))\s*$/x } #Regular expression without "/x" #ProhibitComplexRegexes
                @commands); #require block grep 
            # Changes below filter for defect 324346        
            @matches = grep ({ !/^\s*\Q$cmd\E\s+\*\s+.+$/x } @matches); #require block grep  #Regular expression without "/x" 
            #
            my $opt1 = '\s+\-[A-Za-z0-9\:\+\[\]]*';
            my $opt2 = '\s+\*[a-zA-Z0-9\+\-\[\]\/]*\s*';
            my $opt3 = '\s+\-[A-Za-z0-9\:\+\[\]\s]+\*[a-zA-Z0-9\+\-\[\]\/]*\s*';
            my $opt4 = '[A-Za-z\d\:\+\-\[\]\*]+';
            
            my @no_matches = ();
            $nopath = (split(/\//x, $cmd))[-1]; #Regular expression without "/x"
            if (grep({ /\/$nopath\s*$/x } @array_chown_chgrp_chmod) and grep({ /$cmd/x } @commands)) #require block grep   #Regular expression without "/x"
            {
                @matches = grep   ({ !/^\s*\Q$cmd\E\s+.*\s+[\/\w]+$/x } @matches); #require block grep    #Regular expression without "/x"
                @no_matches = grep({
                    !/^\s*(?:(?:\Q$cmd\E)|(?:\Q$cmd\E(($opt1)|($opt2)|($opt3))))\s*$/x }  #Regular expression without "/x"#ProhibitUnusedCapture #ProhibitComplexRegexes
                    @commands);    #Lines not matching $matches #require block grep
                @no_matches = grep({ /^\s*((\Q$cmd\E\s+$opt4\s*([\sa-zA-Z]*\*\s*)?))$/x } @no_matches);  #Regular expression without "/x"#require block grep #ProhibitComplexRegexes 
                @no_matches = grep({ !/^\s*\Q$cmd\E\s+.*\s+[\/\w]+$/x } @no_matches); #Regular expression without "/x"#require block grep 
            }
            my @matched=();
            push(@matched,@matches);
            push(@matched,@no_matches);
            my @unique_matched_array = uniq(@matched);
            foreach my $match (@unique_matched_array)
            {
                
                ($filename, $line_number, $master_text) = get_line_location_text($line);                #Sub called with "&"
                IssueViolation($header_without_host, $line_number, $cmd, "File-related command \'$match\' cannot be used with asterisk or empty scoping",$master_text, $filename, 'SFIT2525'); #Sub called with "&"
            }
        }
    }
    return; #require final return
}

sub check_file_affecting_commands_with_negation
{
    my ($array_ref1) = @_; ## #require argument unpacking #Reused variable name in lexical scope  #Get reference of sudoers array and continue using it

    my $line='';
    my @sudoers_matches;
    my @sudoers_matches_all_users="";
    my %sudoers_users_hash=();
    my @sudoers_users_array="";
   if($DEBUG)
    {
        print "\n\nIN check_file_affecting_commands_with_negation -2526\n\n";

    }
    
    my @cmds_temp;
    my $header;
    my $rest;
    my @sudoers_matches_all_users_cmds;
    my @sudoers_matches_all_users_cmds_new;
    my @sudoers_file1 = @{$array_ref1}; #Reused variable name in lexical scope
    my $old_line;
    my @cmds;                               #strict_use
    my $last_cmd="";                            #strict_use
    my $h1;                                 #strict_use
    my $r1;                                 #strict_use
    my $cmd;                                #strict_use
    my @array1=("/cat","/chgrp","/chmod","/chown","/cp","/ln","/ls","/mkdir","/mv","/rm","/rmdir","/tar","/touch","/zcat","/sort","/grep","/egrep","/fgrep");
    my @array2=("/compress","/diff","/find","/gunzip","/gzip","/head","/tail","/uncompress");
    #Step - 0 get all the lines for $cmd.
    @sudoers_matches_all_users_cmds = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file1); #Regular expression without "/x"#require block grep    
    ###########################
    foreach(@sudoers_matches_all_users_cmds)
    {
        ($header,$rest )=split(/=/x,$_,2); #Regular expression without "/x"
        $header=~s/\s+[A-Za-z0-9_]+//x;#Regular expression without "/x"
        $header=~s/\s+$//x;#Regular expression without "/x"
        @cmds=split(/\s*,\s*/x,$rest); #Regular expression without "/x"
        if ($DEBUG)
        {
            print "Line == $_\n";
            print "Header ==== $header\n";
            print "Rest == $rest\n";
            print "Cmds == @cmds\n";
        }
       
 
        for(0..$#cmds)
        {   
            
            $cmds[$_]=~s/^\s*//x;#Regular expression without "/x"
            $cmds[$_]=~s/\([A-Za-z0-9%@\_]+\)//xg;#Regular expression without "/x"
            $last_cmd=(split(/\s+/x,$cmds[$_]))[0]; #Regular expression without "/x"
            if(defined $last_cmd)
            {
                $last_cmd=(split(/\//x,$last_cmd))[-1]; #Regular expression without "/x"
                if(defined $last_cmd)
                {
                    chomp $last_cmd;
                    if(grep({ /\/\Q$last_cmd\E$/x } @array1)) #require block grep    #Regular expression without "/x"
                    {
                        $cmds[$_] =~ s/(^\s*\/usr\/bin\/$last_cmd)/\/bin\/$last_cmd/xg; #Regular expression without "/x"
                    }
                    elsif(grep({ /\/\Q$last_cmd\E$/x } @array2))#require block grep #Regular expression without "/x" 
                    {
                        $cmds[$_] =~ s/(^\s*\/bin\/$last_cmd)/\/usr\/bin\/$last_cmd/xg; #Regular expression without "/x"
                    }
                }
            }
        }
        $rest=join(",", @cmds);
        $_=~s/\([A-Za-z0-9@\_%]+\)//xg; #Regular expression without "/x"
        ($h1,$r1)=split(/=/x,$_,2); #Regular expression without "/x"
        $h1=~s/\s+[A-Za-z0-9_]+//x;#Regular expression without "/x"
        $h1=~s/\s+$//x;#Regular expression without "/x"
        $r1=~s/\s*,\s*/,/xg;#Regular expression without "/x"
        $r1=~s/^\s+|\s+$//x;#Regular expression without "/x"
        $_="$h1=$r1";
        $_=~s/=\s*/=/x;#Regular expression without "/x"
        my $newline="$header=$rest";
        $newline=~s/\s*,\s*/,/xg;#Regular expression without "/x"
        push(@sudoers_matches_all_users_cmds_new,$newline);
        update_line_location($_,$newline); #Sub called with "&"
    }
    @sudoers_matches_all_users_cmds=@sudoers_matches_all_users_cmds_new;

    if($DEBUG)
    {
        print "data for array sudoers_matches_all_users_cmds\n";    
        foreach (@sudoers_matches_all_users_cmds) {
            print "$_\n";
        }
    }
        
    ###########################
    #defect 4896
    @cmds_temp = ();

    #Remove negation commands other that those not fulfilling combination of 3 commands
  #  for (my $j = 0 ; $j <= $#sudoers_matches_all_users_cmds ; $j++)
    for (0..$#sudoers_matches_all_users_cmds)
    {
        $old_line = $sudoers_matches_all_users_cmds[$_];
        ($header, $rest) = split(/=/x, $sudoers_matches_all_users_cmds[$_],2); #Regular expression without "/x"
        @cmds_temp = split(/\,/x, $rest); #Regular expression without "/x"
       # for (my $i = 0 ; $i <= $#cmds_temp ; $i++)
        for(0..$#cmds_temp)
        { 
            if (!(($cmds_temp[$_] =~ /!.*\/\*((\s+)|((\[\\\:space\\\:\])+))\*/x )|| ($cmds_temp[$_] =~ /!.*\*\.\.\*/x) || ($cmds_temp[$_] =~ /!.*\*\.\/\*/x) || ($cmds_temp[$_] =~ /\/find/x)) && ($cmds_temp[$_] =~ /^\s*!/x)) #Regular expression without "/x"#prohibit mixed boolean operators#brackets_added_because_of_precedence
            {
                $cmds_temp[$_] = "";
            }
            elsif ($cmds_temp[$_] =~ /\/\*\//x and $cmds_temp[$_] !~ /\/find/x)#Regular expression without "/x"
            {
                $cmds_temp[$_] = "";
            }
            elsif ($cmds_temp[$_] !~ /!.*\/\*(?:(?:\s+)|(?:(?:\[\\\:space\\\:\])+))\*/x and $cmds_temp[$_] !~ /!.*\*\.\.\*/x and $cmds_temp[$_] !~ /!.*\*\.\/\*/x and $cmds_temp[$_] !~ /\/\*\//x and ($cmds_temp[$_] =~ /\/\*\w/x)) #ProhibitUnusedCapture#Regular expression without "/x"
            {
                $cmds_temp[$_] = "";
            }
        }
        $sudoers_matches_all_users_cmds[$_] = "";
        foreach my $cmd(@cmds_temp)
        {
            if ($cmd =~ /.+/x)#Regular expression without "/x"
            {
                $sudoers_matches_all_users_cmds[$_] = $sudoers_matches_all_users_cmds[$_] . "," . $cmd;
            }
        }
        if ($sudoers_matches_all_users_cmds[$_] =~ /.+/x)#Regular expression without "/x"
        { 
            $sudoers_matches_all_users_cmds[$_] = "$header=" . $sudoers_matches_all_users_cmds[$_];
        }
        
        $sudoers_matches_all_users_cmds[$_] =~ s/=,/=/xg; #Regular expression without "/x"
        $sudoers_matches_all_users_cmds[$_]=~s/=\s*/=/x; #Regular expression without "/x"
        if ($sudoers_matches_all_users_cmds[$_] =~ /.+/x)#Regular expression without "/x"
        {
            push(@sudoers_matches_all_users, $sudoers_matches_all_users_cmds[$_]);
            update_line_location($old_line, $sudoers_matches_all_users_cmds[$_]); #Sub called with "&"
        }
        
        @cmds_temp = ();
    }
    @sudoers_matches_all_users_cmds = @sudoers_matches_all_users;

    if($DEBUG)
    {
        print "data for array sudoers_matches_all_users_cmds\n";    
        foreach (@sudoers_matches_all_users_cmds) {
            print "$_\n";
        }
    }
    
    #defect 4896
    foreach my $one_target_cmd (@FILE_AFFECTING_COMMANDS_ONE_TRGT,@FILE_AFFECTING_COMMANDS_FIXED_PATH_ONE_TARGET,@FILE_AFFECTING_COMMANDS_TWO_TRGT)
    {
        $cmd="/".(split(/\//x,$one_target_cmd))[-1]; #Regular expression without "/x"
        if(grep({ /$cmd$/x } @array1)){$cmd="/bin$cmd";} #require block grep #Regular expression without "/x"
        if(grep({ /$cmd$/x } @array2)){$cmd="/usr/bin$cmd";} #require block grep #Regular expression without "/x"
        else{$cmd=$one_target_cmd;}
        next if ($cmd =~ m/sudoedit/is);
        @sudoers_matches_all_users = @sudoers_matches_all_users_cmds;
        @sudoers_matches_all_users = grep({ /[=,\s]+$cmd/x } @sudoers_matches_all_users); #require block grep #Regular expression without "/x"

        #removing all the lines that does not contain * anywhere in the line.
        #TBD: Need to filter out embadded * in options and path... i.e. path /file/*/file is valid entry.
        @sudoers_matches_all_users = grep({ /\*/x } @sudoers_matches_all_users); #require block grep #Regular expression without "/x"


        if($DEBUG){
            print "sudoers_matches_all_users = $one_target_cmd\n";
            foreach (@sudoers_matches_all_users){
                print "$_\n";
            }
        }
        #Removing all the lines containing /*/ in the file path.

        #Get the list of all the users.

        undef %sudoers_users_hash;
        foreach (@sudoers_matches_all_users)
        {
            m/^([%\w,]+)[\s=]+/x;#Regular expression without "/x"
            if(defined $1){$sudoers_users_hash{$1} = " ";}

            # removing extra '/' from the command.
            s/\/\//\//xg;#Regular expression without "/x"
        }

        @sudoers_users_array = keys %sudoers_users_hash;

        foreach my $sudoers_users (@sudoers_users_array)
        {
            @sudoers_matches = grep({ /^\s*$sudoers_users[\s=]+/x } @sudoers_matches_all_users); #Regular expression without "/x" #require block grep 

            #Step - 1 get all the lines for $cmd with option.
            #(TBD:Need to refine options... detect if options has [,] in it.)
            my $chars =  '[\-\w+\d+\:\+\[0-9\]+]'; 
            my $alpha = '[\w+\s+\/\<\:\w*\>\.\w\[\W+\]]';           
           @sudoers_matches_wt_optn = grep({ /[^!]$cmd\s+($chars)+\s*($alpha)+/x } @sudoers_matches); #Regular expression without "/x"       #require block grep  #ProhibitComplexRegexes
                
            if($DEBUG){
                print "sudoers_matches_wt_optn = $one_target_cmd\n";
                foreach (@sudoers_matches_wt_optn){
                    print "$_\n";
                }
            }
       

            #Step - 2
            # grep all the lines with $cmd without options...

            my $regex = '[a-z\*\.\/\*\s+\dA-Z\[\\\:a-zA-Z\]+\[\W+\]]';
            @sudoers_matches_wo_optn = grep({ /[^!]$cmd\s+[^\w\s\d\-\[\]]\s*($regex)+/x } @sudoers_matches); #Regular expression without "/x" #require block grep  #ProhibitComplexRegexes
            
            if($DEBUG){
                print "sudoers_matches_wo_optn = $one_target_cmd\n";
                foreach (@sudoers_matches_wo_optn){
                    print "$_\n";
                }
            }
    
            #reversing the array and verifying last entry first.

            @sudoers_matches_wt_optn = reverse(@sudoers_matches_wt_optn);
            @sudoers_matches_wo_optn = reverse(@sudoers_matches_wo_optn);

            # Check if command is one target command or two target command.
            ####################
            if($cmd =~ /\/find/x)#Regular expression without "/x"
            {
                @sudoers_matches_wt_optn = grep({ /find\s+/x } @sudoers_matches);#require block grep #Regular expression without "/x"
                @sudoers_matches_wo_optn = grep({ !/find\s+/x } @sudoers_matches); #require block grep   #Regular expression without "/x"
                process_line_findcommand_one_trgt($cmd); #Sub called with "&"
            }
            ####################
            else
            {
                if (grep({ /^$one_target_cmd$/x }@FILE_AFFECTING_COMMANDS_ONE_TRGT,@FILE_AFFECTING_COMMANDS_FIXED_PATH_ONE_TARGET)) #Regular expression without "/x" #require block grep  
                {
                    # process with option sudoers entries
                    process_line_one_trgt_with_optn($cmd); #Sub called with "&"

                    # process without option sudoers entries
                    process_line_one_trgt_without_optn($cmd); #Sub called with "&"
                }
                else
                { 
                    # process with option sudoers entries
                    process_line_two_trgt_with_optn($cmd); #Sub called with "&"

                    # process without option sudoers entries
                    process_line_two_trgt_without_optn($cmd); #Sub called with "&"
                }
            }

        }

    }
    return; #require final return

}
#######################
#Task 65507-Negation logic improvements
#I want to verify that we have the right "negations" when we check them--- 
#can you send me a list of the strings we consider as ok negations for the 
#commands we are checking?   What you provided looks good... see comments 
#for a new, simpler check I'd like to add before the existing checks.
#######################
sub check_negation_standards
{
    my ($array_ref1) = @_;             #Get reference of sudoers array and continue using it #Reused variable name in lexical scope
    my @sudoers_file1 = @{$array_ref1}; #Reused variable name in lexical scope #Double-sigil dereference
    my $header;
    my $rest;
    my @splitted_cmd = "";
    my @unique_array = "";
    my $original_line;
    my $cmd_search;                         #strict_use
    my @matched_lines;                      #strict_use
    my $cmd;                                #strict_use
    @sudoers_file1 = grep ({ defined() and length() } @sudoers_file1);
    my $space = '\[\\\:space\\\:\]';
    my @incorrect_negation_syntax = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file1); #Regular expression without "/x" #require block grep  
    @incorrect_negation_syntax = grep({ /([=,]+!*([\w\/]+)?\s*($space)+)|(($space)+\s*(,|$))/x } @incorrect_negation_syntax); #Regular expression without "/x" #require block grep  #ProhibitComplexRegexes
    
    if($DEBUG)
    {
        print "\nIn check_negation_standards\n";
    }
    
    foreach my $line (@incorrect_negation_syntax) #perlcritic
    {
        $original_line=$line;
        if($DEBUG)
        {
            print "Line Pre= $line\n";
        }
        
        $line =~ s/NOPASSWD\://xg; #Regular expression without "/x"
        $line =~ s/PASSWD\://xg; #Regular expression without "/x"
        $line =~ s/NOEXEC\://xg; #Regular expression without "/x"
        $line =~ s/EXEC\://xg; #Regular expression without "/x"
                
        if($DEBUG)
        {
            print "Line Post= $line\n";
        }

        ($header, $rest) = split(/=/x, $line, 2); #Regular expression without "/x"
        
        my ($filename, $line_number, $master_text) = get_line_location_text($original_line); #Sub called with "&"
        $cmd="";
        
        if($line =~ /([=,]+!\s*(\[\\\:space\\\:\])+)/x or $line =~ /([=,]+!*[\w\/]+\s*(\[\\\:space\\\:\])+)/x or $line =~ /((\[\\\:space\\\:\])+\s*(,|$))/x)#Regular expression without "/x"
        {
            $cmd=$1;
        }
        $cmd =~ s/(^\s*,)|(,\s*$)//xg; #Regular expression without "/x"
        IssueWarning($header, $line_number, $cmd,"Use of negations with [:space:] is not permitted",$master_text, $filename, 'SFIT190310'); #Sub called with "&"
    }
    ###############################
    @incorrect_negation_syntax = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file1);  #Regular expression without "/x"#require block grep 
    @incorrect_negation_syntax = grep ({ defined() and length() } @incorrect_negation_syntax);
    foreach my $cmd (@FILE_AFFECTING_COMMANDS_ONE_TRGT,@FILE_AFFECTING_COMMANDS_FIXED_PATH_ONE_TARGET,@FILE_AFFECTING_COMMANDS_TWO_TRGT) #perlcritic
    {
        @splitted_cmd=split(/\//x,$cmd); #Regular expression without "/x"
        $cmd_search="/".$splitted_cmd[-1];
        if(!grep({ /^$cmd_search$/x } @unique_array)) #require block grep #Regular expression without "/x"   
        {
            push(@unique_array,$cmd_search);
            @matched_lines=grep({ /[\w\/]+$cmd_search(\s|,|$)+/x } @incorrect_negation_syntax); #Regular expression without "/x" #require block grep  
            foreach(@matched_lines)
            {
                #####Changes for defect 130208
                my $temp = $_; 
                s/NOPASSWD\://xg; #Regular expression without "/x"
                s/PASSWD\://xg; #Regular expression without "/x"
                s/NOEXEC\://xg; #Regular expression without "/x"
                s/EXEC\://xg; #Regular expression without "/x"

                if($DEBUG)
                {
                    print "Line2 = $_\n";
                }

                ($header, $rest) = split(/=/x, $_, 2); #pankaj #Regular expression without "/x"
                @splitted_cmd=split(/\s*,\s*/x,$rest); #Regular expression without "/x"
                @splitted_cmd=grep({ /$cmd_search(\s|,|$)/x } @splitted_cmd); #Regular expression without "/x" #require block grep    
              
                if(!grep({ /^$cmd$/x} @FILE_AFFECTING_COMMANDS_FIXED_PATH_ONE_TARGET))  #Regular expression without "/x"#require block grep   
                {   
                    @splitted_cmd=grep({ !/^[!\s]*\/usr\/bin$cmd_search/x }@splitted_cmd);#require block grep#Regular expression without "/x"    
                    @splitted_cmd=grep({ !/^[!\s]*\/bin$cmd_search/x } @splitted_cmd);  #require block grep    #Regular expression without "/x"                
                }
                elsif(grep({ /^$cmd$/x } @FILE_AFFECTING_COMMANDS_FIXED_PATH_ONE_TARGET))#Regular expression without "/x"
                {
                    # Changes for defect 457768
                    if($cmd_search =~ /\/(mount|umount|exportfs|unlink)/x)#Regular expression without "/x"
                    {
                        @splitted_cmd=grep({ !/^[!\s]*\/usr\/bin$cmd_search/x } @splitted_cmd);#Regular expression without "/x"#require block grep   
                        @splitted_cmd=grep({ !/^[!\s]*\/usr\/sbin$cmd_search/x } @splitted_cmd);#Regular expression without "/x"#require block grep  
                        @splitted_cmd=grep({ !/^[!\s]*\/bin$cmd_search/x } @splitted_cmd);#Regular expression without "/x"#require block grep    
                        @splitted_cmd=grep({ !/^[!\s]*\/sbin$cmd_search/x } @splitted_cmd);#Regular expression without "/x"#require block grep   
                    }
                    elsif($cmd_search =~ /\/strings/x or $cmd_search =~ /\/ul/x)#Regular expression without "/x"#require block grep   
                    {
                        @splitted_cmd=grep({ !/^[!\s]*\/usr\/bin$cmd_search/x } @splitted_cmd);#Regular expression without "/x"#require block grep   #require block grep   
                        @splitted_cmd=grep({ !/^[!\s]*\/bin$cmd_search/x } @splitted_cmd);#Regular expression without "/x"#require block grep   #require block grep    
                    }                    
                }
                @splitted_cmd=grep({ !/^\s*!\s*/x } @splitted_cmd);#require block grep#Regular expression without "/x"   
                ##Changes for defect 140676
                @splitted_cmd=grep({ !/^(?:[a-z]+)\s*(?:\/usr)?\/(?:s)?bin$cmd_search/x } @splitted_cmd);#Regular expression without "/x"#require block grep #ProhibitUnusedCapture
                if($#splitted_cmd>=0)
                {
                    #####Changes for defect 130208
                    $splitted_cmd[0] =~ s/(^\s*,)|(,\s*$)//xg; #Regular expression without "/x"
                    my ($filename, $line_number, $master_text) = get_line_location_text($temp); #Sub called with "&"
                    IssueWarning($header, $line_number, $splitted_cmd[0],"Standard OS command not permitted in non-standard directory.",$master_text, $filename, 'SFIT65507'); #Sub called with "&"
                }

            }
        }
    }   
return; #require final return   
}

sub match_common_regex #Sub called with "&"
{
    my ($regex_str,$cmd,$array_ref1) = @_;             #Get reference of sudoers array and continue using it #Reused variable name in lexical scope
    my @cmds = @{$array_ref1}; #Double-sigil dereference
    my $i=0;
    if($DEBUG)
    {
        print "\nIn match_common_regex";
    }
    if(defined $regex_str)
    {
        if($regex_str eq "second_match")
        {
            #for($i=0;$i<= $#cmds;$i++)
            for(0..$#cmds)
            {
                if($cmds[$_] =~ /\!\s*$cmd\s*\*\.\.\*/x)#Regular expression without "/x"
                {
                    return $_;
                    
                }
            }
        }
    
        if($regex_str eq "third_match")
        {
            #for($i=0;$i<= $#cmds;$i++)
            for(0..$#cmds)
            {
                if($cmds[$_] =~ /\!\s*$cmd\s*\*\.\/\*/x)#Regular expression without "/x"
                {
                    return $_;
                    
                }
            }
        }
        if($regex_str =~ /IBM_[a-zA-Z_]+_NEG/x)#Regular expression without "/x"
        {
           # for($i=0;$i<= $#cmds;$i++)
            for(0..$#cmds)
            {
                if($cmds[$_] =~ /^\s*$regex_str\s*$/x)#Regular expression without "/x"
                {
                    return $_;  
                }
            }
        }
    }
    return $i;
}
sub verify_standard_negation_set
{
    my ($cmd,$array_ref1) = @_;             #Get reference of sudoers array and continue using it #Reused variable name in lexical scope
    my @cmds = @{$array_ref1}; #Double-sigil dereference
    my @temp;
    my $cmd_temp=$cmd;
    $cmd_temp =~ s/(^\s*)|(\s*$)//xg; #Regular expression without "/x"
    if($cmd_temp =~ /^([^\s]+)/x)#Regular expression without "/x"
    {
        $cmd_temp=$1;
        $cmd_temp=(split(/\//x,$cmd_temp))[-1]; #Regular expression without "/x"
        $cmd_temp = uc($cmd_temp);
        $cmd_temp="IBM_".$cmd_temp."_NEG";
        if(grep({ /^\s*$cmd_temp\s*$/x} @cmds)) #require block grep #Regular expression without "/x" 
        {
            return "0|$cmd_temp";
        }
        if(grep({ /^\s*IBM_ALL_NEG\s*$/x } @cmds)) #require block grep   #Regular expression without "/x"
        {
            return "0|IBM_ALL_NEG";
        }
    }
    return 1;
}
sub process_line_two_trgt_with_optn
{        

    my ($cmd) = @_; ##require argument unpacking
    my @cmds;
    my $optn;
    my $issue_deviation = 1;    # 0 = No, 1 = Yes.
    my $header; 
    my $rest;
    
    my $i;
    my $first_match=-1;
    my $second_match=-1;
    my $third_match=-1;
    my $fourth_match=-1;
    my $fifth_match=-1;
    my $ret1;
    my $ret2;
    my $cmd_match=-1;
     if($DEBUG)
    {
        print "\n\nIN process_line_two_trgt_with_optn -2526\n\n";
     } 
    foreach my $line (@sudoers_matches_wt_optn)
    {
        $first_match=-1;
        $second_match=-1;
        $third_match=-1;
        $cmd_match=-1;
        ($header, $rest) = split(/=/x, $line,2); #Regular expression without "/x"
        @cmds = split(/\,/x, $rest); #Regular expression without "/x"
        
        #Dont process the line if the target does not contain *
        my $chars = '[A-Za-z\d\:\+\-\[\]\*\s]';
        my $alpha = '[\w\/\-\?\[\]\*\.]*';
          next if (!grep({ /$cmd\s+($chars)+\s+($alpha)\s*[\w\/\-\.]*\*[\w\/\.]*/x } @cmds)) ; #Regular expression without "/x"#require block grep  #prohibit unreachable code  #ProhibitComplexRegexes
    
        #}
#################################################################################################################
        #{
            #########################
            my $space = '(\s+)|((\[\\\:space\\\:\])+)';
            my $space2 = '(\s*)|((\[\\\:space\\\:\])*)';
            #for($i=0;$i<= $#cmds;$i++)
             for(0..$#cmds)
             {
                if($cmds[$_] =~ /\!\s*$cmd($space)[-]*[A-Za-z\d\*]+($space2)\/\*($space)\/\*($space)\*/x)#Regular expression without "/x" #ProhibitComplexRegexes
                {
                    $first_match=$_;
                    last;
                }
            }
            #########################
            if (
                grep({ 
                    /\!\s*$cmd($space)[-]*[A-Za-z\d\*]+($space2)\/\*($space)\/\*($space)\*/x }#Regular expression without "/x" #ProhibitComplexRegexes
                  @cmds) #require block grep    
               )
            { 
                if (grep({ /\!\s*$cmd\s*\*\.\.\*/x } @cmds)) #require block grep #Regular expression without "/x"
                { 
                    if (grep({ /\!\s*$cmd\s*\*\.\/\*/x } @cmds)) #require block grep #Regular expression without "/x"
                    {
                        $issue_deviation = 0;
                    }
                }
            }
        
        $second_match=match_common_regex("second_match",$cmd,\@cmds); #Sub called with "&"
        $third_match=match_common_regex("third_match",$cmd,\@cmds); #Sub called with "&"
        #for($i=0;$i<= $#cmds;$i++)
        for(0..$#cmds)
        {
            if($cmds[$_] =~ /^\s*$cmd\s+[\-\w+\d+\:\+]+\s*[\w+\s+\/\<\:\w*\>\.\w]+/x)#Regular expression without "/x"
            {
                $cmd_match=$_;
            }
        }
        if ($issue_deviation > 0 and $template_check==1)
        {
            $ret1=verify_standard_negation_set($cmd,\@cmds); #Sub called with "&"
            ($ret1,$ret2)=split(/\|/x,$ret1); #Regular expression without "/x"
            $fourth_match=match_common_regex("IBM_ALL_NEG",$cmd,\@cmds); #Sub called with "&"
            $fifth_match=match_common_regex($ret2,$cmd,\@cmds); #Sub called with "&"
            $issue_deviation=$ret1;
        }
        if($cmd_match > $first_match and $cmd_match > $second_match and $cmd_match > $third_match and $cmd_match > $fourth_match and $cmd_match > $fifth_match)
        {
            $issue_deviation=1;
        }
        if ($issue_deviation > 0)
        {  
            $line = $line . "|" . $cmd;
            
            if (!grep({ /\Q$line/x } @all_matches_check_file_affecting_commands_with_negation) )#Regular expression without "/x"#require block grep  
            {
               push(@all_matches_check_file_affecting_commands_with_negation, $line);
                
                $line = (split(/\|/x, $line))[0]; #Regular expression without "/x"
                ($header, $rest) = split(/=/x, $line,2); #Regular expression without "/x"
                $header=~s/\s*$//x;#Regular expression without "/x"
                $header=(split " ",$header)[0];
                $rest=~s/\s*,\s*/,/xg;#Regular expression without "/x"
                $rest=~s/^\s*//x;#Regular expression without "/x"
                $rest=~s/\s*$//x;#Regular expression without "/x"
                $line="$header=$rest";
                my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                IssueViolation($header, $line_number, $cmd,
                                "File-related command with * in target and lacks all required negations",
                                $master_text, $filename, 'SFIT2526'); #Sub called with "&"
            }
        }
    }
    return; #require final return
}

sub process_line_one_trgt_with_optn
{
    my ($cmd) = @_; #require argument unpacking
    my @cmds;
    my $optn;
    my $issue_deviation = 1;    # 0 = No, 1 = Yes.
    my ($header, $rest);
    my $counter;
    my $i;
    my $first_match=-1;
    my $second_match=-1;
    my $third_match=-1;
    my $fourth_match=-1;
    my $fifth_match=-1;
    my $ret1;
    my $ret2;
    my $cmd_match=-1;
    my $char = '\*\s*[\w\.\-\/]*\s*(,|$)';
    my $all_char = '[\w\/<>\:[\]\-\!\'\.\*\?]';
    my $alpha = '[A-Za-z\d\*]+';
    my $char2 = '[^\*\/][\w\.\/]+(,|$)';
    my $regex = '[\w\/]*$cmd\s+';

     if($DEBUG)
    {
        print "\n\nIN process_line_one_trgt_with_optn -2526\n\n";

    }     
 
    foreach my $line (@sudoers_matches_wt_optn)
    {    
        
        $first_match=-1;
        $second_match=-1;
        $third_match=-1;
        $cmd_match=-1;
        ($header, $rest) = split(/=/x, $line,2); #Regular expression without "/x"

        @cmds = split(/\,/x, $rest); #Regular expression without "/x"
        if($DEBUG)
        {
            print "Line == $line\n";
            print "Rest == $rest\n";
            print "\@cmds == @cmds\n";
            print "\@cmds count == $#cmds\n";
            print "\$cmd == $cmd\n";
        } 
        
        #changes for defect 137714
        ###changes for defect 209767
        if ( !grep({ /$cmd\s+[A-Za-z0-9\:\+\-\\\[\]\*\s]+\s+[\w\/\*\.]*/x } @cmds)) #require block grep #Regular expression without "/x" #ProhibitComplexRegexes
        {
           
            if ($DEBUG)
            {
                print "NOT PROCESSING THIS LINE $cmd|$line\n";
            } 
                next;
        }
         if (!grep({ /^[\w\/]*$cmd\s+[A-Za-z\d\:\+\-\[\]\,\*\\\s]+\s+($all_char)*$char/x } @cmds))  #Regular expression without "/x"   #require block grep 
        #if (!grep({ /^[\w\/]*$cmd\s+($char)+\s+($all_char)*\*\s*[\w\.\-\/]*\s*(,|$)/x } @cmds))  #Regular expression without "/x"   #require block grep  #ProhibitComplexRegexes
        {   
            if ($DEBUG)
            { 
                print "NOT PROCESSING THIS if LINE $cmd|$line\n";
            }
            next;
        }
        ###changes for defect 209767
        if(($cmd =~ /\/chgrp/x or $cmd =~ /\/chmod/x or $cmd =~ /\/chown/x) and grep({ /^[\w\/]*$cmd\s+[A-Za-z\d\:\+\-\[\]\,\*\\\s]+\s+$alpha\s*$char2/x } @cmds))  #Regular expression without "/x"##new #require block grep #ProhibitComplexRegexes 
        #if(($cmd =~ /\/chgrp/x or $cmd =~ /\/chmod/x or $cmd =~ /\/chown/x) and grep({ /^[\w\/]*$cmd\s+($char)+\s+$alpha\s*[^\*\/][\w\.\/]+(,|$)/x } @cmds))  #Regular expression without "/x"##new #require block grep #ProhibitComplexRegexes  
        {
            if ($DEBUG)
            { 
                print "NOT PROCESSING THIS if LINE 2 $cmd|$line\n";
            }
            next;
        }
        my $space = '(\s+)|((\[\\\:space\\\:\])+)';
        my $space2 = '(\s*)|((\[\\\:space\\\:\])*)';
        #for($i=0;$i<= $#cmds;$i++)
        for (0..$#cmds)
        {
            if($cmds[$_] =~ /\!\s*$cmd($space)[-]*[A-Za-z0-9\*]+($space2)\/\*($space)\*/x)#Regular expression without "/x" #ProhibitComplexRegexes
            {
                $first_match=$_;
                if ($DEBUG)
                { 
                    print "\nfirst_match = $first_match\n"; 
                }   
                last;
            }
        }
        $second_match=match_common_regex("second_match",$cmd,\@cmds); #Sub called with "&"
        $third_match=match_common_regex("third_match",$cmd,\@cmds); #Sub called with "&"
        if ($DEBUG)
        { 
            print "\nsecond_match = $second_match\n";
            print "\nthird_match = $third_match\n";
        }
        #for($i=0;$i<= $#cmds;$i++)
         for(0..$#cmds)
         {
            if($cmds[$_] =~ /^\s*$cmd\s+[\-\w+\d+\:\+]+\s*[\w+\s+\/\<\:\w*\>\.\w]+/x)#Regular expression without "/x"
            {
                $cmd_match=$_;
                if ($DEBUG)
                { 
                    print "\nMatched : $cmds[$_]\n";            
                }
            }
        }
        if ($DEBUG)
        { 
            print "\ncmd_match = $cmd_match\n";         
        }
         
        if (grep({ /\!\s*$cmd($space)[-]*[A-Za-z0-9\*]+[\s\*]*($space2)\/\*($space)\*/x } @cmds))#Regular expression without "/x"#require block grep #ProhibitComplexRegexes    
        {
            if ($DEBUG)
            {
                print "\nReached First if \n";  
            }
            if (grep({ /\!\s*$cmd\s*\*\.\.\*/x } @cmds))#require block grep  #Regular expression without "/x"
            {
                if ($DEBUG)
                {
                    print "\nReached Second if \n";     
                }
                if (grep({ /\!\s*$cmd\s*\*\.\/\*/x } @cmds))#require block grep  #Regular expression without "/x"
                {
                    if ($DEBUG)
                    {
                        print "\nReached third if \n";  
                    }
                    $issue_deviation = 0;
                }
            }
        }
        if ($issue_deviation > 0 and $template_check==1)
        {
            $ret1=verify_standard_negation_set($cmd,\@cmds);
            ($ret1,$ret2)=split(/\|/x,$ret1); #Regular expression without "/x" #Sub called with "&"
            $fourth_match=match_common_regex("IBM_ALL_NEG",$cmd,\@cmds); #Sub called with "&"
            $fifth_match=match_common_regex($ret2,$cmd,\@cmds); #Sub called with "&"
            $issue_deviation=$ret1;
        }
        if ($DEBUG)
        {
            print "cmd_match = $cmd_match\n";
            print "first_match = $first_match\n";
            print "second_match $second_match\n";   
            print "third_match $third_match\n"; 
            print "fourth_match $fourth_match\n";   
            print "fifth_match $fifth_match\n"; 
        }       
        #if($cmd_match > $first_match and $cmd_match > $second_match and $cmd_match > $third_match and $cmd_match > $fourth_match and $cmd_match > $fifth_match) 
        #Defect 341333: Invalid SFIT2526 generated violation should be seen in all the 3 modes for the test data
         if($cmd_match > $first_match and $cmd_match > $second_match and $cmd_match > $third_match and $cmd_match > $fourth_match )
       {
            $issue_deviation=1;
        }
        if ($DEBUG)
        {
            print "\nissue_deviation = $issue_deviation\n";     
        }
        if ($issue_deviation > 0)
        {   
            $line = $line . "|" . $cmd;
            if ($DEBUG)
            {
                print "Updated line = $line\n";
                print "\@all_matches == @all_matches_check_file_affecting_commands_with_negation\n";
            }
            if (!grep({ /\Q$line/x } @all_matches_check_file_affecting_commands_with_negation))#Regular expression without "/x"#require block grep   
            {
                push(@all_matches_check_file_affecting_commands_with_negation, $line);

                $line = (split(/\|/x, $line))[0]; #Regular expression without "/x"
                ($header, $rest) = split(/=/x, $line,2); #Regular expression without "/x"
                $header=~s/\s*$//x;#Regular expression without "/x"
                $header=(split " ",$header)[0];
                $rest=~s/\s*,\s*/,/xg;#Regular expression without "/x"
                $rest=~s/^\s*//x;#Regular expression without "/x"
                $rest=~s/\s*$//x;#Regular expression without "/x"
                $line="$header=$rest";
                my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                IssueViolation($header, $line_number, $cmd,
                                "File-related command with * in target and lacks all required negations",
                                $master_text, $filename, 'SFIT2526'); #Sub called with "&"
            }
        }
    }
    return; #require final return
}

sub process_line_two_trgt_without_optn
{
    my ($cmd) = @_; #require argument unpacking
    my @cmds;
    my $optn;
    my $issue_deviation = 1;    # 0 = No, 1 = Yes.
    my $header; 
    my $rest;
    my $i;
    my $first_match=-1;
    my $second_match=-1;
    my $third_match=-1;
    my $fourth_match=-1;
    my $fifth_match=-1;
    my $ret1;
    my $ret2;
    my $cmd_match=-1;
    my $chars = '[\w\/\*\.\[\]\-]';
     if($DEBUG)
    {
        print "\n\nIN process_line_two_trgt_without_optn -2526\n\n";
    }  
    foreach my $line (@sudoers_matches_wo_optn)
    {
       
        $first_match=-1;
        $second_match=-1;
        $third_match=-1;
        $cmd_match=-1;
        ($header, $rest) = split(/=/x, $line,2); #Regular expression without "/x"

        #split all the commands separated by ,;
        @cmds = split(/\,/x, $rest); #Regular expression without "/x"
        my $char = '[\w\/\*\.\[\]\-]';
        
        #Dont process the line if the target does not contain *  
        if (!grep({ /$cmd\s+[\w\/\-\?\[\]\*\.]*\s*[\w\/\-\.]*\*[\w\/\.]*/x } @cmds))   #Regular expression without "/x" #require block grep  
            {
              
                if ($DEBUG)
                {
                    print "NOT PROCESSING THIS LINE $cmd|$line\n";
                } 
                next;
            }  
                
           
             ###changes for defect 209767
            if (!grep({ /^[\w\/]*$cmd\s+[^\-](($chars)*\s+[\w\/\.]*\*[\w\/\*\.])*/x } @cmds))#Regular expression without "/x" #require block grep  #ProhibitComplexRegexes
            {  
             
               if ($DEBUG)
                {
                    print "NOT PROCESSING THIS LINE $cmd|$line\n";
                }
                next;
            }
        
##############################################################################################################
        #{   
            #########################
            my $regex1 = '(\s+)|((\[\\\:space\\\:\])+)';
            my $regex2 = '(\s*)|((\[\\\:space\\\:\])*)';
            #for($i=0;$i<= $#cmds;$i++)
            for(0..$#cmds)
            {
                if($cmds[$_] =~ /\!\s*$cmd(($regex1)[\*]*($regex2)\/\*){2}($regex1)\*/x)#Regular expression without "/x"  #ProhibitComplexRegexes
                {
                    $first_match=$_;
                    last;
                }
            }
            #########################
            
            if (
                grep({ 
                    /\!\s*$cmd(($regex1)[\*]*($regex2)\/\*){2}($regex1)\*/x }#Regular expression without "/x"  #ProhibitComplexRegexes
                    @cmds)#require block grep   
               )
            {  
                
                if (grep({ /\!\s*$cmd\s*\*\.\.\*/x }@cmds))#require block grep   #Regular expression without "/x"
                {  
                    if (grep({ /\!\s*$cmd\s*\*\.\/\*/x } @cmds))#require block grep  #Regular expression without "/x"
                    {
                        $issue_deviation = 0;
                    }
                }
            }

##############################################################################################################
        $second_match=match_common_regex("second_match",$cmd,\@cmds); #Sub called with "&"
        $third_match=match_common_regex("third_match",$cmd,\@cmds); #Sub called with "&"
        my $chars1 = '[a-z\*\.\/\*\s+0-9A-Z\[\\\:a-zA-Z\]+]';
        #for($i=0;$i<= $#cmds;$i++)
        for(0..$#cmds)
        {
            if($cmds[$_] =~ /^\s*$cmd\s+[^\w\s\d\-]\s*($chars1)+/x)#Regular expression without "/x"  #ProhibitComplexRegexes
            {
                $cmd_match=$_;
            }
        }
        if ($issue_deviation > 0 and $template_check==1)
        {
            $ret1=verify_standard_negation_set($cmd,\@cmds); #Sub called with "&"
            ($ret1,$ret2)=split(/\|/x,$ret1); #Regular expression without "/x"
            $fourth_match=match_common_regex("IBM_ALL_NEG",$cmd,\@cmds); #Sub called with "&"
            $fifth_match=match_common_regex($ret2,$cmd,\@cmds); #Sub called with "&"
            $issue_deviation=$ret1;
        }
        if($cmd_match > $first_match and $cmd_match > $second_match and $cmd_match > $third_match and $cmd_match > $fourth_match and $cmd_match > $fifth_match)
        {
            $issue_deviation=1;
        }
        if ($issue_deviation > 0)
        {
           
            $line = $line . "|" . $cmd;
            if (!grep({ /\Q$line/x } @all_matches_check_file_affecting_commands_with_negation))#Regular expression without "/x"#require block grep   
            {
                push(@all_matches_check_file_affecting_commands_with_negation, $line);

                $line = (split(/\|/x, $line))[0]; #Regular expression without "/x"
                ($header, $rest) = split(/=/x, $line,2); #Regular expression without "/x"
                $header=~s/\s*$//x;#Regular expression without "/x"
                $header=(split " ",$header)[0];
                $rest=~s/\s*,\s*/,/xg;#Regular expression without "/x"
                $rest=~s/^\s*//x;#Regular expression without "/x"
                $rest=~s/\s*$//x;#Regular expression without "/x"
                $line="$header=$rest";
                my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                IssueViolation($header, $line_number, $cmd,
                                "File-related command with * in target and lacks all required negations",
                                $master_text, $filename, 'SFIT2526'); #Sub called with "&"
            }
        }
    }
    return; #require final return
}

sub process_line_one_trgt_without_optn
 {   
    my ($cmd) = @_; #require argument unpacking
    my @cmds;
    my $optn;
    my $issue_deviation = 1;    # 0 = No, 1 = Yes.
    my $header; 
    my $rest;
    my $i;
    my $first_match=-1;
    my $second_match=-1;
    my $third_match=-1;
    my $fourth_match=-1;
    my $fifth_match=-1;
    my $ret1;
    my $ret2;
    my $cmd_match=-1;


     if($DEBUG)
    {
        print "\n\nIN process_line_one_trgt_without_optn -2526\n\n";

    }

     foreach my $line (@sudoers_matches_wo_optn)
    {   
        
        $first_match=-1;
        $second_match=-1;
        $third_match=-1;
        $cmd_match=-1;
        ($header, $rest) = split(/=/x, $line,2); #Regular expression without "/x"

        #split all the commands separated by ,;
        @cmds = split(/\,/x, $rest); #Regular expression without "/x"
        
        #Dont process the line if the target does not contain *
        if (!grep({ /$cmd\s+[\w\/\*\.]*/x } @cmds))#require block grep #Regular expression without "/x"  
            {
             
                if ($DEBUG)
                {
                    print "NOT PROCESSING THIS LINE $cmd|$line\n";
                } 
                    next;
            }
        ##chnages for defect 209767
        
        if (!grep({ /$cmd\s*[A-Za-z0-9_\/\[\]\!\-\'\.\?]*\*/x } @cmds))#require block grep#Regular expression without "/x"   
        {
            if ($DEBUG)
            {
                print "NOT PROCESSING THIS LINE $cmd|$line\n";
            }
            next;
        }
        #########################
        my $regex1 = '(\s+)|((\[\\\:space\\\:\])+)';
        my $regex2 = '(\s*)|((\[\\\:space\\\:\])*)';
        #for($i=0;$i<= $#cmds;$i++)
        for(0..$#cmds)
        {
            if($cmds[$_] =~ /\!\s*$cmd($regex2)[\*]*($regex2)\/\*($regex1)\*/x)#Regular expression without "/x"  #ProhibitComplexRegexes
            {
                $first_match=$_;
                last;
            }
        }
        $second_match=match_common_regex("second_match",$cmd,\@cmds); #Sub called with "&"
        $third_match=match_common_regex("third_match",$cmd,\@cmds); #Sub called with "&"
        my $chars = '[a-z\*\.\/\*\s+0-9A-Z\[\\\:a-zA-Z\]+]';
        #for($i=0;$i<= $#cmds;$i++)
        for(0..$#cmds)
        {
            if($cmds[$_] =~ /^\s*$cmd\s+[^\w\s\d\-]\s*($chars)+/x)#Regular expression without "/x"  #ProhibitComplexRegexes
            {
                $cmd_match=$_;
            }
        }

        #########################
        if (grep({ /\!\s*$cmd($regex2)[\*]*($regex2)\/\*($regex1)\*/x } @cmds))#require block grep  #Regular expression without "/x"   #ProhibitComplexRegexes
        {   
            if (grep({ /\!\s*$cmd\s*\*\.\.\*/x } @cmds))#require block grep#Regular expression without "/x"  
            { 
                if (grep({ /\!\s*$cmd\s*\*\.\/\*/x } @cmds))#require block grep  #Regular expression without "/x"
                { 
                    $issue_deviation = 0;
                }
            }
        }
        if ($issue_deviation > 0 and $template_check==1)
        {
            $ret1=verify_standard_negation_set($cmd,\@cmds); #Sub called with "&"
            ($ret1,$ret2)=split(/\|/x,$ret1); #Regular expression without "/x"
            $fourth_match=match_common_regex("IBM_ALL_NEG",$cmd,\@cmds); #Sub called with "&"
            $fifth_match=match_common_regex($ret2,$cmd,\@cmds); #Sub called with "&"
            $issue_deviation=$ret1;
        }
        if($cmd_match > $first_match and $cmd_match > $second_match and $cmd_match > $third_match and $cmd_match > $fourth_match and $cmd_match > $fifth_match)
        {
            $issue_deviation=1;
        }
        if ($issue_deviation > 0)
        {
            $line = $line . "|" . $cmd;    #defect 4510
            
        
            if (!grep({ /\Q$line/x } @all_matches_check_file_affecting_commands_with_negation))#Regular expression without "/x"#require block grep   
            {   
                push(@all_matches_check_file_affecting_commands_with_negation, $line);
                $line = (split(/\|/x, $line))[0]; #Regular expression without "/x"

                ($header, $rest) = split(/=/x, $line,2); #Regular expression without "/x"
                $header=~s/\s*$//x;#Regular expression without "/x"
                $header=(split " ",$header)[0];
                $rest=~s/\s*,\s*/,/xg;#Regular expression without "/x"
                $rest=~s/^\s*//x;#Regular expression without "/x"
                $rest=~s/\s*$//x;#Regular expression without "/x"
                $line="$header=$rest";
                my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                IssueViolation($header, $line_number, $cmd,
                                "File-related command with * in target and lacks all required negations",
                                $master_text, $filename, 'SFIT2526'); #Sub called with "&"
            }
        }
    }
    return; #require final return
}

sub process_line_findcommand_one_trgt
{
    my ($cmd) = @_; ##require argument unpacking
    my @cmds;
    my $optn;
    my $issue_deviation = 1;    # 0 = No, 1 = Yes.
    my ($header, $rest);
    my $counter;
    my $ret1;
    my $ret2;
    
    if($DEBUG)
    {
        print "\nin process_line_findcommand_one_trgt";
    }
    foreach my $line (@sudoers_matches_wt_optn)
    {
        ($header, $rest) = split(/=/x, $line,2); #Regular expression without "/x"

        @cmds = split(/\,/x, $rest); #Regular expression without "/x"

        #Dont process the line if the target does not contain *
        if (!grep({ /[^!]*$cmd/x } @cmds)) #require block grep #Regular expression without "/x"
        {    
            if ($DEBUG)
            {
                print "NOT PROCESSING THIS LINE \n@cmds\n";
            }
            next;
        }
        if (grep({ /!\s*$cmd\s+\*\s*\-execdir\s*\*\s*$/x } @cmds)) #require block grep #Regular expression without "/x"
        {
            if (grep({ /!\s*$cmd\s+\*\s*\-okdir\s*\*\s*$/x } @cmds)) #require block grep #Regular expression without "/x"
            {
                if (grep({ /!\s*$cmd\s+\*\s*\-exec\s*\*\s*$/x } @cmds)) #require block grep #Regular expression without "/x"
                {
                    if (grep({ /!\s*$cmd\s+\*\s*\-ok\s*\*\s*$/x }  @cmds)) #require block grep #Regular expression without "/x"
                    {    
                        if (grep({ /!\s*$cmd\s+\*\.\.\*\s*/x } @cmds)) #require block grep #Regular expression without "/x"
                        {
                            $issue_deviation = 0;
                        }
                    }
                }
            }
        }
        if ($issue_deviation > 0 and $template_check==1)
        {
            $ret1=verify_standard_negation_set($cmd,\@cmds); #Sub called with "&"
            ($ret1,$ret2)=split(/\|/x,$ret1); #Regular expression without "/x"
            $issue_deviation=$ret1;
        }
        if ($issue_deviation > 0)
        {
            $line = $line . "|" . $cmd;
            if ( !grep({/\Q$line/x } @all_matches_check_file_affecting_commands_with_negation)) #require block grep #Regular expression without "/x"
            {
                push(@all_matches_check_file_affecting_commands_with_negation, $line);
                $line = (split(/\|/x, $line))[0]; #Regular expression without "/x"
                ($header, $rest) = split(/=/x, $line, 2); #pankaj #Regular expression without "/x"
                $header=~s/\s*$//x; #Regular expression without "/x"
                $header=(split " ",$header)[0];
                $rest=~s/\s*,\s*/,/xg; #Regular expression without "/x"
                $rest=~s/^\s*//x; #Regular expression without "/x"
                $rest=~s/\s*$//x; #Regular expression without "/x"
                $line="$header=$rest";
                my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                IssueViolation($header, $line_number, $cmd,
                                "File-related command with * in target and lacks all required negations",
                                $master_text, $filename, 'SFIT2526'); #Sub called with "&"
            }
        }
    }
    return; #require final return
}
#
# convert an entry like:
# /usr/bin/su *
#
# to a regular expression:
#
sub sudoers_entry_to_regular_expression_search_entry
{
    my ($entry) = @_;
    my $base_expression = "^[^\\!\\s]*";
    # replace actual spaces with "\s+"
    $entry =~ s/\s+/\\s\+/xg;  #Regular expression without "/x"
    # replace wildcard "*" with ".*"
    $entry =~ s/\*/.*/xg;  #Regular expression without "/x"
    # replace path separators
    $entry =~ s/\//\\\//xg;  #Regular expression without "/x"
    # return the final expression
    return $entry; #require final return   #$entry;#perl -w
}

#
# convert an entry like:
#
# to a regular expression:
# ^[^\!\s]*vi\s*\/etc\/group\S*$
#

sub sudoers_entry_to_regular_expression
{
    my ($entry) = @_;
    my $base_expression = "^[^\\!\\s]*";

    # replace actual spaces with "\s+"
    $entry =~ s/\s+/\\s\+/xg; #Regular expression without "/x"

    # replace wildcard "*" with "\S*"
    $entry =~ s/\*/\[^\/\\s]*/xg; #Regular expression without "/x"

    # replace path separators
    $entry =~ s/\//\\\//xg; #Regular expression without "/x"

    # replace quotes
    $entry =~ s/\"/\\\"/xg; #Regular expression without "/x"

    # return the final expression
    # $base_expression . $entry . "(\\s+|\$)";
    return $base_expression . $entry . "(\\s+|\$)";
}

#
# Check the contents of the named Cmnd_alias against the array of commands passed in
# Issue violation for any missing commands in the Cmnd_alias
# Generate expressions from the array to check for usage in the sudoers array passed in
#
# sample:
# &validate_alias_contents_and_check_usage(\@sudoers_file_expanded, "IBM_NONE_ALL", "SFIT4364", \@IBM_NONE_ALL)
#

sub validate_alias_contents_and_check_usage
{
    my ($sudoers_ref, $alias_name, $sfit_id, $contents_ref) = @_;
    my @sudoers_file1 = @{$sudoers_ref}; #@sudoers_file #Reused variable name in lexical scope #Double-sigil dereference

    #my @check_contents = @$contents_ref;
    my @get_contents = @{$contents_ref}; #Double-sigil dereference
    my @check_contents = grep({ !/\/chmod \* \/\*/x } @get_contents); #require block grep#Regular expression without "/x"

    if ($DEBUG)
    {
        print "validate_alias_contents_and_check_usage\n";
        print "alias = $alias_name\n";
        print "ID = $sfit_id\n";
    }

    my @alias_commands  = ();
    my %unique_commands = ();
    @sudoers_file1 = grep ({ defined() and length() } @sudoers_file1);
    # find the alias
    my @alias_name_matches = grep({ /Cmnd_Alias\s+$alias_name\s*=/x } @sudoers_file1);  #Regular expression without "/x"#require block grep
    foreach my $match (@alias_name_matches)
    {
        # parse the alias contents into separate commands
        my ($header, $rest) = split(/=/x, $match, 2); #pankaj #Regular expression without "/x"
        my @commands = split(/\,/x, $rest); #Regular expression without "/x"

        # look for each command from the internal list in the alias
        foreach my $check (@check_contents)
        {
            # save the base check command and arguments for later
            my $base_check;
            if ($check =~ /(\/[^\/\s\!]+(\s+.*)?$)/x)  #Regular expression without "/x"
            {
                $base_check = $1;
            }
            else
            {
                $base_check = $check;
            }
            $unique_commands{$base_check} = "0";

            # find each command from the internal array in the alias
            if ($DEBUG)
            {
                print "looking for $check - ";
            }
            my $found = 0;
            foreach my $command (@commands)
            {
                chomp($command);
                my $expression = sudoers_entry_to_regular_expression_search_entry($command); #Sub called with "&"
                $found = ($check =~ /^$expression$/x);  #Regular expression without "/x"
                if ($found)
                {
                    last;
                }
            }
            if ($DEBUG)
            {
                if ($found)
                {
                    print "found\n";
                }
                else
                {
                    print "not found\n";
                }
            }

            # violation if not found
            if (!$found)
            {
                my ($filename, $line_number, $master_text) = get_line_location_text($match); #Sub called with "&"
                IssueViolation($header, $line_number, "$check", "Required entry not found in Cmnd_alias", $master_text, $filename,
                                "$sfit_id"); #Sub called with "&"
            }
        }
    }

    @alias_commands                = sort keys %unique_commands;
    my %alias_command_expression_hash = ();

    if ($DEBUG)
    {
        print "$sfit_id $alias_name commands are:\n";
        print join("\n", @alias_commands), "\n";
        print "regular expressions are:\n";
    }

    foreach my $command (@alias_commands)
    {
        my $expression = sudoers_entry_to_regular_expression($command); #Sub called with "&"
        $alias_command_expression_hash{$command} = $expression;
        if ($DEBUG)
        {
            print $command . " = " . $expression . "\n";
        }
    }

    # search the sudoers array for any active use of the alias commands
    foreach my $alias_command (keys %alias_command_expression_hash)
    {
        # skip any su commands
        if ($alias_command !~ /\/su(?:\s+|$)/x) #ProhibitUnusedCapture  #Regular expression without "/x"
        {
            my $expression = $alias_command_expression_hash{$alias_command};
            foreach my $line (@sudoers_file)
            {
                (my $header, my $rest) = split(/=/x, $line, 2); #Regular expression without "/x"
                if ($header !~ /Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x)  #Regular expression without "/x"
                {
                    my @commands = split(/\,/x, $rest); #Regular expression without "/x"
                    my @command_matches = grep({ /$expression/x } @commands); #require block grep  #Regular expression without "/x"

                    foreach my $match (@command_matches)
                    {
                        my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
                        IssueViolation($header, $line_number, "$match", "contains disallowed command from $alias_name alias",
                                        $master_text, $filename, "$sfit_id"); #Sub called with "&"
                    }
                }
            }
        }
        else
        {
            if ($DEBUG)
            {
                print "skipping su command $alias_command\n";
            }
        }
    }
    return; #require final return
}

#
# validate the contents of the named Cmnd_alias IBM_NONE_EDITOR against the array of commands passed in
# Issue violation for any missing commands in the Cmnd_alias with respect to @IBM_NONE_EDITOR
# sample:
# &validate_alias_IBM_NONE_EDITOR(\@sudoers_file_expanded, "IBM_NONE_EDITOR", "SFIT58079", \@IBM_NONE_EDITOR)
#
sub validate_alias_IBM_NONE_EDITOR
{
    my ($sudoers_ref, $alias_name, $sfit_id, $contents_ref) = @_;
    my @sudoers_file1 = @{$sudoers_ref}; #Reused variable name in lexical scope #Double-sigil dereference
    
    my @get_contents = @{$contents_ref}; #Double-sigil dereference
    my @check_contents = grep({ !/\/chmod \* \/\*/x } @get_contents); #require block grep#Regular expression without "/x"

    if ($DEBUG)
    {
        print "validate_alias_IBM_NONE_EDITOR\n";
        print "alias = $alias_name\n";
        print "ID = $sfit_id\n";
    }

    my @alias_commands  = ();
    #my @ibmNoneEditorInputCommands = ();#Reused variable name in lexical scope     
 
    @sudoers_file1 = grep ({ defined() and length() } @sudoers_file1);
    my @sudoers_IBM_NONE_EDITOR_matches = grep({ /Cmnd_Alias\s+$alias_name\s*=/x } @sudoers_file1);  #Regular expression without "/x"#require block grep
    my $sudoers_IBM_NONE_EDITOR_matches_line = join('', @sudoers_IBM_NONE_EDITOR_matches);
        
    if ($sudoers_IBM_NONE_EDITOR_matches_line !~ /^\s*$/x)    #Regular expression without "/x" 
    {
        my ($header, $rest) = split(/=/x, $sudoers_IBM_NONE_EDITOR_matches_line, 2); #Regular expression without "/x"
        my @ibmNoneEditorInputCommands = split(/\,/x, $rest);    #Regular expression without "/x"     
        
        foreach my $editor (@check_contents)
        {
            if (!grep { /^$editor$/x } @ibmNoneEditorInputCommands)  #Regular expression without "/x"     #require block grep     
            {           
                my ($filename, $line_number, $master_text) = get_line_location_text($sudoers_IBM_NONE_EDITOR_matches_line);   #Sub called with "&"              
                IssueViolation($editor, $line_number, "$alias_name", "Command '$editor' is missing inside Cmnd_alias $alias_name", $master_text, $filename,"$sfit_id");         #Sub called with "&"        
            }
        }   
    }
    return; #require final return
}

#SFIT 4994
sub check_chmod_permissions
{
    my ($array_ref1) = @_;   #require argument unpacking          #Get reference of sudoers array and continue using it #Reused variable name in lexical scope
    if ($DEBUG)
    {
        print "\nIn check_chmod_permissions\n";
    }
    my @matches;    
    my $match;
    my $header;
    my $rest;
    my $cmd;
    my $line;
    my @sudoers_file1 = @{$array_ref1}; #Reused variable name in lexical scope #Double-sigil dereference
    my $line_count=1;
    my @lineidToLine = ();
    @sudoers_file1 = grep ({ defined() and length() } @sudoers_file1);
    my @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file1); #Regular expression without "/x" #require block grep
    my @chmod_cmds;                             #strict_use
    
    ###Changes for enhancement 180727
    my @chmod_matches = ();
    my @sudoers_matches_temp = ();
    @sudoers_matches = grep ({ defined() and length() } @sudoers_matches);
    @chmod_matches = grep({ /\/chmod/x } @sudoers_matches); #require block grep #Regular expression without "/x"
    
    foreach my $original_line (@sudoers_matches)
    {
        $lineidToLine[$line_count]=$original_line;
        $line = $original_line;     
        if(defined $line)
        {
        
            $line =~ s/(![^,]*)|.*=//xg;    #Regular expression without "/x"  
            $line =~ s/,+/,/xg;       #Regular expression without "/x"
            $line =~ s/^\s*,|,\s*$|^\s*//xg; #Regular expression without "/x"
            
            foreach (split(/,/x, $line)) #Regular expression without "/x"
            {       
                push(@sudoers_matches_temp, $_ . "|" . $line_count);
            }
            $line_count+=1;
        }
    }
    @sudoers_matches=@sudoers_matches_temp; 
    my $num = '?:0|1|4|5|0-1|4-5';
    my $chmod_cmd = '[\/usr]*\/bin\/chmod\s*[\-\w\s]*';
    ################
    @matches = grep({ /^\s*$chmod_cmd(\[*[\d\-]+\]*){3}\s+[^\|]+\|/x } @sudoers_matches); #require block grep #Regular expression without "/x"  #ProhibitComplexRegexes
    ##Changes for defect 239070
    @matches=grep({ !/^\s*$chmod_cmd(\[*[0-7\-]+\]*){2}\[*($num)+\]*\s+[^\|]+\|/x } @matches);  #Regular expression without "/x"  #require block grep #ProhibitUnusedCapture  #ProhibitComplexRegexes
    
    foreach my $match (@matches)
    {
        ($cmd,$rest) = split(/\|/x, $match, 2); #Regular expression without "/x"
        $rest=$lineidToLine[$rest];
        $header = (split(/=/x, $rest, 2))[0];   #Regular expression without "/x"      
        my ($filename, $line_number, $master_text) = get_line_location_text($rest); #Sub called with "&"
        IssueViolation($header, $line_number, "$cmd", "Chmod need to use with [0-7][0-7][0145] permission",$master_text, $filename, "SFIT4994"); #Sub called with "&"
    }
    ###Changes for enhancement 180727
    foreach my $chmod_cmd (@chmod_matches)
    {
        ($header, $rest) = split(/=/x, $chmod_cmd, 2);    #Regular expression without "/x"
        my @cmds=split(/\,/x,$rest); #Regular expression without "/x"
        @chmod_cmds = grep({ /\/chmod/xg } @cmds);   #Regular expression without "/x"    #require block grep 
        my $regex = '\-+[R|v|f|silent|recursive|quiet|verbose]+\s*';
        foreach my $cmd (@chmod_cmds)
        {  
           next if($cmd =~ m/\!/xg);#Regular expression without "/x"
           if($cmd =~ m/[\/usr]*\/bin\/chmod\s*($regex)?([ug]?[o|a])\+(r*wx*)\s*(.*?)$/xg)#Regular expression without "/x"  #ProhibitComplexRegexes
           {
              my ($filename, $line_number, $master_text) = get_line_location_text($chmod_cmd);   #Sub called with "&"
              IssueViolation($header, $line_number, "$cmd", "Chmod with symbolic mode definition o+w is not allowed ",$master_text, $filename, "SFIT4994");       #Sub called with "&"  
           }        
        }           
    }
    return; #require final return
}

###Changes for Task 60432
sub check_IBM_NONE_ALL_entries
{
    my ($array_ref1) = @_;     #require argument unpacking        #Get reference of sudoers array and continue using it #Reused variable name in lexical scope
    if ($DEBUG)
    {
        print "\nIn check_IBM_NONE_ALL_entries\n";
    }
    my $header;
    my $rest;                   #strict_use
    my @sudoers_file1 = @{$array_ref1}; #Reused variable name in lexical scope #Double-sigil dereference
    my @sudoers_matches = grep({ !/Cmnd_Alias|User_Alias|Runas_Alias|Host_Alias|Defaults/x } @sudoers_file1); #Regular expression without "/x" #require block grep
    @sudoers_matches = grep({ /IBM_NONE_ALL/x } @sudoers_matches);   #Regular expression without "/x"  #require block grep
    
    ##########################

    foreach my $line (@sudoers_matches)
    {
         ($header, $rest) = split(/=/x, $line,2); #Regular expression without "/x"             
         my ($filename, $line_number, $master_text) = get_line_location_text($line); #Sub called with "&"
         IssueWarning($header, $line_number, "", "Alias IBM_NONE_ALL is used",$master_text, $filename, "SFIT60432"); #Sub called with "&"
    }
    return; #require final return

}

sub sudoers_runas_expansion {
my @array_ref=@_; ##require argument unpacking
my $header;             #strict_use
my $rest;               #strict_use
my @commands;           #strict_use
my $getalias;           #strict_use
my @tmparr;             #strict_use
my $tempalias;          #strict_use
my $finalalias;         #strict_use
my $tempcmd;            #strict_use
my $getgroup;           #strict_use
my @tmpgrp;             #strict_use
my $removedups;         #strict_use
my @removeduplicates;   #strict_use
my @finalduplicates;    #strict_use
my %fordups;            #strict_use
my %hash;               #strict_use
my $index1;             #strict_use
my $index;              #strict_use
my $command1;           #strict_use
my @runasarray;         #strict_use
my @runasfinal;         #strict_use
my @aliasarr;           #strict_use
my $grpvar;             #strict_use
my @grparr;             #strict_use
my $finalgrp;           #strict_use
my $finaldups;          #strict_use
my $final;              #strict_use
my $aliasexpanded;      #strict_use

    #for loop for getting one entry in the sudoers array at a time(line by line processing)
   # for (my $line=0;$line<=scalar(@array_ref)-1;$line++) #for (my $line=0;$line<=$#_;$line++)
    for (0..scalar(@array_ref)-1)
    {
        if(defined $array_ref[$_])
        {
            if($array_ref[$_]=~/^(Cmnd_Alias|User_Alias|Runas_Alias|Defaults)/x)  #Regular expression without "/x"
            {
                $runasfinal[$_]=$array_ref[$_];
                next;
            }
            #separating the lhs and rhs part . for example: ALL = /bin/vi will become $header=ALL and $rest=/bin/vi
            $header=substr $array_ref[$_],0,index($array_ref[$_],'=');
            $rest=substr $array_ref[$_],index($array_ref[$_],'=')+1;
        }
        if(defined $rest)
        {
            $rest =~ s/^\s+//x; #Regular expression without "/x"
        }   
        @runasarray=(); #reinitializing this array for each iteration
        #   @commands=split(',',$rest); #using this array for splitting on comma, for each line's input. for example : all=/bin/vi,/bin/ls will become @commands[0]=/bin/vi ,@commands[1]=/bin/ls , etc
        if(defined $rest)
        {
            @commands=split /,(?=[^\)]*(?:\(|$))/x,$rest; #ProhibitUnusedCapture  #Regular expression without "/x"
        }
        $index=0;
        $index1=0;
        foreach my $command(@commands) #get one command to process at a time, from the line input #perlcritic
        {
            $command =~ s/^\s+//x;  #Regular expression without "/x"
            if($command=~m/^\(([A-Za-z0-9_-|,%+\s]+)\)/x)  #Regular expression without "/x"
            {
                $getalias=$1;
                @tmparr=split /\,/x,$getalias;   #Regular expression without "/x" 
                #for($index=0;$index<=$#tmparr;$index++)
                for(0..$#tmparr)
                {
                    if(keys %User_Alias_hash_copy)
                    {
                        foreach my $forcmp(keys %User_Alias_hash_copy) #perlcritic
                        {
                            $tmparr[$_]=~ s/^\s+|\s+$//xg;  #Regular expression without "/x"
                            $tempalias=$tmparr[$_];
                            if($tempalias eq $forcmp)
                            {
                                $aliasexpanded=$User_Alias_hash_copy{$tempalias};
                                $aliasarr[$_]=$aliasexpanded;
                                last;
                            }
                            else
                            {
                                $aliasarr[$_]=$tmparr[$_];
                            }   
                        }
                    }
                    else
                    {
                         $tmparr[$_]=~ s/^\s+|\s+$//xg;  #Regular expression without "/x"
                         $tempalias=$tmparr[$_];
                         $aliasarr[$_]=$tmparr[$_];
                    }
                  $index=$_;

                }
                $index = $index+1;
                $tempcmd=substr $command,index($command,')')+1;
                my %foralias1  = map { $_ => 1 } @aliasarr;
                my @finalaliasarr = keys %foralias1;
                $finalalias=join(',',@finalaliasarr);
                $command="($finalalias)$tempcmd";
                @aliasarr=();
                @finalaliasarr=();

            }
            #groups in runas
            if(($command=~m/^\(([A-Za-z0-9_-|%,+]+)\)/x)&&($EXTENDED_CHECK_USER))  #Regular expression without "/x"
            {
                $getgroup=$1;
                @tmpgrp=split /\,/x,$getgroup; #Regular expression without "/x"
                if(keys %groups)
                {
                    #for($index=0;$index<=$#tmpgrp;$index++)
                    for(0..$#tmpgrp)
                    {
                        $tmpgrp[$_]=~ s/^\s+|\s+$//xg;  #Regular expression without "/x"
                        if($tmpgrp[$_]=~/^\%(_PLUS_)?([A-Za-z0-9-_+\s]+)/x) #Regular expression without "/x"
                        {
                            $grpvar=$2;
                        }
                        else
                        {
                            $grparr[$_]=$tmpgrp[$_];
                            next;
                        }
                        foreach my $forgrp(keys %groups) #perlcritic
                        {
                            if($grpvar eq $forgrp)
                            {                   
                                $aliasexpanded=$groups{$grpvar};
                                $grparr[$_]=$aliasexpanded;
                                last;
                            }
                            else
                            {
                                $grparr[$_]=$tmpgrp[$_];
                            }
                        }

                    }
        
                }
                else
                {
                    $tmpgrp[$index]=~ s/^\s+|\s+$//xg; #Regular expression without "/x"
                    $grparr[$index]=$tmpgrp[$index];
                }
                $tempcmd=substr $command,index($command,')')+1;
                my %forgrp1  = map { $_ => 1 } @grparr;
                my @finalgrparr = keys %forgrp1;
                $finalgrp=join(',',@finalgrparr);
                $command="($finalgrp)$tempcmd";
                @grparr=();
                @finalgrparr=();
            }
            #handle duplicates
            if($command=~m/^\(([A-Za-z0-9_-|%,+\s]+)\)/x)#Regular expression without "/x"
            {
                $removedups=$1;
                $tempcmd=substr $command,index($command,')')+1;
                @removeduplicates=split /\,/x,$removedups; #Regular expression without "/x"
                %fordups= map { $_ => 1 } @removeduplicates;
                @finalduplicates= keys %fordups;
                $finaldups=join('@',@finalduplicates);
                $command="($finaldups)$tempcmd";
                @removeduplicates=();
                @finalduplicates=();
            }

            if($command=~m/^\((.*?)\)/x)  #Regular expression without "/x"
            {
                $hash{$index1}= $1;
                $index1=$index1+1;
            }
            else
            {
                #if the command is at the first position of the line input , and has no runas user specified, then initialize its runas user to root and add it to a hash.
                if($index1 == 0)
                {
                    $hash{$index1}="root";
                    $index1=$index1+1;
                }
                #if the command has no runas user specified, then assign the runas user which is assigned to its previous command , as the sudoers file is processed from left to right
                else
                {
                    $hash{$index1}=$hash{$index1-1};
                    $index1=$index1+1;
                }
            }
        }
        #loop for merging the results of rhs with the lhs and then adding the results to the final @runasfinal array.
        #for($command1=0;$command1<=$#commands;$command1++)
        for(0..$#commands)
        {
            #if the input string contained runas user already, then print the string as it was originally
            if($commands[$_]=~/^\((.*?)\)/x)  #Regular expression without "/x"
            {
                $runasarray[$_]="$commands[$_]";#@runasarray[$_]="$commands[$_]";
            }
            #if the input string did not contain any runas user at the time of input, then add the runas user by using the value which is previously calculated in the hash.
            else
            {
                $runasarray[$_]="($hash{$_})$commands[$_]"; #@runasarray[$_]="($hash{$_})$commands[$_]";
                #   print "@runasarray[$_]\n";
            }
        }
        #use $final to get the whole processed line in one variable. for example : ALL=/bin/vi,(pankaj)/bin/ls,/var/log   will become => ALL= (root)/bin/vi,(pankaj)/bin/ls,(pankaj)/var/log
        $final=join(',',@runasarray);
        #put each processed line back in a final array (@runasfinal).
        $runasfinal[$_]="$header = $final"; #@runasfinal[$_]="$header = $final";
    }
    return @runasfinal;
}

# Load template version file into hash %Sudo_Template_Versions
sub load_template_version_file #Sub called with "&"
{
    if ($DEBUG)
    {
        print "In load_template_version_file\n";
    }
    my $templates_dir1 = "/etc/sfit/template_versions"; ##Reused variable name in lexical scope
    if ( -d $templates_dir1)
    {
        my @template_files1 = (); ##Reused variable name in lexical scope
        @template_files1 = glob "$templates_dir1/MINIMUM_TEMPLATE_VERSIONS_*.txt";      
        if(@template_files1)
        {
            foreach my $file(@template_files1)
            {
                if ( -f $file && -s $file )
                {
                    if ($DEBUG)
                    {
                        print "Reading Template Version File : $file\n";
                    }                
                    my $template_version_file_handle = IO::File->new("$file", "<");     #prohibit indirect syntax            
                    while (my $line = <$template_version_file_handle>)
                    {
                        chomp($line);
                        if ($line =~ m/^\s*\S+\s*\=\s*(\d+\s*$|(\d+\.){1,}\d+\s*$)/x) #Regular expression without "/x" # check for digit versions ex. 1, 1.1, 1.2.3 
                        {                       
                            my ($template_name, $template_min_version) = split(/=/x,$line,2); #Regular expression without "/x"
                            $template_name = trim($template_name); #Sub called with "&"
                            $template_min_version = trim($template_min_version); #Sub called with "&"
                            if ($DEBUG)
                            {
                                print "Template Name = $template_name \t Template Min Version = $template_min_version\n";
                            }   
                            $Sudo_Template_Versions{$template_name}=$template_min_version;
                        }   
                    }               
                    $template_version_file_handle->close();
                }
                else
                {
                    if ($DEBUG)
                    {
                        print "$file does not exist or is empty!\n";
                    }                   
                }   
            }           
        }
        else
        {
            IssueNote("", "", "", "Directory $templates_dir1 does not contain any file! template version check has been skipped", "", "", "SFIT331843"); #Sub called with "&"
            if ($DEBUG)
            {
                print "Templates Directory $templates_dir1 does not contain version files in .txt format!"
            }
        }
        if ($DEBUG)
        {
            if (%Sudo_Template_Versions)
            {
                print "\nPrinting Template Hash:\n";
                foreach my $template_name (keys %Sudo_Template_Versions)
                {             
                    print "$template_name => $Sudo_Template_Versions{$template_name}\n";
                }   
            }
            else
            {
                print "Template Hash is empty\n";
            }   
        }   
    }
    else
    {   
        IssueNote("", "", "", "Directory $templates_dir1 does not exist! template version check has been skipped", "", "", "SFIT331843"); #Sub called with "&"
        if ($DEBUG)
        {
            print "Templates Directory $templates_dir1 does not exist!";
        }
    }
return; #require final return   
}

sub check_sudo_template_file_min_reqd_version #Sub called with "&"
{
    my($INC_TYPE,$INC_FILE,$file_getline)=@_; ###require argument unpacking 
    if ($DEBUG)
    {
        print "\nIn check_sudo_template_file_min_reqd_version\n\n";
    }
    
    
    my $basefilename = basename(abs_path($INC_FILE));
    my $templateNameToCheck = $basefilename;    
    
    if ( $templateNameToCheck =~ /\.txt$/x)  #Regular expression without "/x"
    {
        my $templateNameToCheck_rev = reverse $templateNameToCheck;
        my ($extn, $rev_temp_name) = split(/\_/x, $templateNameToCheck_rev, 2);   #Regular expression without "/x"    
        if (defined $rev_temp_name )
        {
            $templateNameToCheck = reverse $rev_temp_name;      
        }
    }

    if ($DEBUG)
    {
        print "\$filepath=$INC_FILE\n";
        print "Type=$INC_TYPE\n";
        print "basefilename=$basefilename\n";
        print "file_getline=$file_getline\n";
        print "Template to check in hash = $templateNameToCheck\n";
    }
    if(exists $Sudo_Template_Versions{$templateNameToCheck})
    {       
        if ($DEBUG)
        {
            print "$basefilename is a standard template file\n";
        }       
        my $template_file_handle = IO::File->new("$INC_FILE", "<"); #prohibit indirect syntax   
        my $line = <$template_file_handle>;  #Extracting first line only
        $template_file_handle->close();
        
        if ($line =~ /^\#\s+Begin.+\s+Ver\s+([\d\.]*\d)\s+.+\s+Begin\s+\#\s*$/x) #Regular expression without "/x"# works more precise match till end.
        {                   
            my $version_in_template_sudoers_file=$1;
            my $min_required_template_version=$Sudo_Template_Versions{$templateNameToCheck};
            if ($DEBUG)
            {
                print "Template_version matched : $line\n"; 
                print "version_in_template_sudoers_file=$version_in_template_sudoers_file\n";
                print "min_required_template_version = $min_required_template_version\n";
            }   
            
            # get_larger_version returns larger value or equal string
            my $version_return_val = get_larger_version("$min_required_template_version","$version_in_template_sudoers_file"); #Sub called with "&"
            if ($DEBUG)
            {
                print "version_return_val = $version_return_val\n";
            }   
            
            # check if min_required_template_version is greater version than in the template file 
            if ( $version_return_val == 1 ) #ProhibitMismatchedOperators
            {
                my ($filename, $line_number, $master_text) = get_line_location_text("$INC_TYPE $file_getline");  #Sub called with "&"   
                if ($line_number eq "")
                {
                    $INC_TYPE="#includedir";
                    $file_getline=dirname($file_getline);
                    ($filename, $line_number, $master_text) = get_line_location_text("$INC_TYPE $file_getline"); #Sub called with "&"
                }
                if ( $basefilename eq "sudoers" )
                {
                    IssueWarning("$basefilename","1","$basefilename","Outdated sudoers global template used. Minimum version required $min_required_template_version while existing is $version_in_template_sudoers_file","master","$basefilename", "SFIT331843"); #Sub called with "&"
                }
                elsif ( $basefilename eq $config_basefilename )
                {
                    IssueWarning("$basefilename","1","$basefilename","Outdated global template used. Minimum version required $min_required_template_version while existing is $version_in_template_sudoers_file","master","$basefilename", "SFIT331843"); #Sub called with "&"
                }
                else
                {
                    IssueWarning("$INC_TYPE $file_getline","$line_number","$basefilename","Outdated global template used. Minimum version required $min_required_template_version while existing is $version_in_template_sudoers_file","$master_text","$filename", "SFIT331843"); #Sub called with "&"
                }
            }
        }
        else #Show Warning about version missing in template
        {
            my ($filename, $line_number, $master_text) = get_line_location_text("$INC_TYPE $file_getline"); #Sub called with "&"
            if ((defined $line_number) && ($line_number eq ""))
            {
                $INC_TYPE="#includedir";
                $file_getline=dirname($file_getline);
                ($filename, $line_number, $master_text) = get_line_location_text("$INC_TYPE $file_getline"); #Sub called with "&"
            }
            if ( $basefilename eq "sudoers" )
            {
                IssueWarning("$basefilename","1","$basefilename","Version not defined in sudoers template file","master","$basefilename", "SFIT331843"); #Sub called with "&"
            }
            elsif ( $basefilename eq $config_basefilename )
            {
                IssueWarning("$basefilename","1","$basefilename","Version not defined in template file","master","$basefilename", "SFIT331843"); #Sub called with "&"
            }
            else
            {
                IssueWarning("$INC_TYPE $file_getline","$line_number","$basefilename","Version not defined in template file","$master_text","$filename", "SFIT331843"); #Sub called with "&"
            }
            if ($DEBUG)
            {
                print "Version Not defined in template file\n";
            }
        }
    }
    else 
    {
        if ($DEBUG)
        {
            print "File $basefilename is NOT a standard template file\n";
        }   
    }   
    return; #require final return
}

# This function takes 2 argument values and returns larger value or "equal" string
# This function omits leading zeroes E.x 1.5 and 1.05 are equal while 1.5 and 1.50 are not-equal
# 1.2.3.0.0 equals 1.2.3 

# sub get_larger_version returns 3 types of values : 
# 1  : $ref > $usr
# -1 : $ref < $usr
# 0  : $ref eq $usr 
 sub get_larger_version()
{
    my $ref = shift;
    my $usr = shift;        
    my @ref_arr = split(/\./x,$ref); #Regular expression without "/x"
    my @usr_arr = split(/\./x,$usr); #Regular expression without "/x"
        
    for(my $i=0;$i<=$#ref_arr and $i<=$#usr_arr ;$i++)
    {           
        if ( $ref_arr[$i] > $usr_arr[$i] )
        {
            return 1;           
        }
        elsif ( $ref_arr[$i] < $usr_arr[$i] )
        {
            return -1;          
        }
    }   
    return 0;
}