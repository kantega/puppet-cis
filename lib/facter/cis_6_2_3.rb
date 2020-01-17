# frozen_string_literal: true

# cis_6_2_3.rb

Facter.add('cis_6_2_3') do
  setcode do
    Facter::Core::Execution.exec('/usr/local/bin/cis_6_2_3.sh')
  end
end
