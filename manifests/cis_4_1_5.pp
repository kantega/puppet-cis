# 4.1.5 Ensure session initiation information is collected (Scored)
#
# Description:
# Monitor session initiation events. The parameters in this section track changes to the files
# associated with session events. The file /var/run/utmp file tracks all currently logged in
# users. All audit records will be tagged with the identifier "session." The /var/log/wtmp file
# tracks logins, logouts, shutdown, and reboot events. The file /var/log/btmp keeps track of
# failed login attempts and can be read by entering the command /usr/bin/last -f
# /var/log/btmp . All audit records will be tagged with the identifier "logins."
#
# Rationale:
# Monitoring these files for changes could alert a system administrator to logins occurring at
# unusual hours, which could indicate intruder activity (i.e. a user logging in at a time when
# they do not normally log in).
#
# @summary 4.1.5 Ensure session initiation information is collected (Scored)
#
# @example
#   include cis::4_1_5
class cis::cis_4_1_5 (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line { 'audit.rules session 1':
      ensure => present,
      path   => '/etc/audit/audit.rules',
      line   => '-w /var/run/utmp -p wa -k session',
    }

    file_line { 'audit.rules session 2':
      ensure => present,
      path   => '/etc/audit/audit.rules',
      line   => '-w /var/log/wtmp -p wa -k logins',
    }

    file_line { 'audit.rules session 3':
      ensure => present,
      path   => '/etc/audit/audit.rules',
      line   => '-w /var/log/btmp -p wa -k logins',
    }
  }
}
