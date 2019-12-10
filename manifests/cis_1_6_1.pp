# 1.6.1 Ensure core dumps are restricted (Scored)
#
#
# Description:
# A core dump is the memory of an executable program. It is generally used to determine why a program aborted. It can
# also be used to glean confidential information from a core file. The system provides the ability to set a soft limit for core dumps,
# but this can be overridden by the user.
#
# @summary 1.6.1 Ensure core dumps are restricted (Scored)
#
# @example
#   include cis::1_6_1
class cis::cis_1_6_1 (
  Boolean $enforced = true,
) {

  if $enforced {
    file_line { 'ensure core dumps are restricted':
      path => '/etc/security/limits.conf',
      line => '* hard core 0',
    }
    sysctl { 'fs.suid_dumpable':
      value => 0,
    }
  }
}
