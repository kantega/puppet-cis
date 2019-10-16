# 6.2.17 Ensure no duplicate GIDs exist (Scored)
#
#
# Description:
# Although the groupadd program will not let you create a duplicate Group ID (GID), it is possible for an administrator
# to manually edit the /etc/group file and change the GID field.
#
# @summary 6.2.17 Ensure no duplicate GIDs exist (Scored)
#
# @example
#   include cis::6_2_17
class cis::cis_6_2_17 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/usr/local/bin/cis_6_2_17.sh':
      owner   => 'root',
      group   => 'root',
      mode    => '0711',
      content => file('cis/cis_6_2_17.sh'),
    }

    if !($facts['cis_6_2_17'].empty) {
      notify { 'cis_6_2_17':
        message  => 'Not in compliance with CIS 6.2.17 (Scored). There are duplicate GIDs that exist in /etc/group',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
