# 1.5.1 Ensure permissions on bootloader config are configured (Scored)
#
#
# Description:
# The grub configuration file contains information on boot settings and passwords for unlocking boot options.
# The grub configuration is usually located at /boot/grub2/grub.cfg and linked as /etc/grub2.cfg. Additional settings can be found in the
# /boot/grub2/user.cfg file.
#
# @summary 1.5.1 Ensure permissions on bootloader config are configured (Scored)
#
# @example
#   include cis::1_5_1
class cis::cis_1_5_1 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/boot/grub2/grub.cfg':
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0600',
    }

    file { '/boot/grub2/user.cfg':
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0600',
    }

  }
}
