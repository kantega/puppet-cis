# frozen_string_literal: true

# cis_6_2_14.rb
# 6.2.14 Ensure no users have .rhosts files (Scored)

Facter.add('cis_6_2_14') do
  setcode do
    Facter::Core::Execution.exec('/usr/local/bin/cis_6_2_14')
  end
end
