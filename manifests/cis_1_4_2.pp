# 1.4.2 Ensure filesystem integrity is regularly checked (Scored)
#
# Description:
# Periodic checking of the filesystem integrity is needed to detect changes to the filesystem.
#
# Rationale:
# Periodic file checking allows the system administrator to determine on a regular basis if
# critical files have been changed in an unauthorized fashion.
#
# @summary 1.4.2 Ensure filesystem integrity is regularly checked (Scored)
#
# @example
#   include cis::1_4_2
class cis::cis_1_4_2 (
  Boolean $enforced = true,
) {

  if $enforced {
    cron {'aide check crontab entry':
      command => '/usr/sbin/aide --check',
      user    => 'root',
      hour    => 5,
      minute  => 0,
    }
  }
}
