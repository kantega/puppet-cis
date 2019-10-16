# 2.2.20 Ensure rsync service is not enabled (Scored)
#
# Description:
# The rsyncd service can be used to synchronize files between systems over network links.
#
# Rationale:
# The rsyncd service presents a security risk as it uses unencrypted protocols for communication.
#
# @summary 2.2.20 Ensure rsync service is not enabled (Scored)
#
# @example
#   include cis::2_2_20
class cis::cis_2_2_20 (
  Boolean $enforced = true,
) {

  if $enforced {
    service { 'rsyncd':
      ensure => stopped,
      enable => false,
    }
  }
}
