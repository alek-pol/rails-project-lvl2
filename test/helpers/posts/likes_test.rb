# frozen_string_literal: true

require 'test_helper'

class Posts::LikesHelperTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include Posts::LikesHelper
  attr_reader :current_user

  setup do
    sign_in users(:one)

    @current_user = users(:one)
    @post_one = posts(:one)
    @post_two = posts(:two)
  end

  test 'when post liked by current user (instance)' do
    post_like = current_user_like(@post_one)

    assert_instance_of(PostLike, post_like)
  end

  test 'when post liked by current user' do
    post_like = current_user_like?(@post_one)

    assert post_like
  end

  test 'when current user does not like the (instance)' do
    post_like = current_user_like(@post_two)

    assert_nil post_like
  end

  test 'when current user does not like the' do
    post_like = current_user_like?(@post_two)

    assert_not(post_like)
  end
end
