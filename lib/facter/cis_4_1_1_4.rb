# frozen_string_literal: true

# cis_4_1_1_4.rb

Facter.add('cis_4_1_1_4') do
  setcode do
    Facter::Core::Execution.exec('grep "^GRUB_CMDLINE_LINUX*audit_backlog_limit=8192" /etc/default/grub')
    unless $CHILD_STATUS
      true
    else
      false
    end
  end
end