# 6.2.6 Ensure root PATH Integrity (Scored)
#
# @summary 6.2.6 Ensure root PATH Integrity (Scored)
#
# @example
#   include cis::6_2_6
class cis::cis_6_2_6 (
  Boolean $enforced = true,
) {

  if $enforced {
    file { 'root path integrity check script':
      ensure  => file,
      path    => '/usr/local/bin/cis_6_2_6.sh',
      owner   => 'root',
      group   => 'root',
      mode    => '0711',
      content => file('cis/cis_6_2_6.sh'),
    }
    if $facts['cis_6_2_6'] {
      notify { 'cis_6_2_6':
        message  => 'Not in compliance with CIS 6.2.6 (Scored). There is a "." or other writable directory in the root executable path. Check the root_path fact for details',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
