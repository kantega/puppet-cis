# 1.1.1.1 Ensure mounting of cramfs filesystems is disabled (Scored)
#
# Description:
# The cramfs filesystem type is a compressed read-only Linux filesystem embedded in small footprint systems.
# A cramfs image can be used without having to first decompress the image.
#
# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the server.
# If this filesystem type is not needed, disable it.
#
# @summary 1.1.1.1 Ensure mounting of cramfs filesystems is disabled (Scored)
#
# @example
#   include cis::1_1_1_1
class cis::cis_1_1_1_1 (
  Boolean $enforced = true,
) {

  if $enforced {
    file { 'disable mounting cramfs filesystem':
      ensure  => file,
      path    => '/etc/modprobe.d/cramfs.conf',
      owner   => 'root',
      group   => 'root',
      mode    => '0400',
      content => 'install cramfs /bin/true',
    }
  }

}
