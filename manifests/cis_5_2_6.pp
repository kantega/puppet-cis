# 5.2.6 Ensure SSH X11 forwarding is disabled (Scored)
#
# Description:
# The X11Forwarding parameter provides the ability to tunnel X11 traffic through
# the connection to enable remote graphic connections.
#
# Rationale:
# Disable X11 forwarding unless there is an operational requirement to use X11
# applications directly. There is a small risk that the remote X11 servers of
# users who are logged in via SSH with X11 forwarding could be compromised by
# other users on the X11 server. Note that even if X11 forwarding is disabled,
# users can always install their own forwarders.
#
# @summary 5.2.6 Ensure SSH X11 forwarding is disabled (Scored)
#
# @example
#   include cis::5_2_6
class cis::cis_5_2_6 (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line { 'ssh x11 setting':
      ensure => present,
      path   => '/etc/ssh/sshd_config',
      line   => 'X11Forwarding no',
      match  => '^#?[\r\n\f\v ]?X11Forwarding',
      notify => Service['sshd'],
    }
  }
}
