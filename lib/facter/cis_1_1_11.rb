# frozen_string_literal: true

# cis_1_1_11.rb
# Ensures a seperate partition exists for /var/log

Facter.add('cis_1_1_11') do
  setcode '/bin/mount | /bin/grep \' /var/log \''
end
