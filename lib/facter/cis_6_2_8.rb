# frozen_string_literal: true

# cis_6_2_8.rb
# 6.2.8 Ensure users own their home directories (Scored)

Facter.add('cis_6_2_8') do
  setcode do
    Facter::Core::Execution.exec('/usr/local/bin/cis_6_2_8.sh')
  end
end
