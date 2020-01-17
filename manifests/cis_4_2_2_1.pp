# 4.2.2.1 Ensure journald is configured to send logs to rsyslog (Scored)
#
# Description:
#
# Data from journald may be stored in volatile memory or persisted locally on the server.
# Utilities exist to accept remote export of journald logs, however, use of the rsyslog service
# provides a consistent means of log collection and export.
#
# Rationale:
#
# Storing log data on a remote host protects log integrity from local attacks. If an attacker
# gains root access on the local system, they could tamper with or remove log data that is
# stored on the local system.
#
# @example
#   include cis::4_2_2_1
class cis::cis_4_2_2_1 (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line { 'journald forward to syslog':
      ensure => present,
      path   => '/etc/systemd/journald.conf',
      line   => 'ForwardToSyslog=yes',
      match  => '^ForwardToSyslog=',
    }
  }
}
