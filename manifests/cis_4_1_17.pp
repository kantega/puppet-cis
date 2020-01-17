# 4.1.17 Ensure the audit configuration is immutable (Scored)
#
# Description:
# Set system audit so that audit rules cannot be modified with auditctl . Setting the flag "-e 2"
# forces audit to be put in immutable mode. Audit changes can only be made on system reboot.
#
# Rationale:
# In immutable mode, unauthorized users cannot execute changes to the audit system to
# potentially hide malicious activity and then put the audit rules back. Users would most
# likely notice a system reboot and that could alert administrators of an attempt to make
# unauthorized audit changes.
#
# @summary 4.1.17 Ensure the audit configuration is immutable (Scored)
#
# @example
#   include cis::4_1_17
class cis::cis_4_1_17 (
  Boolean $enforced = true,
) {
  if $enforced {
    file { 'audit configuration immutable setting':
      ensure  => file,
      mode    => '0400',
      owner   => 'root',
      group   => 'root',
      content => '-e 2',
      path    => '/etc/audit/rules.d/99-finalize.rules',
    }
  }
}

