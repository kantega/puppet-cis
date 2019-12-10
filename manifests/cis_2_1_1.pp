# 2.1.1 Ensure xinetd is not installed (Scored)
#
# Description:
#
# The eXtended InterNET Daemon ( xinetd ) is an open source super daemon that replaced
# the original inetd daemon. The xinetd daemon listens for well known services and
# dispatches the appropriate daemon to properly respond to service requests.
#
# Rationale:
#
# If there are no xinetd services required, it is recommended that the daemon be removed.
#
# @summary 2.1.1 Ensure xinetd is not installed (Scored)
#
# @example
#   include cis::2_1_1
class cis::cis_2_1_1 (
  Boolean $enforced = true,
) {
  if $enforced {
    service { 'stop and disable xinetd':
      ensure => stopped,
      name   => 'xinetd',
      enable => false,
    }
    ->package { 'ensure xinetd is removed':
      ensure => absent,
      name   => 'xinetd',
    }
  }
}
