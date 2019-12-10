# 1.3.3 Ensure sudo log file exists (Scored)
#
# Description:
# sudo can use a custom log file
#
# Rationale:
# A sudo log file simplifies auditing of sudo commands
#
# @summary 1.3.3 Ensure filesystem integrity is regularly checked (Scored)
#
# @example
#   include cis::1_3_3
class cis::cis_1_3_3 (
  Boolean $enforced = true,
) {

  if $enforced {
    if $facts['cis_1_3_3'] {
      notify { 'cis_1_3_3':
        message  => 'Not in compliance with CIS 1.3.3 (Scored). Sudo commands not logged.',
        loglevel => 'warning',
      }
    }
  }
}
