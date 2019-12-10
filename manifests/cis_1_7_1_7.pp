# 1.7.1.7 Ensure the MCS Translation Service (mcstrans) is not installed (Scored)
#
#
# Description:
# The mcstransd daemon provides category label information to client processes requesting information. The label
# translations are defined in /etc/selinux/targeted/setrans.conf
#
# @summary 1.7.1.7 Ensure the MCS Translation Service (mcstrans) is not installed (Scored)
#
# @example
#   include cis::1_7_1_7
class cis::cis_1_7_1_7 (
  Boolean $enforced = true,
) {
  if $enforced {
    package { 'mcstrans':
      ensure => purged,
    }
  }
}
