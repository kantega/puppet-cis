# 1.1.16 Ensure nosuid option set on /dev/shm partition (Scored)
#
#
# Description:
# The nosuid mount option specifies that the filesystem cannot contain setuid files.
#
# @summary 1.1.16 Ensure nosuid option set on /dev/shm partition (Scored)
#
# @example
#   include cis::1_1_16
class cis::cis_1_1_16 (
  Boolean $enforced = true,
) {
  if $enforced {
    # 1.1.15 Ensure nodev option set on /dev/shm partition
    if $facts['cis_1_1_16'] == false {
      notify { 'cis_1_1_16':
        message  => 'Not in compliance with CIS 1.1.16 (Scored). The "nosuid" option is not enabled on the /dev/shm partition',
        loglevel => 'warning',
      }
    }
  }
}
