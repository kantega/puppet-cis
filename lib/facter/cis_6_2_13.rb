# frozen_string_literal: true

# cis_6_2_13.rb
# 6.2.13 Ensure users' .netrc Files are not group or world accessible

Facter.add('cis_6_2_13') do
  setcode do
    Facter::Core::Execution.exec('/usr/local/bin/cis_6_2_13.sh')
  end
end
