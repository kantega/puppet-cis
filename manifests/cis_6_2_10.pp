# 6.2.10 Ensure users' dot files are not group or world writable (Scored)
#
#
# Description:
# While the system administrator can establish secure permissions for users' "dot" files, the users can easily override these.
#
# @summary 6.2.10 Ensure users' dot files are not group or world writable (Scored)
#
# @example
#   include cis::6_2_10
class cis::cis_6_2_10 (
  Boolean $enforced = true,
) {

  if $enforced {
    file { 'users dot files world readable check script':
      ensure  => file,
      path    => '/usr/local/bin/cis_6_2_10.sh',
      owner   => 'root',
      group   => 'root',
      mode    => '0711',
      content => file('cis/cis_6_2_10.sh'),
    }
    if $facts['cis_6_2_10'] != '' {
      notify { 'cis_6_2_10':
        message  => 'Not in compliance with CIS 6.2.10 (Scored). There are DOT files that are either group or world writable. Check the dot_file_writable fact for details',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
