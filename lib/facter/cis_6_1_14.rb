# frozen_string_literal: true

# cis_6_1_14.rb
# This fact contains SGID files, which are nearly identical to SUID files mentioned in cis_1_1_13

Facter.add('cis_6_1_14') do
  setcode "df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -2000"
end
