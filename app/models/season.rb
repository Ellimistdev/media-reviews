class Season < ApplicationRecord
  # Must include Conceivable before Review/Viewable to avoid ActiveRecord::HasManyThroughOrderError 
  include Conceivable  
  include Reviewable, Viewable
  belongs_to :series
  has_many :episodes
  before_validation :build_parents
  validates :number, presence: true
end
