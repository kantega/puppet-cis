# frozen_string_literal: true

require 'English'

# cis_3_6_1.rb
# 3.6.1 Ensure iptables is installed

Facter.add('cis_3_6_1') do
  setcode do
    Facter::Core::Execution.exec('/usr/bin/rpm -q iptables')
    unless $CHILD_STATUS
      true
    end
    false
  end
end
