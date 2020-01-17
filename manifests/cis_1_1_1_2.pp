# 1.1.1.2 Ensure mounting of FAT filesystems is disabled (Scored)
#
# Description:
# The FAT filesystem format is primarily used on older windows systems and portable USB drives or flash modules.
# It comes in three types FAT12 , FAT16 , and FAT32 all of which are supported by the vfat kernel module.
#
# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the system.
# If this filesystem type is not needed, disable it.
#
# @summary 1.1.1.2 Ensure mounting of vFAT filesystems is limited (Scored)
#
# @example
#   include cis::1_1_1_2
class cis::cis_1_1_1_2 (
  Boolean $enforced = true,
) {

  if $enforced {
    file { 'disable mounting vfat filesystem':
      ensure  => file,
      path    =>  '/etc/modprobe.d/vfat.conf',
      owner   => 'root',
      group   => 'root',
      mode    => '0400',
      content => 'install vfat /bin/true',
    }
  }

}
