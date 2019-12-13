# 4.2.2.3 Ensure journald is configured to write logfiles to persistent disk (Scored)
#
# Description:
#
# Data from journald may be stored in volatile memory or persisted locally on the server.
# Logs in memory will be lost upon a system reboot. By persisting logs to local disk on the
# server they are protected from loss.
#
# Rationale:
#
# Writing log data to disk will provide the ability to forensically reconstruct events which
# may have impacted the operations or security of a system even after a system crash or
# reboot.
# @summary 4.2.2.3 Ensure journald is configured to write logfiles to persistent disk (Scored)
#
# @example
#   include cis::4_2_2_3
class cis::cis_4_2_2_3 (
  Boolean $enforced = true,
) {

  if $enforced {
    file_line { 'journald compression of large log files':
      ensure => present,
      path   => '/etc/systemd/journald.conf',
      line   => 'Storage=persistent',
      match  => '^Storage=',
    }
  }
}
