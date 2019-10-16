# frozen_string_literal: true

# cis_6_2_3.rb
# 6.2.3 Ensure no legacy "+" entries exist in /etc/shadow (Scored)

Facter.add('cis_6_2_3') do
  setcode "grep '^\\+:' /etc/shadow"
end
