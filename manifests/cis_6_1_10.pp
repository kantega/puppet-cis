# 6.1.10 Ensure no world writable files exist (Scored)
#
# Description:
# Unix-based systems support variable settings to control access to files. World writable files are the least secure. See the chmod(2)
# man page for more information.
#
# @summary 6.1.10 Ensure no world writable files exist (Scored)
#
# @example
#   include cis::6_1_10
class cis::cis_6_1_10 (
  Boolean $enforced = true,
) {
#   if $enforced {
#     if $facts['cis_6_1_10'] {
#       notify { 'cis_6_1_10':
#         message  => '[6.1.10] You have one or more world writable files. Check the world_writable fact for details.',
#         loglevel => 'warning',
#       }
#     }
#   }
# }
# TODO: Implement fact
}
