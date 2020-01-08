# 6.2.6 Ensure root is the only UID 0 account (Scored)
#
#
# Description:
# Any account with UID 0 has superuser privileges on the system.
#
# @summary 6.2.6 Ensure root is the only UID 0 account (Scored)
#
# @example
#   include cis::6_2_6
class cis::cis_6_2_6 (
  Boolean $enforced = true,
) {
  if $enforced {
    if $facts['cis_6_2_6'] and $facts['cis_6_2_6'] != 'root' {
      notify { 'cis_6_2_6':
        message  => 'Not in compliance with CIS 6.2.6 (Scored). One or more users have superuser privileges on the system other than Root. Check the root_uid fact for details', # lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
