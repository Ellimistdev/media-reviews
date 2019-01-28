class Series < ApplicationRecord
  # Must include Conceivable before Review/Viewable to avoid ActiveRecord::HasManyThroughOrderError 
  include Conceivable  
  include Reviewable, Viewable
  has_many :seasons
  has_many :episodes, through: :seasons
  before_validation :build_parents
  validates :title, presence: true
end
