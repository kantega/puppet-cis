# 2.1.3 Ensure discard services are not enabled (Scored)
#
# Description:
# discard is a network service that simply discards all data it receives.
# This service is intended for debugging and testing purposes. It is recommended that this service be disabled.
#
# Rationale:
# Disabling this service will reduce the remote attack surface of the system.
#
# @summary 2.1.3 Ensure discard services are not enabled (Scored)
#
# @example
#   include cis::2_1_3
class cis::cis_2_1_3 (
  Boolean $enforced = true,
) {
  if $enforced {
    service { 'stop and disable discard-dgram service':
      ensure => stopped,
      name   => 'discard-dgram',
      enable => false,
    }
    service { 'stop and disable discard-stream service':
      ensure => stopped,
      name   => 'discard-stream',
      enable => false,
    }
  }
}
