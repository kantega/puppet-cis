# 5.5.2 Ensure system accounts are non-login (Scored)
#
#
# Description:
# There are a number of accounts provided with Red Hat 7 that are used to manage applications and are not intended to provide
# an interactive shell.
#
# @summary 5.5.2 Ensure system accounts are non-login (Scored)
#
# @exampl e
#   include cis::5_5_2
class cis::cis_5_5_2 (
  Boolean $enforced = true,
) {
  if $enforced {
    if $facts['cis_5_5_2'] != [] {
      $facts['cis_5_5_2'].each | String $user | {
        exec { "nologin ${user}":
          command => "usermod -s /sbin/nologin ${user}",
          path    => '/sbin/',
        }
      }
    }
  }
}
