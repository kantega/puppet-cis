# 6.2.7 Ensure all users' home directories exist (Scored)
#
#
# Description:
# Users can be defined in /etc/passwd without a home directory or with a home directory that does not actually exist.
#
# @summary 6.2.7 Ensure all users' home directories exist (Scored)
#
# @example
#   include cis::6_2_7
class cis::cis_6_2_7 (
  Boolean $enforced = true,
) {

  if $enforced {
    file { 'all users have home directory check script':
      ensure  => file,
      path    => '/usr/local/bin/cis_6_2_7.sh',
      owner   => 'root',
      group   => 'root',
      mode    => '0711',
      content => file('cis/cis_6_2_7.sh')
    }

    if $facts['cis_6_2_7'] {
      notify { 'cis_6_2_7':
        message  => 'Not in compliance with CIS 6.2.7 (Scored). You have a user(s) that does not have a home directory. Check the home_directory fact for details',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
