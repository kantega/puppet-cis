# frozen_string_literal: true

# cis_6_2_16.rb
# 6.2.16 Ensure no duplicate UIDs exist (Scored)

Facter.add('cis_6_2_16') do
  setcode do
    Facter::Core::Execution.exec('/usr/local/bin/cis_6_2_16.sh')
  end
end
