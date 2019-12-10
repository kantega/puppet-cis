# frozen_string_literal: true

# cis_1_8_1_2.rb

Facter.add('cis_1_8_1_2') do
  setcode 'egrep \'(\\\v|\\\r|\\\m|\\\s)\' /etc/issue'
end
