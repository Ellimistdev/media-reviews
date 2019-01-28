class Episode < ApplicationRecord
  include Conceivable
  belongs_to :medium
  belongs_to :season  
  before_validation :build_parents
  validates :title, presence: true
end
