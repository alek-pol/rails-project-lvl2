# frozen_string_literal: true

def add_sub_comment(comment)
  PostComment.create!({
                        content: Faker::Lorem.sentence(word_count: [3, 12, 27].sample),
                        post_id: comment.post_id,
                        user_id: random_user(comment.user_id),
                        parent_id: comment.id
                      })
end

rows = @posts.map do |post|
  {
    content: Faker::Lorem.question(word_count: 3),
    post_id: post.id,
    user_id: random_user(post.creator_id)
  }
end

PostComment.transaction(requires_new: true) do
  PostComment.create!(rows)
  first_comment = PostComment.first

  add_sub_comment(first_comment)
  add_sub_comment(PostComment.last)
  add_sub_comment(first_comment)
end
