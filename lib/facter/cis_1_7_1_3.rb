# frozen_string_literal: true

# cis_1_7_1_3.rb
# 1.7.1.3 Ensure remote login warning banner is configured properly

Facter.add('cis_1_7_1_3') do
  setcode 'egrep \'(\\\v|\\\r|\\\m|\\\s)\' /etc/issue.net'
end
