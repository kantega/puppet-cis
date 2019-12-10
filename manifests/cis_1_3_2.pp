# 1.3.2 Ensure sudo commands use pty (Scored)
#
#
# Description:
# sudo can be configured to run only from a psuedo-pty
#
# Rationale:
# Attackers can run a malicious program using sudo which would fork a background process
# that remains even when the main program has finished executing.
#
# @summary 1.3.2 Ensure filesystem integrity is regularly checked (Scored)
#
# @example
#   include cis::1_3_2
class cis::cis_1_3_2 (
  Boolean $enforced = true,
) {

  if $enforced {
    if $facts['cis_1_3_2'] {
      notify { 'cis_1_3_2':
        message  => 'Not in compliance with CIS 1.3.2 (Scored). Sudo exposed to process forking.',
        loglevel => 'warning',
      }
    }
  }
}
