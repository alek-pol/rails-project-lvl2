# frozen_string_literal: true

require 'test_helper'

class Posts::CommentsRoutingTest < RoutingTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)

    @post_id = posts(:one).id.to_s
  end

  test 'should comments routes' do
    should_route("POST /posts/#{@post_id}/comments" => 'posts/comments#create', post_id: @post_id)
  end
end
