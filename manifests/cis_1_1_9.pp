# 1.1.9 Ensure nosuid option set on /var/tmp partition (Scored)
#
#
# Description:
# The nosuid mount option specifies that the filesystem cannot contain setuid files.
#
# @summary 1.1.9 Ensure nosuid option set on /var/tmp partition (Scored)
#
# @example
#   include cis::1_1_9
class cis::cis_1_1_9 (
  Boolean $enforced = true,
) {
  if $enforced {
    # 1.1.7 Ensure separate partition exists for /var/tmp
    if !($facts['cis_1_1_7'].empty) {
      if $facts['cis_1_1_9'] == false {
        notify { 'cis_1_1_9':
          message  => 'Not in compliance with CIS 1.1.9 (Scored). The nosuid option is not set on the /var/tmp partition',
          loglevel => 'warning',
        }
      }
    }
  }
}
