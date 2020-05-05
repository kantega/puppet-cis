# The CentOS Linux 8 CIS Benchmark is updated for version: 1.0.0
#
# The benchmark can be found here:
# https://downloads.cisecurity.org/
#
# @summary This class declares CIS controls for the CentOS Linux 8 Benchmark v1.0.0
#
# @example
#   include cis

class cis (
  Boolean $cis_1_enforced                       = true,
  Boolean $cis_1_4_enforced                     = true,
  Boolean $cis_1_7_enforced                     = true,
  Boolean $cis_2_enforced                       = true,
  Boolean $cis_2_2_1_enforced                   = true,
  Boolean $cis_3_enforced                       = true,
  Boolean $cis_3_4_enforced                     = true,
  Boolean $cis_4_enforced                       = true,
  Boolean $cis_4_2_1_enforced                   = true,
  Boolean $cis_4_3_enforced                     = true,
  Boolean $cis_5_enforced                       = true,
  Boolean $cis_5_3_enforced                     = true,
  Boolean $cis_5_4_enforced                     = true,
  Boolean $cis_5_5_1_enforced                   = true,
  Boolean $cis_5_6_enforced                     = true,
  Boolean $cis_6_enforced                       = true,
) {

  if $cis_1_enforced {
    include ::cis::cis_1_1_1_1
    include ::cis::cis_1_1_1_2
    include ::cis::cis_1_1_1_3
    include ::cis::cis_1_1_1_4
    include ::cis::cis_1_1_2
    include ::cis::cis_1_1_3
    include ::cis::cis_1_1_4
    include ::cis::cis_1_1_5
    include ::cis::cis_1_1_6
    include ::cis::cis_1_1_7
    include ::cis::cis_1_1_8
    include ::cis::cis_1_1_9
    include ::cis::cis_1_1_10
    include ::cis::cis_1_1_11
    include ::cis::cis_1_1_12
    include ::cis::cis_1_1_13
    include ::cis::cis_1_1_14
    include ::cis::cis_1_1_15
    include ::cis::cis_1_1_16
    include ::cis::cis_1_1_17
    include ::cis::cis_1_1_18
    include ::cis::cis_1_1_19
    include ::cis::cis_1_1_20
    include ::cis::cis_1_1_21
    include ::cis::cis_1_1_22
    include ::cis::cis_1_1_23
    include ::cis::cis_1_2_1
    include ::cis::cis_1_2_2
    include ::cis::cis_1_2_3
    include ::cis::cis_1_3_1
    include ::cis::cis_1_3_2
    include ::cis::cis_1_3_3
    include ::cis::cis_1_5_1
    include ::cis::cis_1_5_2
    include ::cis::cis_1_5_3
    include ::cis::cis_1_6_1
    include ::cis::cis_1_6_2
    include ::cis::cis_1_8_1_1
    include ::cis::cis_1_8_1_2
    include ::cis::cis_1_8_1_3
    include ::cis::cis_1_8_1_4
    include ::cis::cis_1_8_2
    include ::cis::cis_1_9
    include ::cis::cis_1_10
    include ::cis::cis_1_11
    if $cis_1_4_enforced {
      include ::cis::cis_1_4_1
      include ::cis::cis_1_4_2
    }
    if $cis_1_7_enforced {
      include ::cis::cis_1_7_1_1
      include ::cis::cis_1_7_1_2
      include ::cis::cis_1_7_1_3
      include ::cis::cis_1_7_1_4
      include ::cis::cis_1_7_1_5
      include ::cis::cis_1_7_1_6
      include ::cis::cis_1_7_1_7
    }
  }
  if $cis_2_enforced {
    include ::cis::cis_2_1_1
    include ::cis::cis_2_1_2
    include ::cis::cis_2_1_3
    include ::cis::cis_2_1_4
    include ::cis::cis_2_1_5
    include ::cis::cis_2_1_6
    if $cis_2_2_1_enforced {
      include ::cis::cis_2_2_1_1
      include ::cis::cis_2_2_1_2
      include ::cis::cis_2_2_1_3
    }
    include ::cis::cis_2_2_2
    include ::cis::cis_2_2_3
    include ::cis::cis_2_2_4
    include ::cis::cis_2_2_5
    include ::cis::cis_2_2_6
    include ::cis::cis_2_2_7
    include ::cis::cis_2_2_8
    include ::cis::cis_2_2_9
    include ::cis::cis_2_2_10
    include ::cis::cis_2_2_11
    include ::cis::cis_2_2_12
    # 2.2.13 included in cis_2_2_12
    include ::cis::cis_2_2_14
    include ::cis::cis_2_2_15
    include ::cis::cis_2_2_16
    include ::cis::cis_2_2_17
    include ::cis::cis_2_2_18
    include ::cis::cis_2_2_19
    include ::cis::cis_2_2_21
    include ::cis::cis_2_3_1
    include ::cis::cis_2_3_2
    include ::cis::cis_2_3_3
  }
  if $cis_3_enforced {
    include ::cis::cis_3_1_1
    include ::cis::cis_3_1_2
    include ::cis::cis_3_2_1
    include ::cis::cis_3_2_2
    include ::cis::cis_3_2_3
    include ::cis::cis_3_2_4
    include ::cis::cis_3_2_5
    include ::cis::cis_3_2_6
    include ::cis::cis_3_2_7
    include ::cis::cis_3_2_8
    include ::cis::cis_3_2_9
    include ::cis::cis_3_3_1
    include ::cis::cis_3_3_2
    include ::cis::cis_3_3_3
    include ::cis::cis_3_3_4
    # if $cis_3_4_enforced {
      # TODO Implement firewall benchmarks
      # Use external module meanwhile
    # }
    include ::cis::cis_3_5
    include ::cis::cis_3_6
  }
  if $cis_4_enforced {
    include ::cis::cis_4_1_1_1
    include ::cis::cis_4_1_1_2
    include ::cis::cis_4_1_1_3
    include ::cis::cis_4_1_1_4
    include ::cis::cis_4_1_2_1
    include ::cis::cis_4_1_2_2
    include ::cis::cis_4_1_2_3
    include ::cis::cis_4_1_3
    include ::cis::cis_4_1_4
    include ::cis::cis_4_1_5
    include ::cis::cis_4_1_6
    include ::cis::cis_4_1_7
    include ::cis::cis_4_1_8
    include ::cis::cis_4_1_9
    include ::cis::cis_4_1_10
    include ::cis::cis_4_1_11
    include ::cis::cis_4_1_12
    include ::cis::cis_4_1_13
    include ::cis::cis_4_1_14
    include ::cis::cis_4_1_15
    include ::cis::cis_4_1_16
    include ::cis::cis_4_1_17
    if $cis_4_2_1_enforced {
      include ::cis::cis_4_2_1_1
      include ::cis::cis_4_2_1_2
      include ::cis::cis_4_2_1_3
      include ::cis::cis_4_2_1_4
      include ::cis::cis_4_2_1_5
      include ::cis::cis_4_2_1_6
    }
    include ::cis::cis_4_2_2_1
    include ::cis::cis_4_2_2_2
    include ::cis::cis_4_2_2_3
    include ::cis::cis_4_2_2_4
    include ::cis::cis_4_2_2_5
    include ::cis::cis_4_2_3
    include ::cis::cis_4_2_4
    if $cis_4_3_enforced {
      include ::cis::cis_4_3
    }
  }
  if $cis_5_enforced {
    include ::cis::cis_5_1_1
    include ::cis::cis_5_1_2
    include ::cis::cis_5_1_3
    include ::cis::cis_5_1_4
    include ::cis::cis_5_1_5
    include ::cis::cis_5_1_6
    include ::cis::cis_5_1_7
    include ::cis::cis_5_1_8
    include ::cis::cis_5_2_1
    include ::cis::cis_5_2_2
    include ::cis::cis_5_2_3
    include ::cis::cis_5_2_4
    include ::cis::cis_5_2_5
    include ::cis::cis_5_2_6
    include ::cis::cis_5_2_7
    include ::cis::cis_5_2_8
    include ::cis::cis_5_2_9
    include ::cis::cis_5_2_10
    include ::cis::cis_5_2_11
    include ::cis::cis_5_2_12
    include ::cis::cis_5_2_13
    include ::cis::cis_5_2_14
    include ::cis::cis_5_2_15
    include ::cis::cis_5_2_16
    include ::cis::cis_5_2_17
    include ::cis::cis_5_2_18
    include ::cis::cis_5_2_19
    include ::cis::cis_5_2_20
    # if $cis_5_3_enforced {
      # TODO
    # }
    if $cis_5_4_enforced {
      include ::cis::cis_5_4_1
      include ::cis::cis_5_4_2
      include ::cis::cis_5_4_3
      # include ::cis::cis_5_4_4 TODO
    }
    if $cis_5_5_1_enforced {
      include ::cis::cis_5_5_1_1
      include ::cis::cis_5_5_1_2
      include ::cis::cis_5_5_1_3
      include ::cis::cis_5_5_1_4
      include ::cis::cis_5_5_1_5
    }
    include ::cis::cis_5_5_2
    include ::cis::cis_5_5_3
    include ::cis::cis_5_5_4
    include ::cis::cis_5_5_5
    if $cis_5_6_enforced {
      include ::cis::cis_5_6
    }
    include ::cis::cis_5_7
  }
  if $cis_6_enforced {
    include ::cis::cis_6_1_1
    include ::cis::cis_6_1_2
    include ::cis::cis_6_1_3
    include ::cis::cis_6_1_4
    include ::cis::cis_6_1_5
    include ::cis::cis_6_1_6
    include ::cis::cis_6_1_7
    include ::cis::cis_6_1_8
    include ::cis::cis_6_1_9
    include ::cis::cis_6_1_10
    include ::cis::cis_6_1_11
    include ::cis::cis_6_1_12
    include ::cis::cis_6_1_13
    include ::cis::cis_6_1_14
    include ::cis::cis_6_2_1
    include ::cis::cis_6_2_2
    include ::cis::cis_6_2_3
    include ::cis::cis_6_2_4
    include ::cis::cis_6_2_5
    include ::cis::cis_6_2_6
    include ::cis::cis_6_2_7
    include ::cis::cis_6_2_8
    include ::cis::cis_6_2_9
    include ::cis::cis_6_2_10
    include ::cis::cis_6_2_11
    include ::cis::cis_6_2_12
    include ::cis::cis_6_2_13
    include ::cis::cis_6_2_14
    include ::cis::cis_6_2_15
    include ::cis::cis_6_2_16
    include ::cis::cis_6_2_17
    include ::cis::cis_6_2_18
    include ::cis::cis_6_2_19
    include ::cis::cis_6_2_20
  }
}

