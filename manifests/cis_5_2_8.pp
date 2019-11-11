# 5.2.8 Ensure SSH root login is disabled (Scored)
#
# Description:
# The PermitRootLogin parameter specifies if the root user can log in using ssh(1). The default is no.
#
# Rationale:
# Disallowing root logins over SSH requires system admins to authenticate using their own individual account, then escalating to root via
# sudo or su . This in turn limits opportunity for non-repudiation and provides a clear audit trail in the event of a security incident
#
# @summary 5.2.8 Ensure SSH root login is disabled (Scored)
#
# @example
#   include cis::5_2_8
class cis::cis_5_2_8 (
  Boolean $enforced = true,
  Enum['no','yes','without-password'] $setting = 'no',
) {

  if $enforced {

    file_line { 'ssh permit root login':
      ensure => 'present',
      path   => '/etc/ssh/sshd_config',
      line   => "PermitRootLogin ${setting}",
      match  => '^#?PermitRootLogin',
      notify => Service['sshd'],
    }
  }
}
