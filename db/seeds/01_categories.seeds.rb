# frozen_string_literal: true

rows = [
  { name: 'development' },
  { name: 'business' }
]

Category.transaction(requires_new: true) do
  Category.destroy_all
  Category.create!(rows)
end
