# 6.2.9 Ensure users own their home directories (Scored)
#
#
# Description:
# The user home directory is space defined for the particular user to set local environment variables and to store personal files.
#
# @summary 6.2.9 Ensure users own their home directories (Scored)
#
# @example
#   include cis::6_2_9
class cis::cis_6_2_9 (
  Boolean $enforced = true,
) {

  if $enforced {
    file { 'users own their home directory check script':
      path    => '/usr/local/bin/cis_6_2_9.sh',
      owner   => 'root',
      group   => 'root',
      mode    => '0711',
      content => file('cis/cis_6_2_9.sh')
    }
    if !($facts[ 'cis_6_2_9' ].empty) {
      notify { 'cis_6_2_9':
        message  => 'Not in compliance with CIS 6.2.9 (Scored). You have a home directory that is not owned by a user. Check the home_directory_owner fact for details',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
