# frozen_string_literal: true

require 'test_helper'

class Posts::LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)

    @user     = users(:one)
    @post_one = posts(:one)
    @post_two = posts(:two)
    @like     = post_likes(:one)
  end

  test 'should create like post' do
    assert_difference('PostLike.count', 1) do
      post post_likes_path(@post_two)
    end

    assert_redirected_to post_url(@post_two)

    like = PostLike.find_by!(creator_id: @user.id, post_id: @post_two.id)

    assert { like }
  end

  test 'should destroy like' do
    assert_difference('PostLike.count', -1) do
      delete post_like_path(@post_one, @like)
    end

    assert_redirected_to post_url(@post_one)

    assert_not PostLike.exists? @like.id
  end
end
