# manifest disabling other irrelevant default stuff in CentOS8
class cis::extras (
  Boolean $enforced             = true,
  Boolean $disable_cockpit      = true,
  Boolean $remove_root_bin_path = true,
) {
  if $enforced {
    if $disable_cockpit {
      $packages = ['cockpit-bridge',
                   'cockpit-packagekit',
                   'cockpit-system',
                   'cockpit-ws',
                   'cockpit']
      $files = [ '/etc/motd.d/cockpit',
                 '/run/cockpit/motd' ]

      service { 'stop and disable cockpit service':
        ensure => stopped,
        name   => 'cockpit',
        enable => 'false',
      }
      ->package { $packages:
        ensure => absent,
      }->file { $files:
        ensure => absent,
      }
    }
    if $remove_root_bin_path {
      file_line { "remove root bin path":
        ensure => absent,
        path => "/root/.bash_profile",
        match => '^PATH=\$PATH:\$HOME/bin',
        match_for_absence => true
      }
    }
  }
}
