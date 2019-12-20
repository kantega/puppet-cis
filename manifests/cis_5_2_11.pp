# 5.2.11 Ensure SSH PermitEmptyPasswords is disabled (Scored)
#
# Description:
# The PermitEmptyPasswords parameter specifies if the SSH server allows login to accounts with empty password strings.
#
# Rationale:
# Disallowing remote shell access to accounts that have an empty password reduces the probability of unauthorized access to the system
#
# @summary 5.2.11 Ensure SSH PermitEmptyPasswords is disabled (Scored)
#
# @example
#   include cis::5_2_11
class cis::cis_5_2_11 (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line { 'ssh permit empty password':
      ensure => 'present',
      path   => '/etc/ssh/sshd_config',
      line   => 'PermitEmptyPasswords no',
      match  => '^#?PermitEmptyPasswords',
      notify => Service['sshd'],
    }
  }
}
