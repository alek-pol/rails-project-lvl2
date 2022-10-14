# frozen_string_literal: true

rows = Array.new(4) { |num| { email: "test#{num + 1}@test.ru", password: "tests#{num + 1}" } }

User.transaction(requires_new: true) do
  User.destroy_all
  User.create!(rows)

  @users_id = User.ids
end
