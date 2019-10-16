# frozen_string_literal: true

# cis_6_1_12.rb
# Sometimes when administrators delete users or groups from the system they neglect to remove all files owned by those users or groups.

Facter.add('cis_6_1_12') do
  setcode "df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nogroup"
end
