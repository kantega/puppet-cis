# 5.2.10 Ensure SSH PermitUserEnvironment is disabled (Scored)
#
# Description:
# The PermitUserEnvironment option allows users to present environment options to the ssh daemon.
#
# Rationale:
# Permitting users the ability to set environment variables through the SSH daemon could potentially allow users to bypass security
# controls (e.g. setting an execution path that has ssh executing trojan'd programs)
#
# @summary 5.2.10 Ensure SSH PermitUserEnvironment is disabled (Scored)
#
# @example
#   include cis::5_2_10
class cis::cis_5_2_10 (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line { 'ssh permit user environment':
        ensure => 'present',
        path   => '/etc/ssh/sshd_config',
        line   => 'PermitUserEnvironment no',
        match  => '^#?PermitUserEnvironment',
    }
  }
}
