# 5.4.5 Ensure default user shell timeout is 900 seconds or less (Scored)
#
# Description:
# The default TMOUT determines the shell timeout for users. The TMOUT value is measured in
# seconds.
#
#
# @summary 5.4.5 Ensure default user shell timeout is 900 seconds or less (Scored)
#
# @example
#   include cis::cis_5_4_5
class cis::cis_5_4_5 (
  Boolean $enforced = true,
) {

  if $enforced {
    file_line { 'bashrc_tmout':
      path => '/etc/bashrc',
      line => 'TMOUT=600',
    }
    file_line { 'profile_tmout':
      path => '/etc/profile',
      line => 'TMOUT=600',
    }
  }
}
