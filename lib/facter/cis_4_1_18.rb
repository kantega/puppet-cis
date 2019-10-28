# frozen_string_literal: true

# cis_4_1_18.rb
# 4.1.18 Ensure the audit configuration is immutable

Facter.add('cis_4_1_18') do
  setcode do
    setting = Facter::Core::Execution.exec('tail -n 1 /etc/audit/audit.rules')
    setting_defs = Facter::Core::Execution.exec('grep \'-e 2$\' /etc/audit/audit.rules | wc -l')
    if setting != '-e 2' or setting_defs.to_i > 1
      true
    else
      false
    end
  end
end
