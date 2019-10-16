# 1.1.3 Ensure nodev option set on /tmp partition (Scored)
#
#
# Description:
# The nodev mount option specifies that the filesystem cannot contain special devices.
#
# @summary 1.1.3 Ensure nodev option set on /tmp partition (Scored)
#
# @example
#   include cis::1_1_3
class cis::cis_1_1_3 (
  Boolean $enforced = true,
) {

  if $enforced {
    # 1.1.2 Ensure separate partition exists for /tmp
    if $facts['cis_1_1_2'] {
      if $facts['cis_1_1_3'] == false {
        notify { 'cis_1_1_3':
          message  => 'Not in compliance with CIS 1.1.3 (Scored). The nodev option is not set on the /tmp partition',
          loglevel => 'warning',
        }
      }
    }
  }

}
