# frozen_string_literal: true

# cis_5_4_2.rb
# 5.4.2 Ensure system accounts are non-login (Scored)

Facter.add('cis_5_4_2') do
  setcode do
    user_list = Facter::Core::Execution.exec(
      "egrep -v \"^\\+\" /etc/passwd | awk -F: '($1!=\"root\" && $1!=\"sync\" && $1!=\"shutdown\" && $1!=\"halt\" && $3<1000 && $7!=\"/sbin/nologin\" && $7!=\"/bin/false\") {print}'",
    ).split("\n")
    # rubocop:enable Metrics/LineLength
    users = []

    user_list.each do |user|
      users.push(%r{^[^:]*}.match(user))
    end
    users
  end
end
