# frozen_string_literal: true

require 'test_helper'

class PostControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @post = posts(:one)

    @title       = Faker::Books::Dune.title
    @post_params = {
      title: @title,
      body: Faker::Books::Dune.quote,
      category_id: categories(:one).id
    }
  end

  test 'should get index' do
    get posts_path

    assert_response :success
  end

  test 'should get new' do
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    assert_difference('Post.count', 1) do
      post posts_path, params: { post: @post_params }
    end
    assert_response :redirect

    post = Post.find_by!(title: @title)
    assert { post }
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end

  test 'should get edit' do
    get edit_post_url(@post)
    assert_response :success
  end

  test 'should update post' do
    assert_difference('Post.count', 0) do
      patch post_url(@post), params: { post: @post_params }
    end
    assert_redirected_to post_url(@post)

    @post.reload

    assert_equal @post.title, @title
  end

  test 'should destroy post' do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end
    assert_not Post.exists? @post.id

    assert_redirected_to root_path
  end
end
