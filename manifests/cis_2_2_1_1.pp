# 2.2.1.1 Ensure time synchronization is in use (Not Scored)
#
# Description:
# System time should be synchronized between all systems in an environment. This is
# typically done by establishing an authoritative time server or set of servers and having all
# systems synchronize their clocks to them.
# Rationale:
# Time synchronization is important to support time sensitive security mechanisms like
# Kerberos and also ensures log files have consistent time records across the enterprise,
# which aids in forensic investigations.
#
# @summary 2.2.1.1 Ensure time synchronization is in use (Not Scored)
#
# @example
#   include cis::2_2_1_1
class cis::cis_2_2_1_1 (
  Boolean $enforced = true,
) {

  if $enforced {
    if $facts['cis_2_2_1_1'] == false {
      notify { 'cis_2_2_1_1':
        message  => 'Not in compliance with CIS 2.2.1.1 (Not Scored). No time synchronization software is installed',
        loglevel => 'warning',
      }
    }
  }
  # This benchmark is handled by either cis::2_2_1_2
  # or cis::2_2_1_3 depending on whether ntp or
  # chrony is used for time synchronization.

}
