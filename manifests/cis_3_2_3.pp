# 3.2.3 Ensure secure ICMP redirects are not accepted (Scored)
#
# Description:
# Secure ICMP redirects are the same as ICMP redirects, except they come from gateways listed on the default gateway list.
# It is assumed that these gateways are known to your system, and that they are likely to be secure.
#
# Rationale:
# It is still possible for even known gateways to be compromised. Setting net.ipv4.conf.all.secure_redirects to 0 protects
# the system from routing table updates by possibly compromised known gateways.
#
# @summary 3.2.3 Ensure secure ICMP redirects are not accepted (Scored)
#
# @example
#   include cis::3_2_3
class cis::cis_3_2_3 (
  Boolean $enforced = true,
) {

  if $enforced {
    sysctl { 'net.ipv4.conf.all.secure_redirects':
      value => 0,
    }->sysctl { 'net.ipv4.conf.default.secure_redirects':
      value => 0,
    }~>exec { 'cis_3_2_3 route flush':
      command     => 'sysctl -w net.ipv4.route.flush=1',
      refreshonly => true,
      user        => 'root',
      path        => '/sbin',
    }
  }
}
