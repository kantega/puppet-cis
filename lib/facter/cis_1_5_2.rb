# frozen_string_literal: true

# cis_1_5_2.rb
# 1.5.2 Ensure XD/NX support is enabled

Facter.add('cis_1_5_2') do
  setcode '/usr/bin/dmesg | /usr/bin/grep "NX.*protection: active"'
end
