# frozen_string_literal: true

# cis_1_1_4.rb
# Ensure nosuid option set on /tmp partition

Facter.add('cis_1_1_4') do
  setcode do
    mounted = Facter::Core::Execution.exec('mount | grep \' /tmp \'')
    if mounted.match?(%r{nosuid})
      true
    else
      false
    end
  end
end
