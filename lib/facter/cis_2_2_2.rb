# frozen_string_literal: true

# cis_2_2_2.rb
# 2.2.2 Ensure X Window System is not installed

Facter.add('cis_2_2_2') do
  confine kernel: :linux
  setcode do
    package_list = Facter::Core::Execution.exec('rpm -qa xorg-x11*')
    package_list.split("\n")
  end
end
