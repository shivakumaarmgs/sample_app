class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  POST_STATUSES = ['draft', 'published', 'archived']

  validates_presence_of :post_status
end
