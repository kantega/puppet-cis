# 2.2.8 Ensure IMAP and POP3 server is not enabled (Scored)
#
# Description:
# dovecot is an open source IMAP and POP3 server for Linux based systems.
#
# Rationale:
# Unless POP3 and/or IMAP servers are to be provided by this system,
# it is recommended that the service be disabled to reduce the potential attack surface.
#
# @summary 2.2.8 Ensure IMAP and POP3 server is not enabled (Scored)
#
# @example
#   include cis::2_2_8
class cis::cis_2_2_8 (
  Boolean $enforced = true,
) {

  if $enforced {

    $services = [
      'dovecot',
      'cyrus-imap',
      'courier-imap',
    ]

    service { $services:
      ensure => stopped,
      enable => false,
    }
  }
}
