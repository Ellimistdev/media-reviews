class Season < ApplicationRecord
  include Conceivable
  belongs_to :medium
  belongs_to :series
  has_many :episodes
  before_validation :build_parents
  validates :number, presence: true
end
