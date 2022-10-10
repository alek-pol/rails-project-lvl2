# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class RoutingTest < ActionDispatch::IntegrationTest
  def take_controller_action(arg)
    raise ArgumentError unless arg.values.first =~ /\A(.+)#(.+)\z/

    controller = Regexp.last_match(1)
    action     = Regexp.last_match(2)

    { controller:, action: }
  end

  def should_route(arg)
    arg     = arg.dup
    request = arg.keys.detect { |key| key.is_a?(String) }
    raise ArgumentError unless request

    options = arg.slice!(request)
    raise ArgumentError unless request =~ /\A(GET|POST|PUT|PATCH|DELETE)\s+(.+)\z/

    method = Regexp.last_match(1).downcase.to_sym
    path   = Regexp.last_match(2)
    assert_routing({ method:, path: }, options.merge(take_controller_action(arg)))
  end
end
