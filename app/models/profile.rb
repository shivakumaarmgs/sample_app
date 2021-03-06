class Profile < ApplicationRecord
  belongs_to :user

  validates_uniqueness_of :username
  validates_presence_of :username
end
