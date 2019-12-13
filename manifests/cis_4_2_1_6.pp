# 4.2.1.6 Ensure remote rsyslog messages are only accepted on designated log hosts. (Not Scored)
#
# Description:
# By default, rsyslog does not listen for log messages coming in from remote systems. The
# ModLoad tells rsyslog to load the imtcp.so module so it can listen over a network via TCP.
# The InputTCPServerRun option instructs rsyslogd to listen on the specified TCP port.
#
# Rationale:
# The guidance in the section ensures that remote log hosts are configured to only accept
# rsyslog data from hosts within the specified domain and that those systems that are not
# designed to be log hosts do not accept any remote rsyslog messages. This provides
# protection from spoofed log data and ensures that system administrators are reviewing
# reasonably complete syslog data in a central location.
#
# @summary 4.2.1.6 Ensure remote rsyslog messages are only accepted on designated log hosts. (Not Scored)
#
# @example
#   include cis::4_2_1_6
class cis::cis_4_2_1_6 (
  Boolean $enforced = true,
  Enum['rsyslog', 'syslog-ng', 'none'] $logging = 'rsyslog',
  Boolean $is_logging_host = false,
) {

  if $enforced and $logging == 'rsyslog' {

    if $is_logging_host {

      file_line { 'rsyslog.conf ModLoad':
        ensure => present,
        path   => '/etc/rsyslog.conf',
        line   => '$ModLoad imtcp',
        match  => '\$ModLoad',
        notify => Exec['reload rsyslog 4_2_1_6'],
      }

      file_line { 'rsyslog.conf InputTCPServerRun':
        ensure => present,
        path   => '/etc/rsyslog.conf',
        line   => '$InputTCPServerRun 514',
        match  => '\$InputTCPServerRun',
        notify => Exec['reload rsyslog 4_2_1_6'],
      }
    }

    else {

      file_line { 'rsyslog.conf ModLoad':
        ensure => present,
        path   => '/etc/rsyslog.conf',
        line   => '#$ModLoad imtcp',
        match  => '\$ModLoad',
        notify => Exec['reload rsyslog 4_2_1_6'],
      }

      file_line { 'rsyslog.conf InputTCPServerRun':
        ensure => present,
        path   => '/etc/rsyslog.conf',
        line   => '#$InputTCPServerRun 514',
        match  => '\$InputTCPServerRun',
        notify => Exec['reload rsyslog 4_2_1_6'],
      }
    }

    exec { 'reload rsyslog 4_2_1_6':
      command     => '/bin/pkill -HUP rsyslogd',
      refreshonly => true,
    }
  }
}
