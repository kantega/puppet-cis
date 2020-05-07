# frozen_string_literal: true

# cis_4_1_1_3.rb

Facter.add('cis_4_1_1_3') do
  setcode do
    Facter::Core::Execution.exec('grep "^GRUB_CMDLINE_LINUX.*audit=1" /etc/default/grub')
    if $?.exitstatus != 0
      true
    else
      false
    end
  end
end
