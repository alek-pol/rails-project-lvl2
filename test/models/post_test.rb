# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  body        :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer          not null
#  creator_id  :integer          not null
#
# Indexes
#
#  index_posts_on_category_id  (category_id)
#  index_posts_on_creator_id   (creator_id)
#
# Foreign Keys
#
#  category_id  (category_id => categories.id)
#  creator_id   (creator_id => users.id)
#
require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    @post = posts(:one)
    @title = Faker::Books::Dune.title
    @post_params = {
      title: @title,
      body: Faker::Books::Dune.quote,
      category_id: categories(:one).id,
      creator_id: User.first.id
    }
  end

  test 'should create post' do
    assert_difference('Post.count', 1) do
      Post.create!(@post_params)
    end

    post = Post.find_by!({ title: @title })
    assert_equal @post_params[:title], post.title
  end

  test 'should destroy post' do
    assert_difference('Post.count', -1) do
      Post.destroy(@post.id)
    end
    assert_not Post.exists? @post.id
  end
end
