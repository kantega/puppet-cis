# 4.2.1.5 Ensure rsyslog is configured to send logs to a remote log host (Scored)
#
#
# Description:
# The rsyslog utility supports the ability to send logs it gathers to a remote log host running syslogd(8)
# or to receive messages from remote hosts, reducing administrative overhead.
#
# @summary 4.2.1.5 Ensure rsyslog is configured to send logs to a remote log host (Scored)
#
# @example
#   include cis::4_2_1_5
class cis::cis_4_2_1_5 (
  Boolean $enforced = true,
  Enum['rsyslog', 'syslog-ng', 'none'] $logging = 'rsyslog',
  String $logging_host = '',
) {

  if $enforced and $logging == 'rsyslog' and $logging_host != '' {

    file_line { 'rsyslog.conf logging_host':
      ensure => present,
      path   => '/etc/rsyslog.conf',
      line   => "*.* @@${logging_host}",
      match  => '\*\.\* @@',
    }~>exec { 'reload rsyslog 4_2_1_4':
      command     => '/bin/pkill -HUP rsyslogd',
      refreshonly => true,
    }
  }
}
