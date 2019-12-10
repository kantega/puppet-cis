# 2.2.5 Ensure SNMP Server is not enabled (Scored)
#
# Description:
# The Simple Network Management Protocol (SNMP) server is used to listen for SNMP commands from an SNMP management system,
# execute the commands or collect the information and then send results back to the requesting system.
#
# Rationale:
# The SNMP server can communicate using SNMP v1, which transmits data in the clear and does not require authentication to execute commands.
# Unless absolutely necessary, it is recommended that the SNMP service not be used.
# If SNMP is required the server should be configured to disallow SNMP v1.
#
# @summary 2.2.5 Ensure SNMP Server is not enabled (Scored)
#
# @example
#   include cis::2_2_5
class cis::cis_2_2_5 (
  Boolean $enforced = true,
) {

  if $enforced {

    service { 'snmpd':
      ensure => stopped,
      enable => false,
    }
  }
}
