# frozen_string_literal: true

# cis_6_1_11.rb
# Sometimes when administrators delete users from the password file they neglect to
# remove all files owned by those users from the system.

Facter.add('cis_6_1_11') do
  setcode do
    Facter::Core::Execution.exec('/usr/local/bin/cis_6_1_11.sh')
  end
end
