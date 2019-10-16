# 1.1.13 Ensure separate partition exists for /home (Scored)
#
#
# Description:
# The /home directory is used to support disk storage needs of local users.
#
# @summary 1.1.13 Ensure separate partition exists for /home (Scored)
#
# @example
#   include cis::1_1_13
class cis::cis_1_1_13 (
  Boolean $enforced = true,
) {
  if $enforced {

    # 1.1.13 Ensure separate partition exists for /home
    if $facts['cis_1_1_13'].empty {
      notify {'cis_1_1_13':
        message  => 'Not in compliance with CIS 1.1.13 (Scored). There is not a seperate partition for /home',
        loglevel => 'warning',
      }
    }
  }
}
