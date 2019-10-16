# 1.1.22 Disable Automounting (Scored)
#
#
# Description:
# autofs allows automatic mounting of devices, typically including CD/DVDs and USB drives.
#
# @summary 1.1.22 Disable Automounting (Scored)
#
# @example
#   include cis::1_1_22
class cis::cis_1_1_22 (
  Boolean $enforced = true,
) {
  if $enforced {
    service { 'disable automounting':
      ensure => stopped,
      name   => 'autofs',
      enable => false,
    }
  }
}
