# 6.2.1 Ensure password fields are not empty (Scored)
#
#
# Description:
# An account with an empty password field means that anybody may log in as that user without providing a password.
#
# @summary 6.2.1 Ensure password fields are not empty (Scored)
#
# @example
#   include cis::6_2_1
class cis::cis_6_2_1 (
  Boolean $enforced = true,
) {
  if $enforced {
    if $facts['cis_6_2_1'] {
      notify{'cis_6_2_1':
        message  => 'Not in compliance with CIS 6.2.1 (Scored). Check fact password_empty for the user(s) who do not have a password',
        loglevel => 'warning',
      }
    }
  }
}
