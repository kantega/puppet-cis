# 6.2.20 Ensure all users' home directories exist (Scored)
#
#
# Description:
# Users can be defined in /etc/passwd without a home directory or with a home directory that does not actually exist.
#
# @summary 6.2.20 Ensure all users' home directories exist (Scored)
#
# @example
#   include cis::6_2_20
class cis::cis_6_2_20 (
  Boolean $enforced = true,
  Array[String] $exclude_users = [],
) {
  $exclude_users_real = concat($exclude_users, [ 'shutdown', 'halt', 'sync' ])
  $exclude_users_string = join($exclude_users_real, '|')

  if $enforced {
    file { 'all users have home directory check script':
      ensure  => file,
      path    => '/usr/local/bin/cis_6_2_20.sh',
      owner   => 'root',
      group   => 'root',
      mode    => '0711',
      content => template('cis/cis_6_2_20.sh.erb')
    }

    if $facts['cis_6_2_20'] != '' {
      notify { 'cis_6_2_20':
        message  => 'Not in compliance with CIS 6.2.20 (Scored). You have a user(s) that does not have a home directory.',
        loglevel => 'warning',
      }
    }
  }
}
