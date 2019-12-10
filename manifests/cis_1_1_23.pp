# 1.1.23 Disable USB Storage (Scored)
#
# Description:
# USB storage provides a means to transfer and store files insuring persistence and
# availability of the files independent of network connection status. Its popularity and utility
# has led to USB-based malware being a simple and common means for network infiltration
# and a first step to establishing a persistent threat within a networked environment.
#
# Rationale:
# Restricting USB access on the system will decrease the physical attack surface for a device
# and diminish the possible vectors to introduce malware.
#
# @summary 1.1.23 Disable USB Storage (Scored)
#
# @example
#   include cis::1_1_23
class cis::cis_1_1_23 (
  Boolean $enforced = true,
) {

  if $enforced {
    file { 'disable USB storage':
      ensure  => file,
      path    =>  '/etc/modprobe.d/usb-storage.conf',
      owner   => 'root',
      group   => 'root',
      mode    => '0400',
      content => 'install usb-storage /bin/true',
    }
  }

}
