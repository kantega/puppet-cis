# 6.1.6 Ensure permissions on /etc/passwd- are configured (Scored)
#
# Description:
# The /etc/passwd- file contains backup user account information.
#
# @summary 6.1.6 Ensure permissions on /etc/passwd- are configured (Scored)
#
# @example
#   include cis::6_1_6
class cis::cis_6_1_6 (
  Boolean $enforced = true,
) {
  if $enforced {
    file {'/etc/passwd-':
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
  }
}
