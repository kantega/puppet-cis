# frozen_string_literal: true

# cis_1_1_14.rb
# 1.1.14 Ensure nodev option set on /home partition

Facter.add('cis_1_1_14') do
  setcode do
    mounted = Facter::Core::Execution.exec('mount | grep \' /home \'')
    if mounted.match?(%r{nodev})
      true
    else
      false
    end
  end
end
