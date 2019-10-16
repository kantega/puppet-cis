# 4.1.2 Ensure auditd service is enabled (Scored)
#
# Description:
# Turn on the auditd daemon to record system events.
#
# Rationale:
# The capturing of system events provides system administrators with information to allow
# them to determine if unauthorized access to their system is occurring.
#
# @summary 4.1.2 Ensure auditd service is enabled (Scored)
#
# @example
#   include cis::4_1_2
class cis::cis_4_1_2 (
  Boolean $enforced = true,
) {

  if $enforced {
    package { 'audit':
      ensure => installed,
    }~>service { 'auditd':
      ensure => running,
      enable => true,
    }
  }
}
