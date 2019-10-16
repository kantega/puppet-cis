# 6.2.5 Ensure root is the only UID 0 account (Scored)
#
#
# Description:
# Any account with UID 0 has superuser privileges on the system.
#
# @summary 6.2.5 Ensure root is the only UID 0 account (Scored)
#
# @example
#   include cis::6_2_5
class cis::cis_6_2_5 (
  Boolean $enforced = true,
) {
  if $enforced {
    if $facts['cis_6_2_5'] and $facts['cis_6_2_5'] != 'root' {
      notify { 'cis_6_2_5':
        message  => 'Not in compliance with CIS 6.2.5 (Scored). One or more users have superuser privileges on the system other than Root. Check the root_uid fact for details', # lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
