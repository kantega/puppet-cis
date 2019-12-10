# 1.5.3 Ensure authentication required for single user mode (Scored)
#
#
# Description:
# ingle user mode (rescue mode) is used for recovery when the system detects an issue during boot or by
# manual selection from the bootloader.
#
# @summary 1.5.3 Ensure authentication required for single user mode (Scored)
#
# @example
#   include cis::1_5_3
class cis::cis_1_5_3 (
  Boolean $enforced = true,
) {

  if $enforced {
    file_line { 'rescue':
      path  => '/usr/lib/systemd/system/rescue.service',
      line  => 'ExecStart=-/usr/lib/systemd/systemd-sulogin-shell rescue'
      match => '^ExecStart=',
    }
    file_line { 'emergency':
      path  => '/usr/lib/systemd/system/emergency.service',
      line  => 'ExecStart=-/usr/lib/systemd/systemd-sulogin-shell emergency',
      match => '^ExecStart=',
    }
  }
}
