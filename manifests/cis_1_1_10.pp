# 1.1.10 Ensure noexec option set on /var/tmp partition (Scored)
#
#
# Description:
# The noexec mount option specifies that the filesystem cannot contain executable binaries.
#
# @summary 1.1.10 Ensure noexec option set on /var/tmp partition (Scored)
#
# @example
#   include cis::1_1_10
class cis::cis_1_1_10 (
  Boolean $enforced = true,
) {
  if $enforced {

    # 1.1.7 Ensure separate partition exists for /var/tmp
    if !($facts['cis_1_1_7'].empty) {
      if $facts['cis_1_1_10'] == false {
        notify { 'cis_1_1_10':
          message  => 'Not in compliance with CIS 1.1.10 (Scored). The noexec option is not set on the /var/tmp partition',
          loglevel => 'warning',
        }
      }
    }
  }
}
