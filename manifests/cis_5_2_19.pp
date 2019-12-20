# 5.2.19 Ensure SSH MaxSessions is set to 4 or less (Scored)
#
# Description:
#
# The MaxSessions parameter specifies the maximum number of open sessions permitted
# from a given connection.
# Rationale:
#
# To protect a system from denial of service due to a large number of concurrent sessions,
# use the rate limiting function of MaxSessions to protect availability of sshd logins and
# prevent overwhelming the daemon.
#
# @summary 5.2.19 Ensure SSH MaxSessions is set to 4 or less (Scored)
#
# @example
#   include cis::5_2_19
class cis::cis_5_2_19 (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line{ 'ssh maxsessions':
      ensure => 'present',
      path   => '/etc/ssh/sshd_config',
      line   => 'MaxSessions 4',
      match  => '^#?MaxSessions',
      notify => Service['sshd'],
    }
  }
}
