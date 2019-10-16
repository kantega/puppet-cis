# 1.1.1.3 Ensure mounting of jffs2 filesystems is disabled (Scored)
#
# Description:
# The jffs2 (journaling flash filesystem 2) filesystem type is a log-structured filesystem used in flash memory devices.
#
# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the system.
# If this filesystem type is not needed, disable it.
#
# @summary 1.1.1.3 Ensure mounting of jffs2 filesystems is disabled (Scored)
#
# @example
#   include cis::1_1_1_3
class cis::cis_1_1_1_3 (
  Boolean $enforced = true,
) {

  if $enforced {
    file { 'disable mounting jffs2 filesystem':
      ensure  => file,
      path    =>  '/etc/modprobe.d/jffs2.conf',
      owner   => 'root',
      group   => 'root',
      mode    => '0400',
      content => 'install jffs2 /bin/true',
    }
  }

}
