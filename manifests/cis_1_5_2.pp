# 1.5.2 Ensure bootloader password is set (Scored)
#
#
# Description:
# Setting the boot loader password will require that anyone rebooting the system must enter a password
# before being able to set command line boot parameters
#
# @summary 1.5.2 Ensure bootloader password is set (Scored)
#
# @example
#   include cis::1_5_2
class cis::cis_1_5_2 (
  Boolean $enforced = true,
  String $grub_password = undef,
) {

  if $enforced {
    if $grub_password != undef {
      file_line { 'GRUB2_PASSWORD':
        path  => '/boot/grub2/user.cfg',
        line  => "GRUB2_PASSWORD=${grub_password}",
        match => '^GRUB2_PASSWORD',
      }
    }
    else {
      notify { 'cis_1_5_2':
        message  => 'Not in compliance with CIS 1.5.2 (Scored). The Grub bootloader does not have a set password', #lint:ignore:80chars
        loglevel => 'warning',
      }
    }
  }

}
