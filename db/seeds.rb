# frozen_string_literal: true

require 'faker'

@users_id = []
@categories_id = []
@posts = []

def users_without_some_user(user_id)
  @users_id - [user_id]
end

def random_user(user_id)
  (user_id ? users_without_some_user(user_id) : @users_id).sample
end

Dir[Rails.root.join('db/seeds/*.rb')].each do |file|
  Rails.logger.debug { "Processing #{file.split('/').last}" }

  require file
end
