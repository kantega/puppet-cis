# 6.2.18 Ensure no duplicate user names exist (Scored)
#
#
# Description:
# Although the useradd program will not let you create a duplicate user name, it is possible for an administrator to manually
# edit the /etc/passwd file and change the user name.
#
# @summary 6.2.18 Ensure no duplicate user names exist (Scored)
#
# @example
#   include cis::6_2_18
class cis::cis_6_2_18 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/usr/local/bin/cis_6_2_18.sh':
      owner   => 'root',
      group   => 'root',
      mode    => '0711',
      content => file('cis/cis_6_2_18.sh'),
    }

    if !($facts['cis_6_2_18'].empty) {

      notify { 'cis_6_2_18':
        message  => 'Not in compliance with CIS 6.2.18 (Scored). There is a duplicate user name(s) in /etc/passwd. Check the duplicate_user fact for details',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
