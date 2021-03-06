# The CentOS Linux 7 CIS Benchmark is updated for version: 2.2.0
#
# The benchmark can be found here:
# https://downloads.cisecurity.org/
#
# @summary This class declares CIS controls for the CentOS Linux 7 Benchmark v2.2.0
#
# @example
#   include cis

class cis (
  Boolean $cis_1_enforced                       = true,
  # 1.3 Filesystem Integrity Checking
  Boolean $cis_1_3_enforced                     = true,
  # 1.6.1 Configure SELinux
  Boolean $cis_1_6_1_enforced                   = true,
  # 1.6.2 Ensure SELinux is installed
  Boolean $cis_1_6_2_enforced                   = true,
  Boolean $cis_2_enforced                       = true,
  # 2.2.1 Time Synchronization
  Boolean $cis_2_2_1_enforced                   = true,
  Boolean $cis_3_enforced                       = true,
  # 3.6 Firewall Configuration
  Boolean $cis_3_6_enforced                     = true,
  Boolean $cis_4_enforced                       = true,
  # 4.1 Configure System Accounting
  Boolean $cis_4_1_enforced                     = true,
  # 4.2 Configure Logging
  Boolean $cis_4_2_enforced                     = true,
  Boolean $cis_5_enforced                       = true,
  # 5.2 SSH Server Configuration
  Boolean $cis_5_2_enforced                     = true,
  # 5.3 Configure PAM
  Boolean $cis_5_3_enforced                     = true,
  # 5.4.1 Set Shadow Password Suite Parameters
  Boolean $cis_5_4_1_enforced                   = true,
  Boolean $cis_6_enforced                       = true,
) {

  if $cis_1_enforced {
      include ::cis::cis_1_1_1_1
      include ::cis::cis_1_1_1_2
      include ::cis::cis_1_1_1_3
      include ::cis::cis_1_1_1_4
      include ::cis::cis_1_1_1_5
      include ::cis::cis_1_1_1_6
      include ::cis::cis_1_1_1_7
      include ::cis::cis_1_1_1_8
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
      include ::cis::cis_1_2_1
      include ::cis::cis_1_2_2
      include ::cis::cis_1_2_3
      if $cis_1_3_enforced {
          include ::cis::cis_1_3_1
          include ::cis::cis_1_3_2
      }
      include ::cis::cis_1_4_1
      include ::cis::cis_1_4_3
      include ::cis::cis_1_5_1
      include ::cis::cis_1_5_2
      include ::cis::cis_1_5_3
      include ::cis::cis_1_5_4
      if $cis_1_6_1_enforced {
        include ::cis::cis_1_6_1_1
        include ::cis::cis_1_6_1_2
        include ::cis::cis_1_6_1_3
        include ::cis::cis_1_6_1_4
        include ::cis::cis_1_6_1_5
        include ::cis::cis_1_6_1_6
      }
      if $cis_1_6_2_enforced {
        include ::cis::cis_1_6_2
      }
      include ::cis::cis_1_7_1_1
      include ::cis::cis_1_7_1_2
      include ::cis::cis_1_7_1_3
      include ::cis::cis_1_7_1_4
      include ::cis::cis_1_7_2
      include ::cis::cis_1_8
  }
  if $cis_2_enforced {
    include ::cis::cis_2_1_1
    include ::cis::cis_2_1_2
    include ::cis::cis_2_1_3
    include ::cis::cis_2_1_4
    include ::cis::cis_2_1_5
    include ::cis::cis_2_1_6
    include ::cis::cis_2_1_7
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
    include ::cis::cis_2_2_13
    include ::cis::cis_2_2_14
    include ::cis::cis_2_2_15
    include ::cis::cis_2_2_16
    include ::cis::cis_2_2_17
    include ::cis::cis_2_2_18
    include ::cis::cis_2_2_19
    include ::cis::cis_2_2_20
    include ::cis::cis_2_2_21
    include ::cis::cis_2_3_1
    include ::cis::cis_2_3_2
    include ::cis::cis_2_3_3
    include ::cis::cis_2_3_4
    include ::cis::cis_2_3_5
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
    include ::cis::cis_3_3_1
    include ::cis::cis_3_3_2
    include ::cis::cis_3_3_3
    include ::cis::cis_3_4_1
    include ::cis::cis_3_4_2
    include ::cis::cis_3_4_3
    include ::cis::cis_3_4_4
    include ::cis::cis_3_4_5
    include ::cis::cis_3_5_1
    include ::cis::cis_3_5_2
    include ::cis::cis_3_5_3
    include ::cis::cis_3_5_4
    if $cis_3_6_enforced {
      include ::cis::cis_3_6_1
      include ::cis::cis_3_6_2
      include ::cis::cis_3_6_3
      include ::cis::cis_3_6_4
      include ::cis::cis_3_6_5

      Class['::cis::cis_3_6_1']
      -> Class['::cis::cis_3_6_3']
      -> Class['::cis::cis_3_6_4']
      -> Class['::cis::cis_3_6_5']
      -> Class['::cis::cis_3_6_2']
    }
    include ::cis::cis_3_7
  }
  if $cis_4_enforced {
    if $cis_4_1_enforced {
      include ::cis::cis_4_1_1_1
      include ::cis::cis_4_1_1_2
      include ::cis::cis_4_1_1_3
      include ::cis::cis_4_1_2
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
      include ::cis::cis_4_1_18
    }
    if $cis_4_2_enforced {
      include ::cis::cis_4_2_1_1
      include ::cis::cis_4_2_1_2
      include ::cis::cis_4_2_1_3
      include ::cis::cis_4_2_1_4
      include ::cis::cis_4_2_1_5
      include ::cis::cis_4_2_2_1
      include ::cis::cis_4_2_2_2
      include ::cis::cis_4_2_2_3
      include ::cis::cis_4_2_2_4
      include ::cis::cis_4_2_2_5
      include ::cis::cis_4_2_3
      include ::cis::cis_4_2_4
    }
    include ::cis::cis_4_3
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
    if $cis_5_2_enforced {
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
    }
    if $cis_5_3_enforced {
      include ::cis::cis_5_3_1
      include ::cis::cis_5_3_2
      include ::cis::cis_5_3_3
      include ::cis::cis_5_3_4
    }
    if $cis_5_4_1_enforced {

      include ::cis::cis_5_4_1_1
      include ::cis::cis_5_4_1_2
      include ::cis::cis_5_4_1_3
      include ::cis::cis_5_4_1_4
      include ::cis::cis_5_4_1_5
    }
    include ::cis::cis_5_4_2
    include ::cis::cis_5_4_3
    include ::cis::cis_5_4_4
    include ::cis::cis_5_4_5
    include ::cis::cis_5_5
    include ::cis::cis_5_6
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
  }
}
