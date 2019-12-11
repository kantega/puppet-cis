# 4.1.1.3 Ensure auditing for processes that start prior to auditd is enabled (Scored)
#
# Description:
# Configure grub2 so that processes that are capable of being audited can be audited even if
# they start up prior to auditd startup.
#
# Rationale:
# Audit events need to be captured on processes that start up prior to auditd, so that
# potential malicious activity cannot go undetected.
#
# @summary 4.1.1.3 Ensure auditing for processes that start prior to auditd is enabled (Scored)
#
# @example
#   include cis::4_1_1_3
class cis::cis_4_1_1_3 (
  Boolean $enforced = true,
) {

  if $enforced {
    if $facts['cis_4_1_1_3'] {
      notify { 'cis_4_1_1_3':
        message  => 'Not in compliance with CIS 4.1.1.3 (Scored). Auditing for processes starting prior to auditd is not enabled',
        loglevel => 'warning',
      }
    }
  }
}
