# 4.2.1.2 Ensure rsyslog Service is enabled (Scored)
#
# Description:
# Once the rsyslog package is installed it needs to be activated.
#
# Rationale:
# If the rsyslog service is not activated the system may default to the syslogd service or lack
# logging instead.
#
# @summary 4.2.1.2 Ensure rsyslog Service is enabled (Scored)
#
# @example
#   include cis::4_2_1_2
class cis::cis_4_2_1_2 (
  Boolean $enforced = true,
  Enum['rsyslog', 'syslog-ng', 'none'] $logging = 'rsyslog',
) {

  if $enforced and $logging != 'none' {

    service { $logging:
      ensure => running,
      enable => true,
    }
  }
}
