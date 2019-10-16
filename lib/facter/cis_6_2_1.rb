# frozen_string_literal: true

# cis_6_2_1.rb
# 6.2.1 Ensure password fields are not empty (Scored)

Facter.add('cis_6_2_1') do
  setcode "cat /etc/shadow | awk -F: \'($2 == \"\" ) { print $1 \" does not have a password \"}\'"
end
