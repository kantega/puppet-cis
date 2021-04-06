# 5.4.2 Ensure system accounts are non-login (Scored)
#
#
# Description:
# There are a number of accounts provided with Red Hat 7 that are used to manage applications and are not intended to provide
# an interactive shell.
#
# @summary 5.4.2 Ensure system accounts are non-login (Scored)
#
# @exampl e
#   include cis::5_4_2
class cis::cis_5_4_2 (
  Boolean $enforced = true,
  Array[String] $exclude_users = [],
) {
  if $enforced {
    if $facts['cis_5_4_2'] != [] {
      $users = delete($facts['cis_5_4_2'],$exclude_users)
      $users.each | String $user | {
        exec { "nologin ${user}":
          command => "usermod -s /sbin/nologin ${user}",
          path    => '/sbin/',
        }
      }
    }
  }
}
