# frozen_string_literal: true

# cis_6_2_17.rb
# 6.2.17 Ensure no duplicate user names exist (Scored)

Facter.add('cis_6_2_17') do
  setcode do
    Facter::Core::Execution.exec('/usr/local/bin/cis_6_2_17.sh')
  end
end
