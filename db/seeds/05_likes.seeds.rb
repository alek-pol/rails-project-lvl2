# frozen_string_literal: true

rows = @posts.each_with_object([]) do |post, result|
  users = users_without_some_user(post.creator_id)
  random_users = users.shuffle.take(rand(1..users.count))

  random_users.map { |user_id| result << { post_id: post.id, user_id: user_id } }
end

PostLike.create!(rows)
