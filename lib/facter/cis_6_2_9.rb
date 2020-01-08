# frozen_string_literal: true

# cis_6_2_9.rb
# 6.2.9 Ensure users' dot files are not group or world writable (Scored)

Facter.add('cis_6_2_9') do
  setcode do
    Facter::Core::Execution.exec('/usr/local/bin/cis_6_2_9.sh')
  end
end
