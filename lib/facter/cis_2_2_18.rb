# frozen_string_literal: true

# cis_2_2_18.rb
# 2.2.18 Ensure mail transfer agent is configured for local-only mode

Facter.add('cis_2_2_18') do
  ipv4 = Facter::Core::Execution.exec('netstat -an | grep "[[:space:]]127.0.0.1:25[[:space:]]"')
  ipv6 = Facter::Core::Execution.exec('netstat -an | grep "[[:space:]]::1:25[[:space:]]"')
  if ' 127.0.0.1:25' =~ /#{ipv4}/ || ' ::1:25' =~ /#{ipv6}/
    false
  else
    true
  end
end
