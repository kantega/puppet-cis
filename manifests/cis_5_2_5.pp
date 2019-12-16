# 5.2.5 Ensure SSH LogLevel is appropriate (Scored)
#
# Description:
#
# INFO level is the basic level that only records login activity of SSH users. In many situations,
# such as Incident Response, it is important to determine when a particular user was active
# on a system. The logout record can eliminate those users who disconnected, which helps
# narrow the field.
# VERBOSE level specifies that login and logout activity as well as the key fingerprint for any
# SSH key used for login will be logged. This information is important for SSH key
# management, especially in legacy environments.
#
# Rationale:
#
# SSH provides several logging levels with varying amounts of verbosity. DEBUG is specifically
# not recommended other than strictly for debugging SSH communications since it provides
# so much data that it is difficult to identify important security information.
#
# @summary 5.2.5 Ensure SSH LogLevel is appropriate (Scored)
#
# @example
#   include cis::5_2_5
class cis::cis_5_2_5 (
  Boolean $enforced = true,
  Enum['INFO', 'VERBOSE'] $loglevel = 'INFO',
) {

  if $enforced {
    file_line{ 'sshd loglevel setting':
      ensure => present,
      path   => '/etc/ssh/sshd_config',
      line   => "LogLevel ${loglevel}",
      match  => '^LogLevel',
      notify => Service['sshd'],
    }
  }
}
