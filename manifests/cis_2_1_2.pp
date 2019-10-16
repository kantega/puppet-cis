# 2.1.2 Ensure daytime services are not enabled (Scored)
#
# Description:
# daytime is a network service that responds with the server's current date and time.
# This service is intended for debugging and testing purposes. It is recommended that this service be disabled.
#
# Rationale:
# Disabling this service will reduce the remote attack surface of the system.
#
# @summary 2.1.2 Ensure daytime services are not enabled (Scored)
#
# @example
#   include cis::2_1_2
class cis::cis_2_1_2 (
  Boolean $enforced = true,
) {
  if $enforced {
    service { 'stop and disable daytime-dgram service':
      ensure => stopped,
      name   => 'daytime-dgram',
      enable => false,
    }
    service { 'stop and disable daytime-stream service':
      ensure => stopped,
      name   => 'daytime-stream',
      enable => false,
    }
  }
}
