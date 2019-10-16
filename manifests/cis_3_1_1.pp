# 3.1.1 Ensure IP forwarding is disabled (Scored)
#
# Description:
# The net.ipv4.ip_forward flag is used to tell the system whether it can forward packets or not.
#
# Rationale:
# Setting the flag to 0 ensures that a system with multiple interfaces (for example, a hard proxy),
# will never be able to forward packets, and therefore, never serve as a router.
#
# @summary 3.1.1 Ensure IP forwarding is disabled (Scored)
#
# @example
#   include cis::3_1_1
class cis::cis_3_1_1 (
  Boolean $enforced = true,
) {

  if $enforced {
    sysctl { 'net.ipv4.ip_forward':
      value => 0,
    }~>exec { 'net.ipv4.ip_forward route flush':
      command     => 'sysctl -w net.ipv4.route.flush=1',
      refreshonly => true,
      user        => 'root',
      path        => '/sbin'
    }
  }
}
