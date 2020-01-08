# 5.5.5 Ensure default user umask is 027 or more restrictive (Scored)
#
#
# Description:
# The default umask determines the permissions of files created by users. The user creating the file has the discretion of making
# their files and directories readable by others via the chmod command. Users who wish to allow their files and directories to be
# readable by others by default may choose a different default umask by inserting the umask command into the standard shell
# configuration files ( .profile , .bashrc , etc.) in their home directories.
#
# @summary 5.5.5 Ensure default user umask is 027 or more restrictive (Scored)
#
# @example
#   include cis::redhat7::cis_5_5_5
class cis::cis_5_5_5 (
  Boolean $enforced = true,
) {

  if $enforced {
    file_line { 'bashrc':
      path => '/etc/bashrc',
      line => 'umask 027',
    }
    file_line { 'profile':
      path => '/etc/profile',
      line => 'umask 027',
    }
  }
}
