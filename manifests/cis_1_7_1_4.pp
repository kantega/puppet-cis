# 1.7.1.4 Ensure the SELinux state is enforcing (Scored)
#
#
# Description:
# Set SELinux to enable when the system is booted.
#
# @summary 1.7.1.4 Ensure the SELinux state is enforcing (Scored)
#
# @example
#   include cis::1_7_1_4
class cis::cis_1_7_1_4 (
  Boolean $enforced = true,
) {
  if $enforced {
    file_line { 'selinux_enforce':
      path     => '/etc/selinux/config',
      line     => 'SELINUX=enforcing',
      match    => 'SELINUX=',
      multiple => true,
    }
  }
}
