# frozen_string_literal: true

# cis_6_2_20.rb
# 6.2.20 Ensure all users' home directories exist (Scored)

Facter.add('cis_6_2_20') do
  setcode do
    Facter::Core::Execution.exec('/usr/local/bin/cis_6_2_20.sh')
  end
end
