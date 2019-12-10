# 1.7.1.1 Ensure SELinux is installed (Scored)
#
#
# Description:
# SELinux provides Mandatory Access Controls.
#
# @summary 1.7.1.1 Ensure SELinux is installed (Scored)
#
# @example
#   include cis::1_7_1_1
class cis::cis_1_7_1_1 (
  Boolean $enforced = true,
) {
  if $enforced {
    package { 'libselinux':
      ensure => present,
    }
  }
}
