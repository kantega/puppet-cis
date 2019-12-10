# 1.2.3 Ensure package manager repositories are configured (Not Scored)
#
#
# Description:
# Systems need to have package manager repositories configured to ensure they receive the latest patches and updates.
#
# @summary 1.2.3 Ensure package manager repositories are configured (Not Scored)
#
# @example
#   include cis::1_2_3
class cis::cis_1_2_3 {
  # See CIS CentOS7 bencmark documentation
  # Boils down to inspecting the contents of 'dnf repolist'
}
