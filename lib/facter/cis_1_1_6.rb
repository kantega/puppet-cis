# frozen_string_literal: true

# cis_1_1_6.rb
# Ensure separate partition exists for /var

Facter.add('cis_1_1_6') do
  setcode '/bin/mount | /bin/grep \' /var \''
end
