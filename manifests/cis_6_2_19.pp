# 6.2.19 Ensure shadow group is empty (Scored)
#
# Description:
#
# The shadow group allows system programs which require access the ability to read the
# /etc/shadow file. No users should be assigned to the shadow group.
#
# Rationale:
#
# Any users assigned to the shadow group would be granted read access to the /etc/shadow
# file. If attackers can gain read access to the /etc/shadow file, they can easily run a password
# cracking program against the hashed passwords to break them. Other security information
# that is stored in the /etc/shadow file (such as expiration) could also be useful to subvert
# additional user accounts.
#
# @summary 6.2.19 Ensure shadow group is empty (Scored)
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
        message  => 'Not in compliance with CIS 6.2.19 (Scored). Shadow group is not empty',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
