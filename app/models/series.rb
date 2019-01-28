class Series < ApplicationRecord
  include Conceivable
  belongs_to :medium  
  before_validation :build_parents
  validates :title, presence: true
end
