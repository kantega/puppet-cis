# 1.2.3 Ensure gpgcheck is globally activated (Scored)
#
#
# Description:
# The gpgcheck option, found in the main section of the /etc/yum.conf and individual /etc/yum/repos.d/*
# files determines if an RPM package's signature is checked prior to its installation.
#
# @summary 1.2.3 Ensure gpgcheck is globally activated (Scored)
#
# @example
#   include cis::1_2_3
class cis::cis_1_2_3 (
  Boolean $enforced = true,
) {

  if $enforced {
    file_line { 'gpgcheck':
      ensure => present,
      path   => '/etc/yum.conf',
      line   => 'gpgcheck=1',
      match  => '^gpgcheck',
    }
    if !($facts['cis_1_2_3'].empty) {
      notify { 'cis_1_2_3':
        message  => 'Not in compliance with CIS 1.2.3 (Scored). Repositories with gpgcheck disabled exists',
        loglevel => 'warning',
      }
    }
  }
}
