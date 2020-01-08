# 5.5.3 Ensure default user shell timeout is 900 seconds or less (Scored)
#
# Description:
# The default TMOUT determines the shell timeout for users. The TMOUT value is measured in
# seconds.
#
#
# @summary 5.5.3 Ensure default user shell timeout is 900 seconds or less (Scored)
#
# @example
#   include cis::cis_5_5_3
class cis::cis_5_5_3 (
  Boolean $enforced = true,
) {

  if $enforced {
    file_line { 'bashrc_tmout':
      path => '/etc/bashrc',
      line => 'TMOUT=900',
    }
    file_line { 'profile_tmout':
      path => '/etc/profile',
      line => 'TMOUT=900',
    }
  }
}
