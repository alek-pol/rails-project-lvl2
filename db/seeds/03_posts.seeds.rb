# frozen_string_literal: true

rows = Array.new(3) do |row|
  post_date_time = DateTime.now - row
  {
    title: Faker::Lorem.sentence(word_count: 5, supplemental: true, random_words_to_add: 1),
    body: Faker::Lorem.paragraph(sentence_count: 6),
    category_id: @categories_id.sample,
    creator_id: @users_id[row],

    created_at: post_date_time,
    updated_at: post_date_time
  }
end

Post.transaction(requires_new: true) do
  Post.create!(rows)

  @posts = Post.all
end
