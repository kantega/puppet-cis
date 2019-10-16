# 1.6.2 Ensure SELinux is installed (Scored)
#
#
# Description:
# SELinux provides Mandatory Access Controls.
#
# @summary 1.6.2 Ensure SELinux is installed (Scored)
#
# @example
#   include cis::1_6_2
class cis::cis_1_6_2 (
  Boolean $enforced = true,
) {
  if $enforced {
    package { 'libselinux':
      ensure => present,
    }
  }
}
