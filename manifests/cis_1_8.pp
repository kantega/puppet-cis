# 1.8 Ensure updates, patches, and additional security software are installed (Scored)
#
#
# Description:
# Periodically patches are released for included software either due to security flaws or to include additional functionality.
#
# @summary 1.8 Ensure updates, patches, and additional security software are installed (Scored)
#
# @example
#   include cis::1_8
class cis::cis_1_8 {
  # See CIS CentOS benchmark docs
  # It basically boils down to running 'yum check-update --security' at a regular interval
  # This CIS is best implemented as a check running at regular intervals in a monitoring system
}
