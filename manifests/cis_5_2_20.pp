# 5.2.20 Ensure system-wide crypto policy is not over-ridden (Scored)
#
# Description:
#
# System-wide Crypto policy can be over-ridden or opted out of for openSSH
#
# Rationale:
#
# Over-riding or opting out of the system-wide crypto policy could allow for the use of less
# secure Ciphers, MACs, KexAlgoritms and GSSAPIKexAlgorithsm
#
# @summary 5.2.20 Ensure system-wide crypto policy is not over-ridden (Scored)
#
# @example
#   include cis::5_2_20
class cis::cis_5_2_20 (
  Boolean $enforced = true,
) {

  if $enforced {
    exec { 'ssh systemwide crypto policy':
      command => '/usr/bin/sed -ri "s/^\s*(CRYPTO_POLICY\s*=.*)$/# \1/" /etc/sysconfig/sshd',
      onlyif  => '/usr/bin/grep "^/s*CRYPTO_POLICY=" /etc/sysconfig/sshd',
      user    => 'root',
      notify  => Service['sshd'],
    }
  }
}
