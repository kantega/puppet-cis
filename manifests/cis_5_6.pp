# 5.6 Ensure root login is restricted to system console (Not Scored)
#
# Description:
# The file /etc/securetty contains a list of valid terminals that may be logged in directly as root.
#
# @summary 5.6 Ensure root login is restricted to system console (Not Scored)
#
# @example
#   include cis::cis_5_6
class cis::cis_5_6 (
  Boolean $enforced = true,
) {

}
#
#   if $enforced {
#
#     notify { 'console':
#     message => '[5.6] (Not Scored) Please ensure any consoles specified in /etc/securetty are valid and in a physically secure location',
#     }
#   }
# }
#---This cannot be automated or enforced in any way
