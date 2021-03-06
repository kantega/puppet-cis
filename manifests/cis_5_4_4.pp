# 5.4.4 Ensure default user umask is 027 or more restrictive (Scored)
#
#
# Description:
# The default umask determines the permissions of files created by users. The user creating the file has the discretion of making
# their files and directories readable by others via the chmod command. Users who wish to allow their files and directories to be
# readable by others by default may choose a different default umask by inserting the umask command into the standard shell
# configuration files ( .profile , .bashrc , etc.) in their home directories.
#
# @summary 5.4.4 Ensure default user umask is 027 or more restrictive (Scored)
#
# @example
#   include cis::redhat7::cis_5_4_4
class cis::cis_5_4_4 (
  Boolean $enforced = true,
  String  $umask    = '027',
) {

  if $enforced {
    file_line { 'bashrc':
      path => '/etc/bashrc',
      line => "umask ${umask}",
      match => '^umask ',
    }
    file_line { 'profile':
      path  => '/etc/profile',
      line  => "umask ${umask}",
      match => '^umask ',
    }
  }
}
