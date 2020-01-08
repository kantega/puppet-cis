# 6.2.11 Ensure no users have .netrc files (Scored)
#
#
# Description:
# The .netrc file contains data for logging into a remote host for file transfers via FTP.
#
# @summary 6.2.11 Ensure no users have .netrc files (Scored)
#
# @example
#   include cis::6_2_11
class cis::cis_6_2_11 (
  Boolean $enforced = true,
) {

  if $enforced {
    file { '/usr/local/bin/cis_6_2_11.sh':
      owner   => 'root',
      group   => 'root',
      mode    => '0711',
      content => file('cis/cis_6_2_11.sh'),
    }
    if !($facts[ 'cis_6_2_11' ].empty) {
      notify { 'cis_6_2_11':
        message  => 'Not in compliance with CIS 6.2.11 (Scored). There are .netrc files on the system.',
        loglevel => 'warning',
      }
    }
  }
}
