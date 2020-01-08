# 6.2.5 Ensure no legacy "+" entries exist in /etc/group (Scored)
#
#
# Description:
# The character + in various files used to be markers for systems to insert data from NIS maps at a certain point in a system configuration
# file. These entries are no longer required on most systems, but may exist in files that have been imported from other platforms.
#
# @summary 6.2.5 Ensure no legacy "+" entries exist in /etc/group (Scored)
#
# @example
#   include cis::6_2_5
class cis::cis_6_2_5 (
  Boolean $enforced = true,
) {
  if $enforced {
    if $facts[ 'cis_6_2_5' ] {
      notify { 'cis_6_2_5':
        message  => 'Not in compliance with CIS 6.2.5 (Scored). You have "+" entries in /etc/group. Check the plus_group fact for details',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
