# frozen_string_literal: true

# cis_1_7_2.rb
# 1.7.2 Ensure GDM login banner is configured
Facter.add('cis_1_7_2') do
  setcode 'rpm -qa | grep gnome'
end
