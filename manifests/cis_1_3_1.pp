# 1.3.1 Ensure AIDE is installed (Scored)
#
#
# Description:
# AIDE takes a snapshot of filesystem state including modification times, permissions, and file hashes which can then be
# used to compare against the current state of the filesystem to detect modifications to the system.
#
# @summary 1.3.1 Ensure AIDE is installed (Scored)
#
# @example
#   include cis::1_3_1
class cis::cis_1_3_1 (
  Boolean $enforced = true,
) {

  if $enforced {
    package { 'aide':
      ensure => installed,
    }~>exec { 'create initial aide database':
      command     => 'aide --init',
      user        => 'root',
      refreshonly => true,
      path        => '/usr/sbin',
    }~>exec { 'make intitial aide database main':
      command     => 'mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz',
      refreshonly => true,
      path        => '/usr/bin',
    }
  }

}
