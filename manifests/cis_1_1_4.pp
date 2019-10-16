# 1.1.4 Ensure nosuid option set on /tmp partition (Scored)
#
#
# Description:
# The nosuid mount option specifies that the filesystem cannot contain setuid files.
#
# @summary 1.1.4 Ensure nosuid option set on /tmp partition (Scored)
#
# @example
#   include cis::1_1_4
class cis::cis_1_1_4 (
  Boolean $enforced = true,
) {
  if $enforced {
    # 1.1.2 Ensure separate partition exists for /tmp
    if $facts['cis_1_1_2'] {
      if $facts['cis_1_1_4'] == false {
        notify { 'cis_1_1_4':
          message  => 'Not in compliance with CIS 1.1.4 (Scored). The nosuid option is not set on the /tmp partition',
          loglevel => 'warning',
        }
      }
    }
  }
}
