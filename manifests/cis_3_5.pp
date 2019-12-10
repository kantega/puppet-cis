# 3.5 Ensure wireless interfaces are disabled (Not Scored)
#
# Description:
# Wireless networking is used when wired networks are unavailable. Red Hat Enterprise
# Linux 7 contains a wireless tool kit to allow system administrators to configure and use
# wireless networks.
#
# Rationale:
# If wireless is not to be used, wireless devices can be disabled to reduce the potential attack
# surface.
#
# @summary 3.5 Ensure wireless interfaces are disabled (Not Scored)
#
# @example
#   include cis::3_5
class cis::cis_3_5 (
  Boolean $enforced = true,
) {

  if $enforced {
    exec { 'Disable wireless interfaces':
      command => 'nmcli radio all off',
      onlyif  => 'nmcli radio | awk \'{print $2 " " $4}\' | grep \'enabled\'',
      user    => 'root',
      path    => '/usr/bin',
    }
  }
}
