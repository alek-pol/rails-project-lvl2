# frozen_string_literal: true

# == Schema Information
#
# Table name: post_likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  creator_id :integer          not null
#  post_id    :integer          not null
#
# Indexes
#
#  index_post_likes_on_creator_id  (creator_id)
#  index_post_likes_on_post_id     (post_id)
#
# Foreign Keys
#
#  creator_id  (creator_id => users.id)
#  post_id     (post_id => posts.id)
#
require 'test_helper'

class PostLikeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
