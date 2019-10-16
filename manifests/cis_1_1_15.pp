# 1.1.15 Ensure nodev option set on /dev/shm partition (Scored)
#
#
# Description:
# The nodev mount option specifies that the filesystem cannot contain special devices.
#
# @summary 1.1.15 Ensure nodev option set on /dev/shm partition (Scored)
#
# @example
#   include cis::1_1_15
class cis::cis_1_1_15 (
  Boolean $enforced = true,
) {

  if $enforced {
    if $facts['cis_1_1_15'] == false {
      notify { 'cis_1_1_15':
        message  => 'Not in compliance with CIS 1.1.15 (Scored). The "nodev" option is not included on the /dev/shm partition',
        loglevel => 'warning',
      }
    }
  }
}
