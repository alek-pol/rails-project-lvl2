# frozen_string_literal: true

require 'test_helper'

class PostsRoutingTest < RoutingTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)

    @post_id = posts(:one).id.to_s
  end

  test 'should posts routes' do
    should_route('GET /' => 'posts#index')
    should_route('GET /posts/new' => 'posts#new')
    should_route("GET /posts/#{@post_id}" => 'posts#show', id: @post_id)
    should_route("GET /posts/#{@post_id}/edit" => 'posts#edit', id: @post_id)
    should_route("DELETE /posts/#{@post_id}" => 'posts#destroy', id: @post_id)
  end
end
