# 1.11 Ensure system-wide crypto policy is FUTURE or FIPS (Scored)
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
# FUTURE: Is a conservative security level that is believed to withstand any near-term future
# attacks. This level does not allow the use of SHA-1 in signature algorithms. The RSA and
# Diffie-Hellman parameters are accepted if larger than 3071 bits. The level provides at least
# 128-bit security
# FIPS: Conforms to the FIPS 140-2 requirements. This policy is used internally by the fips-
# mode-setup(8) tool which can switch the system into the FIPS 140-2 compliance mode. The
# level provides at least 112-bit security
#
# @summary 1.11 Ensure system-wide crypto policy is FUTURE or FIPS (Scored)
#
# @example
#   include cis::1_11
class cis::cis_1_11 {
  # See cis_1_10
}
