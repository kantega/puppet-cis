# # 6.1.13 Audit SUID executables (Not Scored)
# #
# #
# # Description:
# # The owner of a file can set the file's permissions to run with the owner's or group's permissions, even if the user running the
# # program is not the owner or a member of the group. The most common reason for a SUID program is to enable users to perform functions
# # (such as changing their password) that require root privileges.
# #
# # @summary 6.1.13 Audit SUID executables (Not Scored)
# #
# # @example
# #   include cis::6_1_13
class cis::cis_6_1_13 (
  Boolean $enforced = true,
) {
#
#   if $enforced {
#     if $facts['cis_6_1_13'] {
#       notify { 'cis_6_1_13':
#         message  => '[6.1.13] (Not Scored) You have SUID files on your system. Check the suid_files
#         fact and ensure all files are authorized.', #lint:ignore:140chars
#       }
#     }
#   }
# }
#-------Data stored in suid_files
}
