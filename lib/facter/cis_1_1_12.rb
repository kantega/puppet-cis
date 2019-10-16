# frozen_string_literal: true

# cis_1_1_12.rb
# 1.1.12 Ensure separate partition exists for /var/log/audit

Facter.add('cis_1_1_12') do
  setcode '/bin/mount | /bin/grep \' /var/log/audit \''
end
