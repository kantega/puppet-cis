# frozen_string_literal: true

# cis_6_2_2.rb
# 6.2.2 Ensure no legacy "+" entries exist in /etc/passwd (Scored)

Facter.add('cis_6_2_2') do
  setcode "grep '^\\+:' /etc/passwd"
end
