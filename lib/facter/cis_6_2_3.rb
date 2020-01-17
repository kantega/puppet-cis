# frozen_string_literal: true

# cis_6_2_4.rb

Facter.add('cis_6_2_4') do
  setcode "grep '^\\+:' /etc/shadow"
end
