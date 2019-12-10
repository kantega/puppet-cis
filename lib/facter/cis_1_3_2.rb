# frozen_string_literal: true

# cis_1_3_2.rb

Facter.add('cis_1_3_2') do
  setcode do
    Facter::Core::Execution.exec('/usr/local/bin/cis_1_3_2.sh')
  end
end
