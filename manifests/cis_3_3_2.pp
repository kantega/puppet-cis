# 3.3.2 Ensure SCTP is disabled (Not Scored)
#
# Description:
# The Stream Control Transmission Protocol (SCTP) is a transport layer protocol used to
# support message oriented communication, with several streams of messages in one
# connection. It serves a similar function as TCP and UDP, incorporating features of both. It is
# message-oriented like UDP, and ensures reliable in-sequence transport of messages with
# congestion control like TCP.
#
# Rationale:
# If the protocol is not being used, it is recommended that kernel module not be loaded,
# disabling the service to reduce the potential attack surface.
#
# @summary 3.3.2 Ensure SCTP is disabled (Not Scored)
#
# @example
#   include cis::3_3_2
class cis::cis_3_3_2 (
  Boolean $enforced = true,
) {

  if $enforced {
    file { 'disable SCTP':
      ensure  => file,
      path    => '/etc/modprobe.d/sctp.conf',
      owner   => 'root',
      group   => 'root',
      mode    => '0400',
      content => 'install sctp /bin/true',
    }
  }
}
