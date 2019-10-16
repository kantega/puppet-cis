# frozen_string_literal: true

# cis_1_1_3.rb
# Ensure nodev option set on /tmp partition

Facter.add('cis_1_1_3') do
  setcode do
    mounted = Facter::Core::Execution.exec('mount | grep \' /tmp \'')
    if mounted.match?(%r{nodev})
      true
    else
      false
    end
  end
end
