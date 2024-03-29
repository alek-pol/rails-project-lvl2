# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  body        :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer          not null
#  creator_id  :integer          not null
#
# Indexes
#
#  index_posts_on_category_id  (category_id)
#  index_posts_on_creator_id   (creator_id)
#
# Foreign Keys
#
#  category_id  (category_id => categories.id)
#  creator_id   (creator_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :category

  has_many :comments, class_name: 'PostComment', dependent: :destroy, inverse_of: :post
  has_many :likes, class_name: 'PostLike', dependent: :destroy, inverse_of: :post

  validates :title, presence: true
  validates :body, presence: true
end
