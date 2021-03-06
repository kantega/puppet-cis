# 6.2.13 Ensure users' .netrc Files are not group or world accessible
#
#
# Description:
# While the system administrator can establish secure permissions for users' .netrc files, the users can easily override these.
#
# @summary 6.2.13 Ensure users' .netrc Files are not group or world accessible
#
# @example
#   include cis::6_2_13
class cis::cis_6_2_13 (
  Boolean $enforced = true,
) {

  if $enforced {
    file { '/usr/local/bin/cis_6_2_13.sh':
      owner   => 'root',
      group   => 'root',
      mode    => '0711',
      content => file('cis/cis_6_2_13.sh'),
    }
    if !($facts[ 'cis_6_2_13' ].empty) {
      notify { 'cis_6_2_13':
        message  => 'Not in compliance with CIS 6.2.13 (Scored). There are .netrc files that are either group or world accessible.',
        loglevel => 'warning',
      }
    }
  }
}
