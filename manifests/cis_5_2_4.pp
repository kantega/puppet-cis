# 5.2.4 Ensure permissions on SSH public host key files are configured (Scored)
#
# Description:
#
# An SSH public key is one of two files used in SSH public key authentication. In this
# authentication method, a public key is a key that can be used for verifying digital signatures
# generated using a corresponding private key. Only a public key that corresponds to a
# private key will be able to authenticate successfully.
#
# Rationale:
# If a public host key file is modified by an unauthorized user, the SSH service may be
# compromised.
#
# @summary 5.2.4 Ensure permissions on SSH public host key files are configured (Scored)
#
# @example
#   include cis::5_2_4
class cis::cis_5_2_4 (
  Boolean $enforced = true,
) {

  if $enforced {
    exec { 'set mode permissions on SSH public keys':
      command  => 'find /etc/ssh -xdev -type f -name "ssh_host_*_key.pub" -exec chmod 0644 {} \;',
      onlyif   => 'if [ $(find /etc/ssh -type f -iname "ssh_host_*_key.pub" -perm /055 | wc -l) -gt 0 ]; then exit 1; else exit 0; fi',#lint:ignore:140chars
      user     => 'root',
      path     => [ '/usr/bin' ],
      provider => 'shell',
    }
    exec { 'set ownership on SSH public keys':
      command  => 'find /etc/ssh -xdev -type f -name "ssh_host_*_key.pub" -exec chown root:root {} \;',
      onlyif   => 'if [ $(find /etc/ssh \! -user root -o \! -group root -iname "ssh_host_*_key.pub") | wc -l) -gt 0 ]; then exit 1; else exit 0; fi',#lint:ignore:140chars
      user     => 'root',
      path     => [ '/usr/bin' ],
      provider => 'shell',
    }
  }
}
