class User < ApplicationRecord
  has_many :reviews
  has_many :reviewed_media, through: :reviews, source: :medium
  has_many :views
  has_many :viewed_media, through: :views, source: :medium
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  has_secure_password
end
