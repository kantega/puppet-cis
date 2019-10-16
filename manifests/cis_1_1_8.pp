# 1.1.8 Ensure nodev option set on /var/tmp partition (Scored)
#
#
# Description:
# The nodev mount option specifies that the filesystem cannot contain special devices.
#
# @summary 1.1.8 Ensure nodev option set on /var/tmp partition (Scored)
#
# @example
#   include cis::1_1_8
class cis::cis_1_1_8 (
  Boolean $enforced = true,
) {
  if $enforced {
    # 1.1.7 Ensure separate partition exists for /var/tmp
    if !($facts['cis_1_1_7'].empty) {
      if $facts['cis_1_1_8'] == false {
        notify { 'cis_1_1_8':
          message  => 'Not in compliance with CIS 1.1.8 (Scored). The /var/tmp partition does not have the nodev option set',
          loglevel => 'warning',
        }
      }
    }
  }
}
