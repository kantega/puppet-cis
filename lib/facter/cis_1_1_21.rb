# frozen_string_literal: true

# cis_1_1_21.rb
# 1.1.21 Ensure sticky bit is set on all world-writable directories

Facter.add('cis_1_1_21') do
  setcode "df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null"
end
