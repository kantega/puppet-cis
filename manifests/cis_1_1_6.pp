# 1.1.6 Ensure separate partition exists for /var (Scored)
#
#
# Description:
# The /var directory is used by daemons and other system services to temporarily store dynamic data. Some directories created by
# these processes may be world-writable.
#
# @summary 1.1.6 Ensure separate partition exists for /var (Scored)
#
# @example
#   include cis::1_1_6
class cis::cis_1_1_6 (
  Boolean $enforced = true,
) {
  if $enforced {
    # 1.1.6 Ensure separate partition exists for /var
    if $facts['cis_1_1_6'].empty {
      notify { 'cis_1_1_6':
        message  => 'Not in compliance with CIS 1.1.6 (Scored). A seperate partition does not exist for /var',
        loglevel => 'warning',
      }
    }
  }
}
