# 4.1.2.2 Ensure audit logs are not automatically deleted (Scored)
#
# Description:
# The max_log_file_action setting determines how to handle the audit log file reaching the
# max file size. A value of keep_logs will rotate the logs but never delete old logs.
#
# Rationale:
# In high security contexts, the benefits of maintaining a long audit history exceed the cost of
# storing the audit history.
#
# @summary 4.1.2.2 Ensure audit logs are not automatically deleted (Scored)
#
# @example
#   include cis::4_1_2_2
class cis::cis_4_1_2_2 (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line { 'max_log_file_action':
      ensure => present,
      path   => '/etc/audit/auditd.conf',
      line   => 'max_log_file_action = keep_logs',
      match  => '^max_log_file_action',
    }
  }
}
