# 6.2.15 Ensure all groups in /etc/passwd exist in /etc/group (Scored)
#
#
# Description:
# Over time, system administration errors and changes can lead to groups being defined in /etc/passwd but not in /etc/group
#
# @summary 6.2.15 Ensure all groups in /etc/passwd exist in /etc/group (Scored)
#
# @example
#   include cis::6_2_15
class cis::cis_6_2_15 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/usr/local/bin/cis_6_2_15.sh':
      owner   => 'root',
      group   => 'root',
      mode    => '0711',
      content => file('cis/cis_6_2_15.sh'),
    }
    if !($facts['cis_6_2_15'].empty) {
      notify { 'cis_6_2_15':
        message  => 'Not in compliance with CIS 6.2.15 (Scored). There is a group(s) in /etc/passwd that does not exist in /etc/group.', # lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
