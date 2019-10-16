# 3.5.1 Ensure DCCP is disabled (Not Scored)
#
# Description:
# The Datagram Congestion Control Protocol (DCCP) is a transport layer protocol that
# supports streaming media and telephony. DCCP provides a way to gain access to
# congestion control, without having to do it at the application layer, but does not provide insequence
# delivery.
#
# Rationale:
# If the protocol is not required, it is recommended that the drivers not be installed to reduce
# the potential attack surface.
#
# @summary 3.5.1 Ensure DCCP is disabled (Not Scored)
#
# @example
#   include cis::3_5_1
class cis::cis_3_5_1 (
  Boolean $enforced = true,
) {

  if $enforced {
    file { 'disable DCCP':
      ensure  => file,
      path    => '/etc/modprobe.d/dccp.conf',
      owner   => 'root',
      group   => 'root',
      mode    => '0400',
      content => 'install dccp /bin/true',
    }
  }
}
