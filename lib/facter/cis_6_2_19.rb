# frozen_string_literal: true

# cis_6_2_19.rb
# 6.2.19 Ensure no duplicate group names exist (Scored)

Facter.add('cis_6_2_19') do
  setcode do
    Facter::Core::Execution.exec('/usr/local/bin/cis_6_2_19.sh')
  end
end
