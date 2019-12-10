# 2.2.14 Ensure LDAP server is not enabled (Scored)
#
# Description:
# The Lightweight Directory Access Protocol (LDAP) was introduced as a replacement for NIS/YP.
# It is a service that provides a method for looking up information from a central database.
#
# Rationale:
# If the system will not need to act as an LDAP server,
# it is recommended that the software be disabled to reduce the potential attack surface.
#
# @summary 2.2.14 Ensure LDAP server is not enabled (Scored)
#
# @example
#   include cis::2_2_14
class cis::cis_2_2_14 (
  Boolean $enforced = true,
) {

  if $enforced {
    service { 'slapd':
      ensure => stopped,
      enable => false,
    }
  }
}
