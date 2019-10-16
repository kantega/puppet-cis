# 1.1.2 Ensure separate partition exists for /tmp (Scored)
#
#
# Description:
# The /tmp directory is a world-writable directory used for temporary storage by all users and some applications.
#
# @summary 1.1.2 Ensure separate partition exists for /tmp (Scored)
#
# @example
#   include cis::1_1_2
class cis::cis_1_1_2 (
  Boolean $enforced = true,
) {

  if $enforced {
    # 1.1.2 Ensure separate partition exists for /tmp
    if $facts['cis_1_1_2'] == undef {
      notify { 'cis_1_1_2':
        message  => 'Not in compliance with CIS 1.1.2 (Scored). There is not a seperate partition for /tmp',
        loglevel => 'warning',
      }
    }
  }
}
