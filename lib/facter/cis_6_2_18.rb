# frozen_string_literal: true

# cis_6_2_18.rb
# 6.2.18 Ensure no duplicate user names exist (Scored)

Facter.add('cis_6_2_18') do
  setcode do
    Facter::Core::Execution.exec('/usr/local/bin/cis_6_2_18.sh')
  end
end
