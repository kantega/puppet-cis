# 1.10 Ensure system-wide crypto policy is not legacy (Scored)
#
# Description:
#
# The system-wide crypto-policies followed by the crypto core components allow
# consistently deprecating and disabling algorithms system-wide.
# The individual policy levels (DEFAULT, LEGACY, FUTURE, and FIPS) are included in the
# crypto-policies(7) package.
#
# Rationale:
#
# If the Legacy system-wide crypto policy is selected, it includes support for TLS 1.0, TLS 1.1,
# and SSH2 protocols or later. The algorithms DSA, 3DES, and RC4 are allowed, while RSA
# and Diffie-Hellman parameters are accepted if larger than 1023-bits.
# These legacy protocols and algorithms can make the system vulnerable to attacks,
# including those listed in RFC 7457
#
# @summary 1.10 Ensure system-wide crypto policy is not legacy (Scored)
#
# @example
#   include cis::1_10
class cis::cis_1_10 (
  Boolean $enforced = true,
) {

  if $enforced {
    exec { 'set system-wide crypto policy':
      command => '/usr/bin/update-crypto-policies --set FUTURE',
      unless  => '/usr/bin/update-crypto-policies --show | /usr/bin/grep FUTURE',
    }
    ~>exec { 'update system-wide crypto policy':
      command     => '/usr/bin/update-crypto-policies --set FUTURE',
      refreshonly => true,
    }
  }
}
