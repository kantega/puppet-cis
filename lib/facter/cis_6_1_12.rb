# frozen_string_literal: true

# cis_6_1_12.rb
# Sometimes when administrators delete users or groups from the system they neglect to remove all files owned by those users or groups.

Facter.add('cis_6_1_12') do
  setcode do
    Facter::Core::Execution.exec('/usr/local/bin/cis_6_1_12.sh')
  end
end
