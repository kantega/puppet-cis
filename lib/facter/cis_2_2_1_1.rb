# frozen_string_literal: true

require 'English'

# cis_2_2_1_1.rb
# 2.2.1.1 Ensure time synchronization is in use

Facter.add('cis_2_2_1_1') do
  setcode do
    Facter::Core::Execution.exec('/usr/bin/rpm -q ntp')
    unless $CHILD_STATUS
      true
    end
    Facter::Core::Execution.exec('/usr/bin/rpm -q chrony')
    unless $CHILD_STATUS
      true
    end
    false
  end
end
