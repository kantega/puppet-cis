# frozen_string_literal: true

# cis_1_1_9.rb
# 1.1.9 Ensure nosuid option set on /var/tmp partition

Facter.add('cis_1_1_9') do
  setcode do
    mounted = Facter::Core::Execution.exec('mount | grep \' /var/tmp \'')
    if mounted.match?(%r{nosuid})
      true
    else
      false
    end
  end
end
