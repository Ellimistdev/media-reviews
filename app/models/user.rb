class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :reviewed_media, through: :reviews
  has_many :views
  has_many :viewed_media, through: :views
end
