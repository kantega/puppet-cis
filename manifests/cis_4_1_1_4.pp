# 4.1.1.4 Ensure audit_backlog_limit is sufficient (Scored)
#
# Description:
# The backlog limit has a default setting of 64
#
# Rationale:
# during boot if audit=1, then the backlog will hold 64 records. If more that 64 records are
# created during boot, auditd records will be lost and potential malicious activity could go
# undetected.
#
# @summary 4.1.1.4 Ensure audit_backlog_limit is sufficient (Scored)
#
# @example
#   include cis::4_1_1_4
class cis::cis_4_1_1_4 (
  Boolean $enforced = true,
) {

  if $enforced {
    if $facts['cis_4_1_1_4'] {
      notify { 'cis_4_1_1_4':
        message  => 'Not in compliance with CIS 4.1.1.4 (Scored). Audit logs created during boot might get lost.',
        loglevel => 'warning',
      }
    }
  }
}
