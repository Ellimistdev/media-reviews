class Series < ApplicationRecord
  include Conceivable
  belongs_to :medium  
  has_many :seasons
  has_many :episodes, through: :seasons
  before_validation :build_parents
  validates :title, presence: true
end
