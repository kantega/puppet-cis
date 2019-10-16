# frozen_string_literal: true

# cis_6_2_4.rb
# 6.2.4 Ensure no legacy "+" entries exist in /etc/group (Scored)

Facter.add('plus_group') do
  setcode "grep '^\\+:' /etc/group"
end
