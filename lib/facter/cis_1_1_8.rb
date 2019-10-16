# frozen_string_literal: true

# cis_1_1_8.rb
# 1.1.8 Ensure nodev option set on /var/tmp partition

Facter.add('cis_1_1_8') do
  setcode do
    mounted = Facter::Core::Execution.exec('mount | grep \' /var/tmp \'')
    if mounted.match?(%r{nodev})
      true
    else
      false
    end
  end
end
