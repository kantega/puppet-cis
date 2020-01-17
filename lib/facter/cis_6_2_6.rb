# frozen_string_literal: true

# cis_6_2_6.rb
# 6.2.6 Ensure root is the only UID 0 account (Scored)

Facter.add('cis_6_2_6') do
  setcode do
    Facter::Core::Execution.exec("cat /etc/passwd | awk -F: '($3 == 0) { print $1 }")
  end
end
