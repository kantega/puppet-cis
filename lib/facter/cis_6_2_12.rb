# frozen_string_literal: true

# cis_6_2_12.rb
# 6.2.12 Ensure no users have .netrc files (Scored)

Facter.add('cis_6_2_12') do
  setcode do
    Facter::Core::Execution.exec('/usr/local/bin/cis_6_2_12.sh')
  end
end
