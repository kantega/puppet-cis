# frozen_string_literal: true

# cis_1_1_15.rb
# 1.1.15 Ensure nodev option set on /dev/shm partition

Facter.add('cis_1_1_15') do
  setcode do
    mounted = Facter::Core::Execution.exec('mount | grep \' /dev/shm \'')
    if mounted.match?(%r{nodev})
      true
    else
      false
    end
  end
end
