# 1.7.2 Ensure GDM login banner is configured (Scored)
#
#
# Description:
# GDM is the GNOME Display Manager which handles graphical login for GNOME based systems.
#
# @summary 1.7.2 Ensure GDM login banner is configured (Scored)
#
# @example
#   include cis::1_7_2
class cis::cis_1_7_2 (
  Boolean $enforced = true,
) {
  if $enforced {
    if !($facts['cis_1_7_2'].empty) {
      file { 'gdm config':
        ensure  => file,
        path    => '/etc/dconf/profile/gdm',
        content => 'user-db:user\nsystem-db:gdm\nfile-db:/usr/share/gdm/greeter-dconf-defaults',
      }->file { 'gdm login banner':
        ensure  => present,
        path    => '/etc/dconf/db/gdm.d/01-banner-message',
        content => "[org/gnome/login-screen]\nbanner-message-enable=true\nbanner-message-text=\'Authorized uses only. All activity may be monitored and reported.\'", #lint:ignore:140chars
        notify  => Exec['dconf'],
      }~>exec { 'update gdm config in system databases':
        path        => '/bin/',
        command     => 'dconf update',
        refreshonly => true,
      }
    }
  }
}
