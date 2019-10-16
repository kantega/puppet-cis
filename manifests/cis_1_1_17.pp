# 1.1.17 Ensure noexec option set on /dev/shm partition (Scored)
#
#
# Description:
# The noexec mount option specifies that the filesystem cannot contain executable binaries.
#
# @summary 1.1.17 Ensure noexec option set on /dev/shm partition (Scored)
#
# @example
#   include cis::1_1_17
class cis::cis_1_1_17 (
  Boolean $enforced = true,
) {
  if $enforced {
    if $facts['cis_1_1_17'] == false {
      notify { 'cis_1_1_17':
        message  => 'Not in compliance with CIS 1.1.17 (Scored). The "noexec" option is not enabled on the /dev/shm partition',
        loglevel => 'warning',
      }
    }
  }
}
