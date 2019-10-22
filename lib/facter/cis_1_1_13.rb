# frozen_string_literal: true

# cis_1_1_13.rb
# 1.1.13 Ensure separate partition exists for /home

Facter.add('cis_1_1_13') do
  setcode '/bin/mount | /bin/grep \' /home \''
end
