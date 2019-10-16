# 2.1.5 Ensure time services are not enabled (Scored)
#
# Description:
# time is a network service that responds with the server's current date and time as a 32 bit integer.
# This service is intended for debugging and testing purposes. It is recommended that this service be disabled.
#
# Rationale:
# Disabling this service will reduce the remote attack surface of the system.
#
# @summary 2.1.5 Ensure time services are not enabled (Scored)
#
# @example
#   include cis::2_1_5
class cis::cis_2_1_5 (
  Boolean $enforced = true,
) {
  if $enforced {
    service { 'stop and disable time-dgram service':
      ensure => stopped,
      name   => 'time-dgram',
      enable => false,
    }
    service { 'stop and disable time-stream service':
      ensure => stopped,
      name   => 'time-stream',
      enable => false,
    }
  }
}
