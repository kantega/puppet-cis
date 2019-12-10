# 3.3.4 Ensure TIPC is disabled (Not Scored)
#
# # Description:
# The Transparent Inter-Process Communication (TIPC) protocol is designed to provide
# communication between cluster nodes.
#
# Rationale:
# If the protocol is not being used, it is recommended that kernel module not be loaded,
# disabling the service to reduce the potential attack surface.
#
# @summary 3.3.4 Ensure TIPC is disabled (Not Scored)
#
# @example
#   include cis::3_3_4
class cis::cis_3_3_4 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { 'disable TIPC':
      ensure  => file,
      path    => '/etc/modprobe.d/tipc.conf',
      owner   => 'root',
      group   => 'root',
      mode    => '0400',
      content => 'install tipc /bin/true',
    }
  }
}
