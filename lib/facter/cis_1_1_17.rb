# frozen_string_literal: true

# cis_1_1_17.rb
# 1.1.17 Ensure nodev option set on /dev/shm partition

Facter.add('cis_1_1_17') do
  setcode do
    mounted = Facter::Core::Execution.exec('mount | grep \' /dev/shm \'')
    if mounted.match?(%r{noexec})
      true
    else
      false
    end
  end
end
