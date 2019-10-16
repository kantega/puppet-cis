# frozen_string_literal: true

# cis_1_1_10.rb
# 1.1.10 Ensure noexec option set on /var/tmp partition

Facter.add('cis_1_1_10') do
  setcode do
    mounted = Facter::Core::Execution.exec('mount | grep \' /var/tmp \'')
    if mounted.match?(%r{noexec})
      true
    else
      false
    end
  end
end
