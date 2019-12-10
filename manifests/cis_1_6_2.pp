# 1.6.2 Ensure address space layout randomization (ASLR) is enabled (Scored)
#
#
# Description:
# Address space layout randomization (ASLR) is an exploit mitigation technique which randomly arranges the address space
# of key data areas of a process.
#
# @summary 1.6.2 Ensure address space layout randomization (ASLR) is enabled (Scored)
#
# @example
#   include cis::1_6_2
class cis::cis_1_6_2 (
  Boolean $enforced = true,
) {
  if $enforced {
    sysctl { 'kernel.randomize_va_space':
      value => 2,
    }
  }
}
