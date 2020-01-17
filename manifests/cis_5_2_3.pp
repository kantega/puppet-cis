# 5.2.3 Ensure permissions on SSH private host key files are configured (Scored)
#
# Description:
#
# An SSH private key is one of two files used in SSH public key authentication. In this
# authentication method, the possession of the private key is proof of identity. Only a private
# key that corresponds to a public key will be able to authenticate successfully. The private
# keys need to be stored and handled carefully, and no copies of the private key should be
# distributed.
#
# Rationale:
#
# If an unauthorized user obtains the private SSH host key file, the host could be
# impersonated
#
# @summary 5.2.3 Ensure permissions on SSH private host key files are configured (Scored)
#
# @example
#   include cis::5_2_3
class cis::cis_5_2_3 (
  Boolean $enforced = true,
) {

  if $enforced {
    exec { 'set mode permissions on SSH private keys':
      command => 'find /etc/ssh -xdev -type f -name "ssh_host_*_key" -exec chmod 0600 {} \;',
      onlyif  => 'if [ $(find /etc/ssh -type f -iname "ssh_host_*_key" -perm /077 | wc -l) -gt 0 ]; then exit 1; else exit 0; fi',#lint:ignore:140chars
      user    => 'root',
      path    => [ '/usr/bin' ],
    }
    exec { 'set ownership on SSH private keys':
      command => 'find /etc/ssh -xdev -type f -name "ssh_host_*_key" -exec chown root:root {} \;',
      onlyif  => 'if [ $(find /etc/ssh \! -user root -o \! -group root -iname "ssh_host_*_key") | wc -l) -gt 0 ]; then exit 1; else exit 0; fi',#lint:ignore:140chars
      user    => 'root',
      path    => [ '/usr/bin' ],
    }
  }
}
