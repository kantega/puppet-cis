# 1.1.12 Ensure separate partition exists for /var/log/audit (Scored)
#
# Description:
# The auditing daemon, auditd , stores log data in the /var/log/audit directory.
#
# @summary 1.1.12 Ensure separate partition exists for /var/log/audit (Scored)
#
# @example
#   include cis::1_1_12
class cis::cis_1_1_12 (
  Boolean $enforced = true,
) {
  if $enforced {

    # 1.1.12 Ensure separate partition exists for /var/log/audit
    if $facts['cis_1_1_12'] == undef {
      notify {'cis_1_1_12':
        message  => 'Not in compliance with CIS 1.1.12 (Scored). /var/log/audit is not in a seperate partition',
        loglevel => 'warning',
      }
    }
  }
}
