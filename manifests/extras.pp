# manifest disabling other irrelevant default stuff in CentOS8
class cis::extras (
  Boolean $enforced               = true,
  Boolean $disable_cockpit        = true,
  Boolean $remove_root_bin_path   = true,
  Boolean $disable_setroubleshoot = true,
) {
  if $enforced {
    if $disable_cockpit {
      $cockpit_packages = ['cockpit-bridge',
        'cockpit-packagekit',
        'cockpit-system',
        'cockpit-ws',
        'cockpit']
      $cockpit_files = [ '/etc/motd.d/cockpit',
                 '/run/cockpit/motd' ]

      service { 'stop and disable cockpit service':
        ensure => stopped,
        name   => 'cockpit',
        enable => 'false',
      }
      package { $cockpit_packages:
        ensure => absent,
      }
      file { $cockpit_files:
        ensure => absent,
      }
      user { 'remove cockpit-ws user':
        ensure => absent,
        name   => 'cockpit-ws',
      }
    }
    if $remove_root_bin_path {
      file_line { 'remove root bin path':
        ensure            => absent,
        path              => '/root/.bash_profile',
        match             => '^PATH=\$PATH:\$HOME/bin',
        match_for_absence => true
      }
    }
    if $disable_setroubleshoot {
      package { 'setroubleshoot-plugins':
        ensure => absent,
      }
      file { '/etc/setroubleshoot':
        ensure => absent,
        path   => '/etc/setroubleshoot',
        force  => true,
      }
      file { '/var/lib/setroubleshoot':
        ensure => absent,
        path   => '/var/lib/setroubleshoot',
        force  => true,
      }
      user { 'remove setroubleshoot user':
        ensure => absent,
        name   => 'setroubleshoot',
      }
    }
  }
}
