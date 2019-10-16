# 1.1.1.6 Ensure mounting of squashfs filesystems is disabled (Scored)
#
# Description:
# The squashfs filesystem type is a compressed read-only Linux filesystem embedded in small footprint systems (similar to cramfs ).
#  A squashfs image can be used without having to first decompress the image.
#
# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the system.
# If this filesystem type is not needed, disable it.
#
# @summary 1.1.1.6 Ensure mounting of squashfs filesystems is disabled (Scored)
#
# @example
#   include cis::1_1_1_6
class cis::cis_1_1_1_6 (
  Boolean $enforced = true,
) {

  if $enforced {
    file { 'disable mounting squashfs filesystem':
      ensure  => file,
      path    =>  '/etc/modprobe.d/squashfs.conf',
      owner   => 'root',
      group   => 'root',
      mode    => '0400',
      content => 'install squashfs /bin/true',
    }
  }

}
