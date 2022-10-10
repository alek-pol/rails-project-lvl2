# frozen_string_literal: true

module Posts::LikesHelper
  def current_user_like(post)
    post.likes.find_by(creator: current_user)
  end

  def current_user_like?(post)
    current_user_like(post).present?
  end
end
