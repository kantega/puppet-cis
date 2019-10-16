# frozen_string_literal: true

# cis_1_6_1_6.rb
# 1.6.1.6 Ensure no unconfined daemons exist
Facter.add('cis_1_6_1_6') do
  setcode "ps -eZ | egrep \"initrc\" | egrep -vw \"tr|ps|egrep|bash|awk\" | tr ':' ' ' | awk '{ print $NF }'"
end
