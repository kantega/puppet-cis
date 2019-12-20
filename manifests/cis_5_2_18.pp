# 5.2.18 Ensure SSH MaxStartups is configured (Scored)
#
# Description:
#
# The MaxStartups parameter specifies the maximum number of concurrent unauthenticated
# connections to the SSH daemon.
#
# Rationale:
#
# To protect a system from denial of service due to a large number of pending authentication
# connection attempts, use the rate limiting function of MaxStartups to protect availability of
# sshd logins and prevent overwhelming the daemon.#
#
# @summary 5.2.18 Ensure SSH MaxStartups is configured (Scored)
#
# @example
#   include cis::5_2_18
class cis::cis_5_2_18 (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line{ 'ssh maxstartups':
      ensure => 'present',
      path   => '/etc/ssh/sshd_config',
      line   => 'maxstartups 10:30:60',
      match  => '^#?maxstartups',
      notify => Service['sshd'],
    }
  }
}
