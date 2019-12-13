# 4.2.1.1 Ensure rsyslog is installed (Scored)
#
# Description:
#
# The rsyslog software is a recommended replacement to the original syslogd daemon
# which provide improvements over syslogd , such as connection-oriented (i.e. TCP)
# transmission of logs, the option to log to database formats, and the encryption of log data
# en route to a central logging server.
#
# Rationale:
#
# The security enhancements of rsyslog such as connection-oriented (i.e. TCP) transmission
# of logs, the option to log to database formats, and the encryption of log data en route to a
# central logging server) justify installing and configuring the package.
#
# @summary 4.2.1.1 Ensure rsyslog is installed (Scored)
#
# @example
#   include cis::4_2_1_1
class cis::cis_4_2_1_1 (
  Boolean $enforced = true,
) {
  if $enforced {
    package { 'rsyslog':
      ensure => installed,
    }
  }
}
