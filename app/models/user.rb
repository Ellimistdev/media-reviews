class User < ApplicationRecord
  has_many :identities
  has_many :reviews
  has_many :reviewed_media, through: :reviews, source: :medium
  has_many :views
  has_many :viewed_media, through: :views, source: :medium
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  validates_with IdentityValidator
  has_secure_password validations: false

  def self.create_with_omni(auth, identity)
    username = auth[:info][:nickname] || auth[:extra][:raw_info][:username]
    username = nil unless find_by(username: username).nil?
    # username may be nil at this point
    # generate unique username?
    user = new(username: username, email: auth[:info][:email]) # email may be nil
    user.identities << identity
    user.save
    user
  end
end
