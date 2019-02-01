class Movie < ApplicationRecord
  # Must include Conceivable before Review/Viewable to avoid ActiveRecord::HasManyThroughOrderError
  include Conceivable
  include Viewable
  include Reviewable
  before_validation :build_parents
  validates :medium, presence: true, uniqueness: true
  validates :title, presence: true
end
