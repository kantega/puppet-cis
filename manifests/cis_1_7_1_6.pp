# 1.7.1.6 Ensure SETroubleshoot is not installed (Scored)
#
#
# Description:
# The SETroubleshoot service notifies desktop users of SELinux denials through a user- friendly interface. The service provides
# important information around configuration errors, unauthorized intrusions, and other potential errors.
#
# @summary 1.7.1.6 Ensure SETroubleshoot is not installed (Scored)
#
# @example
#   include cis::1_7_1_6
class cis::cis_1_7_1_6 (
  Boolean $enforced = true,
) {
  if $enforced {
    package { 'setroubleshoot':
      ensure => purged,
    }
  }
}
