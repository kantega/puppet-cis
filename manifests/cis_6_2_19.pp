# 6.2.19 Ensure no duplicate group names exist (Scored)
#
#
# Description:
# Although the groupadd program will not let you create a duplicate group name, it is possible for an administrator to manually edit
# the /etc/group file and change the group name.
#
# @summary 6.2.19 Ensure no duplicate group names exist (Scored)
#
# @example
#   include cis::6_2_19
class cis::cis_6_2_19 (
  Boolean $enforced = true,
) {

  if $enforced {
    file { '/usr/local/bin/cis_6_2_19.sh':
      owner   => 'root',
      group   => 'root',
      mode    => '0711',
      content => file('cis/cis_6_2_19.sh'),
    }
    if !($facts['cis_6_2_19'].empty) {
      notify { 'cis_6_2_19':
        message  => 'Not in compliance with CIS 6.2.19 (Scored). There is a duplicate group name(s) in /etc/group',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
