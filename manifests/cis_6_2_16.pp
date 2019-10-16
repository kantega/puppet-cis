# 6.2.16 Ensure no duplicate UIDs exist (Scored)
#
#
# Description:
# Although the useradd program will not let you create a duplicate User ID (UID),
# it is possible for an administrator to manually edit the /etc/passwd file and change the UID field.
#
# @summary 6.2.16 Ensure no duplicate UIDs exist (Scored)
#
# @example
#   include cis::6_2_16
class cis::cis_6_2_16 (
  Boolean $enforced = true,
) {

  if $enforced {
    file { '/usr/local/bin/cis_6_2_16.sh':
      owner   => 'root',
      group   => 'root',
      mode    => '0711',
      content => file('cis/cis_6_2_16.sh'),
      # source => 'puppet:///modules/cis/dup_uid.sh',
    }

    if !($facts['cis_6_2_16'].empty) {

      notify { 'cis_6_2_16':
        message  => 'Not in compliance with CIS 6.2.16 (Scored). There are duplicate UIDs in /etc/passwd.',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
