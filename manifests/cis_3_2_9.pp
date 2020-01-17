# 3.2.9 Ensure IPv6 router advertisements are not accepted (Not Scored)
#
# Description:
# This setting disables the system's ability to accept IPv6 router advertisements.
#
# Rationale:
# It is recommended that systems not accept router advertisements as they could be tricked
# into routing traffic to compromised machines. Setting hard routes within the system
# (usually a single default route to a trusted router) protects the system from bad routes.
#
# @summary 3.2.9 Ensure IPv6 router advertisements are not accepted (Not Scored)
#
# @example
#   include cis::3_2_9
class cis::cis_3_2_9 (
  Boolean $enforced = true,
  Boolean $ipv6_enabled = true,
) {

  if $enforced and $ipv6_enabled {

    sysctl { 'net.ipv6.conf.all.accept_ra':
      value => 0,
    }->sysctl { 'net.ipv6.conf.default.accept_ra':
      value => 0,
    }~>exec { 'cis_3_2_9 route flush':
      command     => 'sysctl -w net.ipv6.route.flush=1',
      refreshonly => true,
      user        => 'root',
      path        => '/sbin',
    }
  }
}
