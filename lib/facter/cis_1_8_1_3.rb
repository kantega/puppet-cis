# frozen_string_literal: true

# cis_1_8_1_3.rb
# 1.8.1.3 Ensure remote login warning banner is configured properly

Facter.add('cis_1_8_1_3') do
  setcode 'egrep \'(\\\v|\\\r|\\\m|\\\s)\' /etc/issue.net'
end
