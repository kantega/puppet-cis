# frozen_string_literal: true

# cis_5_5_4.rb
# 5.5.4 Ensure default group for the root account is GID 0 (Scored)

Facter.add('cis_5_5_4') do
  setcode do
    Facter::Core::Execution.exec('grep "^root:" /etc/passwd | cut -f4 -d:')
  end
end
