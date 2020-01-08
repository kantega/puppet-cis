# frozen_string_literal: true

# cis_6_2_10.rb
# 6.2.10 Ensure no users have .forward files (Scored)

Facter.add('cis_6_2_10') do
  setcode do
    Facter::Core::Execution.exec('/usr/local/bin/cis_6_2_10.sh')
  end
end
