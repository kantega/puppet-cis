# frozen_string_literal: true

# cis_6_2_7.rb
# 6.2.7 Ensure users' home directories permissions are 750 or more restrictive (Scored)

Facter.add('home_directory_permission') do
  setcode do
    Facter::Core::Execution.exec('/usr/local/bin/cis_6_2_7.sh')
  end
end
