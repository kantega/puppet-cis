# 5.5.4 Ensure default group for the root account is GID 0 (Scored)
#
# Description:
#
# The usermod command can be used to specify which group the root user belongs to. This affects permissions
# of files that are created by the root user.
#
# Rationale:
#
# Using GID 0 for the root account helps prevent root -owned files from accidentally
# becoming accessible to non-privileged users.
#
# @summary 5.5.4 Ensure default group for the root account is GID 0 (Scored)
#
# @example
#   include cis::5_5_4
class cis::cis_5_5_4 (
  Boolean $enforced = true,
) {
  if $enforced {
    user { 'root':
      ensure => present,
      gid    => '0',
    }
  }
}
