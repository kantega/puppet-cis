# frozen_string_literal: true

# cis_6_2_5.rb
# 6.2.5 Ensure root is the only UID 0 account (Scored)

Facter.add('cis_6_2_5') do
  setcode "cat /etc/passwd | awk -F: '($3 == 0) { print $1 }"
end
