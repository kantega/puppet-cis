# 6.2.10 Ensure no users have .forward files (Scored)
#
#
# Description:
# The .forward file specifies an email address to forward the user's mail to.
#
# @summary 6.2.10 Ensure no users have .forward files (Scored)
#
# @example
#   include cis::6_2_10
class cis::cis_6_2_10 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { 'users have no .forward files check script':
      ensure  => file,
      path    => '/usr/local/bin/cis_6_2_10.sh',
      owner   => 'root',
      group   => 'root',
      mode    => '0711',
      content => file('cis/cis_6_2_10.sh'),
    }

    if !($facts['cis_6_2_10'].empty) {
      notify { 'cis_6_2_10':
        message  => 'Not in compliance with CIS 6.2.10 (Scored). There are .forward files on the system. Check the forward_files fact for details',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
