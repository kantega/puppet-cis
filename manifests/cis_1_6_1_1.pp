# 1.6.1.1 Ensure SELinux is not disabled in bootloader configuration (Scored)
#
#
# Description:
# Configure SELINUX to be enabled at boot time and verify that it has not been overwritten by the grub boot parameters.
#
# @summary 1.6.1.1 Ensure SELinux is not disabled in bootloader configuration (Scored)
#
# @example
#   include cis::1_6_1_1
class cis::cis_1_6_1_1 (
  Boolean $enforced = true,
) {
  if $enforced {
    file_line { 'cmdline_def':
      path  => '/etc/default/grub',
      line  => 'GRUB_CMDLINE_LINUX_DEFAULT="quiet"',
      match => '^GRUB_CMDLINE_LINUX_DEFAULT',
    }
  }
}
