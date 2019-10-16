# 2.1.4 Ensure echo services are not enabled (Scored)
#
# Description:
# echo is a network service that responds to clients with the data sent to it by the client.
# This service is intended for debugging and testing purposes. It is recommended that this service be disabled.
#
# Rationale:
# Disabling this service will reduce the remote attack surface of the system.
#
# @summary 2.1.4 Ensure echo services are not enabled (Scored)
#
# @example
#   include cis::2_1_4
class cis::cis_2_1_4 (
  Boolean $enforced = true,
) {
  if $enforced {
    service { 'stop and disable echo-dgram service':
      ensure => stopped,
      name   => 'echo-dgram',
      enable => false,
    }
    service { 'stop and disable echo-stream service':
      ensure => stopped,
      name   => 'echo-stream',
      enable => false,
    }
  }
}
