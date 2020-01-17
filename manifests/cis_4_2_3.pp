# 4.2.3 Ensure permissions on all logfiles are configured (Scored)
#
# Description:
#
# Log files stored in /var/log/ contain logged information from many services on the system,
# or on log hosts others as well.
#
# Rationale:
#
# It is important to ensure that log files have the correct permissions to ensure that sensitive
# data is archived and protected.
#
# @summary 4.2.3 Ensure permissions on all logfiles are configured (Scored)
#
# @example
#   include cis::4_2_3
class cis::cis_4_2_3 (
  Boolean $enforced = true,
) {

  if $enforced {
    exec { 'set permissions on all logfiles':
      command => 'find /var/log -type f -exec chmod g-wx,o-rwx "{}" + -o -type d -exec chmod g-w,o-rwx "{}" +',
      onlyif  => 'if [ $(find /var/log -type f -perm /037 -ls -o -type d -perm /026 -ls | wc -l) -gt 0 ]; then exit 1; else exit 0; fi',
      user    => 'root',
      path    => [ '/usr/bin' ],
    }
  }
}
