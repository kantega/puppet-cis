# 1.1.7 Ensure separate partition exists for /var/tmp (Scored)
#
#
# Description:
# The /var/tmp directory is a world-writable directory used for temporary storage by all users and some applications.
#
# @summary A short summary of the purpose of this class
#
# @example
#   include cis::1_1_7
class cis::cis_1_1_7 (
  Boolean $enforced = true,
) {
  if $enforced {
    # 1.1.7 Ensure separate partition exists for /var/tmp
    if $facts['cis_1_1_7'].empty {
      notify { 'cis_1_1_7':
        message  => 'Not in compliance with CIS 1.1.7 (Scored). There is not a separate partition for /var/tmp',
        loglevel => 'warning',
      }
    }
  }
}
