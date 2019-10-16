# frozen_string_literal: true

# tmp_noexec.rb
# Ensures noxec option exists on tmp.mount

Facter.add('cis_1_1_5') do
  setcode do
    mounted = Facter::Core::Execution.exec('mount | grep \' /tmp \'')
    if mounted.match?(%r{noexec})
      true
    else
      false
    end
  end
end
