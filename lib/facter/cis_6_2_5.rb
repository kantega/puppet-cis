# frozen_string_literal: true

# cis_6_2_5.rb
# 6.2.5 Ensure no legacy "+" entries exist in /etc/group (Scored)

Facter.add('cis_6_2_5') do
  setcode "grep '^\\+:' /etc/group"
end
