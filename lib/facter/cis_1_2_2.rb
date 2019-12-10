# frozen_string_literal: true

# cis_1_2_2.rb
# 1.2.2 Ensure gpgcheck is globally activated

Facter.add('cis_1_2_2') do
  setcode '/usr/bin/grep "^gpgcheck[[:space:]]*=[[:space:]]*0" /etc/yum.conf /etc/yum.repos.d/*.repo'
end
