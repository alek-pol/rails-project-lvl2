# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = { email: 'test3@test.com', password: 'Test6#' }
  end

  test 'create user successfully' do
    assert_difference('User.count', 1) do
      User.create!(@user)
    end
    user = User.find_first_by_auth_conditions({ email: @user[:email] })

    assert_equal @user[:email], user.email
  end

  test 'should require password to be set' do
    user = User.new({ email: @user[:email] })

    assert_predicate user, :invalid?
    assert_not_empty user.errors[:password]
    assert_empty user.errors[:email]
  end

  test 'should require email to be set' do
    user = User.new({ password: @user[:password] })

    assert_predicate user, :invalid?
    assert_not_empty user.errors[:email]
    assert_empty user.errors[:password]
  end
end
