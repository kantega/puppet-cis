# 1.1.14 Ensure nodev option set on /home partition (Scored)
#
#
# Description:
# The nodev mount option specifies that the filesystem cannot contain special devices.
#
# @summary 1.1.14 Ensure nodev option set on /home partition (Scored)
#
# @example
#   include cis::1_1_14
class cis::cis_1_1_14 (
  Boolean $enforced = true,
) {
  if $enforced {
    # 1.1.13 Ensure separate partition exists for /home
    if !($facts['cis_1_1_13'].empty) {
      if ($facts['cis_1_1_14'] == false) {
        notify { 'cis_1_1_14':
          message  => 'Not in compliance with CIS 1.1.14 (Scored). The "nodev" option is not included on the home partition',
          loglevel => 'warning',
        }
      }
    }
  }
}
