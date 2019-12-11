# 3.6 Disable IPv6 (Not Scored)
#
# Description:
#
# Although IPv6 has many advantages over IPv4, not all organizations have IPv6 or dual
# stack configurations implemented.
#
# Rationale:
#
# If IPv6 or dual stack is not to be used, it is recommended that IPv6 be disabled to reduce
# the attack surface of the system.
#
# @summary 3.6 Ensure wireless interfaces are disabled (Not Scored)
#
# @example
#   include cis::3_6
class cis::cis_3_6 (
  Boolean $enforced = true,
) {

  if $enforced {
    if $facts['cis_3_6']
      notify { 'cis_3_6':
        message  => 'Not in compliance with CIS 3.6 (Not Scored). IPv6 is enabled.'
        loglevel => 'warning',
      }
    }
  }
}
