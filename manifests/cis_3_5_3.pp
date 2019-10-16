# 3.5.3 Ensure RDS is disabled (Not Scored)
#
# Description:
# The Reliable Datagram Sockets (RDS) protocol is a transport layer protocol designed to
# provide low-latency, high-bandwidth communications between cluster nodes. It was
# developed by the Oracle Corporation.
#
# Rationale:
# If the protocol is not being used, it is recommended that kernel module not be loaded,
# disabling the service to reduce the potential attack surface.
#
# @summary 3.5.3 Ensure RDS is disabled (Not Scored)
#
# @example
#   include cis::3_5_3
class cis::cis_3_5_3 (
  Boolean $enforced = true,
) {

  if $enforced {
    file { 'disable RDS':
      ensure  => file,
      path    => '/etc/modprobe.d/rds.conf',
      owner   => 'root',
      group   => 'root',
      mode    => '0400',
      content => 'install rds /bin/true',
    }
  }
}
