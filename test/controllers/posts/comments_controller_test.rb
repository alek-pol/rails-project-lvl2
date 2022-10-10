# frozen_string_literal: true

require 'test_helper'

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)

    @post    = posts(:one)
    @comment = post_comments(:one)

    @post_comment = {
      content: Faker::Books::Dune.saying
    }
  end

  test 'should create comment' do
    assert_difference('PostComment.count', 1) do
      post post_comments_url(@post), params: { post_comment: @post_comment }
    end
    assert_redirected_to post_url(@post)

    comment = PostComment.find_by!(@post_comment)
    assert { comment }
  end

  test 'should create post_comment with parent' do
    assert_difference('PostComment.count', 1) do
      post post_comments_url(@post), params: { post_comment: @post_comment.merge(parent_id: @comment.id) }
    end

    comment = PostComment.find_by!(@post_comment)
    p comment
    pp PostComment.all
    assert_equal(comment.ancestry, @comment.id.to_s)
    assert_equal(@comment, PostComment.last.parent)
  end
end
