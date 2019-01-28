class Episode < ApplicationRecord
  # Must include Conceivable before Review/Viewable to avoid ActiveRecord::HasManyThroughOrderError 
  include Conceivable  
  include Reviewable, Viewable  
  belongs_to :season  
  before_validation :build_parents
  validates :title, presence: true
end
