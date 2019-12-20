# 5.2.17 Ensure SSH AllowTcpForwarding is disabled (Scored)
#
# Description:
#
# SSH port forwarding is a mechanism in SSH for tunneling application ports from the client
# to the server, or servers to clients. It can be used for adding encryption to legacy
# applications, going through firewalls, and some system administrators and IT professionals
# use it for opening backdoors into the internal network from their home machines
#
# Rationale:
#
# Leaving port forwarding enabled can expose the organization to security risks and back-
# doors.
# SSH connections are protected with strong encryption. This makes their contents invisible
# to most deployed network monitoring and traffic filtering solutions. This invisibility carries
# considerable risk potential if it is used for malicious purposes such as data exfiltration.
# Cybercriminals or malware could exploit SSH to hide their unauthorized communications,
# or to exfiltrate stolen data from the target network
#
# @summary 5.2.17 Ensure SSH AllowTcpForwarding is disabled (Scored)
#
# @example
#   include cis::5_2_17
class cis::cis_5_2_17 (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line{ 'ssh allowtcpforwarding disable':
      ensure => 'present',
      path   => '/etc/ssh/sshd_config',
      line   => "AllowTcpForwarding no",
      match  => '^#?AllowTcpForwarding',
      notify => Service['sshd'],
    }
  }
}
