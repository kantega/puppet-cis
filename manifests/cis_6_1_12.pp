# 6.1.12 Ensure no ungrouped files or directories exist (Scored)
#
# Description:
# Sometimes when administrators delete users or groups from the system they neglect to remove all files owned by those users or groups.
#
# @summary 6.1.12 Ensure no ungrouped files or directories exist (Scored)
#
# @example
#   include cis::6_1_12
class cis::cis_6_1_12 (
  Boolean $enforced = true,
  Array[String] $exclude_paths = [],
) {

  if $enforced {
    $string_to_grep = join($exclude_paths, '\|')
    file { 'no group unowned files or directories check script':
      ensure  => file,
      path    => '/usr/local/bin/cis_6_1_12.sh',
      owner   => 'root',
      group   => 'root',
      mode    => '0711',
      content => template('cis/cis_6_1_12.sh.erb')
    }
    if $facts['cis_6_1_12'] != '' {
      notify { 'cis_6_1_12':
        message  => 'Not in compliance with CIS 6.1.12 (Scored). You have files or directories that are not owned by a group.',
        loglevel => 'warning',
      }
    }
  }
}
