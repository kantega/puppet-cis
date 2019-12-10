# 1.7.1.3 Ensure SELinux policy is configured (Scored)
#
#
# Description:
# Configure SELinux to meet or exceed the default targeted policy, which constrains daemons and system software only.
#
# @summary 1.7.1.3 Ensure SELinux policy is configured (Scored)
#
# @example
#   include cis::1_7_1_3
class cis::cis_1_7_1_3 (
  Boolean $enforced = true,
) {

  if $enforced {
    file_line { 'selinux_targeted':
      path  => '/etc/selinux/config',
      line  => 'SELINUXTYPE=targeted',
      match => '^SELINUXTYPE=',
    }
  }
}
