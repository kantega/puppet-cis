# 5.2.16 Ensure SSH PAM is enabled (Scored)
#
# Description:
#
# UsePAM Enables the Pluggable Authentication Module interface. If set to “yes” this will
# enable PAM authentication using ChallengeResponseAuthentication and
# PasswordAuthentication in addition to PAM account and session module processing for all
# authentication types
#
# Rationale:
#
# When usePAM is set to yes, PAM runs through account and session types properly. This is
# important if you want to restrict access to services based off of IP, time or other factors of
# the account. Additionally, you can make sure users inherit certain environment variables
# on login or disallow access to the server
#
# @summary 5.2.16 Ensure SSH PAM is enabled (Scored)
#
# @example
#   include cis::5_2_16
class cis::cis_5_2_16 (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line{ 'ssh pam enable':
      ensure => 'present',
      path   => '/etc/ssh/sshd_config',
      line   => 'UsePAM yes',
      match  => '^#?UsePAM',
      notify => Service['sshd'],
    }
  }
}
