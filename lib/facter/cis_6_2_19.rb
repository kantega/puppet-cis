# frozen_string_literal: true

Facter.add('cis_6_2_19') do
  setcode do
    Facter::Core::Execution.exec('/usr/local/bin/cis_6_2_19.sh')
  end
end
