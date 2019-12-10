# frozen_string_literal: true

# cis_1_8_1_1.rb
# 1.8.1.1 Ensure message of the day is configured properly

Facter.add('cis_1_8_1_1') do
  setcode "egrep '(\\\\v|\\\\r|\\\\m|\\\\s)' /etc/motd"
end
