# 6.2.3 Ensure root PATH Integrity (Scored)

#  Description:
#
#  The root user can execute any command on the system and could be fooled into executing
#  programs unintentionally if the PATH is not set correctly.
#
#  Rationale:
#
#  Including the current working directory (.) or other writable directory in root 's executable
#  path makes it likely that an attacker can gain superuser access by forcing an administrator
#  operating as root to execute a Trojan horse program.

class cis::cis_6_2_3 (
  Boolean $enforced = true,
) {

  if $enforced {
    file { 'root path integrity script':
      ensure  => file,
      path    => '/usr/local/bin/cis_6_2_3.sh',
      owner   => 'root',
      group   => 'root',
      mode    => '0711',
      content => file('cis/cis_6_2_3.sh'),
    }
    if $facts['cis_6_2_3'] != '' {
      notify { 'cis_6_2_3':
        message  => 'Not in compliance with CIS 6.2.3 (Scored). Integrity of root user PATH.',
        loglevel => 'warning',
      }
    }
  }
}
