# 1.1.5 Ensure noexec option set on /tmp partition (Scored)
#
#
# Description:
# The noexec mount option specifies that the filesystem cannot contain executable binaries.
#
# @summary 1.1.5 Ensure noexec option set on /tmp partition (Scored)
#
# @example
#   include cis::1_1_5
class cis::cis_1_1_5 (
  Boolean $enforced = true,
) {
  if $enforced {
    # 1.1.2 Ensure separate partition exists for /tmp
    if $facts['cis_1_1_2'] {
      if $facts['cis_1_1_5'] == false {
        notify { 'cis_1_1_5':
          message  => 'Not in compliance with CIS 1.1.5 (Scored). The noexec option is not enabled for the /tmp partition',
          loglevel => 'warning',
        }
      }
    }
  }
}
