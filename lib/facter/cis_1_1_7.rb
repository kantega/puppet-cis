# frozen_string_literal: true

# cis_1_1_7.rb
# Ensures a seperate partition exists for /var/tmp

Facter.add('cis_1_1_7') do
  setcode '/bin/mount | /bin/grep \' /var/tmp \''
end
