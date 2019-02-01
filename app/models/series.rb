class Series < ApplicationRecord
  # Must include Conceivable before Review/Viewable to avoid ActiveRecord::HasManyThroughOrderError
  include Conceivable
  include Viewable
  include Reviewable
  has_many :seasons
  has_many :episodes, through: :seasons
  before_validation :build_parents
  validates :medium_id, presence: true, uniqueness: true
  validates :title, presence: true

  def children
    seasons.blank? ? nil : seasons
  end
end
