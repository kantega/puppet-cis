# frozen_string_literal: true

# cis_3_6_2.rb
# 3.6.2 Ensure default deny firewall policy

Facter.add('cis_3_6_2') do
  ip = Facter::Core::Execution.exec('/usr/sbin/iptables -L INPUT | /usr/bin/head -n 1')
  op = Facter::Core::Execution.exec('/usr/sbin/iptables -L OUTPUT | /usr/bin/head -n 1')
  fp = Facter::Core::Execution.exec('/usr/sbin/iptables -L FORWARD | /usr/bin/head -n 1')
  if !(ip.match?(%r{ DROP}) && op.match?(%r{ DROP}) && fp.match?(%r{ DROP}))
    false
  else
    true
  end
end
