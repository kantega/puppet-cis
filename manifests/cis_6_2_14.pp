# 6.2.14 Ensure no users have .rhosts files (Scored)
#
#
# Description:
# While no .rhosts files are shipped by default, users can easily create them.
#
# @summary 6.2.14 Ensure no users have .rhosts files (Scored)
#
# @example
#   include cis::6_2_14
class cis::cis_6_2_14 (
  Boolean $enforced = true,
) {

  if $enforced {
    file { '/usr/local/bin/cis_6_2_14.sh':
      owner   => 'root',
      group   => 'root',
      mode    => '0711',
      content => file('cis/cis_6_2_14.sh'),
    }
    if !($facts['cis_6_2_14'].empty) {
      notify { 'cis_6_2_14':
        message  => 'Not in compliance with CIS 6.2.14 (Scored). A user(s) has .rhost files in their home directory.',
        loglevel => 'warning',
      }
    }
  }
}
