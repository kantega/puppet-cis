# 1.8.1.5 Ensure permissions on /etc/issue are configured (Scored)
#
#
# Description:
# The contents of the /etc/issue file are displayed to users prior to login for local terminals.
#
# @summary 1.8.1.5 Ensure permissions on /etc/issue are configured (Scored)
#
# @example
#   include cis::1_8_1_5
class cis::cis_1_8_1_5 (
  Boolean $enforced = true,
) {
  if $enforced {
    file { '/etc/issue':
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
  }
}
