# frozen_string_literal: true

# cis_2_2_15.rb
# 2.2.15 Ensure mail transfer agent is configured for local-only mode

Facter.add('cis_2_2_15') do
  ipv4 = Facter::Core::Execution.exec('netstat -an | grep "[[:space:]]127.0.0.1:25[[:space:]]"')
  ipv6 = Facter::Core::Execution.exec('netstat -an | grep "[[:space:]]::1:25[[:space:]]"')
  if ' 127.0.0.1:25' =~ /#{ipv4}/ || ' ::1:25' =~ /#{ipv6}/
    false
  else
    true
  end
end
