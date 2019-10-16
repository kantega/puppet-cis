# 2.1.7 Ensure xinetd is not enabled (Scored)
#
# Description:
# The eXtended InterNET Daemon ( xinetd ) is an open source super daemon that replaced the original inetd daemon.
# The xinetd daemon listens for well known services and dispatches the appropriate daemon to properly respond to service requests.
#
# Rationale:
# If there are no xinetd services required, it is recommended that the daemon be disabled.
#
# @summary 2.1.7 Ensure xinetd is not enabled (Scored)
#
# @example
#   include cis::2_1_7
class cis::cis_2_1_7 (
  Boolean $enforced = true,
) {
  if $enforced {
    service { 'stop and disable xinetd':
      ensure => stopped,
      name   => 'xinetd',
      enable => false,
    }
  }
}
