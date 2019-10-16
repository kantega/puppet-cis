# frozen_string_literal: true

# cis_6_2_7.rb
# 6.2.7 Ensure all users' home directories exist (Scored)

Facter.add('cis_6_2_7') do
  setcode do
    Facter::Core::Execution.exec('/tmp/cis_scripts/home_directory.sh')
  end
end
