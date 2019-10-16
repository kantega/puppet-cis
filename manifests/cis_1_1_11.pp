# 1.1.11 Ensure separate partition exists for /var/log (Scored)
#
#
# Description:
# The /var/log directory is used by system services to store log data
#
# @summary 1.1.11 Ensure separate partition exists for /var/log (Scored)
#
# @example
#   include cis::1_1_11
class cis::cis_1_1_11 (
  Boolean $enforced = true,
) {
  if $enforced {

    # 1.1.11 Ensure separate partition exists for /var/log
    if $facts['cis_1_1_11'] == undef {
      notify { 'cis_1_1_11':
        message  => 'Not in compliance with CIS 1.1.11 (Scored). A separate partition does not exist for /var/log',
        loglevel => 'warning',
      }
    }
  }
}
