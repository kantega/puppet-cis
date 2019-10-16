# 3.3.3 Ensure IPv6 is disabled (Not Scored)
#
# Description:
# Although IPv6 has many advantages over IPv4, few organizations have implemented IPv6.
#
# Rationale:
# If IPv6 is not to be used, it is recommended that it be disabled to reduce the attack surface
# of the system.
#
# @summary 3.3.3 Ensure IPv6 is disabled (Not Scored)
#
# @example
#   include cis::3_3_3
class cis::cis_3_3_3 (
  Boolean $enforced = true,
  Boolean $ipv6_enabled = true,
) {

  if $enforced and !$ipv6_enabled {

    # PS: Disabling IPv6 with sysctls can cause SSH XForwarding to break
    # Ref: https://www.thegeekdiary.com/centos-rhel-7-how-to-disable-ipv6/

    sysctl { 'net.ipv6.conf.all.disable_ipv6':
      value => 1,
    }->sysctl { 'net.ipv6.conf.default.disable_ipv6':
      value => 1,
    }~>exec { 'cis_3_3_3 route flush':
      command     => 'sysctl -w net.ipv6.route.flush=1',
      refreshonly => true,
      user        => 'root',
      path        => '/sbin',
    }
  }
}
