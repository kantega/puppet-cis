# frozen_string_literal: true

# cis_1_3_3.rb

Facter.add('cis_1_3_3') do
  setcode do
    Facter::Core::Execution.exec('/usr/local/bin/cis_1_3_3.sh')
  end
end
