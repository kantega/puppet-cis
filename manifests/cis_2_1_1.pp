# 2.1.1 Ensure chargen services are not enabled (Scored)
#
# Description:
# chargenis a network service that responds with 0 to 512 ASCII characters for each connection it receives.
# This service is intended for debugging and testing purposes. It is recommended that this service be disabled.
#
# Rationale:
# Disabling this service will reduce the remote attack surface of the system.
#
# @summary 2.1.1 Ensure chargen services are not enabled (Scored)
#
# @example
#   include cis::2_1_1
class cis::cis_2_1_1 (
  Boolean $enforced = true,
) {

  if $enforced {
    service { 'stop and disable chargen-dgram service':
      ensure => stopped,
      name   => 'chargen-dgram',
      enable => false,
    }
    service { 'stop and disable chargen-stream service':
      ensure => stopped,
      name   => 'chargen-stream',
      enable => false,
    }
  }
}
