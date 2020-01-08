# frozen_string_literal: true

# cis_6_2_14.rb
# 6.2.14 Ensure all groups in /etc/passwd exist in /etc/group (Scored)

Facter.add('cis_6_2_14') do
  setcode do
    Facter::Core::Execution.exec('/usr/local/bin/cis_6_2_14.sh')
  end
end
