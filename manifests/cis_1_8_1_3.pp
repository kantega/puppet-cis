# 1.8.1.3 Ensure remote login warning banner is configured properly (Not Scored)
#
# Description:
# The contents of the /etc/issue.net file are displayed to users prior to login for remote connections from configured services.
# Unix-based systems have typically displayed information about the OS release and patch level upon logging in to the system. This
# information can be useful to developers who are developing software for a particular OS platform. If mingetty(8) supports the following
# options, they display operating system information: \m - machine architecture \r - operating system release \s - operating system
# name \v - operating system version
#
# @summary 1.8.1.3 Ensure remote login warning banner is configured properly (Not Scored)
#
# @example
#   include cis::1_8_1_3
class cis::cis_1_8_1_3 (
  Boolean $enforced = true,
  String $content = 'Authorized access only! All activity is monitored.',
) {

  if $enforced {
    file { 'contents in /etc/issue.net':
      path    => '/etc/issue.net',
      owner   => 'root',
      group   => 'root',
      content => $content,
    }
    if $facts['cis_1_8_1_3'] {
      notify { 'cis_1_8_1_3':
        message  => 'Not in compliance with CIS 1.8.1.3 (Scored). There is OS and/or patch level information in /etc/issue.net',
        loglevel => 'warning',
      }
    }
  }
}
