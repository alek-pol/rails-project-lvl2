# frozen_string_literal: true

require 'test_helper'

class Posts::LikesRoutingTest < RoutingTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)

    @post_id = posts(:one).id.to_s
    @like_id = post_likes(:one).id.to_s
  end

  test 'should likes routes' do
    should_route("POST /posts/#{@post_id}/likes" => 'posts/likes#create', post_id: @post_id)
    should_route("DELETE /posts/#{@post_id}/likes/#{@like_id}" => 'posts/likes#destroy',
                 post_id: @post_id, :id => @like_id)
  end
end
