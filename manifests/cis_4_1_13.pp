# 4.1.13 Ensure use of privileged commands is collected (Scored)
#
# Description:
# Monitor privileged programs (those that have the setuid and/or setgid bit set on execution)
# to determine if unprivileged users are running these commands.
#
# Rationale:
# Execution of privileged commands by non-privileged users could be an indication of
# someone trying to gain unauthorized access to the system.
#
# @summary 4.1.13 Ensure use of privileged commands is collected (Scored)
#
# @example
# include cis::4_1_13
class cis::cis_4_1_13 {
  # see docs
}


