# 2.2.9 Ensure HTTP server is not enabled (Scored)
#
# Description:
# HTTP or web servers provide the ability to host web site content.
#
# Rationale:
# Unless there is a need to run the system as a web server,
# it is recommended that the service be disabled to reduce the potential attack surface.
#
# @summary 2.2.9 Ensure HTTP server is not enabled (Scored)
#
# @example
#   include cis::2_2_9
class cis::cis_2_2_9 (
  Boolean $enforced = true,
) {

  if $enforced {

    $http_services = [
      'httpd',
      'apache',
      'apache2',
      'lighttpd',
      'nginx',
    ]

    service { $http_services:
      ensure => stopped,
      enable => false,
    }
  }
}
