# 6.2.7 Ensure users' home directories permissions are 750 or more restrictive (Scored)
#
#
# Description:
# While the system administrator can establish secure permissions for users' home directories, the users can easily override these.
#
# @summary 6.2.7 Ensure users' home directories permissions are 750 or more restrictive (Scored)
#
# @example
#   include cis::6_2_7
class cis::cis_6_2_7 (
  Boolean $enforced = true,
) {
  if $enforced {
    file { '/usr/local/bin/cis_6_2_7.sh':
      owner   => 'root',
      group   => 'root',
      mode    => '0711',
      content => file('cis/cis_6_2_7.sh')
    }
    if !($facts['cis_6_2_7'].empty) {
      notify { 'cis_6_2_7':
        message  => 'Not in compliance with CIS 6.2.7 (Scored). One or more user directories have permissions less restrictive than 750. Check the home_directory_permission fact for details', # lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
