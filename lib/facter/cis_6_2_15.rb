# frozen_string_literal: true

# cis_6_2_15.rb
# 6.2.15 Ensure all groups in /etc/passwd exist in /etc/group (Scored)

Facter.add('cis_6_2_15') do
  setcode do
    Facter::Core::Execution.exec('/usr/local/bin/cis_6_2_15.sh')
  end
end
