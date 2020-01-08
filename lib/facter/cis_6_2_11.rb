# frozen_string_literal: true

# cis_6_2_11.rb
# 6.2.11 Ensure no users have .netrc files (Scored)

Facter.add('cis_6_2_11') do
  setcode do
    Facter::Core::Execution.exec('/usr/local/bin/cis_6_2_11.sh')
  end
end
