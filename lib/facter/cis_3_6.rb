# frozen_string_literal: true

# cis_3_6.rb

Facter.add('cis_3_6') do
  setcode do
    Facter::Core::Execution.exec('grep "^GRUB_CMDLINE_LINUX.*ipv6.disable=1" /etc/default/grub')
    if $CHILD_STATUS
      true
    else
      false
    end
  end
end
