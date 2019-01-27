class Series < ApplicationRecord
  belongs_to :medium  
  before_validation :build_parents
end
