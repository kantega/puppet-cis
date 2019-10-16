# frozen_string_literal: true

# cis_1_1_2.rb
# Ensure separate partition exists for /tmp

Facter.add('cis_1_1_2') do
  setcode '/bin/mount | /bin/grep \' /tmp \''
end
