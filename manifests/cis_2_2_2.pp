# 2.2.2 Ensure X Window System is not installed (Scored)
#
# Description:
# The X Window System provides a Graphical User Interface (GUI) where users can have multiple windows
# in which to run programs and various add on. The X Windows system is typically used on workstations where users login,
# but not on servers where users typically do not login.
#
# Rationale:
# Unless your organization specifically requires graphical login access via X Windows, remove it to reduce the potential attack surface.
#
# @summary 2.2.2 Ensure X Window System is not installed (Scored)
#
# @example
#   include cis::2_2_2
class cis::cis_2_2_2 (
  Boolean $enforced = true,
) {

  if $enforced {
    if !($facts['cis_2_2_2'].empty) {
      package { $facts['cis_2_2_2']:
        ensure => purged,
      }
    }
  }
}
