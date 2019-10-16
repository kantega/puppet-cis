# frozen_string_literal: true

# cis_4_1_18.rb
# 4.1.18 Ensure the audit configuration is immutable

Facter.add('cis_4_1_18') do
  setcode do
    setting = Facter::Core::Execution.exec('tail -n 1 /etc/audit/audit.rules')
    if setting != '-e 2'
      true
    else
      false
    end
  end
end
