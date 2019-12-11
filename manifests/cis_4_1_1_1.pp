# 4.1.1.1 Ensure auditd is installed (Scored)
#
#
# Description:
# auditd is the userspace component to the Linux Auditing System. It's responsible for
# writing audit records to the disk
#
# Rationale:
# The capturing of system events provides system administrators with information to allow
# them to determine if unauthorized access to their system is occurring.
#
# @summary 4.1.1.1 Ensure auditd is installed (Scored)
#
# @example
#   include cis::4_1_1_1
class cis::cis_4_1_1_1 (
  Boolean $enforced = true,
) {

  if $enforced {
    package { 'ensure audit packages is installed':
      ensure => installed,
      name   => ['audit', 'audit-libs']
    }
  }
}
