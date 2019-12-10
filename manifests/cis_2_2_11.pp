# 2.2.11 Ensure DNS Server is not enabled (Scored)
#
# Description:
# The Domain Name System (DNS) is a hierarchical naming system that maps names to IP addresses for computers,
# services and other resources connected to a network.
#
# Rationale:
# Unless a system is specifically designated to act as a DNS server,
# it is recommended that the service be disabled to reduce the potential attack surface.
#
# @summary 2.2.11 Ensure DNS Server is not enabled (Scored)
#
# @example
#   include cis::2_2_11
class cis::cis_2_2_11 (
  Boolean $enforced = true,
) {

  if $enforced {
    service { 'named':
      ensure => stopped,
      enable => false,
    }
  }
}
