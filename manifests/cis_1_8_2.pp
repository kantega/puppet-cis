# 1.8.2 Ensure GDM login banner is configured (Scored)
#
#
# Description:
# GDM is the GNOME Display Manager which handles graphical login for GNOME based systems.
#
# @summary 1.8.2 Ensure GDM login banner is configured (Scored)
#
# @example
#   include cis::1_8_2
class cis::cis_1_8_2 (
  Boolean $enforced = true,
) {
  if $enforced {
    file { 'gdm3 config directory':
      ensure => directory,
      path   => '/etc/gdm3',
    }
    ->file { 'gdm config file':
        ensure  => file,
        path    => '/etc/gdm3/greeter.dconf-defaults',
        content => "[org/gnome/login-screen]\nbanner-message-enable=true\nbanner-message-text=\'Authorized uses only. All activity may be monitored and reported.\'", #lint:ignore:140chars
    }
  }
}
