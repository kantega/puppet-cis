# 1.8.1.4 Ensure permissions on /etc/motd are configured (Not Scored)
#
#
# Description:
# The contents of the /etc/motd file are displayed to users after login and function as a message of the day for authenticated users.
#
# @summary 1.8.1.4 Ensure permissions on /etc/motd are configured (Not Scored)
#
# @example
#   include cis::1_8_1_4
class cis::cis_1_8_1_4 (
  Boolean $enforced = true,
) {
  if $enforced {
    file { '/etc/motd':
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
  }
}
