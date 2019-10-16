# frozen_string_literal: true

# cis_1_7_1_2.rb
# 1.7.1.2 Ensure local login warning banner is configured properly (Scored)

Facter.add('cis_1_7_1_2') do
  setcode 'egrep \'(\\\v|\\\r|\\\m|\\\s)\' /etc/issue'
end
