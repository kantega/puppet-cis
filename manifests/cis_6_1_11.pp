# 6.1.11 Ensure no unowned files or directories exist (Scored)
#
# Description:
# Sometimes when administrators delete users from the password file they neglect to remove all files owned by those users from the system.
#
# @summary 6.1.11 Ensure no unowned files or directories exist (Scored)
#
# @example
#   include cis::6_1_11
class cis::cis_6_1_11 (
  Boolean $enforced = true,
  Array[String] $exclude_paths = [],
) {
  if $enforced {
    $string_to_grep = join($exclude_paths, '\|')
    file { 'no unowned files or directories check script':
      ensure  => file,
      path    => '/usr/local/bin/cis_6_1_11.sh',
      owner   => 'root',
      group   => 'root',
      mode    => '0711',
      content => template('cis/cis_6_1_11.sh.erb')
    }
    if $facts['cis_6_1_11'] != '' {
      notify { 'cis_6_1_11':
        message  => 'Not in compliance with CIS 6.1.11 (Scored). You have files or directories that are not owned by a user.',
        loglevel => 'warning',
      }
    }
  }
}
