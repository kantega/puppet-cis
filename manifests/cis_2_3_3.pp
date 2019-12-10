# 2.3.3 Ensure LDAP client is not installed (Scored)
#
# Description:
# The Lightweight Directory Access Protocol (LDAP) was introduced as a replacement for NIS/YP.
# It is a service that provides a method for looking up information from a central database.
#
# Rationale:
# If the system will not need to act as an LDAP client, it is recommended that the software
# be removed to reduce the potential attack surface.
#
# @summary 2.3.3 Ensure LDAP client is not installed (Scored)
#
# @example
#   include cis::2_3_3
class cis::cis_2_3_3 (
  Boolean $enforced = true,
) {

  if $enforced {
    package { 'openldap-clients':
      ensure => purged,
    }
  }
}
