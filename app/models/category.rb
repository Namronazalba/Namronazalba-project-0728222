class Category < ApplicationRecord
  validates_presence_of :category_type

  has_many :posts
  # belongs_to :user
end
