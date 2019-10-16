# frozen_string_literal: true

# cis_6_2_8.rb
# 6.2.8 Ensure users' home directories permissions are 750 or more restrictive (Scored)

Facter.add('home_directory_permission') do
  setcode do
    Facter::Core::Execution.exec('/tmp/cis_scripts/home_dir_perm.sh')
  end
end
