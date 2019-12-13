# 4.2.2.2 Ensure journald is configured to compress large log files (Scored)
#
# Description:
#
# The journald system includes the capability of compressing overly large files to avoid filling
# up the system with logs or making the logs unmanageably large.
#
# Rationale:
#
# Uncompressed large files may unexpectedly fill a filesystem leading to resource
# unavailability. Compressing logs prior to write can prevent sudden, unexpected filesystem
# impacts.
# @summary 4.2.2.2 Ensure journald is configured to compress large log files (Scored)
#
# @example
#   include cis::4_2_2_2
class cis::cis_4_2_2_2 (
  Boolean $enforced = true,
) {

  if $enforced {
    file_line { 'journald compression of large log files':
      ensure => present,
      path   => '/etc/systemd/journald.conf',
      line   => 'Compress=yes',
      match  => '^Compress=',
    }
  }
}
