# 2.2.10 Ensure FTP Server is not enabled (Scored)
#
# Description:
# The File Transfer Protocol (FTP) provides networked computers with the ability to transfer files.
#
# Rationale:
# FTP does not protect the confidentiality of data or authentication credentials.
# It is recommended sftp be used if file transfer is required.
# Unless there is a need to run the system as a FTP server (for example, to allow anonymous downloads),
# it is recommended that the service be disabled to reduce the potential attack surface.
#
# @summary 2.2.10 Ensure FTP Server is not enabled (Scored)
#
# @example
#   include cis::2_2_10
class cis::cis_2_2_10 (
  Boolean $enforced = true,
) {

  if $enforced {
    service { 'vsftpd':
      ensure => stopped,
      enable => false,
    }
  }
}
