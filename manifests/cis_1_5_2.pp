# 1.5.2 Ensure XD/NX support is enabled (Not Scored)
#
#
# Description:
# Recent processors in the x86 family support the ability to prevent code execution on a per memory page basis.
# Generically and on AMD processors, this ability is called No Execute (NX), while on Intel processors it is called Execute Disable (XD).
# This ability can help prevent exploitation of buffer overflow vulnerabilities and should be activated whenever possible.
# Extra steps must be taken to ensure that this protection is enabled, particularly on 32-bit x86 systems. Other processors, such
# as # Itanium and POWER, have included such support since inception and the standard kernel for those platforms supports the feature.
#
# @summary 1.5.2 Ensure XD/NX support is enabled (Not Scored)
#
# @example
#   include cis::1_5_2
class cis::cis_1_5_2 (
  Boolean $enforced = true,
) {

  if $enforced {
    if ($facts['cis_1_5_2'].empty) {
      notify { 'cis_1_5_2':
        message => 'Not in compliance with CIS 1.5.2 (Not scored). Verify that No Execute (or Execute Disable, for some Intel processors) protection is enabled', #lint:ignore:140chars
        logevel => 'warning',
      }
    }
  }
}
