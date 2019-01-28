class Episode < ApplicationRecord
  # Must include Conceivable before Review/Viewable to avoid ActiveRecord::HasManyThroughOrderError
  include Conceivable
  include Viewable
  include Reviewable
  belongs_to :season
  before_validation :build_parents
  validates :title, presence: true
end
